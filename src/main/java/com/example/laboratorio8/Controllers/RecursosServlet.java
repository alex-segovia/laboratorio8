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

        RequestDispatcher view;

        // Daos
        DaoJugador daoJugador = new DaoJugador();
        DaoHabitante daoHabitante = new DaoHabitante();

        // Datos
        ArrayList<Habitante> habitantesMoralBaja= daoHabitante.getHabitantesMoralBaja(jugador.getIdJugador());
        ArrayList<Float> alimentoProduccionVsConsumo = daoHabitante.getAlimentoProduccionVsConsumo(jugador.getIdJugador());
        ArrayList<Habitante> habitantesMuertos = daoHabitante.getHabitantesMuertos(jugador.getIdJugador()); // revisarrr

        switch (action){
            case "listado":
                request.setAttribute("habitantesMoralBaja",habitantesMoralBaja);
                request.setAttribute("alimentoProduccionVsConsumo",alimentoProduccionVsConsumo);
                request.setAttribute("habitantesMuertos",habitantesMuertos); // revisarrr
                break;
            default:
                System.out.println("uwu");
                break;
        }
        // Se actualiza la información del jugador por cada cambio de vista
        httpSession.setAttribute("jugadorActual",daoJugador.getJugadorPorId(jugador.getIdJugador()));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Sesión
        HttpSession httpSession = request.getSession();

        // Parámetros
        String action = request.getParameter("action") == null ? "listado" : request.getParameter("action");
        Jugador jugador = (Jugador) httpSession.getAttribute("jugadorActual");

        RequestDispatcher view;

        // Daos
        DaoJugador daoJugador = new DaoJugador();
        DaoHabitante daoHabitante = new DaoHabitante();


        switch (action){

            case "pasarHoras":
                httpSession.setAttribute("validacionPasarHoras",false);
                httpSession.setAttribute("validacionTerminarDia",true);
                daoJugador.skipHoras(jugador.getIdJugador());
                break;

            case "terminarDia":
                httpSession.setAttribute("validacionPasarHoras",true);
                httpSession.setAttribute("validacionTerminarDia",false);

                daoJugador.proceedEndDia(jugador, daoHabitante);

                break;

                default:
                    // Nothing

        }

        httpSession.setAttribute("jugadorActual",daoJugador.getJugadorPorId(jugador.getIdJugador()));
        response.sendRedirect("RecursosServlet");

    }
}

