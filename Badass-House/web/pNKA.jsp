<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Force Close</title>
        <link rel="shortcut icon" href="https://cdn2.iconfinder.com/data/icons/social-messaging-productivity-1-1/128/home-512.png">
        <link rel="stylesheet" href="BS/css/bootstrap.css" />
        <link rel="stylesheet" href="BS/css/bootstrap-theme.css" />
        <link rel="stylesheet" href="BS/css/bootstrap-theme.min.css" />
        <link rel="stylesheet" href="BS/css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/estilos.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="BS/js/bootstrap.js"></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                        <a class="navbar-brand" href="index.jsp">Badass House</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="pForceClose.html">Force Close <span class="sr-only">(current)</span></a></li>
                            <li  class="active"><a href="#">No Kids Allowed</a></li>
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
                            <!--<li><a href="#">Agregar dispositivo</a></li>-->
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
            </nav>
            <div class="">
                <div class=" col-md-12 bienvenida text-center">Evita que tus hijos esten en peligro</div>
            </div>
            <section>
                <div class='text-center fondo'>
                    <div class="noTePeguesArriba">
                        <img src='Imagenes/nka.JPG' alt="DIE MY CHID!!">
                        <form method="post" action="subeAltura.jsp">
                            <%
                                BD.cDatos datos=new BD.cDatos();
                                String altuki="",altot="",correo=(String)session.getAttribute("sessionMail");
                                ResultSet rs;
                                datos.conectar();
                                rs=datos.consulta1("call dimeAltura('"+correo+"')");
                                while(rs.next()){
                                    if(rs.getString("alto")!=null && rs.getString("bajo")!=null){
                                        altuki=rs.getString("alto");
                                        altot=rs.getString("bajo");
                                    }
                                    
                                }
                                
                            %>
                            <input type="text" name="alturaMax" size="3" value="<%=altuki%>" required>
                            
                            <br/>
                            Altura del Sensor de Piso (centímetros)<input id="Alturamin" type="range" min="0" max="2" step="0.1" />

                            <br/><br/>
                            <input type="text" size="3" name="alturaMin" value="<%=altot%>" required>
                            <br/>
                            Altura del Sensor mínima<input id="Alturamin" type="range" min="0" max="2" step="0.1" />
                            <br/>
                            <button type="submit" name="Aceptar" class ="btn btn-success">Confirmar</button>
                        </form>

                    </div>
                </div>
            </section>
        </div>
    </body>
</html>
