<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.laboratorio8.Beans.*" %><%--
  Created by IntelliJ IDEA.
  User: alexd
  Date: 16/11/2023
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Jugador jugadorActual = (Jugador) request.getSession().getAttribute("jugadorActual");%>
<%ArrayList<Float> alimentoProduccionVsConsumo = (ArrayList<Float>) request.getAttribute("alimentoProduccionVsConsumo");%>
<%ArrayList<Habitante> habitantesMoralBaja = (ArrayList<Habitante>) request.getAttribute("habitantesMoralBaja");%>
<%ArrayList<Habitante> habitantesMuertos = (ArrayList<Habitante>) request.getAttribute("habitantesMuertos");%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>Gestión de recursos</title>
    <link rel="icon" href="assets/images/logoarmas.ico">
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/botonUwu.css">
    <link rel="stylesheet" href="assets/css/popupEwe.css">
    <link rel="stylesheet" href="assets/css/porcentajeOwo.css">
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gamingHabitante.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

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
                        <h4 style="color: white">Bienvenido, <div class="animacionUsuario"><%=jugadorActual.getUsuario()%></div></h4>
                    </a>
                    <ul class="nav">
                        <li><a href="<%=request.getContextPath()%>/HabitantesServlet">Habitantes<img src="assets/images/logoHabitante.jpg" alt=""></a></li>
                        <li><a href="<%=request.getContextPath()%>/RecursosServlet" class="active">Recursos<img src="assets/images/logoRecursos.jpg" alt=""></a></li>
                        <li><a href="<%=request.getContextPath()%>/GuerraServlet">Guerra<img src="assets/images/logoGuerra.jpg" alt=""></a></li>
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
                <div class="main-banner" style="background-image: url(assets/images/bannerRecursos.png) !important;">
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="header-text">
                                <h6><em>Enriquécete</em></h6>
                                <h4><em style="color: #ec6090 !important;">Gestión</em> de Recursos</h4>
                                <p style="color: white !important; font-size: 100%">Organiza y gestiona tanto la producción como demanda de recursos de todos los habitantes. Visualiza el estado de los pobladores con moral criticamente baja y aquellos caídos el dia anterior para plantear una estrategia que lleve adelante tu civilización.</p>

                                <% if(!habitantesMoralBaja.isEmpty()){%>
                                <section style="margin-top: 5% !important;">

                                <div class="main-button">
                                        <% if(jugadorActual.getHorasDia()<24){%>
                                        <a class="show-modal" href="#">Pasar horas</a>
                                        <span class="overlay"></span>
                                        <div class="modal-box" style="z-index: 10">
                                            <i class="fa-solid fa-triangle-exclamation" style="color: #ec6090;"></i>
                                            <h2>Advertencia</h2>
                                            <div class="mt-3 mb-3">
                                                <h3 >Está seguro que desea pasar las horas?. Esta acción es irreversible!</h3>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                <button class="close-btn">Cancelar</button>
                                                </div>
                                                <div class="col-6">
                                                <form id="formPasarHoras" action="<%=request.getContextPath()%>/RecursosServlet?action=pasarHoras" method="post">
                                                    <button type="submit">Continuar</button>
                                                </form>
                                                </div>
                                            </div>
                                        </div>
                                        <%}else{%>
                                        <form id="formTerminarDia" action="<%=request.getContextPath()%>/RecursosServlet?action=terminarDia" method="post"></form>
                                        <a onclick="enviarFormulario('formTerminarDia');" href="#" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Al presionar el botón, se procederá con la repartición de recursos.">Terminar día</a>
                                        <%}%>
                                </div>
                                </section>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>

                <% if(habitantesMoralBaja.isEmpty()){%>

                <div class ="row mt-5 text-center">
                    <p style="color: #ec6090 !important; font-size: 24px">Tu civilización está vacía, ve y recluta a tu próxima población! </p>
                </div>
                <%}else{%>
                <div class="row mt-5">
                    <div class="col-lg-4">
                        <div class="featured-games header-text">
                            <div class="heading-section">
                                <h4><em>Estadísticas</em> civilización</h4>
                            </div>
                            <div class="row text-center mb-3">
                                <h4 style="text-underline: white !important;"><u>Alimentos</u></h4>
                            </div>
                            <div class="row text-center mb-1">
                                <div class="col-4 text-center">
                                    <h6 title="Cantidad de alimento que tus habitantes consumen diariamente.">Consumo</h6>
                                </div>
                                <div class="col-4 text-center">
                                    <h6 title="Cantidad de alimento que tus granjeros producen diariamente.">Producción</h6>
                                </div>
                                <div class="col-4 text-center">
                                    <h6 title="Cantidad de alimento sobrante del día anterior. Se vuelve putrefacta después de un día.">Acumulado</h6>
                                </div>
                            </div>
                            <div class="row text-center mb-3">
                                <div class="col-4 text-center">
                                    <span style="font-size: 18px; color: white"><%=Math.round(alimentoProduccionVsConsumo.get(1)*100)/100.0%></span>
                                </div>
                                <div class="col-4 text-center">
                                    <span style="font-size: 18px; color: white"><%=Math.round(alimentoProduccionVsConsumo.get(0)*100)/100.0%></span>
                                </div>
                                <div class="col-4 text-center">
                                    <span style="font-size: 18px; color: white" title="Recuerda que la comida acumulada se pudre después de un día."><%=Math.round(jugadorActual.getAlimentoTotal()*100)/100.0%></span>
                                </div>
                            </div>
                            <div class="row text-center mb-4">
                                <div class="col-12 text-center">
                                    <h6>Porcentaje</h6>
                                </div>
                            </div>

                            <%
                                Integer porcentaje = 0;
                                String visual = "";

                                float almacen = alimentoProduccionVsConsumo.get(0) + jugadorActual.getAlimentoTotal();
                                float consumo = alimentoProduccionVsConsumo.get(1);

                                if(almacen == 0.0f){
                                    visual = "No posee alimento";
                                }else{
                                    porcentaje = Math.round((consumo*100)/(almacen));
                                    if(porcentaje>100){
                                        porcentaje = 100;
                                        visual = ">>";
                                    }
                                }
                            %>

                            <div class="row text-center mb-3">
                                <div class="col-12 d-flex justify-content-center">
                                    <div class="d-flex justify-content-center box">
                                        <div class="content text-center">
                                            <div class="percent" data-text="%" style="--num: <%=porcentaje%>">
                                                <div class="dot"></div>
                                                <svg>
                                                    <circle cx="70" cy="70" r="70"></circle>
                                                    <circle cx="70" cy="70" r="70"></circle>
                                                </svg>
                                            </div>
                                            <div class="number mt-2">
                                                <h2><%=porcentaje%><span>%</span><h5><%=visual%></h5></h2>
                                            </div>
                                            <div class="number mt-2">
                                                <h2 style="font-size: 14px; color: white"title="Representa la porción de comida que tus ciudadanos requieren respecto al alimento disponible.">Demanda Vs Almacén</h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row text-center mb-2 mt-4">
                                <div class="col-6 text-center">
                                    <h4 style="text-underline: white !important;"><u>Hora</u></h4>
                                </div>
                                <div class="col-6 text-center">
                                    <h4 style="text-underline: white !important;"><u>Día actual</u></h4>
                                </div>
                            </div>

                            <div class="row text-center mb-2">
                                <div class="col-6 text-center">
                                    <%int dia = jugadorActual.getHorasDia();%>
                                    <h4 style="text-underline: white !important;"><%=dia%></h4>
                                </div>
                                <div class="col-6 text-center">
                                    <h4 style="text-underline: white !important;"><%=jugadorActual.getDiasDesdeCreacion()%></h4>
                                </div>
                            </div>


                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="top-downloaded">
                            <div class="heading-section">
                                <h4><em>Ciudadanos</em> con moral baja</h4>
                            </div>

                            <div class="row mt-3 justify-content-center">

                                <table class="table justify-content-center table-hover">
                                    <thead>
                                    <tr>
                                        <th scope="col" style="font-size: 17px; color: #ec6090">ID</th>
                                        <th scope="col" style="font-size: 17px; color: #ec6090">Nombre</th>
                                        <th scope="col" style="font-size: 17px; color: #ec6090">Consumo</th>
                                        <th scope="col" style="font-size: 17px; color: #ec6090">Moral</th>
                                        <th scope="col" style="font-size: 17px; color: #ec6090">Días vivo</th>
                                        <th scope="col" style="font-size: 17px; color: #ec6090">Profesión</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <% for(Habitante habitante: habitantesMoralBaja){%>
                                    <tr class="my-4">
                                        <td  style="font-size: 14px; color: white"><%=habitante.getIdHabitante()%></td>
                                        <td  style="font-size: 14px; color: white"><%=habitante.getNombre()%></td>
                                        <td  style="font-size: 14px; color: white"><%=Math.round(habitante.getAlimentacionDiaria()*100)/100.0%></td>
                                        <td  style="font-size: 14px; color: white"><%=Math.round(habitante.getMoral()*100)/100.0%></td>
                                        <td  style="font-size: 14px; color: white"><%=habitante.getDiasVivo()%></td>
                                        <td  style="font-size: 14px; color: white">
                                            <% if(habitante instanceof Constructor){%><%if(habitante.getGenero().equals("F")){%>Constructora<%}else{%>Constructor<%}
                                            }else if (habitante instanceof Granjero){%><%if(habitante.getGenero().equals("F")){%>Granjera<%}else{%>Granjero<%}
                                            }else if (habitante instanceof Soldado){%><%if(habitante.getGenero().equals("F")){%>Soldada<%}else{%>Soldado<%}
                                            }else{%>Ninguna<%}%>
                                        </td>
                                    </tr>
                                    <%}%>
                                    </tbody>
                                </table>
                            </div>

                            <div class="row mt-3 text-center">
                                <p style="color: #ec6090 !important; font-size: 24px">No te desanimes, <%=jugadorActual.getUsuario()%>!</p>
                                <hr>
                                <p style="color: white !important; font-size: 100%">Aunque tus pobladores enfrenten desafíos y su moral pueda estar en baja, recuerda que la grandeza de una civilización se forja en los momentos más difíciles. Inspira a tus habitantes con tu visión y muestra el camino hacia un futuro próspero!</p>

                            </div>
                        </div>
                    </div>


                        </div>
                    </div>
                </div>

                <!-- ***** Gaming Library Start ***** -->
                <div class="gaming-library">
                    <div class="col-lg-12">
                        <div class="heading-section">
                            <h4><em>Habitantes</em> fallecidos el día anterior:</h4>
                        </div>

                    <div class="col-lg-12 d-flex justify-content-center">
                        <table class="table table-responsive table-hover">
                            <thead>
                            <tr>
                                <th scope="col" style="font-size: 17px; color: #ec6090">#</th>
                                <th scope="col" style="font-size: 17px; color: #ec6090">ID</th>
                                <th scope="col" style="font-size: 17px; color: #ec6090">Nombre</th>
                                <th scope="col" style="font-size: 17px; color: #ec6090">Género</th>
                                <th scope="col" style="font-size: 17px; color: #ec6090">Consumo</th>
                                <th scope="col" style="font-size: 17px; color: #ec6090">Moral</th>
                                <th scope="col" style="font-size: 17px; color: #ec6090">Días vivo</th>
                                <th scope="col" style="font-size: 17px; color: #ec6090">Profesión</th>
                                <th scope="col" style="font-size: 17px; color: #ec6090">Fuerza</th>
                                <th scope="col" style="font-size: 17px; color: #ec6090">Producción</th>
                                <th scope="col" style="font-size: 17px; color: #ec6090">Causa muerte</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% for(Habitante habitante: habitantesMuertos){%>
                            <tr>
                                <th style="font-size: 14px; color: white"><%=habitantesMuertos.indexOf(habitante)+1%></th>
                                <td style="font-size: 14px; color: white"><%=habitante.getIdHabitante()%></td>
                                <td style="font-size: 14px; color: white"><%=habitante.getNombre()%></td>
                                <td style="font-size: 14px; color: white"><%if(habitante.getGenero().equals("M")){%>Masculino<%}else if(habitante.getGenero().equals("F")){%>Femenino<%}else{%>Otro<%}%></td>
                                <td style="font-size: 14px; color: white"><%=habitante.getAlimentacionDiaria()%></td>
                                <td style="font-size: 14px; color: white"><%=habitante.getMoral()%></td>
                                <td style="font-size: 14px; color: white"><%=habitante.getDiasVivo()%></td>
                                <td style="font-size: 14px; color: white">
                                    <% if(habitante instanceof Constructor){%><%if(habitante.getGenero().equals("F")){%>Constructora<%}else{%>Constructor<%}
                                    }else if (habitante instanceof Granjero){%><%if(habitante.getGenero().equals("F")){%>Granjera<%}else{%>Granjero<%}
                                    }else if (habitante instanceof Soldado){%><%if(habitante.getGenero().equals("F")){%>Soldada<%}else{%>Soldado<%}
                                    }else{%>Ninguna<%}%>
                                </td>
                                <td style="font-size: 14px; color: white">
                                    <% if(habitante instanceof Constructor){%><%=((Constructor) habitante).getFuerza()%><%}
                                    else if (habitante instanceof Soldado){%><%=((Soldado) habitante).getFuerza()%><%}
                                    else {%>No tiene<%}%>
                                    </td>
                                <td style="font-size: 14px; color: white">
                                    <% if(habitante instanceof Constructor){%><%=((Constructor) habitante).getProduccionMoral()%> (M)<%}
                                    else if (habitante instanceof Soldado){%><%=((Soldado) habitante).getProduccionMoral()%> (M)<%}
                                    else if (habitante instanceof Granjero){%><%=((Granjero) habitante).getProduccionAlimento()%> (A)<%}
                                    else{%>No produce<%}%>
                                </td>
                                <td style="font-size: 14px; color: white"><%=habitante.getMotivoMuerte()%></td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>

                    </div>
                </div>
                <!-- ***** Gaming Library End ***** -->
            </div>
        <%}%>
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
    $(function() {
        $('[data-bs-toggle="tooltip"]').tooltip();
    });
</script>

<!-- Scripts -->
<script>
    function enviarFormulario(idForm) {
        var formulario = document.getElementById(idForm);
        formulario.submit();
    }
</script>

<script>
    const section = document.querySelector("section"),
        overlay = document.querySelector(".overlay"),
        showBtn = document.querySelector(".show-modal"),
        closeBtn = document.querySelector(".close-btn");
    showBtn.addEventListener("click", () => section.classList.add("active"));
    overlay.addEventListener("click", () =>
        section.classList.remove("active")
    );
    closeBtn.addEventListener("click", () =>
        section.classList.remove("active")
    );
</script>

<script>
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

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
