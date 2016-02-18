
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%
String nombre="";
String ap = "";
String am = "";
ResultSet rs;
 String x = (String) session.getAttribute("sessionStat");
 String log = (String) session.getAttribute("sessionMail");
        String gologin = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/login.html'>";
        if (x.equals("logueado")) {
            
    try
    {
        BD.cDatos sql = new BD.cDatos();
        sql.conectar();
        rs = sql.consulta1("select * from usuarios where correo = '"+log+"';");
        
        while(rs.next())
        {
        nombre = rs.getString("nombre");
        ap = rs.getString("aPaterno");
        am = rs.getString("aMaterno");
        }
    }
    catch(Exception xd)
    {
        out.println("Error: " + xd);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="https://cdn2.iconfinder.com/data/icons/social-messaging-productivity-1-1/128/home-512.png">
        <title>Badass House Menú</title>
        <link rel="stylesheet" href="BS/css/bootstrap.css" />
        <link rel="stylesheet" href="BS/css/bootstrap-theme.css" />
        <link rel="stylesheet" href="BS/css/bootstrap-theme.min.css" />
        <link rel="stylesheet" href="BS/css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/estilos.css" />
        <link rel="stylesheet" href="Estilos/estiloTabla.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="BS/js/bootstrap.js"/></script>
    <meta charset="UTF-8">
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
                        <li><a href="pNKA.html">No Kids Allowed</a></li>
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
                                <li><a href="#">Enchufes</a></li>
                                <li><a href="#">Cortinas</a></li>
                            </ul>
                        </li>
                        <%--<li><a href="#">Agregar dispositivo</a></li>--%>
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

                    
        <div class=" ">
            <div class=" col-md-12 bienvenida text-center">Configuración</div>
        </div>
        <div class=" ">
            <div class="col-md-6 fondoConfig noTePeguesArriba text-center" > <!--Ajustes predeterminados-->
                <div class="page-header">
                    <h1>Información general</h1>
                </div>
                <section style="padding-bottom: 51px">
                    <form class="form-horizontal" action="JSPConfig.jsp" method="post"><!-- Aquí van las funciones del form-->
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Cuenta: <%=log%></label>
                            </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Nombre:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" placeholder="Nombre" name="nom" value="<%=nombre%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Apellido Paterno:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" placeholder="Apellido Paterno" name="ap" value="<%=ap%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Apellido Materno:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" placeholder="Apellido Materno" name="am" value="<%=am%>">
                            </div>
                        </div>
                        <!--<div class="form-group">
                            <label class="col-sm-4 control-label">Correo:</label>
                            <div class="col-sm-6">
                                <input type="email" class="form-control" placeholder="nombre@dominio.com">
                            </div>
                        </div>-->
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Contraseña nueva:</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" placeholder="Contraseña nueva" name="pass2">
                            </div>
                        </div>
                        <div class="form-group has-warning has-feedback">
                            <label class="col-sm-4 control-label">Contraseña actual: *</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" placeholder="Contraseña actual" name="pass1">
                            </div>
                        </div>
                        <button type="submit" class ="btn btn-success">Aceptar</button>
                        <button type="reset" class="btn btn-warning">Cancelar</button>
                        <br><br>
                        *La contraseña actual es necesaria para cualquier cambio
                        <input type="hidden" name="uX" value="<%=log%>">
                    </form>
                </section>
            </div>
    </div>
                    
</body>
</html>
<% } else {
        out.print(gologin);
    }
%>