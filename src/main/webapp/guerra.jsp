<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.laboratorio8.Beans.Guerra" %>
<%@ page import="com.example.laboratorio8.Beans.Jugador" %>
<%--
  Created by IntelliJ IDEA.
  User: alexd
  Date: 16/11/2023
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Jugador jugadorActual=(Jugador) request.getSession().getAttribute("jugadorActual");
    ArrayList<Guerra> historialGuerras=(ArrayList<Guerra>) request.getAttribute("historialGuerras");
Boolean guerraHaceUnDia=(Boolean) request.getAttribute("guerraHaceUnDia");
ArrayList<Jugador> listaJugadoresGuerra=(ArrayList<Jugador>) request.getAttribute("listaJugadoresGuerra");%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Guerra</title>
    <link rel="icon" href="assets/images/logoarmas.ico" type="image/x-icon">
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    <style>
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
            padding: 20px;
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            border-radius: 12px;
            transform: translate(-50%, -50%);
            z-index: 10001;
            width: 100%;
            max-width: 650px;
            background-color: rgba(255, 234, 245, 0.8)
        }

        /* Estilo para el botón de cerrar */
        .cerrarPopup {
            display: flex;
            -ms-flex-pack: center;
            justify-content: center;
            -ms-flex-align: center;
            align-items: center;
            width: 40px;
            height: 40px;
            border-radius: 10px;
            background-color: #45437f;
            cursor: pointer;
            position: absolute;
            top: -20px;
            right: -20px;
            z-index: 2;
            transition: background-color .2s ease-in-out;
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
                        <li><a href="<%=request.getContextPath()%>/GuerraServlet" class="active">Guerra<img src="assets/images/logoGuerra.jpg" alt=""></a></li>
                        <li><a href="<%=request.getContextPath()%>/LeaderboardServlet">Leaderboard<img src="assets/images/logoLeaderboard.jpg" alt=""></a></li>
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
                <div class="main-banner" style="background-image: url(fondoGuerra.png) !important;">
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="header-text">
                                <h6>Desafíate</h6>
                                <h4><em>Guerras</em> de civilizaciones</h4>
                                <h6>¡Declara la guerra a otro usuario y potencia tu civilización!</h6>
                                <h6 style="font-size: 75%">Para poder ser victorioso en una guerra, tus soldados tienen que tener más fuerza que los soldados y constructores del defensor después de haber cumplido el ciclo de un día en consumo de recursos.</h6>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ***** Banner End ***** -->

                <!-- ***** Featured Games Start ***** -->
                <div class="row" style="margin-top: 30px">

                    <div class="col-lg-9">
                        <div class="top-streamers">
                            <div class="heading-section">
                                <h4>Historial de <em>Guerras</em></h4>
                            </div>
                            <ul class="overflow-auto overflow-x-hidden" style="max-height: 410px">
                                <%for(Guerra g:historialGuerras){%>
                                <li style="width: 95%">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="row">
                                                <div class="col-6 d-flex justify-content-center">
                                                    <span style="font-size: 14px;color: #ec6090;font-weight: 400;"><img src="iconoGuerra.png" style="width: 25px" alt=""> <img src="assets/images/avatar-01.jpg" alt="" style="max-width: 46px; border-radius: 50%;"> <%=g.getJugadorAtacante().getUsuario()%></span>
                                                </div>
                                                <div class="col-6 d-flex justify-content-center">
                                                    <span style="font-size: 14px;color: #ec6090;font-weight: 400;"><img src="iconoEscudo.png" style="width: 25px" alt=""> <img src="assets/images/avatar-01.jpg" alt="" style="max-width: 46px; border-radius: 50%;"> <%=g.getJugadorDefensor().getUsuario()%></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="row text-center">
                                                <%if((g.getResultado().equals("Victoria atacante")&&g.getJugadorAtacante().getIdJugador()==jugadorActual.getIdJugador())||(g.getResultado().equals("Victoria defensiva")&&g.getJugadorDefensor().getIdJugador()==jugadorActual.getIdJugador())){%>
                                                <div class="col-6 d-flex justify-content-center" style="padding-top: 11px"><span class="text-center" style="color: greenyellow">Victoria</span></div>
                                                <%}else{%>
                                                <div class="col-6 d-flex justify-content-center" style="padding-top: 11px"><span class="text-center" style="color: red">Derrota</span></div>
                                                <%}if(g.getJugadorAtacante().getIdJugador()==jugadorActual.getIdJugador()){
                                                if(jugadorActual.getDiasDesdeCreacion()-g.getDiasRelativosJugadorAtacante()==1){%>
                                                <div class="col-6 d-flex justify-content-center" style="padding-top: 11px"><span class="text-center">Hace 1 día</span></div>
                                                <%}else{%>
                                                <div class="col-6 d-flex justify-content-center" style="padding-top: 11px"><span class="text-center">Hace <%=jugadorActual.getDiasDesdeCreacion()-g.getDiasRelativosJugadorAtacante()%> días</span></div>
                                                <%}}else{if(jugadorActual.getDiasDesdeCreacion()-g.getDiasRelativosJugadorDefensor()==1){%>
                                                <div class="col-6 d-flex justify-content-center" style="padding-top: 11px"><span class="text-center">Hace 1 día</span></div>
                                                <%}else{%>
                                                <div class="col-6 d-flex justify-content-center" style="padding-top: 11px"><span class="text-center">Hace <%=jugadorActual.getDiasDesdeCreacion()-g.getDiasRelativosJugadorDefensor()%> días</span></div>
                                                <%}}%>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <%}%>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="top-streamers">
                            <div class="heading-section">
                                <h4 class="text-center"><em>Reporte</em> Último día</h4>
                            </div>
                            <%if(guerraHaceUnDia){%>
                            <ul>
                                <%if((historialGuerras.get(0).getResultado().equals("Victoria atacante")&&historialGuerras.get(0).getJugadorAtacante().getIdJugador()==jugadorActual.getIdJugador())||(historialGuerras.get(0).getResultado().equals("Victoria defensiva")&&historialGuerras.get(0).getJugadorDefensor().getIdJugador()==jugadorActual.getIdJugador())){
                                if(request.getSession().getAttribute("primeraVez")!=null){%>
                                <audio src="sonidoVictoria.mp3" controls autoplay style="display: none"></audio>
                                <%}%>
                                <li>
                                    <div class="row" style="display: flex;justify-content: center">
                                        <img src="iconoVictoria.png" style="width:60%" alt="">
                                    </div>
                                    <div class="row text-center" style="margin-top: 20px">
                                        <h2 style="font-size: 300%;color: greenyellow">Victoria</h2>
                                    </div>
                                </li>
                                <%}else{
                                    if(request.getSession().getAttribute("primeraVez")!=null){%>
                                <audio src="sonidoDerrota.mp3" controls autoplay style="display: none"></audio>
                                <%request.getSession().removeAttribute("primeraVez");}%>
                                <li>
                                    <div class="row">
                                        <img src="iconoDerrota.png" style="width: 100%" alt="">
                                    </div>
                                    <div class="row text-center" style="margin-top: 20px">
                                        <h2 style="font-size: 300%;color: red">Derrota</h2>
                                    </div>
                                </li>
                                <%}%>
                                <li>
                                    <div>
                                        <%if(historialGuerras.get(0).getJugadorAtacante().getIdJugador()==jugadorActual.getIdJugador()){%>
                                        <h6>Durante el último día se ha registrado una guerra con <span style="color: darkmagenta;font-size:150%"><%=historialGuerras.get(0).getJugadorDefensor().getUsuario()%></span></h6>
                                        <%}else{%>
                                        <h6>Durante el último día se ha registrado una guerra con <span style="color: darkmagenta;font-size:150%"><%=historialGuerras.get(0).getJugadorAtacante().getUsuario()%></span></h6>
                                        <%}%>
                                    </div>
                                </li>
                            </ul>
                            <%}else{%>
                            <ul>
                                <li>
                                    <div class="row">
                                        <img src="iconoPaz2.png" style="width: 100%" alt="">
                                    </div>
                                    <div class="row text-center" style="margin-top: 20px">
                                        <h2 style="font-size: 300%">En paz</h2>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h6>Durante el último día no se ha realizado guerra con nuestra civilización.</h6>
                                    </div>
                                </li>
                            </ul>
                            <%}%>
                        </div>
                    </div>
                </div>
                <!-- ***** Featured Games End ***** -->

                <!-- ***** Banner Start ***** -->
                <div class="row" style="margin-top: 20px">
                    <div class="col-lg-12">
                        <div class="main-profile ">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="clips">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="heading-section">
                                                    <h4>Elige una <em>Civilización</em> y ¡declara una <em>Guerra</em>!</h4>
                                                </div>
                                            </div>
                                            <div class="row overflow-auto" style="max-height: 350px">
                                                <%for(Jugador j:listaJugadoresGuerra){%>
                                                <div class="col-lg-3 col-sm-6">
                                                    <div class="item">
                                                        <div class="thumb" id="mostrarPopupListaJugadores<%=listaJugadoresGuerra.indexOf(j)%>">
                                                            <img src="fotoAlex.png" alt="" style="border-radius: 23px; height: 100%">
                                                            <a onclick="popupFunc()"><img src="iconoAtacar.png" alt=""></a>
                                                        </div>
                                                        <div class="down-content text-center">
                                                            <div class="row">
                                                                <h4><%=j.getUsuario()%></h4>
                                                            </div>
                                                            <div class="row">
                                                                <%if(j.getDiasDesdeCreacion()==1){%>
                                                                <span style="font-size: 75%"><img src="iconoTiempo.png" style="width: 15px" alt=""> 1 día jugando</span>
                                                                <%}else{%>
                                                                <span style="font-size: 75%"><img src="iconoTiempo.png" style="width: 15px" alt=""> <%=j.getDiasDesdeCreacion()%> días jugando</span>
                                                                <%}%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
<%for(Jugador j:listaJugadoresGuerra){%>
<div class="overlay" id="overlayListaJugadores<%=listaJugadoresGuerra.indexOf(j)%>"></div>
<div class="popup" style="width: 600px;" id="popupListaJugadores<%=listaJugadoresGuerra.indexOf(j)%>">
    <svg class="cerrarPopup" id="cerrarPopupListaJugadores<%=listaJugadoresGuerra.indexOf(j)%>" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M11.4142 10L16.7071 4.70711C17.0976 4.31658 17.0976 3.68342 16.7071 3.29289C16.3166 2.90237 15.6834 2.90237 15.2929 3.29289L10 8.58579L4.70711 3.29289C4.31658 2.90237 3.68342 2.90237 3.29289 3.29289C2.90237 3.68342 2.90237 4.31658 3.29289 4.70711L8.58579 10L3.29289 15.2929C2.90237 15.6834 2.90237 16.3166 3.29289 16.7071C3.68342 17.0976 4.31658 17.0976 4.70711 16.7071L10 11.4142L15.2929 16.7071C15.6834 17.0976 16.3166 17.0976 16.7071 16.7071C17.0976 16.3166 17.0976 15.6834 16.7071 15.2929L11.4142 10Z" fill="black"/>
    </svg>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-1"></div>
            <div class="col-sm-10">
                <h5 style="text-align: center;">¿Está seguro de declarar la guerra a <span style="color: red"><%=j.getUsuario()%></span> con <%if(j.getDiasDesdeCreacion()==1){%><span style="color: #20c997">1 día</span><%}else{%><span style="color: #20c997"><%=j.getDiasDesdeCreacion()%> días</span><%}%> de jugar?</h5>
            </div>
            <div class="col-sm-1"></div>
        </div>
    </div>
    <br>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6 d-flex justify-content-center" style="margin-top: 5px;">
                <form method="post" action="<%=request.getContextPath()%>/GuerraServlet?action=declararGuerra">
                    <input type="hidden" name="idJugadorDefensor" value="<%=j.getIdJugador()%>">
                    <button type="submit" class="button secondary" style="background-color:rgba(224, 12, 121, 0.8);color:white">Sí</button>
                </form>
            </div>
            <div class="col-sm-6 d-flex justify-content-center" style="margin-top: 5px;">
                <button class="button secondary" id="cerrarPopupListaJugadores<%=listaJugadoresGuerra.indexOf(j)%>aux" style="background-color: rgba(120, 52, 87, 0.8);color: white">Cancelar</button>
            </div>
        </div>
    </div>
</div>
<%}%>
<script>
    function popupFunc(popupId,abrirId,cerrarClass,overlayId){
        const showPopup=document.getElementById(abrirId);
        const overlay=document.getElementById(overlayId);
        const popup=document.getElementById(popupId);
        const mostrarPopup = () => {
            overlay.style.display = 'block';
            popup.style.display = 'block';
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
</script>
<script>
    <%for(int i=0;i<listaJugadoresGuerra.size();i++){%>
    popupFunc('popupListaJugadores<%=i%>','mostrarPopupListaJugadores<%=i%>',['cerrarPopupListaJugadores<%=i%>','cerrarPopupListaJugadores<%=i%>aux'],'overlayListaJugadores<%=i%>');
    <%}%>
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
