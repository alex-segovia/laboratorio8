package com.example.laboratorio8.Controllers;

import java.io.*;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.example.laboratorio8.Beans.Jugador;
import com.example.laboratorio8.Daos.DaoJugador;
import com.example.laboratorio8.Daos.DaoListaNegra;
import com.mysql.cj.Session;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "InicioSesionServlet", value = "")
public class InicioSesionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String action = request.getParameter("action") == null ? "default" : request.getParameter("action");
        switch (action){
            case "default":
                request.getRequestDispatcher("inicioSesion/inicioSesion.jsp").forward(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        DaoListaNegra dLN=new DaoListaNegra();
        DaoJugador dJ=new DaoJugador();
        String action = request.getParameter("action") == null ? "default" : request.getParameter("action");
        switch (action){
            case "logIn":
                String usuarioCorreoLogin=request.getParameter("login");
                String contrasenaLogin=request.getParameter("password");
                request.setAttribute("usuarioCorreoLogin",usuarioCorreoLogin);
                boolean succesfulLogin=true;
                if(usuarioCorreoLogin.isEmpty()){
                    try {
                        Thread.sleep(1);
                    } catch (InterruptedException e) {
                        throw new RuntimeException(e);
                    }
                    request.getSession().setAttribute("usuarioCorreoLoginVacio","1");
                    succesfulLogin=false;
                }if(contrasenaLogin.isEmpty()){
                    try {
                        Thread.sleep(1);
                    } catch (InterruptedException e) {
                        throw new RuntimeException(e);
                    }
                    request.getSession().setAttribute("contrasenaLoginVacia","2");
                    succesfulLogin=false;
                }Jugador jugador= dJ.logIn(usuarioCorreoLogin,contrasenaLogin);
                if(jugador==null){
                    try {
                        Thread.sleep(1);
                    } catch (InterruptedException e) {
                        throw new RuntimeException(e);
                    }
                    request.getSession().setAttribute("loginError","3");
                    response.sendRedirect(request.getContextPath());
                }else{
                    if(!succesfulLogin) {
                        try {
                            Thread.sleep(1);
                        } catch (InterruptedException e) {
                            throw new RuntimeException(e);
                        }
                        response.sendRedirect(request.getContextPath());
                    }else if(dJ.estaEnPaz(jugador.getIdJugador())){
                        request.getSession().setAttribute("jugadorActual",jugador);
                        response.sendRedirect("HabitantesServlet");
                    }else{
                        request.getSession().setAttribute("primeraVez","1");
                        request.getSession().setAttribute("jugadorActual",jugador);
                        response.sendRedirect("GuerraServlet");
                    }
                }
                break;
            case "signIn":
                HttpSession s=request.getSession();
                String nombre=request.getParameter("nombre");
                request.setAttribute("nombre",nombre);
                String usuario=request.getParameter("usuario");
                request.setAttribute("usuario",usuario);
                String edad=request.getParameter("edad");
                request.setAttribute("edad",edad);
                String correo=request.getParameter("correo");
                request.setAttribute("correo",correo);
                String contrasena=request.getParameter("contrasena");
                String repetirContrasena=request.getParameter("repetirContrasena");
                boolean validacion=true;

                if(usuario.isEmpty()){
                    s.setAttribute("usuarioVacio","4");
                    validacion=false;
                }else{
                    char[] usuarioAux=usuario.toCharArray();
                    if(usuarioAux[0]=='0'||usuarioAux[0]=='1'||usuarioAux[0]=='2'||usuarioAux[0]=='3'||usuarioAux[0]=='4'||usuarioAux[0]=='5'||usuarioAux[0]=='6'||usuarioAux[0]=='7'||usuarioAux[0]=='8'||usuarioAux[0]=='9'){
                        s.setAttribute("usuarioError","5");
                        validacion=false;
                    }else{
                        if(usuario.length()>45){
                            s.setAttribute("usuarioLargo","6");
                            validacion=false;
                        }else {
                            if(dJ.verifyUsuarioRepetido(usuario)){
                                s.setAttribute("usuarioRepetido","7");
                                validacion=false;
                            }
                        }
                    }
                }






                if(nombre.isEmpty()){
                    s.setAttribute("nombreVacio","8");
                    validacion=false;
                }else{
                    char[] nombreAux=nombre.toCharArray();
                    if(nombreAux[0]=='0'||nombreAux[0]=='1'||nombreAux[0]=='2'||nombreAux[0]=='3'||nombreAux[0]=='4'||nombreAux[0]=='5'||nombreAux[0]=='6'||nombreAux[0]=='7'||nombreAux[0]=='8'||nombreAux[0]=='9'){
                        s.setAttribute("nombreError","9");
                        validacion=false;
                    }else{
                        if(nombre.length()>45){
                            s.setAttribute("nombreLargo","10");
                            validacion=false;
                        }
                    }
                }




                if(correo.isEmpty()){
                    s.setAttribute("correoVacio","11");
                    validacion=false;
                }else{
                    if(correo.length()>45){
                        s.setAttribute("correoLargo","12");
                        validacion=false;
                    }else{
                        if(dLN.verifyCorreo(correo)){
                            s.setAttribute("correoListaNegra","13");
                            validacion=false;
                        }else if(dJ.verifyCorreoRepetido(correo)){
                            s.setAttribute("correoRepetido","14");
                            validacion=false;
                        }
                    }
                }



                if(contrasena.isEmpty()){
                    s.setAttribute("contrasenaVacia","15");
                    validacion=false;
                }if(repetirContrasena.isEmpty()){
                    s.setAttribute("repetirContrasenaVacia","16");
                    validacion=false;
                }if(!contrasena.equals(repetirContrasena)){
                    s.setAttribute("contrasenasDiferentes","17");
                    validacion=false;
                }else{
                    if(contrasena.length()>45){
                        s.setAttribute("contrasenaLarga","18");
                        validacion=false;
                    }else{
                        String regexMayuscula = ".*[A-Z].*";
                        String regexNumero = ".*\\d.*";
                        String regexEspecial = ".*[^A-Za-z0-9].*";
                        Pattern patternMayuscula = Pattern.compile(regexMayuscula);
                        Pattern patternNumero = Pattern.compile(regexNumero);
                        Pattern patternEspecial = Pattern.compile(regexEspecial);
                        Matcher matcherMayuscula = patternMayuscula.matcher(contrasena);
                        Matcher matcherNumero = patternNumero.matcher(contrasena);
                        Matcher matcherEspecial = patternEspecial.matcher(contrasena);
                        boolean contieneMayuscula = matcherMayuscula.matches();
                        boolean contieneNumero = matcherNumero.matches();
                        boolean contieneEspecial = matcherEspecial.matches();
                        if (!(contieneMayuscula && contieneNumero && contieneEspecial)) {
                            s.setAttribute("contrasenaIncorrecta","19");
                            validacion=false;
                        }
                    }
                }


                if(edad.isEmpty()){
                    s.setAttribute("edadVacia","20");
                    validacion=false;
                }else{
                    try{
                        Integer edadAux=Integer.parseInt(edad);
                        if(edadAux<12&&validacion){
                            dLN.insertListaNegra(correo);
                        }
                    }catch (NumberFormatException e){
                        s.setAttribute("edadError","21");
                        validacion=false;
                    }
                }

                if(validacion){
                    dJ.signIn(nombre,usuario,Integer.parseInt(edad),correo,contrasena);
                }


                response.sendRedirect(request.getContextPath());
                return;
        }
    }
}