package com.example.laboratorio8.Daos;

import com.example.laboratorio8.Beans.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class DaoHabitante extends DaoBase{

    public ArrayList<Float> getAlimentoProduccionVsConsumo(int idJugador){

        String sql = "SELECT sum(produccionAlimento), sum(alimentacionDiaria) FROM habitante WHERE idJugador = ? GROUP BY idJugador, estaExiliado = false, estaMuerto = false;";
        ArrayList<Float> alimentoProduccionVsConsumo = new ArrayList<>();

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idJugador);

            try(ResultSet rs = pstmt.executeQuery()){
                if(rs.next()){
                    alimentoProduccionVsConsumo.add(rs.getFloat(1));
                    alimentoProduccionVsConsumo.add(rs.getFloat(2));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return alimentoProduccionVsConsumo;
    }

    public ArrayList<Habitante> getHabitantesMoralBaja(int idJugador){

        String sql = "SELECT * FROM habitante WHERE idJugador = ? ORDER BY moral LIMIT 5;";
        ArrayList<Habitante> habitantesMoralBaja = new ArrayList<>();

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idJugador);

            try(ResultSet rs = pstmt.executeQuery()){
                while(rs.next()){
                    habitantesMoralBaja.add(fillHabitante(rs));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return habitantesMoralBaja;
    }

    public ArrayList<Habitante> getHabitantesMuertos(int idJugador){
        String sql = "SELECT * FROM habitante WHERE idJugador = ? AND (estaMuerto = true)";
        ArrayList<Habitante> habitantesMuertos = new ArrayList<>();

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idJugador);

            try(ResultSet rs = pstmt.executeQuery()){
                while(rs.next()){
                    habitantesMuertos.add(fillHabitante(rs));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return habitantesMuertos;
    }

    public void killHabitante(int idHabitante, String motivoMuerte, int diaMuerte){
        String sql = "UPDATE habitante SET estaMuerto = true, motivoMuerte = ?, diaMuerte = ? AND idHabitante = ?;";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1,motivoMuerte);
            pstmt.setInt(2,diaMuerte);
            pstmt.setInt(3,idHabitante);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateMoralMultiple(int idJugador, String motivoMuerte, int diaMuerte){
        String sql = "UPDATE habitante SET moral = moral-ceil(moral*0.5), estaMuerto = IF(moral-ceil(moral*0.5) = 0,?,estaMuerto), " +
                "motivoMuerte = IF(moral-ceil(moral*0.5) = 0,?,motivoMuerte), diaMuerte = IF(moral-ceil(moral*0.5) = 0,?,diaMuerte) WHERE idJugador = ?";

        try (Connection conn = this.getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setBoolean(1,true);
            pstmt.setString(2,motivoMuerte);
            pstmt.setInt(3,diaMuerte);
            pstmt.setInt(4,idJugador);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateMoralMultiple (int idJugador){
        String sql = "UPDATE habitante SET moral = moral + (SELECT sum(produccionMoral) FROM habitante WHERE idJugador = ? GROUP BY idJugador) WHERE idJugador = ?;";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1,idJugador);
            pstmt.setInt(2,idJugador);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Habitante> getListaHabitantes(int idJugador,int tipo){
        String sql = "";

        if(tipo == 1){ // Listado completo
            sql = "SELECT * FROM habitante WHERE idJugador = ?;";
        }else{ // Listado filtrado
            sql = "SELECT * FROM habitante WHERE idJugador = ? AND (estaExiliado = false AND estaMuerto = false);";
        }

        ArrayList<Habitante> listaHabitantes = new ArrayList<>();

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idJugador);

            try(ResultSet rs = pstmt.executeQuery()){
                while(rs.next()){
                    listaHabitantes.add(fillHabitante(rs));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaHabitantes;
    }

    public void updateMoral (int idHabitante, Float moral){
        String sql = "UPDATE habitante SET moral = ? idHabitante = ?";

        try (Connection conn = this.getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setFloat(1,moral);
            pstmt.setInt(2,idHabitante);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Habitante fillHabitante(ResultSet rs) throws SQLException {

        String profesion = rs.getString(4);
        Habitante habitante = null;
        switch (profesion){
            case "Granjero":
                habitante = new Granjero();
                ((Granjero) habitante).setProduccionAlimento(rs.getFloat(13));
                break;
            case "Constructor":
                habitante = new Constructor();
                ((Constructor) habitante).setProduccionMoral(rs.getFloat(14));
                ((Constructor) habitante).setFuerza(rs.getFloat(12));
                break;
            case "Soldado":
                habitante = new Soldado();
                ((Soldado) habitante).setProduccionMoral(rs.getFloat(14));
                ((Soldado) habitante).setFuerza(rs.getFloat(12));
                break;
            default:
                habitante = new Habitante();
                System.out.println("Me olvidé polimorfismo xd");

        }

        habitante.setIdHabitante(rs.getInt(1));
        habitante.setJugador(new DaoJugador().getJugadorPorId(rs.getInt(2)));
        habitante.setNombre(rs.getString(3));
        habitante.setGenero(rs.getString(5));
        habitante.setHorasDia(rs.getInt(6));
        habitante.setDiasVivo(rs.getInt(7));
        habitante.setEstaExiliado(rs.getBoolean(8));
        habitante.setEstaMuerto(rs.getBoolean(9));
        habitante.setAlimentacionDiaria(rs.getFloat(10));
        habitante.setMoral(rs.getFloat(11));
        habitante.setMotivoMuerte(rs.getString(15));
        habitante.setDiaMuerte(rs.getInt(16));



        return habitante;
    }

    public ArrayList<Habitante> listarHabitantes(int idJugador){
        ArrayList<Habitante> listaHabitantes = new ArrayList<>();
        String sql = "select * from habitante where idjugador=?";
        try(Connection conn = getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1,idJugador);
            try(ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Habitante habitante = new Habitante();
                    if (rs.getString(4).equals("Granjero")) {
                        Granjero granjero = (Granjero) habitante;
                        granjero.setIdHabitante(rs.getInt(1));
                        granjero.setNombre(rs.getString(3));
                        granjero.setGenero(rs.getString(5));
                        granjero.setDiasVivo(rs.getInt(7));
                        granjero.setEstaExiliado(rs.getBoolean(8));
                        granjero.setEstaMuerto(rs.getBoolean(9));
                        granjero.setAlimentacionDiaria(rs.getFloat(10));
                        granjero.setMoral(rs.getFloat(11));
                        granjero.setProduccionAlimento(rs.getFloat(13));
                        listaHabitantes.add(granjero);
                    } else if (rs.getString(4).equals("Constructor")) {
                        Constructor constructor = (Constructor) habitante;
                        constructor.setIdHabitante(rs.getInt(1));
                        constructor.setNombre(rs.getString(3));
                        constructor.setGenero(rs.getString(5));
                        constructor.setDiasVivo(rs.getInt(7));
                        constructor.setEstaExiliado(rs.getBoolean(8));
                        constructor.setEstaMuerto(rs.getBoolean(9));
                        constructor.setAlimentacionDiaria(rs.getFloat(10));
                        constructor.setMoral(rs.getFloat(11));
                        constructor.setFuerza(rs.getFloat(12));
                        constructor.setProduccionMoral(rs.getFloat(14));
                        listaHabitantes.add(constructor);
                    } else if (rs.getString(4).equals("Soldado")) {
                        Soldado soldado = (Soldado) habitante;
                        soldado.setIdHabitante(rs.getInt(1));
                        soldado.setNombre(rs.getString(3));
                        soldado.setGenero(rs.getString(5));
                        soldado.setDiasVivo(rs.getInt(7));
                        soldado.setEstaExiliado(rs.getBoolean(8));
                        soldado.setEstaMuerto(rs.getBoolean(9));
                        soldado.setAlimentacionDiaria(rs.getFloat(10));
                        soldado.setMoral(rs.getFloat(11));
                        soldado.setFuerza(rs.getFloat(12));
                        soldado.setProduccionMoral(rs.getFloat(14));
                        listaHabitantes.add(soldado);
                    } else {
                        habitante.setIdHabitante(rs.getInt(1));
                        habitante.setNombre(rs.getString(3));
                        habitante.setGenero(rs.getString(5));
                        habitante.setDiasVivo(rs.getInt(7));
                        habitante.setEstaExiliado(rs.getBoolean(8));
                        habitante.setEstaMuerto(rs.getBoolean(9));
                        habitante.setAlimentacionDiaria(rs.getFloat(10));
                        habitante.setMoral(rs.getFloat(11));
                        listaHabitantes.add(habitante);
                    }
                }
            }
            return listaHabitantes;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public float getSumaFuerzaPorProfesion(int idJugador,String profesion){
        String sql = "select sum(h.fuerza) from habitante h inner join jugador j on j.idJugador=h.idJugador where j.idJugador=? and h.profesion=? group by h.profesion";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idJugador);
            pstmt.setString(2,profesion);
            try(ResultSet rs = pstmt.executeQuery()){
                if (rs.next()){
                    return rs.getFloat(1);
                }else {
                    return 0;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
