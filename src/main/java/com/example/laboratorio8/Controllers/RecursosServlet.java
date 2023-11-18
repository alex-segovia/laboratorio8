package com.example.laboratorio8.Controllers;

import com.example.laboratorio8.Beans.Habitante;
import com.example.laboratorio8.Beans.Jugador;
import com.example.laboratorio8.Daos.DaoHabitante;
import com.example.laboratorio8.Daos.DaoJugador;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;

@WebServlet(name = "RecursosServlet", value = "/RecursosServlet")
public class RecursosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Sesión
        HttpSession httpSession = request.getSession();

        // Parámetros
        String action = request.getParameter("action") == null ? "listado" : request.getParameter("action");
        Jugador jugador = (Jugador) httpSession.getAttribute("jugadorActual");
        if(jugador!=null) {
            RequestDispatcher view;
            view = request.getRequestDispatcher("recursos.jsp");

            // Daos
            DaoJugador daoJugador = new DaoJugador();
            DaoHabitante daoHabitante = new DaoHabitante();

            // Datos
            ArrayList<Habitante> habitantesMoralBaja = daoHabitante.getHabitantesMoralBaja(jugador.getIdJugador());
            ArrayList<Float> alimentoProduccionVsConsumo = daoHabitante.getAlimentoProduccionVsConsumo(jugador.getIdJugador());
            ArrayList<Habitante> habitantesMuertos = daoHabitante.getHabitantesMuertos(jugador.getIdJugador(), jugador.getDiasDesdeCreacion());

            switch (action) {
                case "listado":
                    request.setAttribute("habitantesMoralBaja", habitantesMoralBaja);
                    request.setAttribute("alimentoProduccionVsConsumo", alimentoProduccionVsConsumo);
                    request.setAttribute("habitantesMuertos", habitantesMuertos);
                    break;
                default:

                    break;
            }

            // Se actualiza la información del jugador por cada cambio de vista
            httpSession.setAttribute("jugadorActual", daoJugador.getJugadorPorId(jugador.getIdJugador()));
            view.forward(request, response);
        }else{
            response.sendRedirect("");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Sesión
        HttpSession httpSession = request.getSession();

        // Parámetros
        String action = request.getParameter("action") == null ? "listado" : request.getParameter("action");
        Jugador jugador = (Jugador) httpSession.getAttribute("jugadorActual");
        if(jugador!=null) {
            // Daos
            DaoJugador daoJugador = new DaoJugador();
            DaoHabitante daoHabitante = new DaoHabitante();

            switch (action) {

                case "pasarHoras":
                    if (!(jugador.getHorasDia() >= 24) ) {
                        daoJugador.skipHoras(jugador.getIdJugador());
                    }
                    break;

                case "terminarDia":
                    if (jugador.getHorasDia() >= 24) {
                        daoJugador.proceedEndDia(jugador, daoHabitante);
                    }
                    break;

                default:
                    // Nothing

            }

            response.sendRedirect("RecursosServlet");
        }else{
            response.sendRedirect("");
        }
    }
}

