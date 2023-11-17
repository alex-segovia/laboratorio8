package com.example.laboratorio8.Controllers;

import com.example.laboratorio8.Beans.Jugador;
import com.example.laboratorio8.Daos.DaoGuerra;
import com.example.laboratorio8.Daos.DaoHabitante;
import com.example.laboratorio8.Daos.DaoJugador;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "GuerraServlet", value = "/GuerraServlet")
public class GuerraServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        DaoGuerra dG=new DaoGuerra();
        Jugador jugadorActual=(Jugador) request.getSession().getAttribute("jugadorActual");
        String action = request.getParameter("action") == null ? "default" : request.getParameter("action");
        switch (action){
            case "default":
                request.setAttribute("historialGuerras",dG.historialGuerrasPorID(jugadorActual.getIdJugador()));
                request.setAttribute("guerraHaceUnDia",dG.guerraHaceUnDia(jugadorActual.getIdJugador()));
                request.setAttribute("listaJugadoresGuerra",dG.listaJugadoresGuerra(jugadorActual.getIdJugador()));
                request.getRequestDispatcher("guerra.jsp").forward(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        DaoJugador dJ=new DaoJugador();
        DaoGuerra dG=new DaoGuerra();
        DaoHabitante dH=new DaoHabitante();
        Jugador jugadorActual=(Jugador) request.getSession().getAttribute("jugadorActual");
        String action = request.getParameter("action") == null ? "default" : request.getParameter("action");
        switch (action){
            case "declararGuerra":
                int idJugadorAtacante=jugadorActual.getIdJugador();
                int idJugadorDefensor=Integer.parseInt(request.getParameter("idJugadorDefensor"));

                break;
        }
    }
}

