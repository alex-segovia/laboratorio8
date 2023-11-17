package com.example.laboratorio8.Daos;

import com.example.laboratorio8.Beans.Guerra;
import com.example.laboratorio8.Beans.Jugador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DaoGuerra extends DaoBase{
    public ArrayList<Guerra> historialGuerrasPorID(int idJugador){
        ArrayList<Guerra>listaGuerras=new ArrayList<>();
        String sql="select j1.usuario,j2.usuario,g.resultado,g.diasRelativosJugadorAtacante,g.diasRelativosJugadorDefensor from guerra g inner join jugador j1 on g.idJugadorAtacante=j1.idJugador inner join jugador j2 on g.idJugadorDefensor=j2.idJugador where j1.idJugador=? or j2.idJugador=? order by idGuerra desc";
        try(Connection conn=this.getConection(); PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setInt(1,idJugador);
            pstmt.setInt(2,idJugador);
            try(ResultSet rs=pstmt.executeQuery()){
                while (rs.next()){
                    Guerra g=new Guerra();
                    g.getJugadorAtacante().setUsuario(rs.getString(1));
                    g.getJugadorDefensor().setUsuario(rs.getString(2));
                    g.setResultado(rs.getString(3));
                    g.setDiasRelativosJugadorAtacante(rs.getInt(4));
                    g.setDiasRelativosJugadorDefensor(rs.getInt(5));
                    listaGuerras.add(g);
                }return listaGuerras;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean guerraHaceUnDia(int idJugador){
        String sql="select g.idGuerra from guerra where (idJugadorAtacante=? and diasRelativosJugadorAtacante<=1) or (idJugadorDefensor=? and diasRelativosJugadorDefensor<=1)";
        try(Connection conn=this.getConection(); PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setInt(1,idJugador);
            pstmt.setInt(2,idJugador);
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
        String sql="select j2.idJugador,j2.usuario,j2.diasDesdeCreacion from jugador j2 inner join jugador j1 where j1.diasDesdeCreacion<=j2.diasDesdeCreacion and j1.idJugador=?";
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


}
