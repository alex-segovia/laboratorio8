package com.example.laboratorio8.Daos;

import com.example.laboratorio8.Beans.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

public class DaoGuerra extends DaoBase{
    public ArrayList<Guerra> historialGuerrasPorID(int idJugador){
        ArrayList<Guerra>listaGuerras=new ArrayList<>();
        String sql="select j1.idJugador,j1.usuario,j2.idJugador,j2.usuario,g.resultado,g.diasRelativosJugadorAtacante,g.diasRelativosJugadorDefensor from guerra g inner join jugador j1 on g.idJugadorAtacante=j1.idJugador inner join jugador j2 on g.idJugadorDefensor=j2.idJugador where j1.idJugador=? or j2.idJugador=? order by idGuerra desc";
        try(Connection conn=this.getConection(); PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setInt(1,idJugador);
            pstmt.setInt(2,idJugador);
            try(ResultSet rs=pstmt.executeQuery()){
                while (rs.next()){
                    Guerra g=new Guerra();
                    g.getJugadorAtacante().setIdJugador(rs.getInt(1));
                    g.getJugadorAtacante().setUsuario(rs.getString(2));
                    g.getJugadorDefensor().setIdJugador(rs.getInt(3));
                    g.getJugadorDefensor().setUsuario(rs.getString(4));
                    g.setResultado(rs.getString(5));
                    g.setDiasRelativosJugadorAtacante(rs.getInt(6));
                    g.setDiasRelativosJugadorDefensor(rs.getInt(7));
                    listaGuerras.add(g);
                }return listaGuerras;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean guerraHaceUnDia(int idJugador){
        String sql="select g.idGuerra from guerra g inner join jugador j on ((g.idJugadorAtacante=j.idJugador and j.diasDesdeCreacion-g.diasRelativosJugadorAtacante<=1) or (g.idJugadorDefensor=j.idJugador and j.diasDesdeCreacion-g.diasRelativosJugadorDefensor<=1)) and j.idJugador=?";
        try(Connection conn=this.getConection(); PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setInt(1,idJugador);
            try(ResultSet rs=pstmt.executeQuery()){
                if(rs.next()){
                    return true;
                }else{
                    return false;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Jugador>listaJugadoresGuerra(int idJugador){
        ArrayList<Jugador>listaJugadores=new ArrayList<>();
        String sql="select j2.idJugador,j2.usuario,j2.diasDesdeCreacion from jugador j2 inner join jugador j1 where j1.diasDesdeCreacion<=j2.diasDesdeCreacion and j1.idJugador!=j2.idJugador and j1.idJugador=?";
        try(Connection conn=this.getConection(); PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setInt(1,idJugador);
            try(ResultSet rs=pstmt.executeQuery()){
                while (rs.next()){
                    Jugador j=new Jugador();
                    j.setIdJugador(rs.getInt(1));
                    j.setUsuario(rs.getString(2));
                    j.setDiasDesdeCreacion(rs.getInt(3));
                    listaJugadores.add(j);
                }return listaJugadores;
            }
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

    public void updateSoldadosVictoria(int idJugador){
        String sql = "update habitante set moral=moral*2,fuerza=fuerza*1.2 where idJugador=? and profesion ='Soldado'";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1,idJugador);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void updateGranjerosVictoriaAtaque(int idJugador){
        String sql="update habitante set produccionAlimento=produccionAlimento*1.2 where idJugador=? and profesion='Granjero'";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1,idJugador);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateHabitantesVictoriaDefensa(int idJugador){
        String sql="update habitante set produccionAlimento=produccionAlimento*1.4 where idJugador=? and profesion='Granjero'";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1,idJugador);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        sql="update habitante set produccionMoral=produccionMoral*1.4 where idJugador=? and (profesion='Constructor' or profesion='Soldado')";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1,idJugador);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateHabitanteSobrevivientePerderMoralDerrota(int idHabitante){
        String sql="update habitante set moral=moral*0.5 where idHabitante=?";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1,idHabitante);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateTransferirHabitante(int idHabitante,int idJugadorDestino){
        String sql="update habitante set idJugador=? where idHabitante=?";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1,idJugadorDestino);
            pstmt.setInt(2,idHabitante);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateHabitantesPerderMoralDerrotaDefensa(int idJugador){
        String sql="update habitante set moral=moral*(0.2+rand()*0.6) where idJugador=?";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1,idJugador);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void aumentarProduccionVictoriaAtaque(int idJugadorAtacante,int idJugadorDefensor){
        String sql="update jugador set alimentoTotal=alimentoTotal+(select * from (select sum(h.produccionAlimento) from jugador j inner join habitante h on j.idJugador=h.idJugador where j.idJugador=?) ola) where idJugador=?";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1,idJugadorDefensor);
            pstmt.setInt(2,idJugadorAtacante);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        sql="update habitante set moral=moral+(select * from (select sum(h.produccionMoral) from jugador j inner join habitante h on j.idJugador=h.idJugador where j.idJugador=?) ola) where idJugador=?";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1,idJugadorDefensor);
            pstmt.setInt(2,idJugadorAtacante);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void nuevaGuerra(int idJugadorAtacante,int idJugadorDefensor,String resultado,int diasRelativosJugadorAtacante,int diasRelativosJugadorDefensor){
        String sql="insert into guerra (idJugadorAtacante,idJugadorDefensor,resultado,diasRelativosJugadorAtacante,diasRelativosJugadorDefensor) values(?,?,?,?,?)";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1,idJugadorAtacante);
            pstmt.setInt(2,idJugadorDefensor);
            pstmt.setString(3,resultado);
            pstmt.setInt(4,diasRelativosJugadorAtacante);
            pstmt.setInt(5,diasRelativosJugadorDefensor);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
