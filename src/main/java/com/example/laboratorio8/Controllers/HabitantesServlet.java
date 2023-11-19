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
        if(jugadorActual!=null) {
            DaoHabitante daoHabitante = new DaoHabitante();
            DaoJugador daoJugador = new DaoJugador();
            request.setAttribute("listaHabitantes", daoHabitante.listarHabitantes(jugadorActual.getIdJugador()));
            request.getSession().setAttribute("jugadorActual", daoJugador.getJugadorPorId(jugadorActual.getIdJugador()));
            request.getRequestDispatcher("habitantes.jsp").forward(request, response);
        }else{
            response.sendRedirect(request.getContextPath());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        Jugador jugadorActual=(Jugador) request.getSession().getAttribute("jugadorActual");
        if(jugadorActual!=null) {
            DaoHabitante daoHabitante = new DaoHabitante();
            String action = request.getParameter("action") == null ? "crear" : request.getParameter("action");
            switch (action) {
                case "crear":
                    String nombreHabitante = request.getParameter("nombreHabitante");
                    if (nombreHabitante.length() > 10 || jugadorActual.getHorasDia() > 23) {
                        response.sendRedirect("HabitantesServlet");
                    } else {
                        String generoHabitante = request.getParameter("generoHabitante");
                        String profesionHabitante = request.getParameter("profesionHabitante");
                        int horasAdd = profesionHabitante.equals("Ninguna")?2:8;
                        if(!(horasAdd + jugadorActual.getHorasDia()>24)){
                            daoHabitante.crearHabitante(nombreHabitante, generoHabitante, profesionHabitante, jugadorActual.getIdJugador());
                        }
                        response.sendRedirect("HabitantesServlet");
                    }
                    break;
                case "editar":
                    String nombreNuevo = request.getParameter("nombreNuevoHabitante");
                    if (nombreNuevo.length() > 10) {
                        response.sendRedirect("HabitantesServlet");
                    } else {
                        int idHabitante = Integer.parseInt(request.getParameter("idHabitante"));
                        daoHabitante.editarNombreHabitante(nombreNuevo, idHabitante);
                        response.sendRedirect("HabitantesServlet");
                    }
                    break;
                case "exiliar":
                    int idHabitante = Integer.parseInt(request.getParameter("idHabitante"));
                    daoHabitante.exiliarHabitante(idHabitante, jugadorActual.getDiasDesdeCreacion());
                    response.sendRedirect("HabitantesServlet");
                    break;
            }
        }else{
            response.sendRedirect(request.getContextPath());
        }
    }
}

