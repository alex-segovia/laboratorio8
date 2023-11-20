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
    <%String tipoLista = (String) request.getAttribute("tipoLista");
        String alertaMaxReclutar=(String) request.getSession().getAttribute("alertaMaxReclutar");%>
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gamingHabitante.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css">

    <style>
        @keyframes cambioColorUsuario{
            0% { color: #fafa6e; }
            4.5% { color: #ffe762; }
            9.1% { color: #ffd35c; }
            13.6% { color: #ffc05c; }
            18.1% { color: #ffac61; }
            22.7% { color: #ff9a68; }
            27.27% { color: #ff8871; }
            31.8% { color: #ff787c; }
            36.36% { color: #fd82aa; }
            40.9% { color: #fc5b92; }
            45.45% { color: #ec6090; }
            50% { color: #fc5b92; }
            54.54% { color: #fd82aa; }
            59.1% { color: #ff787c; }
            63.63% { color: #ff8871; }
            68.2% { color: #ff9a68; }
            72.72% { color: #ffac61; }
            77.3% { color: #ffc05c; }
            81.81% { color: #ffd35c; }
            86.36% { color: #ffe762; }
            100% { color: #fafa6e; }
        }

        .animacionUsuario {
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
            display: inline-block;
            animation: cambioColorUsuario 5s infinite;
        }
    </style>

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
            opacity: 0;
            pointer-events: none;
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
            opacity: 0;
            pointer-events: none;
            position: fixed;
            top: 25%;
            left: 37.5%;
            border-radius: 20px;
            background-color: rgba(225, 29, 109,0.8);
            padding-top: 20px;
            z-index: 10001;
            box-shadow: 5px 20px 50px #000;
            transition: all 0.3s ease;
        }
        .popupAux{
            padding: 30px 20px;
            border-radius: 24px;
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #fff;
        }
        .popup i {
            font-size: 70px;
            color: #4070f4;
        }
        .popup h2 {
            margin-top: 20px;
            font-size: 25px;
            font-weight: 500;
            color: #333;
        }
        .popup h3 {
            font-size: 16px;
            font-weight: 400;
            color: #333;
            text-align: center;
        }
        .popup .buttons {
            margin-top: 25px;
        }
        .popup button {
            font-size: 14px;
            padding: 6px 12px;
            margin: 0 10px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            color: #fff;
            background-color: #e75e8d;
            display: inline-block;
            border-radius: 25px;
            font-weight: 400;
            text-transform: capitalize;
            letter-spacing: 0.5px;
            transition: all .3s;
            position: relative;
            overflow: hidden;
        }
        .popup button:hover {
            background-color: #fff;
            color: #e75e8d;
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
        .crearBoton:hover{
            background-color: #ee6a97 !important;
        }
    </style>
</head>
<body>

<!-- ***** Preloader Start ***** -->
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
<!-- ***** Preloader End ***** -->

<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a class="logo d-flex align-items-center justify-content-center">
                        <h4 style="color: white">Bienvenido, <div class="animacionUsuario"><%=jugadorActual.getUsuario()%></div></h4>
                    </a>
                    <ul class="nav" style="display: flex !important;align-items: center !important;">
                        <li><a href="<%=request.getContextPath()%>/HabitantesServlet" class="active">Habitantes<img src="assets/images/logoHabitante.jpg" alt=""></a></li>
                        <li><a href="<%=request.getContextPath()%>/RecursosServlet">Recursos<img src="assets/images/logoRecursos.jpg" alt=""></a></li>
                        <li><a href="<%=request.getContextPath()%>/GuerraServlet">Guerra<img src="assets/images/logoGuerra.jpg" alt=""></a></li>
                        <li><a href="<%=request.getContextPath()%>/LeaderboardServlet">Leaderboard<img src="assets/images/logoLeaderboard.jpg" alt=""></a></li>
                        <li><a style="height: 47px;display: flex !important; align-items: center !important;" href="<%=request.getContextPath()%>?action=logOut">LogOut<svg style="color: #ec6090;margin-left: 5px" xmlns="http://www.w3.org/2000/svg" width="22" height="16" fill="currentColor" class="bi bi-box-arrow-center text-center" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
                            <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
                        </svg></a></li>
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
                <div class="main-banner" style="background-image: url(assets/images/banner2.png) !important;">
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="header-text">
                                <h6><em>Establécete</em></h6>
                                <h4><em style="color: darkmagenta !important;">Gestión</em> de Habitantes</h4>
                                <p style="color: white !important; font-size: 100%">Mantén un registro de todos los habitantes. Tu rol como líder se centra en el cuidado y crecimiento de tus habitantes. Desde asignar roles estratégicos hasta garantizar su bienestar y felicidad.</p>
                                <div class="main-button mt-5">
                                    <a class="crearBoton" style="cursor: pointer; font-size: 17px !important; color: white !important" id="mostrarPopupCrear"><b>Reclutar habitante</b></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ***** Banner End ***** -->

                <%if(request.getAttribute("listaHabitantes")!=null){
                if(((ArrayList<Habitante>) request.getAttribute("listaHabitantes")).isEmpty()){
                if(tipoLista.equals("Todos")){%>
                <div class ="row mt-5 text-center">
                    <p style="color: #ec6090 !important; font-size: 24px">Tu civilización está vacía. Recluta a tu primer habitante!</p>
                </div>
                <%}else{%>
                <div class ="row mt-5 text-center">
                    <p style="color: #ec6090 !important; font-size: 24px">Toda tu civilización murió. No te desanimes, vuelve a hacerla crecer y vuelve a buscar oponentes!</p>
                </div>
                <%}}else{%>
                <!-- ***** Gaming Library Start ***** -->
                <div class="gaming-library">
                    <div class="col-lg-12">
                        <div class="heading-section mb-4 mt-2" style="position: relative; width: 100%;display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap">
                            <div class ="row" style="display: flex; align-items: baseline">
                                <span style="color: #ec6090; font-size: 34px; text-decoration: none;"><b>Mis habitantes</b></span></div>
                                <%if(tipoLista.equals("Todos")){%>
                                <span><button type="submit" style="width: 20vh" class="btn btn-dark"><a href="<%=request.getContextPath()%>/HabitantesServlet?mostrar=Vivos">Mostrar solo vivos</a></button></span>
                                <%}else{%>
                                <span><button type="submit" style="width: 20vh" class="btn btn-dark"><a href="<%=request.getContextPath()%>/HabitantesServlet?mostrar=Todos">Mostrar a todos</a></button></span>
                                <%}%>
                                <span style="color: #e369e3 !important; text-align: end;"><b><%if(jugadorActual.getDiasDesdeCreacion()!=1){%><%=jugadorActual.getDiasDesdeCreacion()%> días<%}else{%><%=jugadorActual.getDiasDesdeCreacion()%> día<%}%></b></span>
                                <span style="color: #e369e3 !important; text-align: end;"><b><%=jugadorActual.getHorasDia()%> horas</b></span>
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
                                            <span style="width: 8% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white;"><%=Math.round(habitante.getMoral()*100)/100.0%></span></span>
                                            <span style="width: 8% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white;"><%=habitante.getDiasVivo()%> día<%if(habitante.getDiasVivo()>1){%>s<%}%></span></span>
                                            <span style="width: 9% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white;"><%if(habitante.getGenero().equals("F")){%><%if(habitante instanceof Granjero){%>Granjera<%}else if(habitante instanceof Constructor){%>Constructora<%}else if(habitante instanceof Soldado){%>Soldada<%}else{%>Ninguna<%}}else{%><%if(habitante instanceof Granjero){%>Granjero<%}else if(habitante instanceof Constructor){%>Constructor<%}else if(habitante instanceof Soldado){%>Soldado<%}else{%>Ninguna<%}}%></span></span>
                                            <span style="width: 8% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white;"><%if(habitante instanceof Constructor){%><%=Math.round(((Constructor) habitante).getFuerza()*100)/100.0%><%}else if(habitante instanceof Soldado){%><%=Math.round(((Soldado) habitante).getFuerza()*100)/100.0%><%}else{%>No tiene<%}%></span></span>
                                            <span style="width: 9% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 13px; color: white;"><%if(habitante instanceof Granjero){%><%=Math.round(((Granjero) habitante).getProduccionAlimento()*100)/100.0%> (A)<%}else if(habitante instanceof Constructor){%><%=Math.round(((Constructor) habitante).getProduccionMoral()*100)/100.0%> (M)<%}else if(habitante instanceof Soldado){%><%=Math.round(((Soldado) habitante).getProduccionMoral()*100)/100.0%> (M)<%}else{%>No produce<%}%></span></span>
                                            <span style="width: 8% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white;"><%if(habitante.getGenero().equals("F")){%><%if(habitante.isEstaExiliado()){%>Exiliada<%}else{%><%if(habitante.isEstaMuerto()){%>Muerta<%}else{%>Viva<%}}}else{%><%if(habitante.isEstaExiliado()){%>Exiliado<%}else{%><%if(habitante.isEstaMuerto()){%>Muerto<%}else{%>Vivo<%}}%><%}%></span></span>
                                            <span style="width: 10% !important"><button class="btn btn-dark" style="font-size: 15px; color: white" id="mostrarPopupEditar<%=listaHabitantes.indexOf(habitante)%>"<%if(habitante.isEstaExiliado() || habitante.isEstaMuerto()){%>disabled<%}%>><a>Editar</a></button></span>
                                            <span style="width: 10% !important">
                                                <form style="margin: 0; padding: 0" method="post" action="<%=request.getContextPath()%>/HabitantesServlet?action=exiliar">
                                                    <input style="" type="hidden" name="idHabitante" value="<%=habitante.getIdHabitante()%>">
                                                    <button type="submit" class="btn btn-dark" style="font-size: 15px; color: white" <%if(habitante.isEstaExiliado() || habitante.isEstaMuerto()){%>disabled<%}%>><a>Exiliar</a></button>
                                                </form>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </ul>
                        </div>
                        <%}}}}%>
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
    <h5 style="text-align: center; color: #ffa6c3; font-size: 25px"><b>Reclutar habitante</b></h5>
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
                            <button style="background: none; color: inherit; border:0; opacity: 0.5" type="submit" id="cerrarPopupCrear1" disabled><a class="boton1" style="color: black !important"><b>Reclutar</b></a></button>
                        </div>
                    </div>
                    <div class="col-sm-6" style="margin-top: 5px;">
                        <div class="main-button">
                            <button type="button"><a class="boton1" style="color: black !important"><b>Cancelar</b></a></button>
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
                            <button type="button" style="background: none; color: inherit; border:0" ><a id="cerrarPopupEditar2<%=i%>" class="boton1" style="color: black !important"><b>Cancelar</b></a></button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<%}}%>


<%if(alertaMaxReclutar!=null){%>
<div id="auxa"></div>
<div class="overlay" style="opacity: 1;pointer-events: auto" id="overlayAlerta"></div>
<div class="popup popupAux" style="opacity: 1;pointer-events: auto;left: 40%;top: 32.5%" id="popupAlerta">
    <svg class="cerrarPopup" id="cerrarPopupAlerta" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M11.4142 10L16.7071 4.70711C17.0976 4.31658 17.0976 3.68342 16.7071 3.29289C16.3166 2.90237 15.6834 2.90237 15.2929 3.29289L10 8.58579L4.70711 3.29289C4.31658 2.90237 3.68342 2.90237 3.29289 3.29289C2.90237 3.68342 2.90237 4.31658 3.29289 4.70711L8.58579 10L3.29289 15.2929C2.90237 15.6834 2.90237 16.3166 3.29289 16.7071C3.68342 17.0976 4.31658 17.0976 4.70711 16.7071L10 11.4142L15.2929 16.7071C15.6834 17.0976 16.3166 17.0976 16.7071 16.7071C17.0976 16.3166 17.0976 15.6834 16.7071 15.2929L11.4142 10Z" fill="black"/>
    </svg>
    <i class="fa-solid fa-triangle-exclamation" style="color: #ec6090;"></i>
    <h2>Alerta</h2>
    <div class="mt-3 mb-3">
        <h3>No puedes reclutar a este tipo de habitante por hoy (las horas totales superan las 24)</h3>
    </div>
</div>
<%}%>

<%if(request.getSession().getAttribute("alertaNombreLargo")!=null){%>
<div id="auxa2"></div>
<div class="overlay" style="opacity: 1;pointer-events: auto" id="overlayAlertaNombreLargo"></div>
<div class="popup popupAux" style="opacity: 1;pointer-events: auto;left: 37.5%;top: 32.5%" id="popupAlertaNombreLargo">
    <svg class="cerrarPopup" id="cerrarPopupAlertaNombreLargo" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M11.4142 10L16.7071 4.70711C17.0976 4.31658 17.0976 3.68342 16.7071 3.29289C16.3166 2.90237 15.6834 2.90237 15.2929 3.29289L10 8.58579L4.70711 3.29289C4.31658 2.90237 3.68342 2.90237 3.29289 3.29289C2.90237 3.68342 2.90237 4.31658 3.29289 4.70711L8.58579 10L3.29289 15.2929C2.90237 15.6834 2.90237 16.3166 3.29289 16.7071C3.68342 17.0976 4.31658 17.0976 4.70711 16.7071L10 11.4142L15.2929 16.7071C15.6834 17.0976 16.3166 17.0976 16.7071 16.7071C17.0976 16.3166 17.0976 15.6834 16.7071 15.2929L11.4142 10Z" fill="black"/>
    </svg>
    <i class="fa-solid fa-triangle-exclamation" style="color: #ec6090;"></i>
    <h2>Alerta</h2>
    <div class="mt-3 mb-3">
        <h3>El nombre del jugador es muy largo (máximo 10 carácteres)</h3>
    </div>
</div>
<%}%>

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
        let showPopup=document.getElementById(abrirId);
        let overlay=document.getElementById(overlayId);
        let popup=document.getElementById(popupId);
        const mostrarPopup = () => {
            overlay.style.opacity='1';
            overlay.style.pointerEvents='auto';
            popup.style.opacity='1';
            popup.style.pointerEvents='auto';
            document.body.style.overflow = 'hidden';
            popup.style.transform= "scale(1.2)";
        };
        showPopup.addEventListener('click', mostrarPopup);
        const cerrarPopup = () => {
            overlay.style.opacity='0';
            overlay.style.pointerEvents='none';
            popup.style.opacity='0';
            popup.style.pointerEvents='none'
            popup.style.transform= "scale(1)";
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
    <%if(alertaMaxReclutar!=null){%>
    popupFunc('popupAlerta','auxa',['cerrarPopupAlerta'],'overlayAlerta');
    <%request.getSession().removeAttribute("alertaMaxReclutar");}%>
    <%if(request.getSession().getAttribute("alertaNombreLargo")!=null){%>
    popupFunc('popupAlertaNombreLargo','auxa2',['cerrarPopupAlertaNombreLargo'],'overlayAlertaNombreLargo');
    <%request.getSession().removeAttribute("alertaNombreLargo");}%>
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
