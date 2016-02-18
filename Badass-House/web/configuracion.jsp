
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%
    String nombre = "";
    String ap = "";
    String am = "";
    ResultSet rs;
    String x = (String) session.getAttribute("sessionStat");
    String log = (String) session.getAttribute("sessionMail");
    String gologin = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/login.html'>";
    if (x.equals("logueado")) {

        try {
            BD.cDatos sql = new BD.cDatos();
            sql.conectar();
            rs = sql.consulta1("select * from usuarios where correo = '" + log + "';");

            while (rs.next()) {
                nombre = rs.getString("nombre");
                ap = rs.getString("aPaterno");
                am = rs.getString("aMaterno");
            }
        } catch (Exception xd) {
            out.println("Error: " + xd);
        }


%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="https://cdn2.iconfinder.com/data/icons/social-messaging-productivity-1-1/128/home-512.png">
        <title>Badass Configuration</title>
        <link rel="stylesheet" href="BS/css/bootstrap.css" />
        <link rel="stylesheet" href="BS/css/bootstrap-theme.css" />
        <link rel="stylesheet" href="BS/css/bootstrap-theme.min.css" />
        <link rel="stylesheet" href="BS/css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/estilos.css" />
        <link rel="stylesheet" href="css/SlidersStylesConfig.css" />
        <link rel="stylesheet" href="Estilos/estiloTabla.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="BS/js/bootstrap.js"/></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            background: url("Imagenes/fondo_config.jpg") no-repeat fixed center;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
    </style>
</head>
<body>
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
                    <a class="navbar-brand" href="index.jsp">Badass House</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="pForceClose.html">Force Close <span class="sr-only">(current)</span></a></li>
                        <!--<li><a href="pNKA.html">No Kids Allowed</a></li>-->
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">In da' kithcen <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="Despensa.jsp">Despensa</a></li>
                                <li><a href="#">Gas</a></li>
                                <li><a href="#">Enchufes</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="luces.html">Luces</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Algo más</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">In ur wife's room<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="luces.html">Luces</a></li>
                                <!--<li><a href="#">Enchufes</a></li>-->
                                <li><a href="#">Cortinas</a></li>
                            </ul>
                        </li>
                        <!--<li><a href="#">Agregar dispositivo</a></li>-->
                    </ul>
                    <ul class="nav navbar-nav navbar-right">

                        <li>
                            <form class="navbar-form navbar-left">
                                <button class="btn btn-default"><a href="login.html">Cerrar sesión</a></button>
                            </form>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

        <div class="col-md-6 fondoConfig noTePeguesArriba">
            <div class="page-header">
                <h1>Notificaciones</h1>
            </div>
            <section>
                <div class="form-group">
                    Force close
                    <br>
                    <input type="checkbox" class="sliderForce" id="sliderForce">
                    <label for="sliderForce"></label>
                    <br>
                    No Kids Allowed
                    <br>
                    <input type="checkbox" class="sliderKids" id="sliderKids">
                    <label for="sliderKids"></label>
                    <br>
                    In da' kitchen
                    <br>
                    <input type="checkbox" class="sliderKitchen" id="sliderKitchen">
                    <label for="sliderKitchen"></label>
                    <br>
                    In ur wife's room
                    <br>
                    <input type="checkbox" class="sliderWife" id="sliderWife">
                    <label for="sliderWife"></label>
                    <br>
                </div>
            </section>
        </div>

        <div class="col-md-6 fondoConfig noTePeguesArriba">
            <div class="page-header">
                <h1>Cuentas de la casa</h1>
            </div>
            <section>
                <div class="form-group">
                    <%  try {
                            BD.cDatos datous = new BD.cDatos();
                            datous.conectar();
                            ResultSet rs1, rs2, rs3;
                            rs2 = datous.consulta1("select idCasa from relUsrCasa where correo ='" + log + "';");
                            while (rs2.next()) {
                                String idCasa = rs2.getString("idCasa");
                                rs1 = datous.consulta1("select correo from relUsrCasa where idCasa='" + idCasa + "'");
                                out.println("<center><table><tr><td><h3>Correo</h3></td><td><h3>Tipo</h3></td></tr>");
                                while (rs1.next()) {
                                    out.print("<tr>");
                                    String correo = rs1.getString("correo");
                                    out.println("<td>" + rs1.getObject("correo") + "</td>");
                                    rs3 = datous.consulta1("call dimeTipo('" + correo + "');");
                                    while (rs3.next()) {
                                        if (rs3.getString("privilegio").equals("1")) {
                                            out.println("<td>Premium</td>");
                                        }
                                        if (rs3.getString("privilegio").equals("2")) {
                                            out.println("<td>Junior</td>");
                                        }

                                    }
                                    out.println("</tr>");
                                }
                                out.println("</table></center>");
                            }

                        } catch (SQLException e) {
                            out.print(e);
                        }

                    %>
                    <!--Force close
                    <br>
                    <input type="checkbox" class="sliderForce" id="sliderForce">
                    <label for="sliderForce"></label>
                    <br>
                    No Kids Allowed
                    <br>
                    <input type="checkbox" class="sliderKids" id="sliderKids">
                    <label for="sliderKids"></label>
                    <br>
                    In da' kitchen
                    <br>
                    <input type="checkbox" class="sliderKitchen" id="sliderKitchen">
                    <label for="sliderKitchen"></label>
                    <br>
                    In ur wife's room
                    <br>
                    <input type="checkbox" class="sliderWife" id="sliderWife">
                    <label for="sliderWife"></label>
                    <br>-->
                </div>
            </section>
        </div>
    </div>
    <!--<div class=" ">
        <div class="col-md-12 fondoConfig noTePeguesArriba">
            <div class="page-header">
                <h3>Ayuda y soporte técnico</h3>
            </div>
            <form>
                <div class="form-group">
                    <label>Reporta un problema, realiza un comentario o sugerencia.</label>
                    <textarea class="form-control" rows="5" id="comment" placeholder="Ingresa tu comentario/queja/sugerencia"></textarea>
                </div>
                <button type="submit" class ="btn btn-success">Aceptar</button>
                <button type="reset" class="btn btn-warning">Cancelar</button>
            </form>
            <br>
        </div>
    </div>-->
</div>   
<br>
</body>
</html>
<% } else {
        out.print(gologin);
    }
%>
