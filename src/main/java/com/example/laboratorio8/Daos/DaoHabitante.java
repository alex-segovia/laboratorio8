package com.example.laboratorio8.Daos;

import com.example.laboratorio8.Beans.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.Random;


public class DaoHabitante extends DaoBase{

    public ArrayList<Float> getAlimentoProduccionVsConsumo(int idJugador){

        String sql = "SELECT sum(produccionAlimento), sum(alimentacionDiaria) FROM habitante WHERE idJugador = ? AND estaMuerto = false AND estaExiliado = false GROUP BY idJugador;";
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

        String sql = "SELECT * FROM habitante WHERE idJugador = ? AND estaMuerto = false AND estaExiliado = false ORDER BY moral LIMIT 5;";
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

    public ArrayList<Habitante> getHabitantesMuertos(int idJugador, int diaJugador){
        String sql = "SELECT * FROM habitante WHERE idJugador = ? AND estaMuerto = true AND diaMuerte = ?";
        ArrayList<Habitante> habitantesMuertos = new ArrayList<>();

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idJugador);
            pstmt.setInt(2,diaJugador-1);

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

    public void killHabitante(int idHabitante, String motivoMuerte, int diaMuerte, int idJugador){
        String sql = "UPDATE habitante SET estaMuerto = true, motivoMuerte = ?, diaMuerte = ?, moral=0 WHERE idHabitante = ?;";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1,motivoMuerte);
            pstmt.setInt(2,diaMuerte);
            pstmt.setInt(3,idHabitante);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        ArrayList<Integer> idsHabitantesVivos = obtenerIdsVivos(idJugador);
        for(int id: idsHabitantesVivos){
            reducirMoralPorMuerte(id,obtenerTiempoVivo(idHabitante));
        }

        ArrayList<Integer> listaIDs = habitantesConMoralMenorACero(idJugador);
        while(listaIDs.size()>0){
            for(int h: listaIDs){
                killHabitante(h,"Depresión",diaMuerte,idJugador);
            }
            listaIDs = habitantesConMoralMenorACero(idJugador);
        }
    }

    public ArrayList<Integer> obtenerIdsVivos(int idJugador){
        ArrayList<Integer> listaIDs = new ArrayList<>();
        String sql = "select idHabitante from habitante where idjugador=? and estaMuerto=false";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1,idJugador);
            try(ResultSet rs = pstmt.executeQuery()){
                while(rs.next()){
                    listaIDs.add(rs.getInt(1));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaIDs;
    }

    public void reducirMoralPorMuerte(int idHabitante, int tiempoMuerto){
        String sql = "update habitante set moral=moral-? where idHabitante=? and estaMuerto=false and estaExiliado=false";
        try(Connection conn = getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setFloat(1,new Random().nextFloat()*(tiempoMuerto+obtenerTiempoVivo(idHabitante)));
            pstmt.setInt(2,idHabitante);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int obtenerTiempoVivo(int idHabitante){
        String sql = "select diasVivo from habitante where idHabitante=?";
        try(Connection conn = getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1,idHabitante);
            try(ResultSet rs = pstmt.executeQuery()){
                if(rs.next()){
                    return rs.getInt(1);
                }else{
                    return 0;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateMoralMultiple(int idJugador, String motivoMuerte, int diaMuerte){
        String sql = "UPDATE habitante SET moral = moral-ceil(moral*0.5) WHERE idJugador = ? AND estaMuerto = false AND estaExiliado = false";

        try (Connection conn = this.getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1,idJugador);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        String sql2 = "UPDATE habitante SET estaMuerto = true, motivoMuerte = ?, diaMuerte = ? WHERE (idJugador = ? AND moral <= 0 AND estaMuerto=false AND estaExiliado=false)";
        try (Connection conn2 = this.getConection();
            PreparedStatement pstmt2 = conn2.prepareStatement(sql2);) {
            pstmt2.setString(1,motivoMuerte);
            pstmt2.setInt(2,diaMuerte);
            pstmt2.setInt(3,idJugador);
            pstmt2.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        String sql3 = "UPDATE habitante SET moral = 0 WHERE (idJugador = ? AND moral <= 0)";
        try (Connection conn3 = this.getConection();
             PreparedStatement pstmt3 = conn3.prepareStatement(sql3);) {
            pstmt3.setInt(1,idJugador);
            pstmt3.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateMoralMultiple (int idJugador){
        String sql = "SELECT sum(produccionMoral) FROM habitante WHERE idJugador = ? AND estaMuerto = false AND estaExiliado = false GROUP BY idJugador;";
        float sumaProduccion = 0.0f;

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1,idJugador);
            try(ResultSet rs = pstmt.executeQuery()){
                if(rs.next()){
                    sumaProduccion = rs.getFloat(1);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        String sql2 = "UPDATE habitante SET moral = moral + ? WHERE idJugador = ? AND estaMuerto=false AND estaExiliado=false";

        try (Connection conn2 = this.getConection();
             PreparedStatement pstmt2 = conn2.prepareStatement(sql2);) {
            pstmt2.setFloat(1,sumaProduccion);
            pstmt2.setInt(2,idJugador);
            pstmt2.executeUpdate();
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
        String sql = "UPDATE habitante SET moral = ? WHERE idHabitante = ?";

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

    public ArrayList<Habitante> listarHabitantesSoloVivos(int idJugador){
        ArrayList<Habitante> listaHabitantes = new ArrayList<>();
        String sql = "select * from habitante where idjugador=? and estaMuerto=false and estaExiliado=false";
        try(Connection conn = getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1,idJugador);
            try(ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    if (rs.getString(4).equals("Granjero")) {
                        Granjero granjero = new Granjero();
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
                        Constructor constructor = new Constructor();
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
                        Soldado soldado = new Soldado();
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
                        Habitante habitante = new Habitante();
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
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaHabitantes;
    }

    public ArrayList<Habitante> listarHabitantes(int idJugador){
        ArrayList<Habitante> listaHabitantes = new ArrayList<>();
        String sql = "select * from habitante where idjugador=? order by IF(estaMuerto=false AND estaExiliado=false,0,1)";
        try(Connection conn = getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1,idJugador);
            try(ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    if (rs.getString(4).equals("Granjero")) {
                        Granjero granjero = new Granjero();
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
                        Constructor constructor = new Constructor();
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
                        Soldado soldado = new Soldado();
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
                        Habitante habitante = new Habitante();
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
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaHabitantes;
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

    public void crearHabitante(String nombre, String genero, String profesion, int idJugador){
        String sql = "insert into habitante(idjugador, nombre, profesion, genero, horasDelDia, diasVivo, estaExiliado, estaMuerto, alimentacionDiaria, moral, fuerza, produccionAlimento, produccionMoral, motivoMuerte, diaMuerte) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try(Connection conn = getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            Habitante habitante = new Habitante();
            Jugador jugador = new Jugador();
            jugador.setIdJugador(idJugador);
            if(profesion.equals("Ninguna")){
                habitante.setJugador(jugador);
                habitante.setNombre(nombre);
                habitante.setGenero(genero);
                habitante.setAlimentacionDiaria((float)(new Random().nextInt(21)+30));
                habitante.setMoral((float)(new Random().nextInt(31)+20));
                pstmt.setInt(1,habitante.getJugador().getIdJugador());
                pstmt.setString(2,habitante.getNombre());
                pstmt.setString(3,profesion);
                pstmt.setString(4,habitante.getGenero());
                pstmt.setInt(5,habitante.getHorasDia());
                pstmt.setInt(6,habitante.getDiasVivo());
                pstmt.setBoolean(7,habitante.isEstaExiliado());
                pstmt.setBoolean(8,habitante.isEstaMuerto());
                pstmt.setFloat(9,habitante.getAlimentacionDiaria());
                pstmt.setFloat(10,habitante.getMoral());
                pstmt.setNull(11, Types.FLOAT);
                pstmt.setNull(12, Types.FLOAT);
                pstmt.setNull(13, Types.FLOAT);
                pstmt.setNull(14, Types.VARCHAR);
                pstmt.setNull(15,Types.INTEGER);
                pstmt.executeUpdate();
            }else if(profesion.equals("Granjero")){
                Granjero granjero = new Granjero();
                granjero.setJugador(jugador);
                granjero.setNombre(nombre);
                granjero.setGenero(genero);
                granjero.setAlimentacionDiaria((float)(new Random().nextInt(21)+10));
                granjero.setMoral((float)(new Random().nextInt(31)+10));
                granjero.setProduccionAlimento((float)(new Random().nextInt(101)+100));
                pstmt.setInt(1,granjero.getJugador().getIdJugador());
                pstmt.setString(2,granjero.getNombre());
                pstmt.setString(3,profesion);
                pstmt.setString(4,granjero.getGenero());
                pstmt.setInt(5,granjero.getHorasDia());
                pstmt.setInt(6,granjero.getDiasVivo());
                pstmt.setBoolean(7,granjero.isEstaExiliado());
                pstmt.setBoolean(8,granjero.isEstaMuerto());
                pstmt.setFloat(9,granjero.getAlimentacionDiaria());
                pstmt.setFloat(10,granjero.getMoral());
                pstmt.setNull(11, Types.FLOAT);
                pstmt.setFloat(12, granjero.getProduccionAlimento());
                pstmt.setNull(13, Types.FLOAT);
                pstmt.setNull(14, Types.VARCHAR);
                pstmt.setNull(15,Types.INTEGER);
                pstmt.executeUpdate();
            }else if(profesion.equals("Soldado")){
                Soldado soldado = new Soldado();
                soldado.setJugador(jugador);
                soldado.setNombre(nombre);
                soldado.setGenero(genero);
                soldado.setAlimentacionDiaria((float)(new Random().nextInt(31)+70));
                soldado.setMoral((float)(new Random().nextInt(21)+30));
                soldado.setFuerza((float)(new Random().nextInt(36)+15));
                soldado.setProduccionMoral((float)(new Random().nextInt(21)));
                pstmt.setInt(1,soldado.getJugador().getIdJugador());
                pstmt.setString(2,soldado.getNombre());
                pstmt.setString(3,profesion);
                pstmt.setString(4,soldado.getGenero());
                pstmt.setInt(5,soldado.getHorasDia());
                pstmt.setInt(6,soldado.getDiasVivo());
                pstmt.setBoolean(7,soldado.isEstaExiliado());
                pstmt.setBoolean(8,soldado.isEstaMuerto());
                pstmt.setFloat(9,soldado.getAlimentacionDiaria());
                pstmt.setFloat(10,soldado.getMoral());
                pstmt.setFloat(11,soldado.getFuerza());
                pstmt.setNull(12, Types.FLOAT);
                pstmt.setFloat(13, soldado.getProduccionMoral());
                pstmt.setNull(14, Types.VARCHAR);
                pstmt.setNull(15,Types.INTEGER);
                pstmt.executeUpdate();
            }else if(profesion.equals("Constructor")){
                Constructor constructor = new Constructor();
                constructor.setJugador(jugador);
                constructor.setNombre(nombre);
                constructor.setGenero(genero);
                constructor.setAlimentacionDiaria((float)(new Random().nextInt(21)+50));
                constructor.setMoral((float)(new Random().nextInt(31)+10));
                constructor.setFuerza((float)(new Random().nextInt(19)+2));
                constructor.setProduccionMoral((float)(new Random().nextInt(11)+10));
                pstmt.setInt(1,constructor.getJugador().getIdJugador());
                pstmt.setString(2,constructor.getNombre());
                pstmt.setString(3,profesion);
                pstmt.setString(4,constructor.getGenero());
                pstmt.setInt(5,constructor.getHorasDia());
                pstmt.setInt(6,constructor.getDiasVivo());
                pstmt.setBoolean(7,constructor.isEstaExiliado());
                pstmt.setBoolean(8,constructor.isEstaMuerto());
                pstmt.setFloat(9,constructor.getAlimentacionDiaria());
                pstmt.setFloat(10,constructor.getMoral());
                pstmt.setFloat(11,constructor.getFuerza());
                pstmt.setNull(12, Types.FLOAT);
                pstmt.setFloat(13, constructor.getProduccionMoral());
                pstmt.setNull(14, Types.VARCHAR);
                pstmt.setNull(15,Types.INTEGER);
                pstmt.executeUpdate();
            }
            String sql2 = "update jugador set horasDelDia=horasDelDia+? where idJugador=?";
            try(Connection conn2 = getConection();
                PreparedStatement pstmt2 = conn2.prepareStatement(sql2)){
                if(profesion.equals("Ninguna")){
                    pstmt2.setInt(1,2);
                }else{
                    pstmt2.setInt(1,8);
                }
                pstmt2.setInt(2,idJugador);
                pstmt2.executeUpdate();
            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public int obtenerHorasPorId(int idJugador){
        String sql = "select horasDelDia from jugador where idJugador=?";
        try(Connection conn = getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1,idJugador);
            try(ResultSet rs = pstmt.executeQuery()){
                if(rs.next()){
                    return rs.getInt(1);
                }else{
                    return 0;
                }
            }
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void editarNombreHabitante(String nombre, int idHabitante){
        String sql = "update habitante set nombre=? where idHabitante=?";
        try(Connection conn = getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,nombre);
            pstmt.setInt(2,idHabitante);
            pstmt.executeUpdate();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void exiliarHabitante(int idHabitante, int diaMuerte){
        String sql = "update habitante set estaExiliado=true where idHabitante=?";
        try(Connection conn = getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1,idHabitante);
            pstmt.executeUpdate();
            String sql2= "update habitante set moral=moral-? where idHabitante!=? and estaExiliado!=true and estaMuerto!=true";
            try(Connection conn2 = getConection();
                PreparedStatement pstmt2 = conn2.prepareStatement(sql2)){
                pstmt2.setFloat(1,new Random().nextFloat()*(this.obtenerMoralPorId(idHabitante)/2));
                pstmt2.setInt(2,idHabitante);
                pstmt2.executeUpdate();
            }
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        int idJugador = obtenerIdJugadorPorHabitante(idHabitante);
        ArrayList<Integer> listaIDs = habitantesConMoralMenorACero(idJugador);
        while(listaIDs.size()>0){
            for(int h: listaIDs){
                killHabitante(h,"Depresión",diaMuerte,idJugador);
            }
            listaIDs = habitantesConMoralMenorACero(idJugador);
        }
    }

    public int obtenerIdJugadorPorHabitante(int idHabitante){
        String sql = "select idjugador from habitante where idHabitante=?";
        try(Connection conn = getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1,idHabitante);
            try(ResultSet rs = pstmt.executeQuery()){
                if(rs.next()){
                    return rs.getInt(1);
                }else{
                    return 0;
                }
            }
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Integer> habitantesConMoralMenorACero(int idJugador){
        ArrayList<Integer> listaMuertos = new ArrayList<>();
        String sql = "select moral from habitante where moral<0 and idjugador=?";
        try(Connection conn = getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1,idJugador);
            try(ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    listaMuertos.add(rs.getInt(1));
                }
                return listaMuertos;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public float obtenerMoralPorId(int idHabitante){
        String sql = "select moral from habitante where idHabitante=?";
        try(Connection conn = getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1,idHabitante);
            try(ResultSet rs = pstmt.executeQuery()){
                if(rs.next()){
                    return rs.getFloat(1);
                }else{
                    return 0;
                }
            }
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
