package com.example.laboratorio8.Daos;

import com.example.laboratorio8.Dtos.DtoLeaderboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class DaoLeaderboard extends DaoBase {
    public ArrayList<DtoLeaderboard> listaLeaderboard(int tipo){
        ArrayList<DtoLeaderboard> lista = new ArrayList<>();
        String sql = "";
        switch (tipo){
            case 1:
                break;
            case 2:
                break;
            case 3:
                break;
            case 4:
                break;
            case 5:
                break;
            case 6:
                break;
            case 7:
                break;
            case 8:
                break;
        }
        try(Connection conn = getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            return lista;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
