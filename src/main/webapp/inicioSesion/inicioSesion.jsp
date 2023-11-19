<%@ page import="java.util.Random" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%String atributo=(String)request.getSession().getAttribute("atributo");
    String nombreVacio="0";
    String nombreError="0";
    String nombreLargo="0";
    String usuarioVacio="0";
    String usuarioError="0";
    String usuarioLargo="0";
    String usuarioRepetido="0";
    String correoVacio="0";
    String correoLargo="0";
    String correoListaNegra="0";
    String correoRepetido="0";
    String edadVacia="0";
    String edadError="0";
    String edadListaNegra="0";
    String contrasenaVacia="0";
    String repetirContrasenaVacia="0";
    String contrasenasDiferentes="0";
    String contrasenaLarga="0";
    String contrasenaIncorrecta="0";
    String nombre=request.getAttribute("nombre")==null?"":(String) request.getAttribute("nombre");
    String usuario=request.getAttribute("usuario")==null?"":(String) request.getAttribute("usuario");
    String edad=request.getAttribute("edad")==null?"":(String) request.getAttribute("edad");
    String correo=request.getAttribute("correo")==null?"":(String) request.getAttribute("correo");
    String usuarioCorreoLoginVacio="0";
    String contrasenaLoginVacia="0";
    String loginError="0";
    String usuarioCorreoLogin=request.getAttribute("usuarioCorreoLogin")==null?"":(String) request.getAttribute("usuarioCorreoLogin");
if(!atributo.equals("*")){

    String atributoAux[]=atributo.split("-");

    if(atributoAux[0].equals("L")){
        if(atributoAux[1].equals("1")){
            usuarioCorreoLoginVacio="1";
        }
        if(atributoAux[2].equals("1")){
            contrasenaLoginVacia="1";
        }
        if(atributoAux[3].equals("1")){
            loginError="1";
        }
    }else {
        String nombreAux=atributoAux[1];

        switch (nombreAux) {
            case "1" : nombreVacio = "1"; break;
            case "01" : nombreError = "1"; break;
            case "001" : nombreLargo = "1"; break;
        }
        String usuarioAux=atributoAux[0];

        switch (usuarioAux){
            case "1" : usuarioVacio = "1"; break;
            case "01" : usuarioError = "1"; break;
            case "001" : usuarioLargo = "1"; break;
            case "0001" : usuarioRepetido = "1"; break;
        }

        String correoAux=atributoAux[2];

        switch (correoAux){
            case "1" : correoVacio = "1"; break;
            case "01" : correoLargo = "1"; break;
            case "001" : correoListaNegra = "1"; break;
            case "0001" : correoRepetido = "1"; break;
        }

        if(atributoAux[3].equals("1")){
            contrasenaVacia = "1";
        }

        if(atributoAux[4].equals("1")){
            repetirContrasenaVacia = "1";
        }

        String contrasenaAux=atributoAux[5];

        switch (contrasenaAux){
            case "1" : contrasenasDiferentes = "1"; break;
            case "01" : contrasenaLarga = "1"; break;
            case "001" : contrasenaIncorrecta = "1"; break;
        }

        String edadAux=atributoAux[6];

        switch (edadAux){
            case "1" : edadVacia = "1"; break;
            case "01" : edadError = "1"; break;
            case "001" : edadListaNegra = "1"; break;
        }
    }
}
    request.getSession().removeAttribute("atributo");
%>
<!DOCTYPE html>
<html>
<head>
    <title>RISE & REVOLT</title>
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <link rel="icon" href="inicioSesion/images/logoarmas.ico" type="image/x-icon">
    <!-- Stylesheets -->
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Oswald:200,400%7CLato:300,400,300italic,700%7CMontserrat:900">
    <link rel="stylesheet" href="inicioSesion/css/bootstrap.css">
    <link rel="stylesheet" href="inicioSesion/css/style.css">
    <link rel="stylesheet" href="inicioSesion/css/fonts.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Macondo&display=swap" rel="stylesheet">
    <script src="js/html5shiv.min.js"> </script>
    <style>
        .bloqueuwu{
            position: relative;
            top: -30px;
            height: 900px;background-color: rgba(255, 234, 245, 0.8);box-shadow: 5px 20px 50px #000;padding: 0 !important;
            overflow: hidden;
        }
        .titulo{
            top: -2050px;
            position: relative;
            font-size: 150%;justify-content: center;display: flex;font-style: inherit;font-weight: bold;
            align-items: end;
            padding: 0 50px 0 50px;
            transition: .5s ease-in-out;
            background-color: rgba(120, 52, 87, 1);
            border-radius: 50% / 20%;
            height: 400px;
        }
        .labelAux{
            font-size: 250%;justify-content: center;display: flex;font-style: inherit;font-weight: bold;
            transition: .5s ease-in-out;
        }
        .loginAux{
            background-color: rgba(120, 52, 87, 1);
            padding: 5px 50px 0 50px;
            transition: .5s ease-in-out;
            margin-top: 60px;
            border-radius: 50% / 10%;
            height: 800px;
        }
        .signInAux{
            padding: 0 50px 0 50px;
            transition: .5s ease-in-out;
        }
        .signInAux .form-fix .labelAux{
            margin-top: 15px;
        }
        #chk:checked ~ .titulo{
            transform: translateY(175px);
            transform: scale(2);
        }
        #chk:checked ~ .bloqueuwu{
            transform: scale(.5);
        }
        #chk:checked ~ .signInAux{
            transform: translateY(185px);
        }
        #chk:checked ~  .signInAux .form-fix .labelAux{
            transform: scale(.75);
        }
        #chk:checked ~ .loginAux .form-fix .labelAux{
            padding: 15px 50px 0 50px;
            transform: scale(1.25);
        }
        #chk:checked ~ .loginAux{
            transform: translateY(-550px);
        }
    </style>
</head>
<body style="overflow: hidden">
<!-- Page preloader-->
<div class="page-loader">
    <div class="page-loader-body">
        <div class="preloader-wrapper big active">
            <div class="spinner-layer spinner-blue">
                <div class="circle-clipper left">
                    <div class="circle"> </div>
                </div>
                <div class="gap-patch">
                    <div class="circle"> </div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
            <div class="spinner-layer spinner-red">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"> </div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
            <div class="spinner-layer spinner-yellow">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"> </div>
                </div>
            </div>
            <div class="spinner-layer spinner-green">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Page-->
<div class="page">
    <section class="section">
        <div class="swiper-form-wrap">
            <!-- Swiper-->
            <div class="swiper-container swiper-slider swiper-slider_height-1 swiper-align-left swiper-align-left-custom context-dark bg-gray-darker" data-loop="false" data-autoplay="5500" data-simulate-touch="false" data-slide-effect="fade">
                <div class="swiper-wrapper">
                    <div class="swiper-slide" data-slide-bg="inicioSesion/images/fondo1.png">
                        <div class="swiper-slide-caption">
                            <div class="container container-bigger swiper-main-section">
                                <div class="row row-fix justify-content-sm-center justify-content-md-start">
                                    <div class="col-md-6 col-lg-5 col-xl-4 col-xxl-5">
                                        <h3 style="font-family: 'Macondo', cursive !important;"><b>Crea tu propia civilización!</b></h3>
                                        <div class="divider divider-decorate"></div>
                                        <p class="text-spacing-sm" style="font-family: 'Macondo', cursive !important;">
                                            ¡Descubre el poder de dar forma a la historia desde los cimientos mismos de una civilización! En este emocionante juego, serás el arquitecto de un mundo completamente nuevo, donde cada decisión que tomes moldeará el destino y la grandeza de tu pueblo.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide" data-slide-bg="inicioSesion/images/fondo2.png">
                        <div class="swiper-slide-caption">
                            <div class="container container-bigger swiper-main-section">
                                <div class="row row-fix justify-content-sm-center justify-content-md-start">
                                    <div class="col-md-6 col-lg-5 col-xl-4 col-xxl-5">
                                        <h3 style="font-family: 'Macondo', cursive !important;"><b>Lucha para ser el dominante en las tierras!</b></h3>
                                        <div class="divider divider-decorate"></div>
                                        <p class="text-spacing-sm" style="font-family: 'Macondo', cursive !important;">¡Adéntrate en un mundo de estrategia, donde la supervivencia y la gloria se entrelazan en cada movimiento! Confronta a otras civilizaciones en una batalla épica por el dominio y la supremacía. Desarrolla tu sociedad y fortalece tus defensas para defender tus fronteras y expandir tu influencia.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide" data-slide-bg="inicioSesion/images/fondo3.png">
                        <div class="swiper-slide-caption">
                            <div class="container container-bigger swiper-main-section">
                                <div class="row row-fix justify-content-sm-center justify-content-md-start">
                                    <div class="col-md-6 col-lg-5 col-xl-4 col-xxl-5">
                                        <h3 style="font-family: 'Macondo', cursive !important;"><b>Guia a tu civilización a un destino lleno de riquezas y aventuras!</b></h3>
                                        <div class="divider divider-decorate"></div>
                                        <p class="text-spacing-sm" style="font-family: 'Macondo', cursive !important;">¡Bienvenido al juego donde tu visión construye no solo una civilización, ¡sino un imperio de riqueza sin igual! En este viaje épico, tendrás el poder de erigir una sociedad próspera, donde la abundancia y la opulencia son más que metas, ¡son tu legado!</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Swiper controls-->
                <div class="swiper-pagination-wrap">
                    <div class="container container-bigger">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container container-bigger form-request-wrap form-request-wrap-modern">
                <div class="row row-fix justify-content-sm-center justify-content-lg-end">
                    <div class="col-lg-6 col-xxl-5" style="align-items: center">
                        <div class="form-request form-request-modern bloqueuwu">
                            <!-- RD Mailform-->
                            <input type="checkbox" id="chk" style="display: none" aria-hidden="true">
                            <div class="signInAux">
                                <form method="post" id="signIn" action="?action=signIn" class="rd-mailform form-fix">
                                    <label for="chk" class="labelAux" aria-hidden="true">Registrarse</label>
                                    <div class="row row-20 row-fix">
                                        <div class="col-sm-12">
                                            <label for="nombreSignIn" class="form-label-outside" style="cursor: auto !important;">Nombre <%if(nombreVacio.equals("1")){%><a style="color: red">Ingrese un nombre<%} else if (nombreError.equals("1")){%>La primera letra no puede ser un número<%}else if(nombreLargo.equals("1")){%>El nombre es muy largo<%}%></a></label>
                                            <input class="form-input" name="nombre" type="text" value="<%=nombre%>" id="nombreSignIn">
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="usuarioSignIn" class="form-label-outside" style="cursor: auto !important;">Usuario <a style="color: red"><%if(usuarioVacio.equals("1")){%>Ingrese un usuario<%} else if (usuarioError.equals("1")){%>La primera letra no puede ser un número<%}else if(usuarioLargo.equals("1")){%>El usuario es muy largo<%}else if(usuarioRepetido.equals("1")){%>El usuario ya se encuentra registrado<%}%></a></label>
                                            <input class="form-input" name="usuario" type="text" value="<%=usuario%>" id="usuarioSignIn">
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="edadSignIn" class="form-label-outside" style="cursor: auto !important;">Edad <a style="color: red"><%if(edadVacia.equals("1")){%>Ingrese una edad<%} else if (edadError.equals("1")){%>La edad tiene que ser un número<%}else if(edadListaNegra.equals("1")){%>La edad tiene que ser mayor a 12<%}%></a></label>
                                            <input class="form-input" name="edad" type="number" value="<%=edad%>" id="edadSignIn">
                                        </div>
                                        <div class="col-sm-12">
                                            <label for="correoSignIn" class="form-label-outside" style="cursor: auto !important;">Correo electrónico <a style="color: red"><%if(correoVacio.equals("1")){%>Ingrese un correo<%} else if (correoLargo.equals("1")){%>El correo es muy largo<%}else if(correoListaNegra.equals("1")){%>El correo se encuentra en lista negra<%}else if(correoRepetido.equals("1")){%>El correo ya se encuentra registrado<%}%></a></label>
                                            <input class="form-input" name="correo" type="email" value="<%=correo%>" id="correoSignIn">
                                        </div>
                                        <div class="col-sm-12">
                                            <label for="contrasenaSignIn" class="form-label-outside" style="cursor: auto !important;">Contraseña <a style="color: red"><%if(contrasenaVacia.equals("1")){%>Ingrese una contraseña<%} else if (contrasenasDiferentes.equals("1")){%>Las contraseñas no coinciden<%}else if(contrasenaLarga.equals("1")){%>La contraseña es muy larga<%}else if(contrasenaIncorrecta.equals("1")){%>La contraseña debe contener por lo menos una mayúscula, un número y un carácter especial<%}%></a></label>
                                            <input class="form-input" name="contrasena" type="password" id="contrasenaSignIn">
                                        </div>
                                        <div class="col-sm-12">
                                            <label for="repetirContrasenaSignIn" class="form-label-outside" style="cursor: auto !important;">Repetir contraseña <a style="color: red"><%if(repetirContrasenaVacia.equals("1")){%>Ingrese una contraseña<%}%></a></label>
                                            <input class="form-input" name="repetirContrasena" type="password" id="repetirContrasenaSignIn">
                                        </div>
                                    </div>
                                    <div class="form-wrap form-button">
                                        <a onclick="enviarForm('signIn')" class="button button-block button-secondary" style="color: white">Registrarse</a>
                                    </div>
                                </form>
                            </div>
                            <div class="loginAux">
                                <form method="post" id="logIn" action="?action=logIn" class="rd-mailform form-fix">
                                    <label class="labelAux" for="chk" aria-hidden="true" style="color: white">Iniciar sesión</label>
                                    <div class="row row-20 row-fix">
                                        <div class="col-sm-12">
                                            <label for="usuarioLogin" style="color: white;cursor: auto !important;" class="form-label-outside">Usuario/Correo electrónico <a style="color: red"><%if(usuarioCorreoLoginVacio.equals("1")){%>Ingrese un correo/usuario<%}%></a></label>
                                            <input class="form-input" name="login" type="text" value="<%=usuarioCorreoLogin%>" id="usuarioLogin">
                                        </div>
                                        <div class="col-sm-12">
                                            <label for="contrasenaLogin" style="color: white;cursor: auto !important;" class="form-label-outside">Contraseña <a style="color: red"><%if(contrasenaLoginVacia.equals("1")){%>Ingrese una contraseña<%}%></a></label>
                                            <input class="form-input" name="password" type="password" id="contrasenaLogin">
                                        </div>
                                    </div>
                                    <div class="form-wrap form-button">
                                        <a onclick="enviarForm('logIn')" class="button button-block button-secondary" style="background: rgba(255, 234, 245, 0.8);color: rgba(120, 52, 87, 1)">Iniciar sesión</a>
                                    </div>
                                    <%if(loginError.equals("1")){%>
                                    <a style="color: red">Las credenciales no son correctas</a>
                                    <%}%>
                                </form>
                            </div>
                            <div class="titulo">
                                <div>
                                    <label style="font-family: 'Macondo', cursive !important; color: white">RISE &<br> REVOLT</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script>
    function enviarForm(idForm){
        let form=document.getElementById(idForm);
        form.submit();
    }
</script>
<script src="inicioSesion/js/core.min.js"></script>
<script src="inicioSesion/js/script.js"></script>
</body>
</html>