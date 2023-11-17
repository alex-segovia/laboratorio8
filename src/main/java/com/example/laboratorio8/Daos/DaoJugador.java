package com.example.laboratorio8.Daos;

import com.example.laboratorio8.Beans.Jugador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoJugador extends DaoBase{

    public Jugador obtenerJugadorPorId(int idJugador){
        String sql = "SELECT * FROM jugador WHERE idJugador = ?";
        Jugador jugador = null;

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idJugador);

            try(ResultSet rs = pstmt.executeQuery()){

                if(rs.next()){
                    jugador = llenarDatosJugador(jugador,rs);
                }

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return jugador;

    }

    public void terminarDia(int idJugador){
        String sql = "UPDATE jugador SET horasDelDia = 0, diasDesdeCreacion = diasDesdeCreacion + 1 WHERE idJugador = ?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idJugador);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void pasarHoras(int idJugador){

        String sql = "UPDATE jugador SET horasDelDia = 24 WHERE idJugador = ?";

        try (Connection conn = this.getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idJugador);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public Jugador llenarDatosJugador(Jugador jugador, ResultSet rs) throws SQLException {

        jugador = new Jugador();
        jugador.setIdJugador(rs.getInt(1));
        jugador.setNombreJugador(rs.getString(2));
        jugador.setEdad((rs.getInt(3)));
        jugador.setCorreo(rs.getString(4));
        jugador.setUsuario(rs.getString(5));
        jugador.setContrasena(rs.getString(6));
        jugador.setHorasDia(rs.getInt(7));
        jugador.setDiasDesdeCreacion(rs.getInt(8));
        jugador.setAldeaEnDesesperacion(rs.getBoolean(9));
        jugador.setEstado(rs.getString(10));

        return jugador;
    }

}
