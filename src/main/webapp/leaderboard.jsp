<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.laboratorio8.Beans.*" %>
<%@ page import="com.example.laboratorio8.Dtos.DtoLeaderboard" %><%--
  Created by IntelliJ IDEA.
  User: alexd
  Date: 16/11/2023
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Jugador jugadorActual = (Jugador) request.getSession().getAttribute("jugadorActual");%>
<%ArrayList<DtoLeaderboard> top10 = (ArrayList<DtoLeaderboard>) request.getAttribute("top10");%>
<%Integer tipo = (Integer) request.getAttribute("tipo");%>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Tabla de Clasificación</title>
    <link rel="icon" href="assets/images/logoarmas.ico">
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gamingHabitante.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css">

    <style>
        @keyframes cambioColorUsuario{
            0% { color: #fc91b6; }
            12.5% { color: #f37da5; }
            25% { color: #ec6090; }
            37.5% { color: #d046ef; }
            50% { color: #8860ec; }
            62.5% { color: #b475d9; }
            75% { color: #e569b7; }
            87.5% { color: #ec729b; }
            100% { color: #fc91b6; }
        }

        .animacionTextoUsuario {
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
            display: inline-block;
            animation: cambioColorUsuario 3s infinite;
        }

        @keyframes cambioColorTipo{
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

        .animacionTextoTipo {
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
            display: inline-block;
            animation: cambioColorTipo 5s infinite;
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
                    <a class="logo d-flex align-items-center justify-content-center">
                        <h4 style="color: #ff90b7">Bienvenido, <%=jugadorActual.getUsuario()%></h4>
                    </a>
                    <ul class="nav">
                        <li><a href="<%=request.getContextPath()%>/HabitantesServlet">Habitantes<img src="assets/images/logoHabitante.jpg" alt=""></a></li>
                        <li><a href="<%=request.getContextPath()%>/RecursosServlet">Recursos<img src="assets/images/logoRecursos.jpg" alt=""></a></li>
                        <li><a href="<%=request.getContextPath()%>/GuerraServlet">Guerra<img src="assets/images/logoGuerra.jpg" alt=""></a></li>
                        <li><a href="<%=request.getContextPath()%>/LeaderboardServlet" class="active">Leaderboard<img src="assets/images/logoLeaderboard.jpg" alt=""></a></li>
                        <li style="display: flex !important; align-items: center !important; height: 20px !important; margin-top: 13px;"><a href="<%=request.getContextPath()%>?action=logOut"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="16" fill="currentColor" class="bi bi-box-arrow-center text-center" viewBox="0 0 16 16">
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
                                <h6><em>Compite</em></h6>
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
                                <span style="color: #ec6090; font-size: 34px; text-decoration: none; margin-bottom: 30px; text-shadow: 10px 15px 7px #333333" class="animacionTextoUsuario"><b>Tabla de Clasificación</b></span>
                            </div>
                        </div>
                        <div class="item">
                            <ul>
                                <div class="row" >
                                    <div class="col">
                                        <div class="row">
                                            <span style="width: 10% !important" class="d-flex align-items-center pt-3"><span style="font-size: 15px; color: #ec6090;text-align: center !important;"><a style="cursor: default" href="#">Ranking</a></span></span>
                                            <span style="width: 10% !important" class="d-flex align-items-center pt-3"><span style="font-size: 15px; color: #ec6090;text-align: center !important;"><a style="cursor: default" href="#">Jugador</a></span></span>
                                            <span style="width: 10% !important" class="d-flex align-items-center pt-3"><span style="font-size: 15px; color: #ec6090;text-align: center !important;"><a href="<%=request.getContextPath()%>/LeaderboardServlet?orden=1"><div <%if(tipo==1 || tipo==0){%>class="animacionTextoTipo"<%}%>>Días jugados</div></a></span></span>
                                            <span style="width: 10% !important" class="d-flex align-items-center pt-3"><span style="font-size: 15px; color: #ec6090;text-align: center !important;"><a href="<%=request.getContextPath()%>/LeaderboardServlet?orden=2"><div <%if(tipo==2){%>class="animacionTextoTipo"<%}%>>Población total</div></a></span></span>
                                            <span style="width: 10% !important" class="d-flex align-items-center pt-3"><span style="font-size: 15px; color: #ec6090;text-align: center !important;"><a href="<%=request.getContextPath()%>/LeaderboardServlet?orden=3"><div <%if(tipo==3){%>class="animacionTextoTipo"<%}%>>Moral de la civilización</div></a></span></span>
                                            <span style="width: 10% !important" class="d-flex align-items-center pt-3"><span style="font-size: 15px; color: #ec6090;text-align: center !important;"><a href="<%=request.getContextPath()%>/LeaderboardServlet?orden=4"><div <%if(tipo==4){%>class="animacionTextoTipo"<%}%>>Guerras ganadas</div></a></span></span>
                                            <span style="width: 10% !important" class="d-flex align-items-center pt-3"><span style="font-size: 15px; color: #ec6090;text-align: center !important;"><a href="<%=request.getContextPath()%>/LeaderboardServlet?orden=5"><div <%if(tipo==5){%>class="animacionTextoTipo"<%}%>>Victorias de guerras (%)</div></a></span></span>
                                            <span style="width: 10% !important" class="d-flex align-items-center pt-3"><span style="font-size: 15px; color: #ec6090;text-align: center !important;"><a href="<%=request.getContextPath()%>/LeaderboardServlet?orden=6"><div <%if(tipo==6){%>class="animacionTextoTipo"<%}%>>Fuerza de la civilización</div></a></span></span>
                                            <span style="width: 10% !important" class="d-flex align-items-center pt-3"><span style="font-size: 15px; color: #ec6090;text-align: center !important;"><a href="<%=request.getContextPath()%>/LeaderboardServlet?orden=7"><div <%if(tipo==7){%>class="animacionTextoTipo"<%}%>>Máx. días de un habitante</div></a></span></span>
                                            <span style="width: 10% !important" class="d-flex align-items-center pt-3"><span style="font-size: 15px; color: #ec6090;text-align: center !important;"><a href="<%=request.getContextPath()%>/LeaderboardServlet?orden=8"><div <%if(tipo==8){%>class="animacionTextoTipo"<%}%>>Producción de alimento</div></a></span></span>
                                        </div>
                                    </div>
                                </div>
                            </ul>
                        </div>
                        <% String usuarioActual = jugadorActual.getUsuario();
                           String coloruwu = "";
                            boolean owo = true;%>
                        <%if(top10!=null){%>
                        <%for(DtoLeaderboard ditto : top10){%>
                        <div class="item <%if(top10.size()-1 == top10.indexOf(ditto)){%>last-item<%}%>">

                            <% if(usuarioActual.equals(ditto.getJugador().getUsuario())){
                                coloruwu = "#ec6090";
                            }else{
                                coloruwu = "white";
                                owo = false;
                            }
                            %>
                            <ul>
                                <div class="row">
                                    <div class="col">
                                        <div class="row">
                                            <span style="width: 7% !important;" class="d-flex justify-content-center pt-3"><span style="font-size: 14px; color: <%=coloruwu%>;text-align: center !important;" <%if(owo){%>class="animacionTextoUsuario"<%}%>><%=top10.indexOf(ditto)+1%></span></span>
                                            <span style="width: 10% !important; margin-left: 20px" class="d-flex justify-content-center pt-3"><span style="font-size: 14px; color: <%=coloruwu%>;text-align: center !important;" <%if(owo){%>class="animacionTextoUsuario"<%}%>><%=ditto.getJugador().getUsuario()%></span></span>
                                            <span style="width: 10% !important; margin-left: 14px" class="d-flex justify-content-center pt-3"><span style="font-size: 14px; color: <%=coloruwu%>;text-align: center !important;" <%if(owo){%>class="animacionTextoUsuario"<%}%>><%=ditto.getDiasJugados()%></span></span>
                                            <span style="width: 10% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 14px; color: <%=coloruwu%>;text-align: center !important;" <%if(owo){%>class="animacionTextoUsuario"<%}%>><%=ditto.getPoblacionTotal()%></span></span>
                                            <span style="width: 10% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 11px; color: <%=coloruwu%>;text-align: center !important;" <%if(owo){%>class="animacionTextoUsuario"<%}%>><%=Math.round(ditto.getMoralTotal()*100)/100%></span></span>
                                            <span style="width: 10% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 14px; color: <%=coloruwu%>;text-align: center !important;" <%if(owo){%>class="animacionTextoUsuario"<%}%>><%=ditto.getGuerrasGanadas()%></span></span>
                                            <span style="width: 10% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 14px; color: <%=coloruwu%>;text-align: center !important;" <%if(owo){%>class="animacionTextoUsuario"<%}%>><%if(ditto.getPorcentajeVictoriasGuerras()<0){%>N.A<%}else{%><%=ditto.getPorcentajeVictoriasGuerras()%> %<%}%></span></span>
                                            <span style="width: 10% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 11px; color: <%=coloruwu%>;text-align: center !important;" <%if(owo){%>class="animacionTextoUsuario"<%}%>><%=Math.round(ditto.getFuerzaTotal()*100)/100%></span></span>
                                            <span style="width: 10% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 13px; color: <%=coloruwu%>;text-align: center !important;" <%if(owo){%>class="animacionTextoUsuario"<%}%>><%=ditto.getMaxDiasHabitante()%></span></span>
                                            <span style="width: 10% !important" class="d-flex justify-content-center pt-3"><span style="font-size: 11px; color: <%=coloruwu%>;text-align: center !important;" <%if(owo){%>class="animacionTextoUsuario"<%}%>><%=Math.round(ditto.getProduccionTotal()*100)/100%></span></span>
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
