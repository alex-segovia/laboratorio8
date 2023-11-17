package com.example.laboratorio8.Controllers;

import com.example.laboratorio8.Beans.Habitante;
import com.example.laboratorio8.Daos.DaoHabitante;
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
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        DaoHabitante daoHabitante = new DaoHabitante();
        switch (action){
            case "listar":
                ArrayList<Habitante> listaHabitantes = new ArrayList<>();
                request.setAttribute("listaHabitantes",listaHabitantes);
                request.getRequestDispatcher("riseAndRevolt/habitantes.jsp").forward(request,response);
                break;
            case "exiliar":
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        DaoHabitante daoHabitante = new DaoHabitante();
        String action = request.getParameter("action") == null ? "crear" : request.getParameter("action");
        switch (action){
            case "crear":
                break;
            case "editar":
                break;
        }
    }
}

