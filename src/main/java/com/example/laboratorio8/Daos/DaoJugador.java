package com.example.laboratorio8.Daos;

import com.example.laboratorio8.Beans.Habitante;
import com.example.laboratorio8.Beans.Jugador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

public class DaoJugador extends DaoBase{

    public Jugador getJugadorPorId(int idJugador){
        String sql = "SELECT * FROM jugador WHERE idJugador = ?";
        Jugador jugador = null;

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idJugador);

            try(ResultSet rs = pstmt.executeQuery()){

                if(rs.next()){
                    jugador = fillJugador(jugador,rs);
                }

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return jugador;

    }

    public void endDia(int idJugador){

        String sql = "UPDATE jugador SET horasDelDia = 0, diasDesdeCreacion = diasDesdeCreacion + 1 WHERE idJugador = ?;";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idJugador);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        String sql2 = "UPDATE habitante SET diasVivo = diasVivo + 1 WHERE idJugador = ? AND estaExiliado = false AND estaMuerto = false;";
        try (Connection conn2 = this.getConection();
             PreparedStatement pstmt2 = conn2.prepareStatement(sql2);) {
            pstmt2.setInt(1, idJugador);
            pstmt2.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void skipHoras(int idJugador){

        String sql = "UPDATE jugador SET horasDelDia = 24 WHERE idJugador = ?";

        try (Connection conn = this.getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idJugador);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public Jugador fillJugador(Jugador jugador, ResultSet rs) throws SQLException {

        jugador = new Jugador();
        jugador.setIdJugador(rs.getInt(1));
        jugador.setNombreJugador(rs.getString(2));
        jugador.setEdad((rs.getInt(3)));
        jugador.setCorreo(rs.getString(4));
        jugador.setUsuario(rs.getString(5));
        jugador.setContrasena(rs.getString(6));
        jugador.setHorasDia(rs.getInt(7));
        jugador.setDiasDesdeCreacion(rs.getInt(8));
        jugador.setEstado(rs.getString(9));
        jugador.setAlimentoTotal(rs.getFloat(10));
        return jugador;
    }

    public void updateAlimentoAcumulado(int idJugador, float alimentoAcumulado){
        String sql = "UPDATE jugador SET alimentoTotal = ? WHERE idJugador = ?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setFloat(1,alimentoAcumulado);
            pstmt.setInt(2, idJugador);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void proceedEndDia(Jugador jugador, DaoHabitante daoHabitante){
        // Alimentar a la población: MUERTES POR HAMBRE

        ArrayList<Habitante> listaHabitantes = daoHabitante.getListaHabitantes(jugador.getIdJugador(),2);
        float alimentoProducido = daoHabitante.getAlimentoProduccionVsConsumo(jugador.getIdJugador()).get(1);

        if(!listaHabitantes.isEmpty()){
            ArrayList<Integer> indicesHabitantes = new ArrayList<>();

            for(int i = 0; i<listaHabitantes.size(); i++){
                indicesHabitantes.add(i);
            }

            Collections.shuffle(indicesHabitantes);

            float alimentoAConsumir = 0.0f;
            float moralPerdida = 0.0f;
            float alimentoAcumulado = jugador.getAlimentoTotal() + alimentoProducido;

            ArrayList<Float> probando = new ArrayList<>();
            probando.add(alimentoAcumulado);

            int aux = 0;

            for(Integer j: indicesHabitantes){

                Habitante habitante = listaHabitantes.get(j);

                alimentoAConsumir = habitante.getAlimentacionDiaria();

                if(alimentoAcumulado>=0.0f){
                    if((alimentoAcumulado-alimentoAConsumir)>0.0f){
                        alimentoAcumulado = alimentoAcumulado - alimentoAConsumir;
                    }else{
                        moralPerdida = habitante.getMoral() - (alimentoAConsumir - alimentoAcumulado);
                        if(moralPerdida <= 0.0f){
                            daoHabitante.updateMoral(habitante.getIdHabitante(), 0.0f);
                            daoHabitante.killHabitante(habitante.getIdHabitante(),"Hambre",jugador.getDiasDesdeCreacion()); // Añadir dia muerte
                        }
                        daoHabitante.updateMoral(habitante.getIdHabitante(), moralPerdida);
                    }
                }else{
                    alimentoAcumulado = 0.0f;
                }


                aux +=1;
                probando.add(alimentoAcumulado);

            }

            probando.add(0.0f);
            // Crecimiento de la población: MUERTES POR DESESPERACIÓN

            int cantidadPoblacion = listaHabitantes.size();
            int diasPasados = jugador.getDiasDesdeCreacion();

            if(cantidadPoblacion>4*diasPasados){
                System.out.println(":D");
            }else{
                // Actualizar y evaluar quienes caen
                daoHabitante.updateMoralMultiple(jugador.getIdJugador(),"Desesperación",jugador.getDiasDesdeCreacion()); // Añadir dia muerte
            }

            // Subir moral:
            daoHabitante.updateMoralMultiple(jugador.getIdJugador());
        }

        // Se termina el día:
        this.endDia(jugador.getIdJugador());

    }

}
