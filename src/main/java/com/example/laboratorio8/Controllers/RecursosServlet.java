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
        Jugador jugador = (Jugador) httpSession.getAttribute("jugadorLogueado");

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
        httpSession.setAttribute("jugadorLogueado",daoJugador.obtenerJugadorPorId(jugador.getIdJugador()));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Sesión
        HttpSession httpSession = request.getSession();

        // Parámetros
        String action = request.getParameter("action") == null ? "listado" : request.getParameter("action");
        Jugador jugador = (Jugador) httpSession.getAttribute("jugadorLogueado");

        RequestDispatcher view;

        // Daos
        DaoJugador daoJugador = new DaoJugador();
        DaoHabitante daoHabitante = new DaoHabitante();


        switch (action){

            case "pasarHoras":
                daoJugador.pasarHoras(jugador.getIdJugador());
                break;

            case "terminarDia":

                // Por ver si el codigo se ejecuta aqui o no

                // Alimentar a la población: MUERTES POR HAMBRE

                ArrayList<Habitante> listaHabitantes = daoHabitante.getListaHabitantes(jugador.getIdJugador());
                Float alimentoProducido = daoHabitante.getAlimentoProduccionVsConsumo(jugador.getIdJugador()).get(1);

                ArrayList<Integer> indicesHabitantes = new ArrayList<>();

                for(int i = 0; i<listaHabitantes.size(); i++){
                    indicesHabitantes.add(i);
                }

                Collections.shuffle(indicesHabitantes);

                Float alimentoAConsumir = 0.0f;
                float moralPerdida = 0.0f;

                for(Integer j: indicesHabitantes){

                    Habitante habitante = listaHabitantes.get(j);

                    alimentoAConsumir = habitante.getAlimentacionDiaria();

                    if(alimentoProducido>=0.0f){
                        if((alimentoProducido-alimentoAConsumir)>0.0f){
                            alimentoProducido = alimentoProducido - alimentoAConsumir;
                        }else{
                            moralPerdida = habitante.getMoral() - (alimentoAConsumir - alimentoProducido);
                            if(moralPerdida <= 0.0f){
                                daoHabitante.updateMoral(jugador.getIdJugador(), habitante.getIdHabitante(), 0.0f);
                                daoHabitante.killHabitante(jugador.getIdJugador(), habitante.getIdHabitante(),"Hambre"); // Añadir dia muerte
                            }
                            daoHabitante.updateMoral(jugador.getIdJugador(), habitante.getIdHabitante(), moralPerdida);
                        }
                    }else{
                        alimentoProducido = 0.0f;
                    }
                }

                // Crecimiento de la población: MUERTES POR DESESPERACIÓN

                int cantidadPoblacion = listaHabitantes.size();
                int diasPasados = jugador.getDiasDesdeCreacion();

                if(cantidadPoblacion>4*diasPasados){
                    System.out.println("Aiuda");
                }else{
                    // Se puede hacer de otra manera pero noseeeee
                    daoHabitante.updateMoralMultiple(jugador.getIdJugador(), "Desesperación"); // Añadir dia muerte
                }

                // Subir moral:

                daoHabitante.updateMoralMultiple(jugador.getIdJugador());

                // Se termina el día:

                daoJugador.terminarDia(jugador.getIdJugador());
        }

        response.sendRedirect("RecursosServlet");
        httpSession.setAttribute("jugadorLogueado",daoJugador.obtenerJugadorPorId(jugador.getIdJugador()));
    }
}

