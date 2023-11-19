package com.example.laboratorio8.Daos;

import com.example.laboratorio8.Dtos.DtoLeaderboard;

import java.sql.*;
import java.util.ArrayList;

public class DaoLeaderboard extends DaoBase {
    public ArrayList<DtoLeaderboard> listaLeaderboard(int tipo){
        ArrayList<DtoLeaderboard> lista = new ArrayList<>();

        String orden = "";

        switch (tipo){
            case 2:
                orden = "`Población Total`";
                break;
            case 3:
                orden = "`Moral Total`";
                break;
            case 4:
                orden = "`Guerras ganadas`";
                break;
            case 5:
                orden = "`% Guerras ganadas`";
                break;
            case 6:
                orden = "`Fuerza Total`";
                break;
            case 7:
                orden = "`Máximo días ciudadano`";
                break;
            case 8:
                orden = "`Producción alimento total`";
                break;
            default:
                orden = "`DiasTotales`";
                break;
        }

        String superSql = "SELECT ja.usuario, ja.diasDesdeCreacion AS `DiasTotales`, q1.`Población Total0` AS `Población Total`, q2.`Moral Total0` AS `Moral Total`, q3.`Guerras ganadas0` AS `Guerras ganadas`,\n" +
                "\t\tq4.`% Guerras ganadas0` AS `% Guerras ganadas`, q5.`Fuerza Total0` AS `Fuerza Total`, q6.`Máximo días ciudadano0` AS `Máximo días ciudadano`, q7.`Producción alimento total0` AS `Producción alimento total`\n" +
                "\n" +
                "FROM jugador ja INNER JOIN \n" +
                "\n" +
                "(SELECT ja.usuario AS `u1`, count(pa.idHabitante) AS `Población Total0` FROM jugador ja LEFT JOIN habitante pa ON (ja.idJugador=pa.idJugador AND pa.estaMuerto=false AND pa.estaExiliado=false) GROUP BY ja.usuario) q1 ON (ja.usuario=q1.`u1`) INNER JOIN\n" +
                "\n" +
                "(SELECT ja.usuario AS `u2`, IFNULL(sum(pa.moral),0) AS `Moral Total0` FROM jugador ja LEFT JOIN habitante pa ON (ja.idJugador=pa.idJugador AND pa.estaMuerto=false AND pa.estaExiliado=false) GROUP BY ja.usuario) q2 ON (ja.usuario=q2.`u2`) INNER JOIN\n" +
                "\n" +
                "(SELECT ja.usuario AS `u3`, sum(IF((g.resultado=\"VictoriaA\" and ja.idJugador=g.idJugadorAtacante) OR (g.resultado=\"VictoriaD\" and ja.idJugador=g.idJugadorDefensor),1,0)) AS `Guerras ganadas0` FROM jugador ja LEFT JOIN guerra g ON (ja.idJugador=g.idJugadorAtacante OR ja.idJugador=g.idJugadorDefensor) GROUP BY ja.usuario) q3 ON (ja.usuario=q3.`u3`) INNER JOIN\n" +
                "\n" +
                "(SELECT ja.usuario AS `u4`, IFNULL(100*(sum(IF((g.resultado=\"VictoriaA\" and ja.idJugador=g.idJugadorAtacante) OR (g.resultado=\"VictoriaD\" and ja.idJugador=g.idJugadorDefensor),1,0))/count(g.idGuerra)),-1) AS `% Guerras ganadas0` FROM jugador ja LEFT JOIN guerra g ON (ja.idJugador=g.idJugadorAtacante OR ja.idJugador=g.idJugadorDefensor) GROUP BY ja.usuario) q4 ON (ja.usuario=q4.`u4`) INNER JOIN\n" +
                "\n" +
                "(SELECT ja.usuario AS `u5`, IFNULL(sum(pa.fuerza),0) AS `Fuerza Total0` FROM jugador ja LEFT JOIN habitante pa  ON (ja.idjugador = pa.idJugador AND pa.estaMuerto=false AND pa.estaExiliado=false) GROUP BY ja.usuario) q5 ON (ja.usuario=q5.`u5`) INNER JOIN\n" +
                "\n" +
                "(SELECT ja.usuario AS `u6`, IFNULL(max(pa.diasVivo),0) AS `Máximo días ciudadano0` FROM jugador ja LEFT JOIN habitante pa  ON (ja.idjugador = pa.idJugador AND pa.estaMuerto=false AND pa.estaExiliado=false) GROUP BY ja.usuario) q6 ON (ja.usuario=q6.`u6`) INNER JOIN\n" +
                "\n" +
                "(SELECT ja.usuario AS `u7`, IFNULL(sum(pa.produccionAlimento),0) AS `Producción alimento total0` FROM jugador ja LEFT JOIN habitante pa  ON (ja.idjugador = pa.idJugador AND pa.estaMuerto=false AND pa.estaExiliado=false) GROUP BY ja.usuario) q7 ON (ja.usuario=q7.`u7`)\n" +
                "\n" +
                "order by "+orden+" DESC LIMIT 10";

        try(Connection conn = getConection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(superSql);){

            while(rs.next()){
                DtoLeaderboard ditto = new DtoLeaderboard();
                ditto.setJugador(new DaoJugador().getJugadorPorUsuario(rs.getString(1)));
                ditto.setDiasJugados(rs.getInt(2));
                ditto.setPoblacionTotal(rs.getInt(3));
                ditto.setMoralTotal(rs.getFloat(4));
                ditto.setGuerrasGanadas(rs.getInt(5));
                ditto.setPorcentajeVictoriasGuerras(rs.getFloat(6));
                ditto.setFuerzaTotal(rs.getFloat(7));
                ditto.setMaxDiasHabitante(rs.getInt(8));
                ditto.setProduccionTotal(rs.getFloat(9));
                lista.add(ditto);
            }

            return lista;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
