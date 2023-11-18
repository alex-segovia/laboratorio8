<%--
  Created by IntelliJ IDEA.
  User: alexd
  Date: 16/11/2023
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/botonUwu.css">
    <link rel="stylesheet" href="assets/css/popupEwe.css">
    <link rel="stylesheet" href="assets/css/porcentajeOwo.css">
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gamingHabitante.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
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
                        <li><a href="<%=request.getContextPath()%>/HabitantesServlet">Habitantes<img src="assets/images/profile-header.jpg" alt=""></a></li>
                        <li><a href="<%=request.getContextPath()%>/RecursosServlet" class="active">Recursos<img src="assets/images/profile-header.jpg" alt=""></a></li>
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
                                <h4><em style="color: darkmagenta !important;">Gestión</em> de Recursos</h4>
                                <p style="color: white !important; font-size: 100%">Organiza y gestiona tanto la producción como demanda de recursos de todos los habitantes. Visualiza el estado de los pobladores con moral criticamente baja y aquellos caídos el dia anterior para plantear una estrategia que lleve adelante tu civilización.</p>

                                <section style="margin-top: 5% !important;">

                                <div class="main-button">
                                        <a class="show-modal" href="#">Pasar horas</a>
                                        <span class="overlay"></span>
                                        <div class="modal-box" style="z-index: 10">
                                            <i class="fa-solid fa-triangle-exclamation" style="color: #ec6090;"></i>
                                            <h2>Advertencia</h2>
                                            <div class="mt-3 mb-3">
                                                <h3 >Está seguro que desea pasar las horas?. Esta acción no es reversible</h3>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                <button class="close-btn">Cancelar</button>
                                                </div>
                                                <div class="col-6">
                                                <button>Continuar</button>
                                                </div>
                                            </div>
                                        </div>
                                        <a onclick="enviarFormulario('formTerminarDia');" href="#">Terminar día</a>
                                </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>


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
                                <div class="col-6 text-center">
                                    <h6>Consumo</h6>
                                </div>
                                <div class="col-6 text-center">
                                    <h6>Producción</h6>
                                </div>
                            </div>
                            <div class="row text-center mb-3">
                                <div class="col-6 text-center">
                                    <span style="font-size: 18px; color: white">120</span>
                                </div>
                                <div class="col-6 text-center">
                                    <span style="font-size: 18px; color: white">130</span>
                                </div>
                            </div>
                            <div class="row text-center mb-3">
                                <div class="col-12 text-center">
                                    <h6>Porcentaje</h6>
                                </div>
                            </div>

                            <div class="row text-center mb-3">
                                <div class="col-12 d-flex justify-content-center">
                                    <div class="d-flex justify-content-center box">
                                        <div class="content text-center">
                                            <div class="percent" data-text="uwu" style="--num: 66">
                                                <div class="dot"></div>
                                                <svg>
                                                    <circle cx="70" cy="70" r="70"></circle>
                                                    <circle cx="70" cy="70" r="70"></circle>
                                                </svg>
                                            </div>
                                            <div class="number mt-2">
                                                <h2>66<span>%</span></h2>
                                            </div>
                                            <div class="number">
                                                <h2 style="font-size: 10px; color: white">DemandaVsAlmacén</h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row text-center mb-2 mt-1">
                                <h4 style="text-underline: white !important;"><u>Horas transcurridas</u></h4>
                            </div>

                            <div class="row text-center mb-2">
                                <div class="col-12 text-center">
                                    <span style="font-size: 18px; color: white">69</span>
                                </div>
                            </div>


                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="top-downloaded maincra">
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
                                        <th scope="col" style="font-size: 17px; color: #ec6090">Tiempo</th>
                                        <th scope="col" style="font-size: 17px; color: #ec6090">Profesión</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="my-4">
                                        <td  style="font-size: 14px; color: white">1</td>
                                        <td  style="font-size: 14px; color: white">Mark</td>
                                        <td  style="font-size: 14px; color: white">Otto</td>
                                        <td  style="font-size: 14px; color: white">@mdo</td>
                                        <td  style="font-size: 14px; color: white">Mark</td>
                                        <td  style="font-size: 14px; color: white">Otto</td>
                                    </tr>
                                    <tr class="my-4">
                                        <td style="font-size: 14px; color: white">1</td>
                                        <td style="font-size: 14px; color: white">Mark</td>
                                        <td style="font-size: 14px; color: white">Otto</td>
                                        <td style="font-size: 14px; color: white">@mdo</td>
                                        <td style="font-size: 14px; color: white">Mark</td>
                                        <td style="font-size: 14px; color: white">Otto</td>
                                    </tr>
                                    <tr>
                                        <th style="font-size: 14px; color: white">1</th>
                                        <td style="font-size: 14px; color: white">Mark</td>
                                        <td style="font-size: 14px; color: white">Otto</td>
                                        <td style="font-size: 14px; color: white">@mdo</td>
                                        <td style="font-size: 14px; color: white">Mark</td>
                                        <td style="font-size: 14px; color: white">Otto</td>
                                    </tr>
                                    <tr>
                                        <th style="font-size: 14px; color: white">1</th>
                                        <td style="font-size: 14px; color: white">Mark</td>
                                        <td style="font-size: 14px; color: white">Otto</td>
                                        <td style="font-size: 14px; color: white">@mdo</td>
                                        <td style="font-size: 14px; color: white">Mark</td>
                                        <td style="font-size: 14px; color: white">Otto</td>
                                    </tr>
                                    <tr>
                                        <th style="font-size: 14px; color: white">1</th>
                                        <td style="font-size: 14px; color: white">Mark</td>
                                        <td style="font-size: 14px; color: white">Otto</td>
                                        <td style="font-size: 14px; color: white">@mdo</td>
                                        <td style="font-size: 14px; color: white">Mark</td>
                                        <td style="font-size: 14px; color: white">Otto</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="row mt-3 text-center">
                                <p style="color: #ec6090 !important; font-size: 24px">No te desanimes!</p>
                                <hr>
                                <p style="color: white !important; font-size: 100%">Aunque tus pobladores enfrenten desafíos y su moral pueda estar en baja, recuerda que la grandeza de una civilización se forja en los momentos más difíciles. Inspira a tus ciudadanos con tu visión y muestra el camino hacia un futuro próspero!</p>

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
                                <th scope="col" style="font-size: 17px; color: #ec6090">Tiempo</th>
                                <th scope="col" style="font-size: 17px; color: #ec6090">Profesión</th>
                                <th scope="col" style="font-size: 17px; color: #ec6090">Fuerza</th>
                                <th scope="col" style="font-size: 17px; color: #ec6090">Producción</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th style="font-size: 14px; color: white">1</th>
                                <td style="font-size: 14px; color: white">Mark</td>
                                <td style="font-size: 14px; color: white">Otto</td>
                                <td style="font-size: 14px; color: white">@mdo</td>
                                <td style="font-size: 14px; color: white">Mark</td>
                                <td style="font-size: 14px; color: white">Otto</td>
                                <td style="font-size: 14px; color: white">@mdo</td>
                                <td style="font-size: 14px; color: white">Mark</td>
                                <td style="font-size: 14px; color: white">Otto</td>
                                <td style="font-size: 14px; color: white">@mdo</td>
                            </tr>
                            <tr>
                                <th style="font-size: 14px; color: white">1</th>
                                <td style="font-size: 14px; color: white">Mark</td>
                                <td style="font-size: 14px; color: white">Otto</td>
                                <td style="font-size: 14px; color: white">@mdo</td>
                                <td style="font-size: 14px; color: white">Mark</td>
                                <td style="font-size: 14px; color: white">Otto</td>
                                <td style="font-size: 14px; color: white">@mdo</td>
                                <td style="font-size: 14px; color: white">Mark</td>
                                <td style="font-size: 14px; color: white">Otto</td>
                                <td style="font-size: 14px; color: white">@mdo</td>
                            </tr>
                            <tr>
                                <th style="font-size: 14px; color: white">1</th>
                                <td style="font-size: 14px; color: white">Mark</td>
                                <td style="font-size: 14px; color: white">Otto</td>
                                <td style="font-size: 14px; color: white">@mdo</td>
                                <td style="font-size: 14px; color: white">Mark</td>
                                <td style="font-size: 14px; color: white">Otto</td>
                                <td style="font-size: 14px; color: white">@mdo</td>
                                <td style="font-size: 14px; color: white">Mark</td>
                                <td style="font-size: 14px; color: white">Otto</td>
                                <td style="font-size: 14px; color: white">@mdo</td>
                            </tr>
                            <tr>
                                <th style="font-size: 14px; color: white">1</th>
                                <td style="font-size: 14px; color: white">Mark</td>
                                <td style="font-size: 14px; color: white">Otto</td>
                                <td style="font-size: 14px; color: white">@mdo</td>
                                <td style="font-size: 14px; color: white">Mark</td>
                                <td style="font-size: 14px; color: white">Otto</td>
                                <td style="font-size: 14px; color: white">@mdo</td>
                                <td style="font-size: 14px; color: white">Mark</td>
                                <td style="font-size: 14px; color: white">Otto</td>
                                <td style="font-size: 14px; color: white">@mdo</td>
                            </tr>
                            <tr>
                                <th style="font-size: 14px; color: white">1</th>
                                <td style="font-size: 14px; color: white">Mark</td>
                                <td style="font-size: 14px; color: white">Otto</td>
                                <td style="font-size: 14px; color: white">@mdo</td>
                                <td style="font-size: 14px; color: white">Mark</td>
                                <td style="font-size: 14px; color: white">Otto</td>
                                <td style="font-size: 14px; color: white">@mdo</td>
                                <td style="font-size: 14px; color: white">Mark</td>
                                <td style="font-size: 14px; color: white">Otto</td>
                                <td style="font-size: 14px; color: white">@mdo</td>
                            </tr>
                            </tbody>
                        </table>

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
<form id="formPasarHoras" action="<%=request.getContextPath()%>/RecursosServlet?action=pasarHoras" method="post"></form>
<form id="formTerminarDia" action="<%=request.getContextPath()%>/RecursosServlet?action=terminarDia" method="post"></form>

<script>
    function enviarFormulario(idForm) {
        var formulario = document.getElementById(idForm);
        formulario.submit();
        alert("¡Hola, esto es una alerta xd!");

    }
</script>

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
