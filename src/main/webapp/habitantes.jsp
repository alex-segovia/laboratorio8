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

    <%ArrayList<Habitante> listaHabitantes = (ArrayList<Habitante>) request.getSession().getAttribute("listaHabitantes");%>
    <%Jugador jugadorActual = (Jugador) request.getSession().getAttribute("jugadorActual");%>

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gamingHabitante.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css">

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
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            border-radius: 12px;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            z-index: 10001;
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
                            <h4>Mis habitantes:</h4>
                        </div>
                        <div class="item">
                            <ul>
                                <div class="row" >
                                    <div class="col-6">
                                        <div class="row">
                                            <div class="col-2 d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090">ID</span></div>
                                            <div class="col-2 d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090">Nombre</span></div>
                                            <div class="col-2 d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090">Género</span></div>
                                            <div class="col-2 d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090">Consumo</span></div>
                                            <div class="col-2 d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090">Moral</span></div>
                                            <div class="col-2 d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090">Tiempo</span></div>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="row" style="width: 99%">
                                            <div class="col-2 d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090">Profesión</span></div>
                                            <div class="col-2 d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090">Fuerza</span></div>
                                            <div class="col-2 d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090">Producción</span></div>
                                            <div class="col-2 d-flex justify-content-center pt-3"><span style="font-size: 17px; color: #ec6090">Estado</span></div>
                                        </div>
                                    </div>
                                </div>
                            </ul>
                        </div>
                        <%for(Habitante habitante : listaHabitantes){%>
                        <div class="item <%if(listaHabitantes.size()-1 == listaHabitantes.indexOf(habitante)){%>last-item<%}%>">
                            <ul>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="row">
                                            <div class="col-2 d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white"><%if(habitante.getIdHabitante()<10){%>0<%=habitante.getIdHabitante()%><%}%></span></div>
                                            <div class="col-2 d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white"><%=habitante.getNombre()%></span></div>
                                            <div class="col-2 d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white"><%if(habitante.getGenero().equals("M")){%>Masculino<%}else if(habitante.getGenero().equals("F")){%>Femenino<%}else{%>Otro<%}%></span></div>
                                            <div class="col-2 d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white"><%=habitante.getAlimentacionDiaria()%></span></div>
                                            <div class="col-2 d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white"><%=habitante.getMoral()%></span></div>
                                            <div class="col-2 d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white"><%=habitante.getDiasVivo()%> día<%if(habitante.getDiasVivo()>1){%>s<%}%></span></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="row" style="width: 99%">
                                            <div class="col-2 d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white"><%if(habitante instanceof Granjero){%>Granjero<%}else if(habitante instanceof Constructor){%>Constructor<%}else if(habitante instanceof Soldado){%>Soldado<%}else{%>Ninguna<%}%></span></div>
                                            <div class="col-2 d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white"><%if(habitante instanceof Constructor){%><%=((Constructor) habitante).getFuerza()%><%}else if(habitante instanceof Soldado){%><%=((Soldado) habitante).getFuerza()%><%}else{%>--No tiene--<%}%></span></div>
                                            <div class="col-2 d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white"><%if(habitante instanceof Granjero){%><%=((Granjero) habitante).getProduccionAlimento()%> (A)<%}else if(habitante instanceof Constructor){%><%=((Constructor) habitante).getProduccionMoral()%><%}else if(habitante instanceof Soldado){%><%=((Soldado) habitante).getProduccionMoral()%><%}else{%>--No produce--<%}%></span></div>
                                            <div class="col-2 d-flex justify-content-center pt-3"><span style="font-size: 14px; color: white"><%if(habitante.isEstaMuerto()){%>Muerto<%}else{%>Vivo<%}%></span></div>
                                            <div class="col-2"><button class="btn btn-dark" style="font-size: 10px; color: white"><a>Editar</a></button></div>
                                            <div class="col-2"><button class="btn btn-dark" style="font-size: 10px; color: white" <%if(habitante.isEstaExiliado()){%>disabled<%}%>><a>Exhiliar</a></button></div>
                                        </div>
                                    </div>
                                </div>
                            </ul>
                        </div>
                        <%}%>
                        <div class="item last-item">
                            <ul>
                                <li><h4>CS-GO</h4><span>Sandbox</span></li>
                                <li><h4>Date Added</h4><span>21/04/2036</span></li>
                                <li><h4>Hours Played</h4><span>892 H 14 Mins</span></li>
                                <li><h4>Currently</h4><span>Downloaded</span></li>
                                <li><div class="main-border-button border-active"><a href="#">Editar</a></div></li>
                                <li><div class="main-border-button border-active"><a href="#">Exiliar</a></div></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- ***** Gaming Library End ***** -->
            </div>
        </div>
    </div>
</div>

<!-- Popup para crear habitante -->
<div class="overlay" id="overlayCrear"></div>
<div class="popup contenedorCrear" style="width: 700px;" id="popupCrear">
    <svg class="cerrarPopup" id="cerrarPopupCrear" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M11.4142 10L16.7071 4.70711C17.0976 4.31658 17.0976 3.68342 16.7071 3.29289C16.3166 2.90237 15.6834 2.90237 15.2929 3.29289L10 8.58579L4.70711 3.29289C4.31658 2.90237 3.68342 2.90237 3.29289 3.29289C2.90237 3.68342 2.90237 4.31658 3.29289 4.70711L8.58579 10L3.29289 15.2929C2.90237 15.6834 2.90237 16.3166 3.29289 16.7071C3.68342 17.0976 4.31658 17.0976 4.70711 16.7071L10 11.4142L15.2929 16.7071C15.6834 17.0976 16.3166 17.0976 16.7071 16.7071C17.0976 16.3166 17.0976 15.6834 16.7071 15.2929L11.4142 10Z" fill="black"/>
    </svg>

        <div class="container-fluid">
            <div class="row"><div class="col"><h5 style="text-align: center;">Crear habitante</h5></div></div>
            <div class="row">
                <div class="col-sm-7">
                    <br>
                    <label for="nombreHabitante" style="margin-top: 25px;"><b>Nombre del habitante:</b></label>
                    <input type="text" name="nombreHabitante" id="nombreHabitante" placeholder="Nombre" required>

                    <label for="generoHabitante" style="margin-top: 25px;"><b>Género del habitante:</b></label>
                    <select style="height: 55px;padding-left: 20px" name="generoHabitante" id="generoHabitante" required>
                        <option value="M">Masculino</option>
                        <option value="F">Femenino</option>
                        <option value="O">Otro</option>
                    </select>

                    <label for="profesionHabitante" style="margin-top: 25px;"><b>Profesión del habitante:</b></label>
                    <select style="height: 55px;padding-left: 20px" name="profesionHabitante" id="profesionHabitante" required>
                        <option value="Ninguna">--Ninguna--</option>
                        <option value="Granjero">Granjero</option>
                        <option value="Constructor">Constructor</option>
                        <option value="Soldado">Soldado</option>
                    </select>

                </div>
            </div>
        </div>
        <br>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6" style="margin-top: 5px;">
                    <button type="submit" style="opacity: 0.5" class="button secondary" id="cerrarPopupCrear1" disabled>Crear</button>
                </div>
                <div class="col-sm-6" style="margin-top: 5px;">
                    <button class="button secondary" id="cerrarPopupCrear2" style="background-color: grey;">Cancelar</button>
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
    popupFunc('popupCrear','mostrarPopupCrear',['cerrarPopupCrear','cerrarPopupCrear1','cerrarPopupCrear2'],'overlayCrear');
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
