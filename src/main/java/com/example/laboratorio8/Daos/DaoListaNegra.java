package com.example.laboratorio8.Daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoListaNegra extends DaoBase{
    public void insertListaNegra(String correo){
        String sql="insert into listaNegra (correo) values (?)";
        try(Connection conn = this.getConection();PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,correo);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean verifyCorreo(String correo){
        String sql="select idListaNegra from listaNegra where correo=?";
        try(Connection conn = this.getConection();PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,correo);
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
}
