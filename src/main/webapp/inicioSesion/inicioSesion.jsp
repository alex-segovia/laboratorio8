<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%String nombreVacio=(String) request.getSession().getAttribute("nombreVacio");
String nombreError=(String) request.getSession().getAttribute("nombreError");
String nombreLargo=(String) request.getSession().getAttribute("nombreLargo");
String usuarioVacio=(String) request.getSession().getAttribute("usuarioVacio");
    String usuarioError=(String) request.getSession().getAttribute("usuarioError");
    String usuarioLargo=(String) request.getSession().getAttribute("usuarioLargo");
    String usuarioRepetido=(String) request.getSession().getAttribute("usuarioRepetido");
    String correoVacio=(String) request.getSession().getAttribute("correoVacio");
    String correoLargo=(String) request.getSession().getAttribute("correoLargo");
    String correoListaNegra=(String) request.getSession().getAttribute("correoListaNegra");
    String correoRepetido=(String) request.getSession().getAttribute("correoRepetido");
    String edadVacia=(String) request.getSession().getAttribute("edadVacia");
    String edadError=(String) request.getSession().getAttribute("edadError");
    String contrasenaVacia=(String) request.getSession().getAttribute("contrasenaVacia");
    String repetirContrasenaVacia=(String) request.getSession().getAttribute("repetirContrasenaVacia");
    String contrasenasDiferentes=(String) request.getSession().getAttribute("contrasenasDiferentes");
    String contrasenaLarga=(String) request.getSession().getAttribute("contrasenaLarga");
    String contrasenaIncorrecta=(String) request.getSession().getAttribute("contrasenaIncorrecta");
    String nombre=(String) request.getAttribute("nombre");
    String usuario=(String) request.getAttribute("usuario");
    String edad=(String) request.getAttribute("edad");
    String correo=(String) request.getAttribute("correo");
    String usuarioCorreoLoginVacio=(String) request.getSession().getAttribute("usuarioCorreoLoginVacio");
    String contrasenaLoginVacia=(String) request.getSession().getAttribute("contrasenaLoginVacia");
    String loginError=(String) request.getSession().getAttribute("loginError");
    String usuarioCorreoLogin=(String) request.getAttribute("usuarioCorreoLogin");
    if(nombreVacio!=null){
        request.getSession().removeAttribute("nombreVacio");
    }if(nombreError!=null){
        request.getSession().removeAttribute("nombreError");
    }if(nombreLargo!=null){
        request.getSession().removeAttribute("nombreLargo");
    }if(usuarioVacio!=null){
        request.getSession().removeAttribute("usuarioVacio");
    }if(usuarioError!=null){
        request.getSession().removeAttribute("usuarioError");
    }if(usuarioLargo!=null){
        request.getSession().removeAttribute("usuarioLargo");
    }if(correoVacio!=null){
        request.getSession().removeAttribute("correoVacio");
    }if(correoLargo!=null){
        request.getSession().removeAttribute("correoLargo");
    }if(correoListaNegra!=null){
        request.getSession().removeAttribute("correoListaNegra");
    }if(correoRepetido!=null){
        request.getSession().removeAttribute("correoRepetido");
    }if(edadVacia!=null){
        request.getSession().removeAttribute("edadVacia");
    }if(edadError!=null){
        request.getSession().removeAttribute("edadError");
    }if(contrasenaVacia!=null){
        request.getSession().removeAttribute("contrasenaVacia");
    }if(repetirContrasenaVacia!=null){
        request.getSession().removeAttribute("repetirContrasenaVacia");
    }if(contrasenasDiferentes!=null){
        request.getSession().removeAttribute("contrasenasDiferentes");
    }if(contrasenaLarga!=null){
        request.getSession().removeAttribute("contrasenaLarga");
    }if(contrasenaIncorrecta!=null){
        request.getSession().removeAttribute("contrasenaIncorrecta");
    }if(usuarioCorreoLoginVacio!=null){
        request.getSession().removeAttribute("usuarioCorreoLoginVacio");
    }if(contrasenaLoginVacia!=null){
        request.getSession().removeAttribute("contrasenaLoginVacia");
    }if(loginError!=null){
        request.getSession().removeAttribute("loginError");
    }
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
                                            <label for="nombreSignIn" class="form-label-outside" style="cursor: auto !important;">Nombre <a style="color: red"><%if(nombreVacio!=null){%>Ingrese un nombre<%} else if (nombreError!=null){%>La primera letra no puede ser un número<%}else if(nombreLargo!=null){%>El nombre es muy largo<%}%></a></label>
                                            <input class="form-input" name="nombre" type="text" <%if(nombre!=null){%>value="<%=nombre%>"<%}%> id="nombreSignIn">
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="usuarioSignIn" class="form-label-outside" style="cursor: auto !important;">Usuario <a style="color: red"><%if(usuarioVacio!=null){%>Ingrese un usuario<%} else if (usuarioError!=null){%>La primera letra no puede ser un número<%}else if(usuarioLargo!=null){%>El usuario es muy largo<%}else if(usuarioRepetido!=null){%>El usuario ya se encuentra registrado<%}%></a></label>
                                            <input class="form-input" name="usuario" type="text" <%if(usuario!=null){%>value="<%=usuario%>"<%}%> id="usuarioSignIn">
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="edadSignIn" class="form-label-outside" style="cursor: auto !important;">Edad <a style="color: red"><%if(edadVacia!=null){%>Ingrese una edad<%} else if (edadError!=null){%>La edad tiene que ser un número<%}%></a></label>
                                            <input class="form-input" name="edad" type="number" <%if(edad!=null){%>value="<%=edad%>"<%}%> id="edadSignIn">
                                        </div>
                                        <div class="col-sm-12">
                                            <label for="correoSignIn" class="form-label-outside" style="cursor: auto !important;">Correo electrónico <a style="color: red"><%if(correoVacio!=null){%>Ingrese un correo<%} else if (correoLargo!=null){%>El correo es muy largo<%}else if(correoListaNegra!=null){%>El correo se encuentra en lista negra<%}else if(correoRepetido!=null){%>El correo ya se encuentra registrado<%}%></a></label>
                                            <input class="form-input" name="correo" type="email" <%if(correo!=null){%>value="<%=correo%>"<%}%> id="correoSignIn">
                                        </div>
                                        <div class="col-sm-12">
                                            <label for="contrasenaSignIn" class="form-label-outside" style="cursor: auto !important;">Contraseña <a style="color: red"><%if(contrasenaVacia!=null){%>Ingrese una contraseña<%} else if (contrasenasDiferentes!=null){%>Las contraseñas no coinciden<%}else if(contrasenaLarga!=null){%>La contraseña es muy larga<%}else if(contrasenaIncorrecta!=null){%>La contraseña debe contener por lo menos una mayúscula, un número y un carácter especial<%}%></a></label>
                                            <input class="form-input" name="contrasena" type="password" id="contrasenaSignIn">
                                        </div>
                                        <div class="col-sm-12">
                                            <label for="repetirContrasenaSignIn" class="form-label-outside" style="cursor: auto !important;">Repetir contraseña <a style="color: red"><%if(repetirContrasenaVacia!=null){%>Ingrese una contraseña<%}%></a></label>
                                            <input class="form-input" name="repetirContrasena" type="password" id="repetirContrasenaSignIn">
                                        </div>
                                    </div>
                                    <div class="form-wrap form-button">
                                        <button onclick="enviarForm('signIn')" class="button button-block button-secondary">Registrarse</button>
                                    </div>
                                </form>
                            </div>
                            <div class="loginAux">
                                <form method="post" id="logIn" action="?action=logIn" class="rd-mailform form-fix">
                                    <label class="labelAux" for="chk" aria-hidden="true" style="color: white">Iniciar sesión</label>
                                    <div class="row row-20 row-fix">
                                        <div class="col-sm-12">
                                            <label for="usuarioLogin" style="color: white;cursor: auto !important;" class="form-label-outside">Usuario/Correo electrónico <a style="color: red"><%if(usuarioCorreoLoginVacio!=null){%>Ingrese un correo/usuario<%}%></a></label>
                                            <input class="form-input" name="login" type="text" <%if(usuarioCorreoLogin!=null){%>value="<%=usuarioCorreoLogin%>"<%}%> id="usuarioLogin">
                                        </div>
                                        <div class="col-sm-12">
                                            <label for="contrasenaLogin" style="color: white;cursor: auto !important;" class="form-label-outside">Contraseña <a style="color: red"><%if(contrasenaLoginVacia!=null){%>Ingrese una contraseña<%}%></a></label>
                                            <input class="form-input" name="password" type="password" id="contrasenaLogin">
                                        </div>
                                    </div>
                                    <div class="form-wrap form-button">
                                        <button onclick="enviarForm('logIn')" class="button button-block button-secondary" style="background: rgba(255, 234, 245, 0.8);color: rgba(120, 52, 87, 1)">Iniciar sesión</button>
                                    </div>
                                    <%if(loginError!=null){%>
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
<!-- Javascript-->
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