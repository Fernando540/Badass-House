<%-- 
    Document   : configuracion
    Created on : 7/12/2015, 06:46:05 PM
    Author     : Best Buy Demo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%
String idusr = request.getParameter("correo");
String nombre="";
String pass1 = "";
String pass2 = "";
String ap = "";
String am = "";
String correo ="";
    try
    {
        BD.cDatos sql = new BD.cDatos();
        sql.conectar();
        //ResultSet rs = sql.consulta("select * from usuarios where idusr = '"+correo+"'");
        ResultSet rs = sql.consulta("call sp_datosUsr('"+correo+"');");
        while(rs.next())
        {
        nombre = rs.getString("nombre");
        pass1 = rs.getString("oldPass");
        pass2 = rs.getString("newPass");
        ap = rs.getString("apPaterno");
        am = rs.getString("apMaterno");
        }
    }
    catch(Exception xd)
    {
        
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
        <link rel="stylesheet" href="css/SlidersStyles.css" />
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
                    <a class="navbar-brand" href="index.html">Badass House</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Force Close <span class="sr-only">(current)</span></a></li>
                        <li><a href="#">No Kids Allowed</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">In da' kithcen <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Despensa</a></li>
                                <li><a href="#">Gas</a></li>
                                <li><a href="#">Enchufes</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Luces</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Algo más</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">In ur wife's room<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Luces</a></li>
                                <li><a href="#">Enchufes</a></li>
                                <li><a href="#">Cortinas</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Agregar dispositivo</a></li>
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
        <div class="row">
            <div class=" col-md-12 bienvenida text-center">Configuración</div>
        </div>
        <div class=" row ">
            <div class="col-md-6 fondoConfig noTePeguesArriba text-center"> <!--Ajustes predeterminados-->
                <div class="page-header">
                    <h1>Información general</h1>
                </div>
                <section>
                    <form class="form-horizontal" action="Config" method="post"><!-- Aquí van las funciones del form-->
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Nombre:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control"  name="nombre" placeholder="Nombre" value="<%=nombre%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Apellido Paterno:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="apPaterno" placeholder="Apellido Paterno" value="<%=ap%>>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Apellido Materno:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name ="apMaterno" placeholder="Apellido Materno" value="<%=am%>>
                            </div>
                        </div>        
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Contraseña nueva:</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" name="newPass" placeholder="Contraseña nueva" value="<%=pass1%>>
                            </div>
                        </div>
                        <div class="form-group has-warning has-feedback">
                            <label class="col-sm-4 control-label">Contraseña actual: *</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" name="oldPass" placeholder="Contraseña actual" value="<%=pass2%>>
                            </div>
                        </div>
                        <button type="submit" class ="btn btn-success">Aceptar</button>
                        <button type="reset" class="btn btn-warning">Cancelar</button>
                        <br><br>
                        *La contraseña actual es necesaria para cualquier cambio
                        <input type="hidden" name="uX" value="<%=Integer.toString(uX)%>" />
                        <br><br><br><br>
                    </form>
                </section>
            </div>

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
                        
                    </div>
                </section>
            </div>
        </div>
        <div class="row">
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
        </div>
    </div>   
</body>
</html>
