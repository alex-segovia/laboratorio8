<%--
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

    <link rel="stylesheet" href="assets/css/style.css">
    <!-- Additional CSS Files -->
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
                                <h4>Gestión de Habitantes</h4>
                                <p style="color: white !important; font-size: 100%">Mantén un registro de todos los habitantes. Cada uno tiene distintas habilidades que aportarán al éxito de tu civilización.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ***** Banner End ***** -->

                <!-- ***** Most Popular Start *****
                <div class="most-popular">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="heading-section">
                                <h4><em>Most Popular</em> Right Now</h4>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-sm-6">
                                    <div class="item">
                                        <img src="assets/images/popular-01.jpg" alt="">
                                        <h4>Fortnite<br><span>Sandbox</span></h4>
                                        <ul>
                                            <li><i class="fa fa-star"></i> 4.8</li>
                                            <li><i class="fa fa-download"></i> 2.3M</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-6">
                                    <div class="item">
                                        <img src="assets/images/popular-02.jpg" alt="">
                                        <h4>PubG<br><span>Battle S</span></h4>
                                        <ul>
                                            <li><i class="fa fa-star"></i> 4.8</li>
                                            <li><i class="fa fa-download"></i> 2.3M</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-6">
                                    <div class="item">
                                        <img src="assets/images/popular-03.jpg" alt="">
                                        <h4>Dota2<br><span>Steam-X</span></h4>
                                        <ul>
                                            <li><i class="fa fa-star"></i> 4.8</li>
                                            <li><i class="fa fa-download"></i> 2.3M</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-6">
                                    <div class="item">
                                        <img src="assets/images/popular-04.jpg" alt="">
                                        <h4>CS-GO<br><span>Legendary</span></h4>
                                        <ul>
                                            <li><i class="fa fa-star"></i> 4.8</li>
                                            <li><i class="fa fa-download"></i> 2.3M</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="item">
                                        <div class="row">
                                            <div class="col-lg-6 col-sm-6">
                                                <div class="item inner-item">
                                                    <img src="assets/images/popular-05.jpg" alt="">
                                                    <h4>Mini Craft<br><span>Legendary</span></h4>
                                                    <ul>
                                                        <li><i class="fa fa-star"></i> 4.8</li>
                                                        <li><i class="fa fa-download"></i> 2.3M</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-sm-6">
                                                <div class="item">
                                                    <img src="assets/images/popular-06.jpg" alt="">
                                                    <h4>Eagles Fly<br><span>Matrix Games</span></h4>
                                                    <ul>
                                                        <li><i class="fa fa-star"></i> 4.8</li>
                                                        <li><i class="fa fa-download"></i> 2.3M</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-6">
                                    <div class="item">
                                        <img src="assets/images/popular-07.jpg" alt="">
                                        <h4>Warface<br><span>Max 3D</span></h4>
                                        <ul>
                                            <li><i class="fa fa-star"></i> 4.8</li>
                                            <li><i class="fa fa-download"></i> 2.3M</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-6">
                                    <div class="item">
                                        <img src="assets/images/popular-08.jpg" alt="">
                                        <h4>Warcraft<br><span>Legend</span></h4>
                                        <ul>
                                            <li><i class="fa fa-star"></i> 4.8</li>
                                            <li><i class="fa fa-download"></i> 2.3M</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="main-button">
                                        <a href="browse.html">Discover Popular</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                ***** Most Popular End ***** -->

                <!-- ***** Gaming Library Start ***** -->
                <div class="gaming-library">
                    <div class="col-lg-12">
                        <div class="heading-section">
                            <h4>Mis habitantes:</h4>
                        </div>
                        <div class="item" style="border: solid 1px rgba(255,255,255,0.2) !important;">
                            <table class="table">
                                <thead style="background: rgba(243, 140, 210, 0.4) !important; ">
                                    <tr>
                                        <th style="padding: 20px 15px !important; font-weight: 700 !important; text-transform: uppercase !important;">ID</th>
                                        <th style="padding: 20px 15px !important; font-weight: 700 !important; text-transform: uppercase !important;">Nombre</th>
                                        <th style="padding: 20px 15px !important; font-weight: 700 !important; text-transform: uppercase !important;">Género</th>
                                        <th style="padding: 20px 15px !important; font-weight: 700 !important; text-transform: uppercase !important;">Alimento</th>
                                        <th style="padding: 20px 15px !important; font-weight: 700 !important; text-transform: uppercase !important;">Moral</th>
                                        <th style="padding: 20px 15px !important; font-weight: 700 !important; text-transform: uppercase !important;">Tiempo</th>
                                        <th style="padding: 20px 15px !important; font-weight: 700 !important; text-transform: uppercase !important;">Fuerza</th>
                                        <th style="padding: 20px 15px !important; font-weight: 700 !important; text-transform: uppercase !important;">Producción</th>
                                        <th style="padding: 20px 15px !important; font-weight: 700 !important; text-transform: uppercase !important;"></th>
                                        <th style="padding: 20px 15px !important; font-weight: 700 !important; text-transform: uppercase !important;"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td style="padding: 15px !important; border-bottom: solid 1px rgba(255, 255, 255, 0.2) !important;" class="text-center">01</td>
                                        <td style="padding: 15px !important; border-bottom: solid 1px rgba(255, 255, 255, 0.2) !important;" class="text-center">Carlos</td>
                                        <td style="padding: 15px !important; border-bottom: solid 1px rgba(255, 255, 255, 0.2) !important;" class="text-center">Masculino</td>
                                        <td style="padding: 15px !important; border-bottom: solid 1px rgba(255, 255, 255, 0.2) !important;" class="text-center">100</td>
                                        <td style="padding: 15px !important; border-bottom: solid 1px rgba(255, 255, 255, 0.2) !important;" class="text-center">50</td>
                                        <td style="padding: 15px !important; border-bottom: solid 1px rgba(255, 255, 255, 0.2) !important;" class="text-center">50</td>
                                        <td style="padding: 15px !important; border-bottom: solid 1px rgba(255, 255, 255, 0.2) !important;" class="text-center">10 días</td>
                                        <td style="padding: 15px !important; border-bottom: solid 1px rgba(255, 255, 255, 0.2) !important;" class="text-center">20</td>
                                        <td style="padding: 15px !important; border-bottom: solid 1px rgba(255, 255, 255, 0.2) !important;"><button class="button button-primary button-xs" style="max-width: 10px !important">Editar</button></td>
                                        <td style="padding: 15px !important; border-bottom: solid 1px rgba(255, 255, 255, 0.2) !important;"><button class="button button-secondary button-xs">Exiliar</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

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
