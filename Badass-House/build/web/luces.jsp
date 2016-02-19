<%-- 
    Document   : luces
    Created on : 18/02/2016, 10:16:19 AM
    Author     : Alumno
--%>
<%@page import="BD.cDatos"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><html>
    <head>
        <title>Status General</title>
        <link rel="shortcut icon" href="https://cdn2.iconfinder.com/data/icons/social-messaging-productivity-1-1/128/home-512.png">
        <link rel="stylesheet" href="BS/css/bootstrap.css" />
        <link rel="stylesheet" href="BS/css/bootstrap-theme.css" />
        <link rel="stylesheet" href="BS/css/bootstrap-theme.min.css" />
        <link rel="stylesheet" href="BS/css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/estilos.css" />
        <link rel="stylesheet" href="css/SlidersStyles.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="BS/js/bootstrap.js"></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                background: url("Imagenes/fondo_status.jpg") no-repeat fixed center;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
        </style>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>

    <%
        String correuki = (String) session.getAttribute("sessionMail");
        String Habitacion = "Habitacion 1";
        
        cDatos datukis = new cDatos();
        datukis.conectar();
    %>

    <body>
        <div class="container">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index.html">Badass House</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="pForceClose.html">Force Close <span class="sr-only">(current)</span></a></li>
                            <li><a href="pNKA.html">No Kids Allowed</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true">In da' kithcen <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="Despensa.jsp">Despensa</a></li>
                                    <li><a href="#">Gas</a></li>
                                    <li><a href="#">Enchufes</a></li>
                                    <li role="separato" class="divider"></li>
                                    <li><a href="luces.html">Luces</a></li>
                                    <li role="separato" class="divider"></li>
                                    <li><a href="#">Algo más</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true">In ur wife's room<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="luces.html">Luces</a></li>
                                    <li><a href="#">Enchufes</a></li>
                                    <li><a href="#">Cortinas</a></li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">

                            <li>
                                <form class="navbar-form navbar-left" role="search">
                                    <button class="btn btn-default"><a href="login.html">Cerrar sesión</a></button>
                                </form>
                            </li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav><!--Desde aquí hasta la linea 25 mas o menos copia, donde empieze el nav-->
            <div class="">
                <div class=" col-md-12 bienvenida text-center">Luces</div>
            </div>
            <div class="">
                <div class=" col-md-3 col-sm-6 col-xs-12 noTePeguesArriba fondoConfig ">
                    <!--<section>-->
                    <div class="form-group">
                        <div class="page-header text-center">
                            <h1>Gestión de Luces</h1>
                        </div>
                        Enchufe 1
                        <br>
                        <table>
                            <tr>
                            <form class="form-horizontal" action="apagadores.jsp" method="post">
                                <td>
                                    <input type="checkbox" class="sliderEstilos" id="sliderPEntrada">
                                    <label for="sliderPEntrada"></label>
                                </td>
                                <td style="padding-left:30px ; padding-top: 18px">
                                    <input type="text" class="form-control" name="Luz1" placeholder="Voltaje" size="5">
                                </td>
                                <td style="padding-left:30px ; padding-top: 18px">
                                    <input type='submit' value='Mandalo'/>
                                </td>
                            </form>
                            </tr>
                        </table>
                        </form>
                        <br>
                        Enchufe 2
                        <br>
                        <table>
                            <tr>
                            <form class="form-horizontal" action="apagadores.jsp" method="post">
                                <td>
                                    <%
                                        ResultSet rs = datukis.consulta1("call enchufeState('" + correuki + "',"+Habitacion+");");
                                        int E1;
                                    %>
                                    <input type="checkbox" class="sliderEstilos" id="sliderPEntrada">
                                    <label for="sliderPEntrada"></label>
                                </td>
                                <td style="padding-left:30px ; padding-top: 18px">
                                    <input type="text" class="form-control" name="Luz1" placeholder="Voltaje" size="5">
                                </td>
                                <td style="padding-left:30px ; padding-top: 18px">
                                    <input type='submit' value='Mandalo'/>
                                </td>
                            </form>
                            </tr>
                        </table>
                        </form>
                        <br>
                        Enchufe 3
                        <br>
                        <table>
                            <tr>
                            <form class="form-horizontal" action="apagadores.jsp" method="post">
                                <td>
                                    <input type="checkbox" class="sliderEstilos" id="sliderPEntrada">
                                    <label for="sliderPEntrada"></label>
                                </td>
                                <td style="padding-left:30px ; padding-top: 18px">
                                    <input type="text" class="form-control" name="Luz1" placeholder="Voltaje" size="5">
                                </td>
                                <td style="padding-left:30px ; padding-top: 18px">
                                    <input type='submit' value='Mandalo'/>
                                </td>
                            </form>
                            </tr>
                        </table>
                        </form>
                        <br>
                        Luz principal
                        <br>
                        <table>
                            <tr>
                            <form class="form-horizontal" action="apagadores.jsp" method="post">
                                <td>
                                    <input type="checkbox" class="sliderEstilos" id="sliderPEntrada">
                                    <label for="sliderPEntrada"></label>
                                </td>
                                <td style="padding-left:30px ; padding-top: 18px">
                                    <input type="text" class="form-control" name="Luz1" placeholder="Voltaje" size="5">
                                </td>
                                <td style="padding-left:30px ; padding-top: 18px">
                                    <input type='submit' value='Mandalo'/>
                                </td>
                            </form>
                            </tr>
                        </table>
                        </form>
                        <br>
                    </div>
                    <!--</section>-->
                </div>
            </div>
        </div>
    </body>
</html>