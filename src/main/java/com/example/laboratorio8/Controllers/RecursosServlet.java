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
        System.out.println("holiwis");

        // Sesión
        HttpSession httpSession = request.getSession();

        // Parámetros
        String action = request.getParameter("action") == null ? "listado" : request.getParameter("action");
        Jugador jugador = (Jugador) httpSession.getAttribute("jugadorActual");

        RequestDispatcher view;
        view = request.getRequestDispatcher("recursos.jsp");

        // Daos
        DaoJugador daoJugador = new DaoJugador();
        DaoHabitante daoHabitante = new DaoHabitante();

        jugador = daoJugador.getJugadorPorId(1);
        // Datos
        ArrayList<Habitante> habitantesMoralBaja= daoHabitante.getHabitantesMoralBaja(jugador.getIdJugador());
        ArrayList<Float> alimentoProduccionVsConsumo = daoHabitante.getAlimentoProduccionVsConsumo(jugador.getIdJugador());
        ArrayList<Habitante> habitantesMuertos = daoHabitante.getHabitantesMuertos(jugador.getIdJugador(),jugador.getDiasDesdeCreacion());

        switch (action){
            case "listado":
                request.setAttribute("habitantesMoralBaja",habitantesMoralBaja);
                request.setAttribute("alimentoProduccionVsConsumo",alimentoProduccionVsConsumo);
                request.setAttribute("habitantesMuertos",habitantesMuertos);
                break;
            default:
                System.out.println("uwu owo");
                break;
        }

        // Se actualiza la información del jugador por cada cambio de vista
        Jugador xd = daoJugador.getJugadorPorId(1);
        httpSession.setAttribute("jugadorActual",daoJugador.getJugadorPorId(jugador.getIdJugador()));
        request.setAttribute("jugadorActual",xd);
        System.out.println("holiwis 2");
        view.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("uwu");
        // Sesión
        HttpSession httpSession = request.getSession();

        // Parámetros
        String action = request.getParameter("action") == null ? "listado" : request.getParameter("action");
        Jugador jugador = (Jugador) httpSession.getAttribute("jugadorActual");

        // Daos
        DaoJugador daoJugador = new DaoJugador();
        DaoHabitante daoHabitante = new DaoHabitante();

        jugador = daoJugador.getJugadorPorId(1);
        switch (action){

            case "pasarHoras":
                if(!(jugador.getHorasDia()==24)){
                    daoJugador.skipHoras(jugador.getIdJugador());
                }

                break;

            case "terminarDia":
                if(jugador.getHorasDia()==24){
                    daoJugador.proceedEndDia(jugador, daoHabitante);
                }
                break;

            default:
                    // Nothing

        }

        httpSession.setAttribute("jugadorActual",daoJugador.getJugadorPorId(jugador.getIdJugador()));
        response.sendRedirect("RecursosServlet");

    }
}

