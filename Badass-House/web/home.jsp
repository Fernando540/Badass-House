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
<link rel="stylesheet" href="Estilos/estiloTabla.css">
<script type="text/javascript">
    function apagaPrende1() {
        document.OnOff1.submit();
    }
    function apagaPrende2() {
        document.OnOff2.submit();
    }
    function apagaPrende3() {
        document.OnOff3.submit();
    }
    function apagaPrende4() {
        document.OnOff4.submit();
    }
    function apagaPrende5() {
        document.OnOff5.submit();
    }
    function apagaPrende6() {
        document.OnOff6.submit();
    }
    function apagaPrende7() {
        document.OnOff7.submit();
    }
    function apagaPrende8() {
        document.OnOff8.submit();
    }
</script>
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
                                ResultSet rs4 = datos.consulta1("call dimePaquete('','" + correin + "');");
                                while (rs4.next()) {
                                    if (rs4.getString("pkte").equals("Basico")) {
                                        out.print("<li><a href='#Habitacion1'>Habitacion 1</a></li>");
                                        out.print("<li><a href='#Habitacion2'>Habitacion 2</a></li>");
                                    } else {
                                        if (rs4.getString("pkte").equals("Pro")) {
                                            out.print("<li><a href='#Habitacion1'>Habitacion 1</a></li>");
                                            out.print("<li><a href='#'>Habitacion 2</a></li>");
                                            out.print("<li><a href='#'>Habitacion 3</a></li>");
                                            out.print("<li><a href='#'>Habitacion 4</a></li>");
                                        } else {
                                            out.print("<li><a href='#Habitacion1'>Habitacion 1</a></li>");
                                            out.print("<li><a href='#'>Habitacion 2</a></li>");
                                            out.print("<li><a href='#'>Habitacion 3</a></li>");
                                            out.print("<li><a href='#'>Habitacion 4</a></li>");
                                            out.print("<li><a href='#'>Habitacion 5</a></li>");
                                            out.print("<li><a href='#'>Habitacion 6</a></li>");
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
        <!--<div class="row-fluid">
            <div class="text-center">
                <br><br><br><br>
                <h4 class="status">Enchufes</h4>
            </div>
            <div class="col-md-3">
                Enchufe 1
                <input type="checkbox" class="sliderEstilos" id="sliderEnchufe1">
                <label for="sliderEnchufe1"></label>
            </div>
            <div class="col-md-3">
                Enchufe 2
                <input type="checkbox" class="sliderEstilos" id="sliderEnchufe2">
                <label for="sliderEnchufe2"></label>
            </div>
            <div class="col-md-3">
                Enchufe 3
                <input type="checkbox" class="sliderEstilos" id="sliderEnchufe3">
                <label for="sliderEnchufe3"></label>
            </div>
            <div class="col-md-3">
                Enchufe 4
                <input type="checkbox" class="sliderEstilos" id="sliderEnchufe4">
                <label for="sliderEnchufe4"></label>
            </div>
        </div>-->
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
            <%
                ResultSet rs6;
                datos.conectar();
                rs6=datos.consulta1("call dimeNoti('"+correin+"');");
                out.println("<center><table><tr><th><h3>Correo</h3></th><th><h3>Accion</h3></th><th><h3>Fecha</h3></th></tr>");
                while(rs6.next()){
                    out.print("<tr><td>"+rs6.getString("correin")+"</td>");
                    out.print("<td>"+rs6.getString("que")+"</td>");
                    out.print("<td>"+rs6.getString("prueba")+"</td>");
                    out.print("</tr>");
                }
                out.print("</center></table>");
            %>
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
                out.print("<script>alert('Alta Exitosa');</script>");
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
                                <form name="OnOff1" action="ApagaPrende.jsp" method="post">
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
                                <form name="OnOff1" action="ApagaPrende.jsp" method="post">
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
                                <form name="OnOff2" action="ApagaPrende.jsp" method="post">
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
                                <form name="OnOff2" action="ApagaPrende.jsp" method="post">
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
                                <form name="OnOff3" action="ApagaPrende.jsp" method="post">
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
                                <form name="OnOff3" action="ApagaPrende.jsp" method="post">
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
                                <form name="OnOff4" action="ApagaPrende.jsp" method="post">
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
                                <form name="OnOff4" action="ApagaPrende.jsp" method="post">
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
                //String correuki = (String) session.getAttribute("sessionMail");

                //cDatos datukis = new cDatos();
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
                                <form name="OnOff5" action="ApagaPrende.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe1" onclick="apagaPrende5()">
                                    <label for="Enchufe1"></label>
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
                                <form name="OnOff5" action="ApagaPrende.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe1" onclick="apagaPrende5()" checked>
                                    <label for="Enchufe1"></label>
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
                                <form name="OnOff6" action="ApagaPrende.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe2" onclick="apagaPrende6()">
                                    <label for="Enchufe2"></label>
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
                                <form name="OnOff6" action="ApagaPrende.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe2" onclick="apagaPrende6()" checked>
                                    <label for="Enchufe2"></label>
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
                                <form name="OnOff7" action="ApagaPrende.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe3" onclick="apagaPrende7()">
                                    <label for="Enchufe3"></label>
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
                                <form name="OnOff7" action="ApagaPrende.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe3" onclick="apagaPrende7()" checked>
                                    <label for="Enchufe3"></label>
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
                                <form name="OnOff8" action="ApagaPrende.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Luz" onclick="apagaPrende8()">
                                    <label for="Luz"></label>
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
                                <form name="OnOff8" action="ApagaPrende.jsp" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Luz" onclick="apagaPrende8()" checked>
                                    <label for="Luz"></label>
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
</body>
</html>