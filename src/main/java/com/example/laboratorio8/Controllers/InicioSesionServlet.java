package com.example.laboratorio8.Controllers;

import java.io.*;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.example.laboratorio8.Beans.Jugador;
import com.example.laboratorio8.Daos.DaoGuerra;
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
                if(request.getSession().getAttribute("jugadorActual")!=null){
                    response.sendRedirect("HabitantesServlet");
                }else{
                    if(request.getSession().getAttribute("atributo")==null){
                        request.getSession().setAttribute("atributo","*");
                    }
                    request.getRequestDispatcher("inicioSesion/inicioSesion.jsp").forward(request,response);
                }
                break;
            case "logOut":
                request.getSession().removeAttribute("jugadorActual");
                request.getSession().invalidate();
                response.sendRedirect(request.getContextPath());
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        DaoListaNegra dLN=new DaoListaNegra();
        DaoJugador dJ=new DaoJugador();
        DaoGuerra dG=new DaoGuerra();
        request.getSession().setAttribute("primeraVez","**");
        String action = request.getParameter("action") == null ? "default" : request.getParameter("action");
        switch (action){
            case "logIn":
                String usuarioCorreoLogin=request.getParameter("login");
                String contrasenaLogin=request.getParameter("password");
                request.setAttribute("usuarioCorreoLogin",usuarioCorreoLogin);
                String atributoL="L-";
                boolean succesfulLogin=true;
                if(usuarioCorreoLogin.isEmpty()){
                    atributoL+="1";
                    succesfulLogin=false;
                }else {
                    atributoL+="0";
                }
                atributoL+="-";
                if(contrasenaLogin.isEmpty()){
                    atributoL+="1";
                    succesfulLogin=false;
                }else{
                    atributoL+="0";
                }
                atributoL+="-";
                Jugador jugador= dJ.logIn(usuarioCorreoLogin,contrasenaLogin);
                if(jugador==null){
                    atributoL+="1";
                    request.getSession().setAttribute("atributo",atributoL);
                    response.sendRedirect(request.getContextPath());
                }else{
                    if(!succesfulLogin) {
                        atributoL+="0";
                        request.getSession().setAttribute("atributo",atributoL);
                        response.sendRedirect(request.getContextPath());
                    }else{
                        request.getSession().setAttribute("jugadorActual",jugador);
                        if(!dG.guerraHaceUnDia(jugador.getIdJugador())){
                            response.sendRedirect("HabitantesServlet");
                        }else{
                            response.sendRedirect("GuerraServlet");
                        }
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
                String atributo="";
                if(usuario.isEmpty()){
                    atributo+="1";
                    validacion=false;
                }else{
                    atributo+="0";
                    char[] usuarioAux=usuario.toCharArray();
                    if(usuarioAux[0]=='0'||usuarioAux[0]=='1'||usuarioAux[0]=='2'||usuarioAux[0]=='3'||usuarioAux[0]=='4'||usuarioAux[0]=='5'||usuarioAux[0]=='6'||usuarioAux[0]=='7'||usuarioAux[0]=='8'||usuarioAux[0]=='9'){
                        atributo+="1";
                        validacion=false;
                    }else{
                        atributo+="0";
                        if(usuario.length()>45){
                            atributo+="1";
                            validacion=false;
                        }else {
                            atributo+="0";
                            if(dJ.verifyUsuarioRepetido(usuario)){
                                atributo+="1";
                                validacion=false;
                            }else{
                                atributo+="0";
                            }
                        }
                    }
                }





                atributo+="-";
                if(nombre.isEmpty()){
                    atributo+="1";
                    validacion=false;
                }else{
                    atributo+="0";
                    char[] nombreAux=nombre.toCharArray();
                    if(nombreAux[0]=='0'||nombreAux[0]=='1'||nombreAux[0]=='2'||nombreAux[0]=='3'||nombreAux[0]=='4'||nombreAux[0]=='5'||nombreAux[0]=='6'||nombreAux[0]=='7'||nombreAux[0]=='8'||nombreAux[0]=='9'){
                        atributo+="1";
                        validacion=false;
                    }else{
                        atributo+="0";
                        if(nombre.length()>45){
                            atributo+="1";
                            validacion=false;
                        }else {
                            atributo+="0";
                        }
                    }
                }

                atributo+="-";


                if(correo.isEmpty()){
                    atributo+="1";
                    validacion=false;
                }else{
                    atributo+="0";
                    if(correo.length()>45){
                        atributo+="1";
                        validacion=false;
                    }else{
                        atributo+="0";
                        if(dLN.verifyCorreo(correo)){
                            atributo+="1";
                            validacion=false;
                        }else{
                            atributo+="0";
                            if(dJ.verifyCorreoRepetido(correo)){
                                atributo+="1";
                                validacion=false;
                            }else{
                                atributo+="0";
                            }
                        }
                    }
                }

                atributo+="-";

                if(contrasena.isEmpty()){
                    atributo+="1";
                    validacion=false;
                }else{
                    atributo+="0";
                }
                atributo+="-";
                if(repetirContrasena.isEmpty()){
                    atributo+="1";
                    validacion=false;
                }else {
                    atributo+="0";
                }
                atributo+="-";
                if(!contrasena.equals(repetirContrasena)){
                    atributo+="1";
                    validacion=false;
                }else{
                    atributo+="0";
                    if(contrasena.length()>45){
                        atributo+="1";
                        validacion=false;
                    }else {
                        atributo+="0";
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
                            atributo+="1";
                            validacion=false;
                        }else {
                            atributo+="0";
                        }
                    }
                }

                atributo+="-";

                if(edad.isEmpty()){
                    atributo+="1";
                    validacion=false;
                }else{
                    atributo+="0";
                    try{
                        Integer edadAux=Integer.parseInt(edad);
                        atributo+="0";
                        if(edadAux<12&&validacion){
                            atributo+="1";
                            dLN.insertListaNegra(correo);
                        }else{
                            atributo+="0";
                        }
                    }catch (NumberFormatException e){
                        atributo+="1";
                        validacion=false;
                    }
                }

                if(validacion){
                    dJ.signIn(nombre,usuario,Integer.parseInt(edad),correo,contrasena);
                }

                request.getSession().setAttribute("atributo",atributo);
                response.sendRedirect(request.getContextPath());
        }
    }
}