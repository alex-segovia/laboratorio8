package com.example.laboratorio8.Controllers;

import com.example.laboratorio8.Beans.Jugador;
import com.example.laboratorio8.Daos.DaoHabitante;
import com.example.laboratorio8.Daos.DaoJugador;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LeaderboardServlet", value = "/LeaderboardServlet")
public class LeaderboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        Jugador jugadorActual=(Jugador) request.getSession().getAttribute("jugadorActual");
        if(jugadorActual==null){
            response.sendRedirect("");
        }else {
            DaoJugador daoJugador = new DaoJugador();
            request.getSession().setAttribute("jugadorActual", daoJugador.getJugadorPorId(jugadorActual.getIdJugador()));
            request.getRequestDispatcher("leaderboard.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

