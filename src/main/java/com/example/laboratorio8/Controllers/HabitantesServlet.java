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

@WebServlet(name = "HabitantesServlet", value = "/HabitantesServlet")
public class HabitantesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        Jugador jugadorActual=(Jugador) request.getSession().getAttribute("jugadorActual");
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        DaoHabitante daoHabitante = new DaoHabitante();
        DaoJugador daoJugador = new DaoJugador();
        switch (action){
            case "listar":
                request.setAttribute("listaHabitantes",daoHabitante.listarHabitantes(1));
                request.getSession().setAttribute("jugadorActual",daoJugador.getJugadorPorId(1));
                request.getRequestDispatcher("habitantes.jsp").forward(request,response);
                break;
            case "exiliar":
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        DaoHabitante daoHabitante = new DaoHabitante();
        DaoJugador daoJugador = new DaoJugador();
        Jugador jugadorActual=(Jugador) request.getSession().getAttribute("jugadorActual");
        String action = request.getParameter("action") == null ? "crear" : request.getParameter("action");
        switch (action){
            case "crear":
                String nombreHabitante = request.getParameter("nombreHabitante");
                if(nombreHabitante.length()>10){
                    request.setAttribute("listaHabitantes",daoHabitante.listarHabitantes(1));
                    request.getSession().setAttribute("jugadorActual",daoJugador.getJugadorPorId(1));
                    request.getRequestDispatcher("habitantes.jsp").forward(request,response);
                }else{
                    String generoHabitante = request.getParameter("generoHabitante");
                    String profesionHabitante = request.getParameter("profesionHabitante");
                    daoHabitante.crearHabitante(nombreHabitante,generoHabitante,profesionHabitante,1);
                    response.sendRedirect("HabitantesServlet");
                }
                break;
            case "editar":

                break;
            case "exhiliar":
                break;
        }
    }
}

