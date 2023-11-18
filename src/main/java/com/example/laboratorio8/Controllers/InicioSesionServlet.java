package com.example.laboratorio8.Controllers;

import java.io.*;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.example.laboratorio8.Beans.Jugador;
import com.example.laboratorio8.Daos.DaoJugador;
import com.example.laboratorio8.Daos.DaoListaNegra;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "InicioSesionServlet", value = "")
public class InicioSesionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        request.getRequestDispatcher("inicioSesion/inicioSesion.jsp").forward(request,response);
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
                if(usuarioCorreoLogin==null){
                    request.getSession().setAttribute("usuarioCorreoLoginVacio","1");
                    succesfulLogin=false;
                }if(contrasenaLogin==null){
                request.getSession().setAttribute("contrasenaLoginVacia","1");
                succesfulLogin=false;
                }Jugador jugador= dJ.logIn(usuarioCorreoLogin,contrasenaLogin);
                if(jugador==null){
                    request.getSession().setAttribute("loginError","1");
                    response.sendRedirect(request.getContextPath());
                }else{
                    if(!succesfulLogin) {
                        response.sendRedirect(request.getContextPath());
                    }else if(dJ.estaEnPaz(jugador.getIdJugador())){
                        response.sendRedirect("HabitantesServlet");
                    }else{
                        response.sendRedirect("GuerraServlet");
                    }
                }
                break;
            case "signIn":
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
                if(nombre==""){
                    request.getSession().setAttribute("nombreVacio","1");
                    validacion=false;
                }else{
                    char[] nombreAux=nombre.toCharArray();
                    if(nombreAux[0]=='0'||nombreAux[0]=='1'||nombreAux[0]=='2'||nombreAux[0]=='3'||nombreAux[0]=='4'||nombreAux[0]=='5'||nombreAux[0]=='6'||nombreAux[0]=='7'||nombreAux[0]=='8'||nombreAux[0]=='9'){
                        request.getSession().setAttribute("nombreError","1");
                        validacion=false;
                    }else if(nombre.length()>45){
                        request.getSession().setAttribute("nombreLargo","1");
                        validacion=false;
                    }
                }if(usuario==""){
                    request.getSession().setAttribute("usuarioVacio","1");
                    validacion=false;
                }else{
                    char[] usuarioAux=usuario.toCharArray();
                    if(usuarioAux[0]=='0'||usuarioAux[0]=='1'||usuarioAux[0]=='2'||usuarioAux[0]=='3'||usuarioAux[0]=='4'||usuarioAux[0]=='5'||usuarioAux[0]=='6'||usuarioAux[0]=='7'||usuarioAux[0]=='8'||usuarioAux[0]=='9'){
                        request.getSession().setAttribute("usuarioError","1");
                        validacion=false;
                }else if(usuario.length()>45){
                    request.getSession().setAttribute("usuarioLargo","1");
                    validacion=false;
                }else if(dJ.verifyUsuarioRepetido(usuario)){
                    request.getSession().setAttribute("usuarioRepetido","1");
                    validacion=false;
                    }
                }if(correo==""){
                    request.getSession().setAttribute("correoVacio","1");
                    validacion=false;
                }else{
                if(correo.length()>45){
                    request.getSession().setAttribute("correoLargo","1");
                    validacion=false;
                }else if(dJ.verifyCorreoRepetido(correo)){
                    request.getSession().setAttribute("correoRepetido","1");
                    validacion=false;
                    }else if(dLN.verifyCorreo(correo)){
                    request.getSession().setAttribute("correoListaNegra","1");
                    validacion=false;
                    }
                }
                if(edad==""){
                    request.getSession().setAttribute("edadVacia","1");
                    validacion=false;
                }else{
                    try{
                        Integer edadAux=Integer.parseInt(edad);
                        if(edadAux<12){
                            dLN.insertListaNegra(correo);
                        }
                    }catch (NumberFormatException e){
                        request.getSession().setAttribute("edadError","1");
                        validacion=false;
                    }
                }if(contrasena==""){
                request.getSession().setAttribute("contrasenaVacia","1");
                validacion=false;
                }if(repetirContrasena==""){
                    request.getSession().setAttribute("repetirContrasenaVacia","1");
                    validacion=false;
                }if(!contrasena.equals(repetirContrasena)){
                    request.getSession().setAttribute("contrasenasDiferentes","1");
                    validacion=false;
                }else if(contrasena.length()>45){
                    request.getSession().setAttribute("contrasenaLarga","1");
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
                    if (contieneMayuscula && contieneNumero && contieneEspecial) {
                        request.getSession().setAttribute("contrasenaIncorrecta","1");
                        validacion=false;
                    }
                }
                    if(validacion){
                        dJ.signIn(nombre,usuario,Integer.parseInt(edad),correo,contrasena);
                    }
                    response.sendRedirect(request.getContextPath());
                break;
        }
    }
}