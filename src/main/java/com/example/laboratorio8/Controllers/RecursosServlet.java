package com.example.laboratorio8.Controllers;

import com.example.laboratorio8.Beans.Jugador;
import com.example.laboratorio8.Daos.DaoHabitante;
import com.example.laboratorio8.Daos.DaoJugador;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "RecursosServlet", value = "/RecursosServlet")
public class RecursosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {





    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession httpSession = request.getSession();

        String action = request.getParameter("action") == null ? "listado" : request.getParameter("action");
        Jugador jugador = (Jugador) httpSession.getAttribute("jugadorLogueado");

        RequestDispatcher view;

        DaoJugador daoJugador = new DaoJugador();
        DaoHabitante daoHabitante = new DaoHabitante();



        switch (action){

            case "pasarHoras":





                break;



        }

    }
}

