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

        String sql = "UPDATE jugador SET horasDelDia = 0, diasDesdeCreacion = diasDesdeCreacion + 1 WHERE idJugador = ?;" +
                "UPDATE habitante SET diasVivo = diasVivo + 1 WHERE idJugador = ? AND estaExiliado = false AND estaMuerto = false;";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idJugador);
            pstmt.setInt(2, idJugador);
            pstmt.executeUpdate();
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

    public void proceedEndDia(Jugador jugador, DaoHabitante daoHabitante){
        // Alimentar a la población: MUERTES POR HAMBRE

        ArrayList<Habitante> listaHabitantes = daoHabitante.getListaHabitantes(jugador.getIdJugador(),2);
        Float alimentoProducido = daoHabitante.getAlimentoProduccionVsConsumo(jugador.getIdJugador()).get(1);

        if(!listaHabitantes.isEmpty()){
            ArrayList<Integer> indicesHabitantes = new ArrayList<>();

            for(int i = 0; i<listaHabitantes.size(); i++){
                indicesHabitantes.add(i);
            }

            Collections.shuffle(indicesHabitantes);

            Float alimentoAConsumir = 0.0f;
            float moralPerdida = 0.0f;

            for(Integer j: indicesHabitantes){

                Habitante habitante = listaHabitantes.get(j);

                alimentoAConsumir = habitante.getAlimentacionDiaria();

                if(alimentoProducido>=0.0f){
                    if((alimentoProducido-alimentoAConsumir)>0.0f){
                        alimentoProducido = alimentoProducido - alimentoAConsumir;
                    }else{
                        moralPerdida = habitante.getMoral() - (alimentoAConsumir - alimentoProducido);
                        if(moralPerdida <= 0.0f){
                            daoHabitante.updateMoral(habitante.getIdHabitante(), 0.0f);
                            daoHabitante.killHabitante(habitante.getIdHabitante(),"Hambre",jugador.getDiasDesdeCreacion()); // Añadir dia muerte
                        }
                        daoHabitante.updateMoral(habitante.getIdHabitante(), moralPerdida);
                    }
                }else{
                    alimentoProducido = 0.0f;
                }
            }

            // Crecimiento de la población: MUERTES POR DESESPERACIÓN

            int cantidadPoblacion = listaHabitantes.size();
            int diasPasados = jugador.getDiasDesdeCreacion();

            if(cantidadPoblacion>4*diasPasados){
                System.out.println("Aiuda");
            }else{
                // Se puede hacer de otra manera pero noseeeee
                daoHabitante.updateMoralMultiple(jugador.getIdJugador(), "Desesperación",jugador.getDiasDesdeCreacion()); // Añadir dia muerte
            }

            // Subir moral:
            daoHabitante.updateMoralMultiple(jugador.getIdJugador());
        }

        // Se termina el día:
        this.endDia(jugador.getIdJugador());

    }

}
