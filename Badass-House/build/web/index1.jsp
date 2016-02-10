<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="shortcut icon" href="https://cdn2.iconfinder.com/data/icons/social-messaging-productivity-1-1/128/home-512.png">
        <title>Badass House Menú</title>
        <link rel="stylesheet" href="BS/css/bootstrap.css" />
        <link rel="stylesheet" href="BS/css/bootstrap-theme.css" />
        <link rel="stylesheet" href="BS/css/bootstrap-theme.min.css" />
        <link rel="stylesheet" href="BS/css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/estilos.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="BS/js/bootstrap.js"/></script>
        <meta charset="UTF-8">
        <meta content="no-cache" http-equiv="Pragma"></meta>
        <meta content="no-cache, no-store, must-revalidate" http-equiv="Cache-Control"></meta>
        <meta content="0" http-equiv="Expires"></meta>
    <style>
        body {
            background: url("Imagenes/fondo_menu_principal.jpg") no-repeat fixed center;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
    </style>
</head>
<body>
    <%
        String x = (String) session.getAttribute("sessionStat");
        String gologin = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/login.html'>";

        if (x.equals("logueado")) { %>
    <div class="container">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index1.html">Badass House</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <!--<li><a href="pForceClose1.html">Force Close <span class="sr-only">(current)</span></a></li>-->
                        <!--<li><a href="pNKA.html">No Kids Allowed</a></li>-->
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">In da' kithcen <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <!--<li><a href="#">Despensa</a></li>
                                <li><a href="#">Gas</a></li>
                                <li><a href="#">Enchufes</a></li>-->
                                <li role="separator" class="divider"></li>
                                <li><a href="luces1.html">Luces</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Algo más</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">In ur wife's room<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="luces1.html">Luces</a></li>
                                <!--<li><a href="#">Enchufes</a></li>-->
                                <li><a href="#">Cortinas</a></li>
                            </ul>
                        </li>
                        <!--<li><a href="#">Agregar dispositivo</a></li>-->
                    </ul>
                    <ul class="nav navbar-nav navbar-right">

                        <li>
                            <form class="navbar-form navbar-left" method="post" action="Logout" >
                                <input type="submit" class="btn btn-default" value="Cerrar Sesion">
                            </form>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        <div class="">
            <div class=" col-md-12 bienvenida text-center">Bienvenido a tu casa ${sessionScope.sessionName}</div>
        </div>
        <section>
            <div class='text-center fondo'>
                <!--<div class="col-md-4 fondo col-sm-4  inline-block noTePeguesArriba">
                    <article>
                        <a href="statusGeneral1.html"><img src='Imagenes/status_general.png' class="col-xs-3"></a>
                        <h2>Status General</h2>
                    </article>
                </div>-->
                <div class="col-md-6 col-sm-6 inline-block noTePeguesArriba fondo">
                    <article>
                        <a href="#"><img src='Imagenes/mi_cuenta.png' class="col-xs-3"></a>
                        <h2>Mi cuenta</h2>
                    </article>
                </div>
                <div class="col-md-6 col-sm-6 inline-block noTePeguesArriba fondo">
                    <article>
                        <a href="configuracion1.html"><img src='Imagenes/config.png' class="col-xs-3"></a>
                        <h2>Configuracion</h2>
                    </article>
                </div>
            </div>
            <!--Div donde están los 3 iconos principales-->
            <!--Div pie de página-->
            <div class="row">
                
            </div>
            <!--Div pie de página-->
        </section>
    </div>
</body>
</html>

<% } else {
        out.print(gologin);
    }
%>
