<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.laboratorio8.Beans.*" %><%--
  Created by IntelliJ IDEA.
  User: alexd
  Date: 16/11/2023
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Gestión de habitantes</title>
    <link rel="icon" href="assets/images/logoarmas.ico">
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

    <%Jugador jugadorActual = (Jugador) request.getSession().getAttribute("jugadorActual");%>

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gamingHabitante.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css">

    <style>
        input::placeholder {
            color: rgba(236, 96, 144, 1); /* Color sólido para el placeholder */
            opacity: 1; /* Opacidad completa para el placeholder */
        }
        .boton1{
            background-color: #ffa6c3 !important;
        }
        .boton1:hover{
            background-color: darkmagenta !important;
        }
        input[type="text"] {
            padding: 8px; /* Espaciado interno */
            font-size: 17px; /* Tamaño de la fuente */
            border: 0px solid #ff00ff; /* Borde de tono magenta */
            border-radius: 5px; /* Bordes redondeados */
            background-color: inherit; /* Fondo en tono magenta */
            color: #ec6090; /* Texto en negro */
            width: 35%; /* Ancho automático basado en el contenido */
            box-sizing: border-box; /* Incluir padding y border en el ancho total */
            float: right; /* Alineación a la derecha */
            text-align: center;
        }
        input[type="text"]:focus {
            outline: none; /* Eliminar el contorno de enfoque */
            box-shadow: 0 0 5px rgba(255, 0, 255, 0.5); /* Sombra al estar enfocado en tono magenta con transparencia */
        }
        /* Estilo base para el ComboBox con fondo magenta y texto negro */
        select {
            padding: 8px; /* Espaciado interno */
            font-size: 17px; /* Tamaño de la fuente */
            border: 0px solid black; /* Borde de tono magenta */
            border-radius: 5px; /* Bordes redondeados */
            appearance: none; /* Elimina el estilo por defecto del sistema */
            -webkit-appearance: none; /* Para navegadores basados en WebKit */
            -moz-appearance: none; /* Para navegadores basados en Gecko (Firefox) */
            background-color: inherit; /* Fondo en tono magenta */
            color: #ec6090; /* Texto en negro */
            background-image: url('data:image/svg+xml;utf8,<svg fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/><path d="M0 0h24v24H0z" fill="none"/></svg>'); /* Icono de flecha personalizado en negro */
            background-repeat: no-repeat; /* No repetir el icono */
            background-size: 30px; /* Tamaño del icono */
            width: 35%; /* Ancho automático basado en el contenido */
            max-width: 100%; /* Ancho máximo */
            box-sizing: border-box; /* Incluir padding y border en el ancho total */
            float: right; /* Alineación a la derecha */
            text-align: center;
        }

        /* Estilos al pasar el mouse sobre el ComboBox */
        select:hover {
            border-color: #cc00cc; /* Cambio de color del borde al pasar el mouse */
        }

        /* Estilos cuando el ComboBox está enfocado */
        select:focus {
            outline: none; /* Eliminar el contorno de enfoque */
            box-shadow: 0 0 5px rgba(255, 0, 255, 0.5); /* Sombra al estar enfocado en tono magenta con transparencia */
        }
        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: 10000;
        }

        /* Estilo para el contenido del popup */
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            border-radius: 20px;
            transform: translate(-50%, -50%);
            background-color: rgba(225, 29, 109,0.8);
            padding-top: 20px;
            z-index: 10001;
            box-shadow: 5px 20px 50px #000
        }
        /* Estilo para el botón de cerrar */
        .cerrarPopup {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
        }
        @media screen and (max-width: 777px) {
            .contenedorCrear {
                width: 80% !important;
            }
        }
    </style>
</head>
<body>

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
<!-- ***** Preloader Start ***** -->

<!-- ***** Preloader End ***** -->

<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="" class="logo d-flex justify-content-center">
                        <img class="img-fluid" src="assets/images/textologo.png">
                    </a>

                    <ul class="nav">
                        <li><a href="<%=request.getContextPath()%>/HabitantesServlet" class="active">Habitantes<img src="assets/images/profile-header.jpg" alt=""></a></li>
                        <li><a href="<%=request.getContextPath()%>/RecursosServlet">Recursos<img src="assets/images/profile-header.jpg" alt=""></a></li>
                        <li><a href="<%=request.getContextPath()%>/GuerraServlet">Guerra<img src="assets/images/profile-header.jpg" alt=""></a></li>
                        <li><a href="<%=request.getContextPath()%>/LeaderboardServlet">Leaderboard<img src="assets/images/profile-header.jpg" alt=""></a></li>
                    </ul>
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- ***** Header Area End ***** -->

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="page-content">

                <!-- ***** Banner Start ***** -->
                <div class="main-banner">
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="header-text">
                                <h4><em style="color: darkmagenta !important;">Gestión</em> de Habitantes</h4>
                                <p style="color: white !important; font-size: 100%">Mantén un registro de todos los habitantes. Cada uno tiene distintas habilidades que aportarán al éxito de tu civilización.</p>
                                <div class="main-button mt-5">
                                    <a style="cursor: pointer" id="mostrarPopupCrear">Crear habitante</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ***** Banner End ***** -->

                <!-- ***** Gaming Library Start ***** -->
                <div class="gaming-library">
                    <div class="col-lg-12">
                        <div class="heading-section">
                            <div class ="row">
                                <span style="color: #ec6090; font-size: 34px; text-decoration: none; margin-bottom: 30px;">Mis habitantes:</span>
                                <span style="color: #e369e3 !important; text-align: end; margin-bottom: -100px !important;"><b><%=jugadorActual.getHorasDia()%> horas</b></span>
                            </div>
                        </div>
                        <div class="item">
                            <ul>
                                <div class="row" >
                                    <div class="col">
                                        <div class="row">
                                            <span style="width: 5% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090;">ID</span></span>
                                            <span style="width: 8% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090;">Nombre</span></span>
                                            <span style="width: 9% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090;">Género</span></span>
                                            <span style="width: 8% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090">Consumo</span></span>
                                            <span style="width: 8% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090;">Moral</span></span>
                                            <span style="width: 8% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090;">Tiempo</span></span>
                                            <span style="width: 9% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090;">Profesión</span></span>
                                            <span style="width: 8% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090;">Fuerza</span></span>
                                            <span style="width: 9% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090;">Producción</span></span>
                                            <span style="width: 8% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090;">Estado</span></span>
                                            <span style="width: 10% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090;"></span></span>
                                            <span style="width: 10% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090;"></span></span>
                                        </div>
                                    </div>
                                </div>
                            </ul>
                        </div>
                        <%if(request.getAttribute("listaHabitantes")!=null){ArrayList<Habitante> listaHabitantes = (ArrayList<Habitante>) request.getAttribute("listaHabitantes");%>
                        <%for(Habitante habitante : listaHabitantes){%>
                        <div class="item <%if(listaHabitantes.size()-1 == listaHabitantes.indexOf(habitante)){%>last-item<%}%>">
                            <ul>
                                <div class="row">
                                    <div class="col">
                                        <div class="row">
                                            <span style="width: 5% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white;"><%if(habitante.getIdHabitante()<10){%>0<%=habitante.getIdHabitante()%><%}else{%><%=habitante.getIdHabitante()%><%}%></span></span>
                                            <span style="width: 8% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white;"><%=habitante.getNombre()%></span></span>
                                            <span style="width: 9% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white;"><%if(habitante.getGenero().equals("M")){%>Masculino<%}else if(habitante.getGenero().equals("F")){%>Femenino<%}else{%>Otro<%}%></span></span>
                                            <span style="width: 8% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white;"><%=habitante.getAlimentacionDiaria()%></span></span>
                                            <span style="width: 8% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white;"><%=habitante.getMoral()%></span></span>
                                            <span style="width: 8% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white;"><%=habitante.getDiasVivo()%> día<%if(habitante.getDiasVivo()>1){%>s<%}%></span></span>
                                            <span style="width: 9% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white;"><%if(habitante.getGenero().equals("F")){%><%if(habitante instanceof Granjero){%>Granjera<%}else if(habitante instanceof Constructor){%>Constructora<%}else if(habitante instanceof Soldado){%>Soldada<%}else{%>Ninguna<%}}else{%><%if(habitante instanceof Granjero){%>Granjero<%}else if(habitante instanceof Constructor){%>Constructor<%}else if(habitante instanceof Soldado){%>Soldado<%}else{%>Ninguna<%}}%></span></span>
                                            <span style="width: 8% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white;"><%if(habitante instanceof Constructor){%><%=((Constructor) habitante).getFuerza()%><%}else if(habitante instanceof Soldado){%><%=((Soldado) habitante).getFuerza()%><%}else{%>No tiene<%}%></span></span>
                                            <span style="width: 9% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 13px; color: white;"><%if(habitante instanceof Granjero){%><%=((Granjero) habitante).getProduccionAlimento()%> (A)<%}else if(habitante instanceof Constructor){%><%=((Constructor) habitante).getProduccionMoral()%> (M)<%}else if(habitante instanceof Soldado){%><%=((Soldado) habitante).getProduccionMoral()%> (M)<%}else{%>No produce<%}%></span></span>
                                            <span style="width: 8% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white;"><%if(habitante.getGenero().equals("F")){%><%if(habitante.isEstaExiliado()){%>Exhiliada<%}else{%><%if(habitante.isEstaMuerto()){%>Muerta<%}else{%>Viva<%}}}else{%><%if(habitante.isEstaExiliado()){%>Exhiliado<%}else{%><%if(habitante.isEstaMuerto()){%>Muerto<%}else{%>Vivo<%}}%><%}%></span></span>
                                            <span style="width: 10% !important"><button class="btn btn-dark" style="font-size: 15px; color: white" id="mostrarPopupEditar<%=listaHabitantes.indexOf(habitante)%>"<%if(habitante.isEstaExiliado() || habitante.isEstaMuerto()){%>disabled<%}%>><a>Editar</a></button></span>
                                            <span style="width: 10% !important">
                                                <form style="margin: 0; padding: 0" method="post" action="<%=request.getContextPath()%>/HabitantesServlet?action=exhiliar">
                                                    <input style="" type="hidden" name="idHabitante" value="<%=habitante.getIdHabitante()%>">
                                                    <button type="submit" class="btn btn-dark" style="font-size: 15px; color: white" <%if(habitante.isEstaExiliado() || habitante.isEstaMuerto()){%>disabled<%}%>><a>Exhiliar</a></button>
                                                </form>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </ul>
                        </div>
                        <%}}%>
                    </div>
                </div>
                <!-- ***** Gaming Library End ***** -->
            </div>
        </div>
    </div>
</div>

<!-- Popup para crear habitante -->
<div class="overlay" id="overlayCrear"></div>
<div class="popup contenedorCrear" style="width: 500px;" id="popupCrear">
    <h5 style="text-align: center; color: #ffa6c3; font-size: 25px"><b>Crear habitante</b></h5>
    <svg class="cerrarPopup" id="cerrarPopupCrear" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M11.4142 10L16.7071 4.70711C17.0976 4.31658 17.0976 3.68342 16.7071 3.29289C16.3166 2.90237 15.6834 2.90237 15.2929 3.29289L10 8.58579L4.70711 3.29289C4.31658 2.90237 3.68342 2.90237 3.29289 3.29289C2.90237 3.68342 2.90237 4.31658 3.29289 4.70711L8.58579 10L3.29289 15.2929C2.90237 15.6834 2.90237 16.3166 3.29289 16.7071C3.68342 17.0976 4.31658 17.0976 4.70711 16.7071L10 11.4142L15.2929 16.7071C15.6834 17.0976 16.3166 17.0976 16.7071 16.7071C17.0976 16.3166 17.0976 15.6834 16.7071 15.2929L11.4142 10Z" fill="black"/>
    </svg>
    <div style="padding-bottom: 20px; background-color: rgba(118, 0, 134,0.8); margin-top:20px; border-bottom-left-radius: 20px; border-bottom-right-radius: 20px;">
        <form method="post" action="<%=request.getContextPath()%>/HabitantesServlet?action=crear">
            <div class="container-fluid">
                <br>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <br>
                        <div class="row">
                            <div class="col">
                                <label for="nombreHabitante" style="margin-top: 25px;color: #ffa6c3"><b>Nombre del habitante:</b></label>
                                <input style="margin-top: 15px" type="text" name="nombreHabitante" id="nombreHabitante" placeholder="Nombre" required>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <label for="generoHabitante" style="margin-top: 25px;color: #ffa6c3"><b>Género del habitante:</b></label>
                                <select style="height: 55px;margin-top: 10px;" name="generoHabitante" id="generoHabitante" required>
                                    <option style="background-color: rgba(118, 0, 134,0.8); color: whitesmoke" value="M">Masculino</option>
                                    <option style="background-color: rgba(118, 0, 134,0.8); color: whitesmoke" value="F">Femenino</option>
                                    <option style="background-color: rgba(118, 0, 134,0.8); color: whitesmoke" value="O">Otro</option>
                                </select>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">
                                <label for="profesionHabitante" style="margin-top: 25px;color: #ffa6c3"><b>Profesión del habitante:</b></label>
                                <select style="height: 55px;margin-top: 10px;" name="profesionHabitante" id="profesionHabitante" required>
                                    <option style="background-color: rgba(118, 0, 134,0.8); color: whitesmoke" value="Ninguna">Ninguna</option>
                                    <option style="background-color: rgba(118, 0, 134,0.8); color: whitesmoke" value="Granjero">Granjero</option>
                                    <option style="background-color: rgba(118, 0, 134,0.8); color: whitesmoke" value="Constructor">Constructor</option>
                                    <option style="background-color: rgba(118, 0, 134,0.8); color: whitesmoke" value="Soldado">Soldado</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>
            <br>
            <div class="container-fluid">
                <div class="row text-center">
                    <div class="col-sm-6" style="margin-top: 5px;">
                        <div class="main-button">
                            <button style="background: none; color: inherit; border:0; opacity: 0.5" type="submit" id="cerrarPopupCrear1" disabled><a class="boton1" style="color: black !important"><b>Crear</b></a></button>
                        </div>
                    </div>
                    <div class="col-sm-6" style="margin-top: 5px;">
                        <div class="main-button">
                            <button style="background: none; color: inherit; border:0" id="cerrarPopupCrear2"><a class="boton1" style="color: black !important"><b>Cancelar</b></a></button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<%if(request.getAttribute("listaHabitantes")!=null){ArrayList<Habitante> listaHabitantes = (ArrayList<Habitante>) request.getAttribute("listaHabitantes");
for(int i=0;i<listaHabitantes.size();i++){%>
<div class="overlay" id="overlayEditar<%=i%>"></div>
<div class="popup contenedorCrear" style="width: 500px;" id="popupEditar<%=i%>">
    <h5 style="text-align: center; color: #ffa6c3; font-size: 25px"><b>Editar habitante</b></h5>
    <svg class="cerrarPopup" id="cerrarPopupEditar<%=i%>" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M11.4142 10L16.7071 4.70711C17.0976 4.31658 17.0976 3.68342 16.7071 3.29289C16.3166 2.90237 15.6834 2.90237 15.2929 3.29289L10 8.58579L4.70711 3.29289C4.31658 2.90237 3.68342 2.90237 3.29289 3.29289C2.90237 3.68342 2.90237 4.31658 3.29289 4.70711L8.58579 10L3.29289 15.2929C2.90237 15.6834 2.90237 16.3166 3.29289 16.7071C3.68342 17.0976 4.31658 17.0976 4.70711 16.7071L10 11.4142L15.2929 16.7071C15.6834 17.0976 16.3166 17.0976 16.7071 16.7071C17.0976 16.3166 17.0976 15.6834 16.7071 15.2929L11.4142 10Z" fill="black"/>
    </svg>
    <div style="padding-bottom: 20px; background-color: rgba(118, 0, 134,0.8); margin-top:20px; border-bottom-left-radius: 20px; border-bottom-right-radius: 20px;">
        <form method="post" action="<%=request.getContextPath()%>/HabitantesServlet?action=editar">
            <div class="container-fluid">
                <br>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <br>
                        <div class="row">
                            <div class="col">
                                <input type="hidden" name="idHabitante" value="<%=listaHabitantes.get(i).getIdHabitante()%>">
                                <label for="nombreHabitanteEditar<%=i%>" style="margin-top: 25px;color: #ffa6c3"><b>Nombre del habitante:</b></label>
                                <input style="margin-top: 15px" type="text" name="nombreNuevoHabitante" id="nombreHabitanteEditar<%=i%>" placeholder="Nombre" value="<%=listaHabitantes.get(i).getNombre()%>" required>
                            </div>
                        </div>
                        <br>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>
            <br>
            <div class="container-fluid">
                <div class="row text-center">
                    <div class="col-sm-6" style="margin-top: 5px;">
                        <div class="main-button">
                            <button style="background: none; color: inherit; border:0; opacity: 0.5" type="submit" id="cerrarPopupEditar1<%=i%>" disabled><a class="boton1" style="color: black !important"><b>Editar</b></a></button>
                        </div>
                    </div>
                    <div class="col-sm-6" style="margin-top: 5px;">
                        <div class="main-button">
                            <button style="background: none; color: inherit; border:0" id="cerrarPopupEditar2<%=i%>"><a class="boton1" style="color: black !important"><b>Cancelar</b></a></button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<%}}%>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <p>Copyright © 2023 | Tombat. Todos los derechos reservados.</p>
            </div>
        </div>
    </div>
</footer>

<script>
    function popupFunc(popupId,abrirId,cerrarClass,overlayId){
        const showPopup=document.getElementById(abrirId);
        const overlay=document.getElementById(overlayId);
        const popup=document.getElementById(popupId);
        const mostrarPopup = () => {
            overlay.style.display = 'block';
            popup.style.display = 'block';
            // Desactivar el scroll
            document.body.style.overflow = 'hidden';
        };
        showPopup.addEventListener('click', mostrarPopup);
        const cerrarPopup = () => {
            overlay.style.display = 'none';
            popup.style.display = 'none';
            document.body.style.overflow = 'auto';

        };
        for(let i=0;i<cerrarClass.length;i++){
            document.getElementById(cerrarClass[i]).addEventListener('click', cerrarPopup);
        }

        overlay.addEventListener('click', (e) => {
            if (e.target === overlay) {
                cerrarPopup();
            }
        });

        document.addEventListener('keydown', (event) => {
            if (event.key === 'Escape') {
                cerrarPopup();
            }
        });
    }
    function verificarInput(miInput,submitBoton){
        let input = document.getElementById(miInput);
        let boton = document.getElementById(submitBoton);
        function validacion(){
            if (input.value.trim() === '') {
                boton.disabled = true; // Si el input está vacío, desactiva el botón
                boton.style.opacity=0.5;
            } else {
                boton.disabled = false; // Si el input no está vacío, activa el
                boton.style.opacity=1;
            }
        }
        input.addEventListener('input', validacion);
        validacion();
    }

    //Crear
    popupFunc('popupCrear','mostrarPopupCrear',['cerrarPopupCrear','cerrarPopupCrear1','cerrarPopupCrear2'],'overlayCrear');

    //Validar en creación
    verificarInput('nombreHabitante','cerrarPopupCrear1')

    <%if(request.getAttribute("listaHabitantes")!=null){ArrayList<Habitante> listaHabitantes = (ArrayList<Habitante>) request.getAttribute("listaHabitantes");%>
    <%if(listaHabitantes!=null){
    for(int i=0;i<listaHabitantes.size();i++){%>
    //Editar
    popupFunc('popupEditar<%=i%>','mostrarPopupEditar<%=i%>',['cerrarPopupEditar<%=i%>','cerrarPopupEditar1<%=i%>','cerrarPopupEditar2<%=i%>'],'overlayEditar<%=i%>');

    //Validar en edición
    verificarInput('nombreHabitanteEditar<%=i%>','cerrarPopupEditar1<%=i%>')
    <%}}}%>
</script>


<!-- Scripts -->
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<script src="assets/js/isotope.min.js"></script>
<script src="assets/js/owl-carousel.js"></script>
<script src="assets/js/tabs.js"></script>
<script src="assets/js/popup.js"></script>
<script src="assets/js/custom.js"></script>
<script src="assets/js/script.js"></script>
</body>
</html>
