package com.example.laboratorio8.Controllers;

import com.example.laboratorio8.Beans.Constructor;
import com.example.laboratorio8.Beans.Habitante;
import com.example.laboratorio8.Beans.Jugador;
import com.example.laboratorio8.Beans.Soldado;
import com.example.laboratorio8.Daos.DaoGuerra;
import com.example.laboratorio8.Daos.DaoHabitante;
import com.example.laboratorio8.Daos.DaoJugador;
import com.example.laboratorio8.Dtos.DtoGuerra;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

@WebServlet(name = "GuerraServlet", value = "/GuerraServlet")
public class GuerraServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        Jugador jugadorActual=(Jugador) request.getSession().getAttribute("jugadorActual");
        if(jugadorActual!=null) {
            DaoGuerra dG = new DaoGuerra();
            String action = request.getParameter("action") == null ? "default" : request.getParameter("action");
            switch (action) {
                case "default":
                    request.setAttribute("historialGuerras", dG.historialGuerrasPorID(jugadorActual.getIdJugador()));
                    request.setAttribute("guerraHaceUnDia", dG.guerraHaceUnDia(jugadorActual.getIdJugador()));
                    request.setAttribute("listaJugadoresGuerra", dG.listaJugadoresGuerra(jugadorActual.getIdJugador()));
                    request.getRequestDispatcher("guerra.jsp").forward(request, response);
                    break;
            }
        }else{
            response.sendRedirect(request.getContextPath());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        Jugador jugadorActual=(Jugador) request.getSession().getAttribute("jugadorActual");
        if(jugadorActual!=null) {
            DaoJugador dJ = new DaoJugador();
            DaoGuerra dG = new DaoGuerra();
            DaoHabitante dH = new DaoHabitante();
            String action = request.getParameter("action") == null ? "default" : request.getParameter("action");
            switch (action) {
                case "declararGuerra":
                    Jugador jugadorDefensor = dJ.getJugadorPorId(Integer.parseInt(request.getParameter("idJugadorDefensor")));
                    DtoGuerra resultadosAntesGuerraAtacante=new DtoGuerra(dG.getTotalFuerza(jugadorActual.getIdJugador()),dG.getTotalMoral(jugadorActual.getIdJugador()),dG.getTotalAlimentoAlmacen(jugadorActual.getIdJugador()),dG.getProduccionTotalAlimento(jugadorActual.getIdJugador()),dG.getProduccionTotalMoral(jugadorActual.getIdJugador()),dG.getTotalSoldados(jugadorActual.getIdJugador()),dG.getTotalConstructores(jugadorActual.getIdJugador()),dG.getTotalHabitantes(jugadorActual.getIdJugador()));
                    DtoGuerra resultadosAntesGuerraDefensor=new DtoGuerra(dG.getTotalFuerza(jugadorDefensor.getIdJugador()),dG.getTotalMoral(jugadorDefensor.getIdJugador()),dG.getTotalAlimentoAlmacen(jugadorDefensor.getIdJugador()),dG.getProduccionTotalAlimento(jugadorDefensor.getIdJugador()),dG.getProduccionTotalMoral(jugadorDefensor.getIdJugador()),dG.getTotalSoldados(jugadorDefensor.getIdJugador()),dG.getTotalConstructores(jugadorDefensor.getIdJugador()),dG.getTotalHabitantes(jugadorDefensor.getIdJugador()));
                    dJ.proceedEndDia(jugadorActual, dH);
                    float fuerzaTotalAtacante = dG.getSumaFuerzaPorProfesion(jugadorActual.getIdJugador(), "Soldado");
                    float fuerzaTotalDefensor = dG.getSumaFuerzaPorProfesion(jugadorDefensor.getIdJugador(), "Soldado") + dG.getSumaFuerzaPorProfesion(jugadorDefensor.getIdJugador(), "Constructor");
                    ArrayList<Habitante> listaHabitantesAtacantes = dH.listarHabitantes(jugadorActual.getIdJugador());
                    ArrayList<Habitante> listaHabitantesDefensores = dH.listarHabitantes(jugadorDefensor.getIdJugador());
                    int habitantesTransferidos=0;
                    String resultado="";
                    if (fuerzaTotalAtacante > fuerzaTotalDefensor) {
                        dG.updateSoldadosVictoria(jugadorActual.getIdJugador());
                        dG.updateGranjerosVictoriaAtaque(jugadorActual.getIdJugador());
                        for (Habitante habitante : listaHabitantesDefensores) {
                            if ((habitante instanceof Soldado || habitante instanceof Constructor)&&!habitante.isEstaMuerto()&&!habitante.isEstaExiliado()) {
                                double numeroTotalmenteRandom = new Random().nextDouble();
                                if (numeroTotalmenteRandom < 0.6) {
                                    dH.killHabitante(habitante.getIdHabitante(), "Guerra", jugadorDefensor.getDiasDesdeCreacion(), jugadorActual.getIdJugador());
                                } else if (numeroTotalmenteRandom < 0.9) {
                                    dG.updateHabitanteSobrevivientePerderMoralDerrota(habitante.getIdHabitante());
                                } else {
                                    dG.updateTransferirHabitante(habitante.getIdHabitante(), jugadorActual.getIdJugador());
                                    habitantesTransferidos++;
                                }
                            }
                        }
                        dG.updateHabitantesPerderMoralDerrotaDefensa(jugadorDefensor.getIdJugador());
                        dG.aumentarProduccionVictoriaAtaque(jugadorActual.getIdJugador(), jugadorDefensor.getIdJugador());
                        resultado="Victoria atacante";
                    } else if (fuerzaTotalAtacante < fuerzaTotalDefensor) {
                        dG.updateSoldadosVictoria(jugadorDefensor.getIdJugador());
                        dG.updateHabitantesVictoriaDefensa(jugadorDefensor.getIdJugador());
                        for (Habitante habitante : listaHabitantesAtacantes) {
                            if (habitante instanceof Soldado) {
                                double numeroTotalmenteRandom = new Random().nextDouble();
                                if (numeroTotalmenteRandom < 0.6) {
                                    dH.killHabitante(habitante.getIdHabitante(), "Guerra", jugadorActual.getDiasDesdeCreacion(),jugadorActual.getIdJugador());
                                } else if (numeroTotalmenteRandom < 0.9) {
                                    dG.updateHabitanteSobrevivientePerderMoralDerrota(habitante.getIdHabitante());
                                } else {
                                    dG.updateTransferirHabitante(habitante.getIdHabitante(), jugadorDefensor.getIdJugador());
                                    habitantesTransferidos++;
                                }
                            }
                        }
                        resultado="Victoria defensiva";
                        dG.updateHabitantesPerderMoralDerrotaDefensa(jugadorActual.getIdJugador());
                    }else{
                        resultado="Empate";
                    }
                    dJ.proceedEndDia(jugadorActual, dH);
                    dJ.proceedEndDia(jugadorDefensor, dH);
                    DtoGuerra resultadosDespuesGuerraAtacante=new DtoGuerra(dG.getTotalFuerza(jugadorActual.getIdJugador()),dG.getTotalMoral(jugadorActual.getIdJugador()),dG.getTotalAlimentoAlmacen(jugadorActual.getIdJugador()),dG.getProduccionTotalAlimento(jugadorActual.getIdJugador()),dG.getProduccionTotalMoral(jugadorActual.getIdJugador()),dG.getTotalSoldados(jugadorActual.getIdJugador()),dG.getTotalConstructores(jugadorActual.getIdJugador()),dG.getTotalHabitantes(jugadorActual.getIdJugador()));
                    DtoGuerra resultadosDespuesGuerraDefensor=new DtoGuerra(dG.getTotalFuerza(jugadorDefensor.getIdJugador()),dG.getTotalMoral(jugadorDefensor.getIdJugador()),dG.getTotalAlimentoAlmacen(jugadorDefensor.getIdJugador()),dG.getProduccionTotalAlimento(jugadorDefensor.getIdJugador()),dG.getProduccionTotalMoral(jugadorDefensor.getIdJugador()),dG.getTotalSoldados(jugadorDefensor.getIdJugador()),dG.getTotalConstructores(jugadorDefensor.getIdJugador()),dG.getTotalHabitantes(jugadorDefensor.getIdJugador()));
                    dG.nuevaGuerra(jugadorActual.getIdJugador(),jugadorDefensor.getIdJugador(),resultado,jugadorActual.getDiasDesdeCreacion(),jugadorDefensor.getDiasDesdeCreacion(),resultadosAntesGuerraAtacante,resultadosDespuesGuerraAtacante,resultadosAntesGuerraDefensor,resultadosDespuesGuerraDefensor,habitantesTransferidos,fuerzaTotalAtacante,fuerzaTotalDefensor);
                    response.sendRedirect("GuerraServlet");
                    break;
            }
        }else{
            response.sendRedirect(request.getContextPath());
        }
    }
}

