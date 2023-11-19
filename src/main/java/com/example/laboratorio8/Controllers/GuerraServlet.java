package com.example.laboratorio8.Controllers;

import com.example.laboratorio8.Beans.Constructor;
import com.example.laboratorio8.Beans.Habitante;
import com.example.laboratorio8.Beans.Jugador;
import com.example.laboratorio8.Beans.Soldado;
import com.example.laboratorio8.Daos.DaoGuerra;
import com.example.laboratorio8.Daos.DaoHabitante;
import com.example.laboratorio8.Daos.DaoJugador;
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
                    dJ.proceedEndDia(jugadorActual, dH);
                    float fuerzaTotalAtacante = dG.getSumaFuerzaPorProfesion(jugadorActual.getIdJugador(), "Soldado");
                    float fuerzaTotalDefensor = dG.getSumaFuerzaPorProfesion(jugadorDefensor.getIdJugador(), "Soldado") + dG.getSumaFuerzaPorProfesion(jugadorDefensor.getIdJugador(), "Constructor");
                    ArrayList<Habitante> listaHabitantesAtacantes = dH.listarHabitantes(jugadorActual.getIdJugador());
                    ArrayList<Habitante> listaHabitantesDefensores = dH.listarHabitantes(jugadorDefensor.getIdJugador());
                    if (fuerzaTotalAtacante > fuerzaTotalDefensor) {
                        dG.updateSoldadosVictoria(jugadorActual.getIdJugador());
                        dG.updateGranjerosVictoriaAtaque(jugadorActual.getIdJugador());
                        for (Habitante habitante : listaHabitantesDefensores) {
                            if (habitante instanceof Soldado || habitante instanceof Constructor) {
                                double numeroTotalmenteRandom = new Random().nextDouble();
                                if (numeroTotalmenteRandom < 0.6) {
                                    dH.killHabitante(habitante.getIdHabitante(), "Guerra", jugadorDefensor.getDiasDesdeCreacion(), jugadorActual.getIdJugador());
                                } else if (numeroTotalmenteRandom < 0.9) {
                                    dG.updateHabitanteSobrevivientePerderMoralDerrota(habitante.getIdHabitante());
                                } else {
                                    dG.updateTransferirHabitante(habitante.getIdHabitante(), jugadorActual.getIdJugador());
                                }
                            }
                        }
                        dG.updateHabitantesPerderMoralDerrotaDefensa(jugadorDefensor.getIdJugador());
                        dG.aumentarProduccionVictoriaAtaque(jugadorActual.getIdJugador(), jugadorDefensor.getIdJugador());
                        dG.nuevaGuerra(jugadorActual.getIdJugador(),jugadorDefensor.getIdJugador(),"Victoria atacante",jugadorActual.getDiasDesdeCreacion(),jugadorDefensor.getDiasDesdeCreacion());
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
                                }
                            }
                        }
                        dG.updateHabitantesPerderMoralDerrotaDefensa(jugadorActual.getIdJugador());
                        dG.nuevaGuerra(jugadorActual.getIdJugador(),jugadorDefensor.getIdJugador(),"Victoria defensiva",jugadorActual.getDiasDesdeCreacion(),jugadorDefensor.getDiasDesdeCreacion());
                    }else{
                        dG.nuevaGuerra(jugadorActual.getIdJugador(),jugadorDefensor.getIdJugador(),"Empate",jugadorActual.getDiasDesdeCreacion(),jugadorDefensor.getDiasDesdeCreacion());
                    }
                    dJ.proceedEndDia(jugadorActual, dH);
                    dJ.proceedEndDia(jugadorDefensor, dH);
                    response.sendRedirect("GuerraServlet");
                    break;
            }
        }else{
            response.sendRedirect(request.getContextPath());
        }
    }
}

