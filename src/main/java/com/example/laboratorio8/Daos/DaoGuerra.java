package com.example.laboratorio8.Daos;

import com.example.laboratorio8.Beans.*;
import com.example.laboratorio8.Dtos.DtoGuerra;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

public class DaoGuerra extends DaoBase{
    public ArrayList<Guerra> historialGuerrasPorID(int idJugador){
        ArrayList<Guerra>listaGuerras=new ArrayList<>();
        String sql="select j1.idJugador,j1.usuario,j2.idJugador,j2.usuario,g.resultado,g.diasRelativosJugadorAtacante,g.diasRelativosJugadorDefensor,g.diferenciaFuerzaAtacante,g.diferenciaFuerzaDefensor,g.diferenciaMoralAtacante,g.diferenciaMoralDefensor,g.diferenciaAlimentoTotalAtacante,g.diferenciaAlimentoTotalDefensor,g.diferenciaProduccionAlimentoTotalAtacante,g.diferenciaProduccionAlimentoTotalDefensor,g.diferenciaProduccionMoralTotalAtacante,g.diferenciaProduccionMoralTotalDefensor,g.diferenciaCantidadSoldadosAtacante,g.diferenciaCantidadSoldadosDefensor,g.diferenciaCantidadConstructoresAtacante,g.diferenciaCantidadConstructoresDefensor,g.diferenciaCantidadHabitantesAtacante,g.diferenciaCantidadHabitantesDefensor,g.habitantesTransferidos,g.fuerzaTotalJugadorAtacante,g.fuerzaTotalJugadorDefensor from guerra g inner join jugador j1 on g.idJugadorAtacante=j1.idJugador inner join jugador j2 on g.idJugadorDefensor=j2.idJugador where j1.idJugador=? or j2.idJugador=? order by idGuerra desc";
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
                    g.setDiferenciaFuerzaAtacante(rs.getFloat(8));
                    g.setDiferenciaFuerzaDefensor(rs.getFloat(9));
                    g.setDiferenciaMoralAtacante(rs.getFloat(10));
                    g.setDiferenciaMoralDefensor(rs.getFloat(11));
                    g.setDiferenciaAlimentoTotalAtacante(rs.getFloat(12));
                    g.setDiferenciaAlimentoTotalDefensor(rs.getFloat(13));
                    g.setDiferenciaProduccionAlimentoTotalAtacante(rs.getFloat(14));
                    g.setDiferenciaProduccionAlimentoTotalDefensor(rs.getFloat(15));
                    g.setDiferenciaProduccionMoralTotalAtacante(rs.getFloat(16));
                    g.setDiferenciaProduccionMoralTotalDefensor(rs.getFloat(17));
                    g.setDiferenciaCantidadSoldadosAtacante(rs.getInt(18));
                    g.setDiferenciaCantidadSoldadosDefensor(rs.getInt(19));
                    g.setDiferenciaCantidadConstructoresAtacante(rs.getInt(20));
                    g.setDiferenciaCantidadConstructoresDefensor(rs.getInt(21));
                    g.setDiferenciaCantidadHabitantesAtacante(rs.getInt(22));
                    g.setDiferenciaCantidadHabitantesDefensor(rs.getInt(23));
                    g.setHabitantesTransferidos(rs.getInt(24));
                    g.setFuerzaTotalJugadorAtacante(rs.getFloat(25));
                    g.setFuerzaTotalJugadorDefensor(rs.getFloat(26));
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
        String sql = "select sum(h.fuerza) from habitante h inner join jugador j on j.idJugador=h.idJugador where j.idJugador=? and h.profesion=? and h.estaMuerto=false and h.estaExiliado=false group by h.profesion";
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
        String sql = "update habitante set moral=moral*2,fuerza=fuerza*1.2 where idJugador=? and profesion ='Soldado' and estaMuerto=false and estaExiliado=false";
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
        String sql="update habitante set moral=moral*(0.2+rand()*0.6) where idJugador=? and estaExiliado=false and estaMuerto=false";
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

    public void nuevaGuerra(int idJugadorAtacante, int idJugadorDefensor, String resultado, int diasRelativosJugadorAtacante, int diasRelativosJugadorDefensor, DtoGuerra resultadosAntesGuerraAtacante,DtoGuerra resultadosDespuesGuerraAtacante,DtoGuerra resultadosAntesGuerraDefensor,DtoGuerra resultadosDespuesGuerraDefensor,int habitantesTransferidos,float fuerzaTotalAtacante,float fuerzaTotalDefensor){
        String sql="insert into guerra (idJugadorAtacante,idJugadorDefensor,resultado,diasRelativosJugadorAtacante,diasRelativosJugadorDefensor,diferenciaFuerzaAtacante,diferenciaFuerzaDefensor,diferenciaMoralAtacante,diferenciaMoralDefensor,diferenciaAlimentoTotalAtacante,diferenciaAlimentoTotalDefensor,diferenciaProduccionAlimentoTotalAtacante,diferenciaProduccionAlimentoTotalDefensor,diferenciaProduccionMoralTotalAtacante,diferenciaProduccionMoralTotalDefensor,diferenciaCantidadSoldadosAtacante,diferenciaCantidadSoldadosDefensor,diferenciaCantidadConstructoresAtacante,diferenciaCantidadConstructoresDefensor,diferenciaCantidadHabitantesAtacante,diferenciaCantidadHabitantesDefensor,habitantesTransferidos,fuerzaTotalJugadorAtacante,fuerzaTotalJugadorDefensor) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1,idJugadorAtacante);
            pstmt.setInt(2,idJugadorDefensor);
            pstmt.setString(3,resultado);
            pstmt.setInt(4,diasRelativosJugadorAtacante);
            pstmt.setInt(5,diasRelativosJugadorDefensor);
            pstmt.setFloat(6,resultadosDespuesGuerraAtacante.getFuerzaTotal()-resultadosAntesGuerraAtacante.getFuerzaTotal());
            pstmt.setFloat(7,resultadosDespuesGuerraDefensor.getFuerzaTotal()-resultadosAntesGuerraDefensor.getFuerzaTotal());
            pstmt.setFloat(8,resultadosDespuesGuerraAtacante.getMoralTotal()-resultadosAntesGuerraAtacante.getMoralTotal());
            pstmt.setFloat(9,resultadosDespuesGuerraDefensor.getMoralTotal()-resultadosAntesGuerraDefensor.getMoralTotal());
            pstmt.setFloat(10,resultadosDespuesGuerraAtacante.getAlimentoTotal()-resultadosAntesGuerraAtacante.getAlimentoTotal());
            pstmt.setFloat(11,resultadosDespuesGuerraDefensor.getAlimentoTotal()-resultadosAntesGuerraDefensor.getAlimentoTotal());
            pstmt.setFloat(12,resultadosDespuesGuerraAtacante.getProduccionAlimentoTotal()-resultadosAntesGuerraAtacante.getProduccionAlimentoTotal());
            pstmt.setFloat(13,resultadosDespuesGuerraDefensor.getProduccionAlimentoTotal()-resultadosAntesGuerraDefensor.getProduccionAlimentoTotal());
            pstmt.setFloat(14,resultadosDespuesGuerraAtacante.getProduccionMoralTotal()-resultadosAntesGuerraAtacante.getProduccionMoralTotal());
            pstmt.setFloat(15,resultadosDespuesGuerraDefensor.getProduccionMoralTotal()-resultadosAntesGuerraDefensor.getProduccionMoralTotal());
            pstmt.setInt(16,resultadosDespuesGuerraAtacante.getCantidadSoldados()-resultadosAntesGuerraAtacante.getCantidadSoldados());
            pstmt.setInt(17,resultadosDespuesGuerraDefensor.getCantidadSoldados()-resultadosAntesGuerraDefensor.getCantidadSoldados());
            pstmt.setInt(18,resultadosDespuesGuerraAtacante.getCantidadConstructores()-resultadosAntesGuerraAtacante.getCantidadConstructores());
            pstmt.setInt(19,resultadosDespuesGuerraDefensor.getCantidadConstructores()-resultadosAntesGuerraDefensor.getCantidadConstructores());
            pstmt.setInt(20,resultadosDespuesGuerraAtacante.getCantidadHabitantes()-resultadosAntesGuerraAtacante.getCantidadHabitantes());
            pstmt.setInt(21,resultadosDespuesGuerraDefensor.getCantidadHabitantes()-resultadosAntesGuerraDefensor.getCantidadHabitantes());
            pstmt.setInt(22,habitantesTransferidos);
            pstmt.setFloat(23,fuerzaTotalAtacante);
            pstmt.setFloat(24,fuerzaTotalDefensor);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public float getTotalMoral(int idJugador){
        String sql = "select sum(h.moral) from habitante h inner join jugador j on j.idJugador=h.idJugador where j.idJugador=? and h.estaMuerto=false and h.estaExiliado=false";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idJugador);
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

    public float getTotalAlimentoAlmacen(int idJugador){
        String sql = "select alimentoTotal from jugador where idJugador=?";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idJugador);
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

    public float getTotalFuerza(int idJugador){
        String sql = "select sum(h.fuerza) from habitante h inner join jugador j on j.idJugador=h.idJugador where j.idJugador=? and h.estaMuerto=false and h.estaExiliado=false";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idJugador);
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

    public int getTotalSoldados(int idJugador){
        String sql = "select count(h.idHabitante) from habitante h inner join jugador j on j.idJugador=h.idJugador where j.idJugador=? and h.profesion='Soldado' and h.estaMuerto=false and h.estaExiliado=false";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idJugador);
            try(ResultSet rs = pstmt.executeQuery()){
                if (rs.next()){
                    return rs.getInt(1);
                }else {
                    return 0;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public int getTotalConstructores(int idJugador){
        String sql = "select count(h.idHabitante) from habitante h inner join jugador j on j.idJugador=h.idJugador where j.idJugador=? and h.profesion='Constructor' and h.estaMuerto=false and h.estaExiliado=false";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idJugador);
            try(ResultSet rs = pstmt.executeQuery()){
                if (rs.next()){
                    return rs.getInt(1);
                }else {
                    return 0;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int getTotalHabitantes(int idJugador){
        String sql = "select count(h.idHabitante) from habitante h inner join jugador j on j.idJugador=h.idJugador where j.idJugador=? and h.estaMuerto=false and h.estaExiliado=false";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idJugador);
            try(ResultSet rs = pstmt.executeQuery()){
                if (rs.next()){
                    return rs.getInt(1);
                }else {
                    return 0;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public float getProduccionTotalAlimento(int idJugador){
        String sql = "select sum(h.produccionAlimento) from habitante h inner join jugador j on j.idJugador=h.idJugador where j.idJugador=? and h.estaMuerto=false and h.estaExiliado=false";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idJugador);
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

    public float getProduccionTotalMoral(int idJugador){
        String sql = "select sum(h.produccionMoral) from habitante h inner join jugador j on j.idJugador=h.idJugador where j.idJugador=? and h.estaMuerto=false and h.estaExiliado=false";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idJugador);
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
