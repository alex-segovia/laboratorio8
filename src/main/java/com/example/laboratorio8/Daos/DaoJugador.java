package com.example.laboratorio8.Daos;

import com.example.laboratorio8.Beans.Jugador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
        jugador.setAldeaEnDesesperacion(rs.getBoolean(9));
        jugador.setEstado(rs.getString(10));

        return jugador;
    }

}
