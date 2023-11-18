package com.example.laboratorio8.Controllers;

import com.example.laboratorio8.Beans.Jugador;
import com.example.laboratorio8.Daos.DaoHabitante;
import com.example.laboratorio8.Daos.DaoJugador;
import com.example.laboratorio8.Daos.DaoLeaderboard;
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
            response.sendRedirect(request.getContextPath());
        }else {
            DaoJugador daoJugador = new DaoJugador();
            DaoLeaderboard daoLeaderboard = new DaoLeaderboard();
            int tipo;
            String orden = (String) request.getParameter("orden");
            try{
                tipo = Integer.parseInt(orden);
            }catch (NumberFormatException e){
                tipo = 1;
            }
            request.getSession().setAttribute("jugadorActual", daoJugador.getJugadorPorId(jugadorActual.getIdJugador()));
            request.setAttribute("top10",daoLeaderboard.listaLeaderboard(tipo));
            request.getRequestDispatcher("leaderboard.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

