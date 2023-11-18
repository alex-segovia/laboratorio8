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

    <title>Tabla de Clasificación</title>
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
                    <a class="logo d-flex align-items-center justify-content-center">
                        <h4 style="color: #ff90b7">Bienvenido, <%=jugadorActual.getUsuario()%></h4>
                    </a>
                    <ul class="nav">
                        <li><a href="<%=request.getContextPath()%>/HabitantesServlet">Habitantes<img src="assets/images/logoHabitante.jpg" alt=""></a></li>
                        <li><a href="<%=request.getContextPath()%>/RecursosServlet">Recursos<img src="assets/images/logoRecursos.jpg" alt=""></a></li>
                        <li><a href="<%=request.getContextPath()%>/GuerraServlet">Guerra<img src="assets/images/logoGuerra.jpg" alt=""></a></li>
                        <li><a href="<%=request.getContextPath()%>/LeaderboardServlet" class="active">Leaderboard<img src="assets/images/logoLeaderboard.jpg" alt=""></a></li>
                        <li style="display: flex !important; align-items: center !important; height: 20px !important; margin-top: 13px;"><a href="<%=request.getContextPath()%>"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="16" fill="currentColor" class="bi bi-box-arrow-center text-center" viewBox="0 0 16 16">
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
                <div class="main-banner" style="background-image: url(assets/images/bannerLeaderboard.png) !important;">
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="header-text mt-4">
                                <h4><em style="color: #ff97bb !important;">Tabla</em> de clasificación</h4>
                                <p style="color: white !important; font-size: 100%">¿Serás el líder que guíe a tu pueblo hacia la grandeza? Echa un vistazo a los líderes más poderosos, mide tu progreso y ¡prepárate para conquistar la historia!</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ***** Banner End ***** -->

                <!-- ***** Gaming Library Start ***** -->
                <div class="gaming-library">
                    <div class="col-lg-12">
                        <div class="heading-section">
                            <div class ="row text-center">
                                <span style="color: #ec6090; font-size: 34px; text-decoration: none; margin-bottom: 30px; text-shadow: 10px 15px 7px black"><b>Tabla de Clasificación</b></span>
                            </div>
                        </div>
                        <div class="item">
                            <ul>
                                <div class="row" >
                                    <div class="col">
                                        <div class="row">
                                            <span style="width: 10% !important" class="d-flex align-items-center pt-3"><span style="font-size: 15px; color: #ec6090;text-align: center !important;">Ranking</span></span>
                                            <span style="width: 10% !important" class="d-flex align-items-center pt-3"><span style="font-size: 15px; color: #ec6090;text-align: center !important;">Jugador</span></span>
                                            <span style="width: 10% !important" class="d-flex align-items-center pt-3"><span style="font-size: 15px; color: #ec6090;text-align: center !important;">Días jugados</span></span>
                                            <span style="width: 10% !important" class="d-flex align-items-center pt-3"><span style="font-size: 15px; color: #ec6090;text-align: center !important;">Población total</span></span>
                                            <span style="width: 10% !important" class="d-flex align-items-center pt-3"><span style="font-size: 15px; color: #ec6090;text-align: center !important;">Moral de la civilización</span></span>
                                            <span style="width: 10% !important" class="d-flex align-items-center pt-3"><span style="font-size: 15px; color: #ec6090;text-align: center !important;">Guerras ganadas</span></span>
                                            <span style="width: 10% !important" class="d-flex align-items-center pt-3"><span style="font-size: 15px; color: #ec6090;text-align: center !important;">Victorias de guerras (%)</span></span>
                                            <span style="width: 10% !important" class="d-flex align-items-center pt-3"><span style="font-size: 15px; color: #ec6090;text-align: center !important;">Fuerza de la civilización</span></span>
                                            <span style="width: 10% !important" class="d-flex align-items-center pt-3"><span style="font-size: 15px; color: #ec6090;text-align: center !important;">Máx. días de un habitante</span></span>
                                            <span style="width: 10% !important" class="d-flex align-items-center pt-3"><span style="font-size: 15px; color: #ec6090;text-align: center !important;">Producción de alimento</span></span>
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

<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <p>Copyright © 2023 | Tombat. Todos los derechos reservados.</p>
            </div>
        </div>
    </div>
</footer>

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
