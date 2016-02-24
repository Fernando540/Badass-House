<%@page import="java.sql.ResultSet"%>
<%@page import="BD.cDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="shortcut icon" href="https://cdn2.iconfinder.com/data/icons/social-messaging-productivity-1-1/128/home-512.png">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <link rel="stylesheet" href="BS/css/bootstrap.css" />
        <link rel="stylesheet" href="BS/css/bootstrap-theme.css" />
        <link rel="stylesheet" href="BS/css/bootstrap-theme.min.css" />
        <link rel="stylesheet" href="BS/css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/estilos.css" />
        <link rel="stylesheet" href="css/SlidersStyles.css" />
        <script src="BS/js/bootstrap.js"/></script>
        <script src="js/scripts.js"/></script>
</head>
<body>
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <center>
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand">Casa de ${sessionScope.sessionName}<!--Aquí va el nombre del cabrón ese--></a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">

                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#status">Status</a></li>
                        <li><a href="#miCuenta">Mi cuenta</a></li>
                        <li><a href="#configuracion">Configuracion</a></li>
                        <li><a href="#cerraduras">Cerraduras</a></li>
                            <%
                                BD.cDatos datos = new BD.cDatos();
                                String correin = (String) session.getAttribute("sessionMail");
                                datos.conectar();
                                ResultSet rs3;
                                rs3 = datos.consulta1("call dimeNKA('" + correin + "');");
                                while (rs3.next()) {
                                    if (rs3.getString("estadots").equals("SI")) {
                                        out.print("<li><a href='#NoKids'>Niños no</a></li>");
                                    }
                                }
                                
                                String paquete = "";
                                ResultSet paqueton = datos.consulta1("call dimePaquete('','" + correin + "');");
                                while (paqueton.next()) {
                                    paquete = paqueton.getString("pkte");
                                }

                                ResultSet rs4 = datos.consulta1("call dimePaquete('','" + correin + "');");
                                while (rs4.next()) {
                                    if (rs4.getString("pkte").equals("Basico")) {
                                        out.print("<li><a href='#Habitacion1'>Habitacion 1</a></li>");
                                        out.print("<li><a href='#Habitacion2'>Habitacion 2</a></li>");
                                    } else {
                                        if (rs4.getString("pkte").equals("Pro")) {
                                            out.print("<li><a href='#Habitacion1'>Habitacion 1</a></li>");
                                            out.print("<li><a href='#Habitacion2'>Habitacion 2</a></li>");
                                            out.print("<li><a href='#Habitacion3'>Habitacion 3</a></li>");
                                            out.print("<li><a href='#Habitacion4'>Habitacion 4</a></li>");
                                        } else {
                                            out.print("<li><a href='#Habitacion1'>Habitacion 1</a></li>");
                                            out.print("<li><a href='#Habitacion2'>Habitacion 2</a></li>");
                                            out.print("<li><a href='#Habitacion3'>Habitacion 3</a></li>");
                                            out.print("<li><a href='#Habitacion4'>Habitacion 4</a></li>");
                                            out.print("<li><a href='#Habitacion5'>Habitacion 5</a></li>");
                                            out.print("<li><a href='#Habitacion6'>Habitacion 6</a></li>");
                                        }
                                    }
                                }
                            %>
                        <li>
                            <form class="navbar-form navbar-left" method="post" action="mandaDespensa" >
                                <input type="submit" class="btn btn-warning" value="Despensa">
                            </form>
                        </li>

                        <li>
                            <form class="navbar-form navbar-left" method="post" action="Logout" >
                                <input type="submit" class="btn btn-default" value="Cerrar Sesion">
                            </form>
                        </li>
                    </ul>

                </div>
            </center>            
        </div>
    </nav>
    <!--Div Satus-->
    <div id="status" class="container-fluid noTePeguesArriba">
        <div class="row">
            <div class=" page-header text-center noTePeguesArriba">
                <br>
                <strong>Status</strong>
            </div>
        </div>
        <div class="row-fluid">
            <div class="text-center">
                <h4 class="status">Puertas</h4>
            </div>
            <div class="col-md-3">
                Puerta de entrada
                <input type="checkbox" class="sliderEstilos" id="sliderPEntrada">
                <label for="sliderPEntrada"></label>
            </div> 
            <div class="col-md-3">
                Puerta dormitorio
                <input type="checkbox" class="sliderEstilos" id="sliderPDormitorio">
                <label for="sliderPDormitorio"></label>
            </div>
            <div class="col-md-3">
                Puerta cocina
                <input type="checkbox" class="sliderEstilos" id="sliderPCocina">
                <label for="sliderPCocina"></label>
            </div>
            <div class="col-md-3">
                Puerta sala
                <input type="checkbox" class="sliderEstilos" id="sliderWife">
                <label for="sliderWife"></label>
            </div>
        </div>
        <div class="row-fluid">
            <div class="text-center">
                <br><br><br><br>
                <h4 class="status">Llaves de gas</h4>
            </div>
            <div class="col-md-3">
                Llave 1 
                <input type="checkbox" class="sliderEstilos" id="sliderLlave1" checked>
                <label for="sliderLlave1"></label>
            </div>
            <div class="col-md-3">
                Llave 2
                <input type="checkbox" class="sliderEstilos" id="sliderLlave2" checked>
                <label for="sliderLlave2"></label>
            </div>
            <div class="col-md-3">
                Llave 3
                <input type="checkbox" class="sliderEstilos" id="sliderLlave3" checked>
                <label for="sliderLlave3"></label>
            </div>
            <div class="col-md-3">
                Llave 4
                <input type="checkbox" class="sliderEstilos" id="sliderLlave4" checked>
                <label for="sliderLlave4"></label>
            </div>
        </div>
    </div>
    <!--Div Satus-->
    <!--Div Mi Cuenta-->
    <div id="miCuenta" class="container-fluid noTePeguesArriba">
        <div class="row">
            <div class="page-header text-center noTePeguesArriba">
                <br>
                <strong>Mi cuenta</strong>
            </div>
        </div>
        <%            String nombre = "";
            String ap = "";
            String am = "";
            ResultSet rs;
            String x = (String) session.getAttribute("sessionStat");
            String log = (String) session.getAttribute("sessionMail");
            String numSerie = (String) session.getAttribute("numSerie");
            String gologin = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/login.html'>";

            try {

                rs = datos.consulta1("select * from usuarios where correo = '" + log + "';");

                while (rs.next()) {
                    nombre = rs.getString("nombre");
                    ap = rs.getString("aPaterno");
                    am = rs.getString("aMaterno");
                }
            } catch (Exception xd) {
                out.println("Error: " + xd);
            }

        %>
        <div class="text-center">
            <h4 class="cuenta">Mis datos</h4>
        </div>
        <div class="row">
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
                <center>
                    <button type="submit" class ="btn btn-success">Aceptar</button>
                    <button type="reset" class="btn btn-warning">Cancelar</button>                
                    <br><br>

                    <small>*La contraseña actual es necesaria para cualquier cambio</small>
                </center>
                <input type="hidden" name="uX" value="">
            </form>
        </div>
        <div class="row">
            <div class="text-center">
                <h4 class="cuenta">Agregar cuenta</h4>
            </div>            
        </div>
        <div class="row">
            <form class="form-horizontal" action="JSPAltaCuenta.jsp" method="post"><!-- Aquí van las funciones del form--> 
                <div class="form-group">
                    <label class="col-sm-4 control-label">Numero de serie:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="numSerie" maxlength="6" required >
                    </div>
                </div> 
                <div class="form-group">
                    <label class="col-sm-4 control-label">Nombre:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="nombre" maxlength="35" onkeypress="return noNumeros(event)" required >
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Apellido Paterno:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="aPaterno" maxlength="35" onkeypress="return noNumeros(event)" required >
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Apellido Materno:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="aMaterno" maxlength="35" onkeypress="return noNumeros(event)" required >
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Tipo Usuario:</label>
                    <div class="col-sm-6">
                        <select class="form-control" name="tipoUsr" required>
                            <option>Premium</option>
                            <option>Junior</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Correo electrónico:</label>
                    <div class="col-sm-6">
                        <input type="email" class="form-control" name="correo" placeholder="nombre@dominio.com" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" >
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Contraseña:</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" name="password" maxlength="15" placeholder="15 caract&eacute;res max" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Contraseña de la cuenta actual:</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" name="passwordOrig" maxlength="15" required>
                    </div>
                </div>
                <center>
                    <button type="submit" class ="btn btn-success">Aceptar</button>
                    <button type="reset" class="btn btn-warning">Cancelar</button>                
                    <br><br>
                </center>
            </form>
        </div>
    </div>
    <!--Div Mi Cuenta-->
    <!--Div Configuración-->
    <div id="configuracion" class="container-fluid noTePeguesArriba">
        <div class="row">
            <div class=" page-header text-center noTePeguesArriba">
                <br>
                <strong>Configuración</strong>
            </div>
        </div>
        <div class="row-fluid">
            <div class="text-center">                
                <h4 class="status">Notificaciones</h4>
            </div>
            <div class="col-md-3">
                Cerraduras
                <input type="checkbox" class="sliderEstilos" id="sliderForce">
                <label for="sliderForce"></label>
            </div>
            <div class="col-md-3">
                Niños no
                <input type="checkbox" class="sliderEstilos" id="sliderKids">
                <label for="sliderKids"></label>
            </div>
            <div class="col-md-3">
                Alacena
                <input type="checkbox" class="sliderEstilos" id="sliderKitchen">
                <label for="sliderKitchen"></label>
            </div>
            <div class="col-md-3">
                Cuartos
                <input type="checkbox" class="sliderEstilos" id="sliderWife">
                <label for="sliderWife"></label>
            </div>
        </div>
    </div>
    <!--Div COnfiguración-->
    <!--Div Cerradura-->
    <div id="cerraduras" class="container-fluid noTePeguesArriba">
        <div class="row">
            <div class=" page-header text-center noTePeguesArriba">
                <br>
                <strong>Cerraduras</strong>
            </div>
        </div>
        <div class="row">
            <div class="text-center">                
                <h4>Cerraduras</h4>
            </div>
            <div class="col-md-3">
                Cerradura 1 
                <input type="checkbox" class="sliderEstilos" id="sliderCerradura1" checked>
                <label for="sliderCerradura1"></label>
            </div>
            <div class="col-md-3">
                Cerradura 2
                <input type="checkbox" class="sliderEstilos" id="sliderCerradura2" checked>
                <label for="sliderCerradura2"></label>
            </div>
            <div class="col-md-3">
                Cerradura 3
                <input type="checkbox" class="sliderEstilos" id="sliderCerradura3" checked>
                <label for="sliderCerradura3"></label>
            </div>
            <div class="col-md-3">
                Cerradura 4
                <input type="checkbox" class="sliderEstilos" id="sliderCerradura4" checked>
                <label for="sliderCerradura4"></label>
            </div>
            <br><br><br><br>
        </div>
    </div>
    <!--Div Cerradura-->
    <!--Niños no-->
    <%
        rs3 = datos.consulta1("call dimeNKA('" + correin + "');");
        while (rs3.next()) {
            if (rs3.getString("estadots").equals("SI")) {
    %>
    <div id='NoKids' class= 'container-fluid noTePeguesArriba' >
        <div class='row'>
            <div class='page-header text-center noTePeguesArriba'>
                <br>
                <strong>Niños no</strong>
            </div>
        </div>
        <div class='row'>
            <div class='text-center'>                
                <h4 class='status'>Altura de sensor</h4>
            </div>
            <div class='col-md-8 col-md-offset-2 text-center'>
                <form method='post' action='subeAltura.jsp'>
                    <%
                        String altuki = "", altot = "", correo = (String) session.getAttribute("sessionMail");
                        ResultSet rs2;

                        rs2 = datos.consulta1("call dimeAltura('" + correo + "')");
                        while (rs2.next()) {
                            if (rs2.getString("alto") != null && rs2.getString("bajo") != null) {
                                altuki = rs2.getString("alto");
                                altot = rs2.getString("bajo");
                            }

                        }

                    %>
                    <input type='text' name='alturaMax' size='3' value='<%=altuki%>' required>

                    <br/>
                    Altura del Sensor de Piso (centímetros)<input id='Alturamin' type='range' min='0' max='2' step='0.1' />

                    <br/><br/>
                    <input type='text' size='3' name='alturaMin' value='<%=altot%>' required>
                    <br/>
                    Altura del Sensor mínima<input id='Alturamin' type='range' min='0' max='2' step='0.1' />
                    <br/>
                    <button type='submit' name='Aceptar' class ='btn btn-success'>Confirmar</button>
                </form>
            </div>
        </div>
    </div>
    <%
            }
        }
    %>
    <div id='Habitacion1' class= 'container-fluid noTePeguesArriba' >
        <div class='row'>
            <div class='page-header text-center noTePeguesArriba'>
                <br>
                <strong>Habitacion 1</strong>
            </div>
        </div>
        <div class='row'>
            <%
                String correuki = (String) session.getAttribute("sessionMail");

                cDatos datukis = new cDatos();
                datukis.conectar();

                try {
                    ResultSet rs5 = datukis.consulta1("call enchufeState('" + correuki + "','Habitacion 1');");
                    int contador = 0;

                    String[] uso = new String[4];
                    String[] nombres = new String[4];
                    while (rs5.next()) {
                        uso[contador] = rs5.getString("estatus");
                        nombres[contador] = rs5.getString("switchName");
                        contador = contador + 1;
                    }
            %>

            <div class="">
                <div class=" col-md-12 bienvenida text-center">Luces</div>
            </div>
            <div class="">
                <center>
                    <!--<section>-->
                    <!--<div class="form-group">-->
                    <div class="page-header text-center">
                        <h1>Gestión de Luces</h1>
                    </div>
                    Enchufe 1
                    <br>
                    <% if (uso[0].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff1" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe1" onclick="apagaPrende1()">
                                    <label for="Enchufe1"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 1" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 1" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff1" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe1" onclick="apagaPrende1()" checked>
                                    <label for="Enchufe1"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 1" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 1" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    Enchufe 2
                    <br>
                    <% if (uso[1].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff2" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe2" onclick="apagaPrende2()">
                                    <label for="Enchufe2"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 1" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 1" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff2" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe2" onclick="apagaPrende2()" checked>
                                    <label for="Enchufe2"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 1" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 1" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    Enchufe 3
                    <br>
                    <% if (uso[2].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff3" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe3" onclick="apagaPrende3()">
                                    <label for="Enchufe3"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 1" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 1" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff3" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe3" onclick="apagaPrende3()" checked>
                                    <label for="Enchufe3"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 1" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 1" name="habit" hidden>
                                   <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    Luz Principal
                    <br>
                    <% if (uso[3].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff4" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Luz" onclick="apagaPrende4()">
                                    <label for="Luz"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 1" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 1" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff4" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Luz" onclick="apagaPrende4()" checked>
                                    <label for="Luz"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 1" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 1" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    </center>
                    <!--</section>-->
            </div>
        </div>
        <%
            } catch (Exception errots) {
                out.print(errots.getMessage());
            }
        %>
    </div>
    <div id='Habitacion2' class= 'container-fluid noTePeguesArriba' >
        <div class='row'>
            <div class='page-header text-center noTePeguesArriba'>
                <br>
                <strong>Habitacion 2</strong>
            </div>
        </div>
        <div class='row'>
            <%
                datukis.conectar();

                try {
                    ResultSet rs5 = datukis.consulta1("call enchufeState('" + correuki + "','Habitacion 2');");
                    int contador = 0;

                    String[] uso = new String[4];
                    String[] nombres = new String[4];
                    while (rs5.next()) {
                        uso[contador] = rs5.getString("estatus");
                        nombres[contador] = rs5.getString("switchName");
                        contador = contador + 1;
                    }
            %>

            <div class="">
                <div class=" col-md-12 bienvenida text-center">Luces</div>
            </div>
            <div class="">
                <center>
                    <!--<section>-->
                    <!--<div class="form-group">-->
                    <div class="page-header text-center">
                        <h1>Gestión de Luces</h1>
                    </div>
                    Enchufe 1
                    <br>
                    <% if (uso[0].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff5" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe5" onclick="apagaPrende5()">
                                    <label for="Enchufe5"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 2" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 2" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff5" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe5" onclick="apagaPrende5()" checked>
                                    <label for="Enchufe5"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 2" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 2" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    Enchufe 2
                    <br>
                    <% if (uso[1].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff6" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe6" onclick="apagaPrende6()">
                                    <label for="Enchufe6"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 2" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 2" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff6" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe6" onclick="apagaPrende6()" checked>
                                    <label for="Enchufe6"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 2" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 2" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    Enchufe 3
                    <br>
                    <% if (uso[2].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff7" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe7" onclick="apagaPrende7()">
                                    <label for="Enchufe7"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 2" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 2" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff7" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe7" onclick="apagaPrende7()" checked>
                                    <label for="Enchufe7"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 2" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 2" name="habit" hidden>
                                   <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    Luz Principal
                    <br>
                    <% if (uso[3].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff8" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Luz2" onclick="apagaPrende8()">
                                    <label for="Luz2"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 2" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 2" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff8" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Luz2" onclick="apagaPrende8()" checked>
                                    <label for="Luz2"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 2" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 2" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    </center>
                    <!--</section>-->
            </div>
        </div>
        <%
            } catch (Exception errots) {
                out.print(errots.getMessage());
            }
        %>
    </div>
    <%
                if (paquete.equals("Pro")){
    %>
    <div id='Habitacion3' class= 'container-fluid noTePeguesArriba' >
        <div class='row'>
            <div class='page-header text-center noTePeguesArriba'>
                <br>
                <strong>Habitacion 3</strong>
            </div>
        </div>
        <div class='row'>
            <%
                datukis.conectar();

                try {
                    ResultSet hab3 = datukis.consulta1("call enchufeState('" + correuki + "','Habitacion 3');");
                    int contador = 0;

                    String[] uso = new String[4];
                    String[] nombres = new String[4];
                    while (hab3.next()) {
                        uso[contador] = hab3.getString("estatus");
                        nombres[contador] = hab3.getString("switchName");
                        contador = contador + 1;
                    }
            %>

            <div class="">
                <div class=" col-md-12 bienvenida text-center">Luces</div>
            </div>
            <div class="">
                <center>
                    <!--<section>-->
                    <!--<div class="form-group">-->
                    <div class="page-header text-center">
                        <h1>Gestión de Luces</h1>
                    </div>
                    Enchufe 1
                    <br>
                    <% if (uso[0].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff9" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe9" onclick="apagaPrende9()">
                                    <label for="Enchufe9"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 3" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 3" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff9" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe9" onclick="apagaPrende9()" checked>
                                    <label for="Enchufe9"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 3" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 3" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    Enchufe 2
                    <br>
                    <% if (uso[1].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff10" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe10" onclick="apagaPrende10()">
                                    <label for="Enchufe10"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 3" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 3" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff10" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe10" onclick="apagaPrende10()" checked>
                                    <label for="Enchufe10"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 3" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 3" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    Enchufe 3
                    <br>
                    <% if (uso[2].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff11" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe11" onclick="apagaPrende11()">
                                    <label for="Enchufe11"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 3" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 3" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff11" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe11" onclick="apagaPrende11()" checked>
                                    <label for="Enchufe11"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 3" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 3" name="habit" hidden>
                                   <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    Luz Principal
                    <br>
                    <% if (uso[3].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff12" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Luz3" onclick="apagaPrende12()">
                                    <label for="Luz3"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 3" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 3" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff12" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Luz3" onclick="apagaPrende12()" checked>
                                    <label for="Luz3"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 3" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 3" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    </center>
                    <!--</section>-->
            </div>
        </div>
        <%
            } catch (Exception errots) {
                out.print(errots.getMessage());
            }
        %>
    </div>
    <div id='Habitacion4' class= 'container-fluid noTePeguesArriba' >
        <div class='row'>
            <div class='page-header text-center noTePeguesArriba'>
                <br>
                <strong>Habitacion 4</strong>
            </div>
        </div>
        <div class='row'>
            <%
                datukis.conectar();

                try {
                    ResultSet hab4 = datukis.consulta1("call enchufeState('" + correuki + "','Habitacion 4');");
                    int contador = 0;

                    String[] uso = new String[4];
                    String[] nombres = new String[4];
                    while (hab4.next()) {
                        uso[contador] = hab4.getString("estatus");
                        nombres[contador] = hab4.getString("switchName");
                        contador = contador + 1;
                    }
            %>

            <div class="">
                <div class=" col-md-12 bienvenida text-center">Luces</div>
            </div>
            <div class="">
                <center>
                    <!--<section>-->
                    <!--<div class="form-group">-->
                    <div class="page-header text-center">
                        <h1>Gestión de Luces</h1>
                    </div>
                    Enchufe 1
                    <br>
                    <% if (uso[0].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff13" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe13" onclick="apagaPrende13()">
                                    <label for="Enchufe13"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 4" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 4" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff13" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe13" onclick="apagaPrende13()" checked>
                                    <label for="Enchufe13"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 4" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 4" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    Enchufe 2
                    <br>
                    <% if (uso[1].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff14" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe14" onclick="apagaPrende14()">
                                    <label for="Enchufe14"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 4" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 4" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff14" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe10" onclick="apagaPrende14()" checked>
                                    <label for="Enchufe14"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 4" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 4" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    Enchufe 3
                    <br>
                    <% if (uso[2].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff15" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe15" onclick="apagaPrende15()">
                                    <label for="Enchufe15"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 4" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 4" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff15" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe15" onclick="apagaPrende15()" checked>
                                    <label for="Enchufe15"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 4" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 4" name="habit" hidden>
                                   <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    Luz Principal
                    <br>
                    <% if (uso[3].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff16" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Luz4" onclick="apagaPrende16()">
                                    <label for="Luz4"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 4" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 4" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff16" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Luz4" onclick="apagaPrende16()" checked>
                                    <label for="Luz4"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 4" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 4" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    </center>
                    <!--</section>-->
            </div>
        </div>
        <%
            } catch (Exception errots) {
                out.print(errots.getMessage());
            }
        %>
    </div>
    <%
                }
                
                /*HABITACIONES 5 Y 6
                ------------------------------------------------------------------------------------------------------------------
                ------------------------------------------------------------------------------------------------------------------*/
    %>
    
    <%
                if (paquete.equals("Platino")){
    %>
    <div id='Habitacion5' class= 'container-fluid noTePeguesArriba' >
        <div class='row'>
            <div class='page-header text-center noTePeguesArriba'>
                <br>
                <strong>Habitacion 3</strong>
            </div>
        </div>
        <div class='row'>
            <%
                datukis.conectar();

                try {
                    ResultSet hab5 = datukis.consulta1("call enchufeState('" + correuki + "','Habitacion 5');");
                    int contador = 0;

                    String[] uso = new String[4];
                    String[] nombres = new String[4];
                    while (hab5.next()) {
                        uso[contador] = hab5.getString("estatus");
                        nombres[contador] = hab5.getString("switchName");
                        contador = contador + 1;
                    }
            %>

            <div class="">
                <div class=" col-md-12 bienvenida text-center">Luces</div>
            </div>
            <div class="">
                <center>
                    <!--<section>-->
                    <!--<div class="form-group">-->
                    <div class="page-header text-center">
                        <h1>Gestión de Luces</h1>
                    </div>
                    Enchufe 1
                    <br>
                    <% if (uso[0].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff17" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe17" onclick="apagaPrende17()">
                                    <label for="Enchufe17"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 5" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 5" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff17" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe17" onclick="apagaPrende17()" checked>
                                    <label for="Enchufe17"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 5" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 5" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    Enchufe 2
                    <br>
                    <% if (uso[1].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff18" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe18" onclick="apagaPrende18()">
                                    <label for="Enchufe18"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 5" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 5" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff18" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe18" onclick="apagaPrende18()" checked>
                                    <label for="Enchufe18"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 5" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 5" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    Enchufe 3
                    <br>
                    <% if (uso[2].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff19" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe19" onclick="apagaPrende19()">
                                    <label for="Enchufe19"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 5" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 5" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff19" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe19" onclick="apagaPrende19()" checked>
                                    <label for="Enchufe19"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 5" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 5" name="habit" hidden>
                                   <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    Luz Principal
                    <br>
                    <% if (uso[3].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff20" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Luz5" onclick="apagaPrende20()">
                                    <label for="Luz5"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 5" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 5" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff20" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Luz5" onclick="apagaPrende20()" checked>
                                    <label for="Luz5"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 5" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 5" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    </center>
                    <!--</section>-->
            </div>
        </div>
        <%
            } catch (Exception errots) {
                out.print(errots.getMessage());
            }
        %>
    </div>
    <div id='Habitacion6' class= 'container-fluid noTePeguesArriba' >
        <div class='row'>
            <div class='page-header text-center noTePeguesArriba'>
                <br>
                <strong>Habitacion 6</strong>
            </div>
        </div>
        <div class='row'>
            <%
                datukis.conectar();

                try {
                    ResultSet hab6 = datukis.consulta1("call enchufeState('" + correuki + "','Habitacion 6');");
                    int contador = 0;

                    String[] uso = new String[4];
                    String[] nombres = new String[4];
                    while (hab6.next()) {
                        uso[contador] = hab6.getString("estatus");
                        nombres[contador] = hab6.getString("switchName");
                        contador = contador + 1;
                    }
            %>

            <div class="">
                <div class=" col-md-12 bienvenida text-center">Luces</div>
            </div>
            <div class="">
                <center>
                    <!--<section>-->
                    <!--<div class="form-group">-->
                    <div class="page-header text-center">
                        <h1>Gestión de Luces</h1>
                    </div>
                    Enchufe 1
                    <br>
                    <% if (uso[0].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff21" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe13" onclick="apagaPrende21()">
                                    <label for="Enchufe21"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 6" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 6" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff21" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe21" onclick="apagaPrende21()" checked>
                                    <label for="Enchufe21"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 6" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="Habitacion 6" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    Enchufe 2
                    <br>
                    <% if (uso[1].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff22" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe22" onclick="apagaPrende22()">
                                    <label for="Enchufe22"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 6" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 6" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff22" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe22" onclick="apagaPrende22()" checked>
                                    <label for="Enchufe22"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 6" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="Habitacion 6" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    Enchufe 3
                    <br>
                    <% if (uso[2].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff23" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe23" onclick="apagaPrende23()">
                                    <label for="Enchufe23"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 6" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 6" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff23" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe15" onclick="apagaPrende23()" checked>
                                    <label for="Enchufe23"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 6" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="Habitacion 6" name="habit" hidden>
                                   <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    Luz Principal
                    <br>
                    <% if (uso[3].equals("0")) {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff24" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Luz6" onclick="apagaPrende24()">
                                    <label for="Luz6"></label>
                                    <input type="text" value="50" name="Voltaje" hidden>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 6" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 6" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <% } else {
                    %>
                    <table style="width:30%">
                        <tr>
                            <td>
                                <form name="OnOff24" action="apagadores.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Luz6" onclick="apagaPrende24()" checked>
                                    <label for="Luz6"></label>
                                    <input type="text" value="0" name="Voltaje" hidden>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 6" name="habit" hidden>
                                </form>
                            </td>
                            <td style="padding-left:30px ; padding-top: 18px">
                                <form class="form-horizontal" action="apagadores.jsp" method="post">
                                    <%
                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    %>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="Habitacion 6" name="habit" hidden>
                                    <input type="submit" class="btn btn-warning" value="Mándalo">
                                </form>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                    <br>
                    </center>
                    <!--</section>-->
            </div>
        </div>
        <%
            } catch (Exception errots) {
                out.print(errots.getMessage());
            }
        %>
    </div>
    <%
                }
    %>
    
</body>
</html>