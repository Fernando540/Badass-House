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
        <script src="BS/js/jquery.js"></script>
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
    jQuery(document).ready(function () {
        var d = new Date();
        d = d.getTime();
        if (jQuery('#reloadValue').val().length === 0) {
            jQuery('#reloadValue').val(d);
            jQuery('body').show();
        } else {
            jQuery('#reloadValue').val('');
            location.reload(true);
        }
    });
</script>
<input id="reloadValue" type="hidden" name="reloadValue" value="" />
</head>
<%
    if (session.getAttribute("sessionMail") == null) {
        out.print("<script>alert('La sesion ha expirado');</script>");
        out.print("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://http://badasshouse.net23.net//login.html'>");
    } else {
%>
<body>

    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <center>
                <div class="navbar-header">
                    <b><a class="navbar-brand">Casa de ${sessionScope.sessionName}</a></b>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <%
                            BD.cDatos datos = new BD.cDatos();
                            String correin = (String) session.getAttribute("sessionMail");
                            int volt = 0, ppm = 0;
                            String tipoUsuario = "";
                            String checado;
                            datos.conectar();
                            ResultSet tipoUsr = datos.consulta1("call dimeTipo('" + correin + "');");
                            while (tipoUsr.next()) {
                                tipoUsuario = tipoUsr.getString("privilegio");
                            }
                            ResultSet dimePuertas = datos.consulta1("call dimePuertas('" + correin + "');");
                            String id[] = new String[2];
                            int num = 0;
                            while (dimePuertas.next()) {
                                id[num] = dimePuertas.getString("codigo");
                                num++;
                            }
                            if (tipoUsuario.equals("1")) {
                        %>



                        <li><a href="#status">Status</a></li>
                        <li><a href="#miCuenta">Mi cuenta</a></li>
                        <li><a href="#configuracion">Configuracion</a></li>
                        <li><a href="#cerraduras">Cerraduras</a></li>
                            <%
                            } else {


                            %>

                        <!--<li><a href="#status">Status</a></li>-->
                        <li><a href="#miCuenta">Mi cuenta</a></li>
                        <li><a href="#configuracion">Configuracion</a></li>
                        <!--<li><a href="#cerraduras">Cerraduras</a></li>-->
                        <%                         }
                        %>    
                        <%
                            datos.conectar();
                            ResultSet rs3;
                            rs3 = datos.consulta1("call dimePaquete('','" + correin + "');");
                            while (rs3.next()) {
                                if (rs3.getString("pkte").equals("BasicoNKA") || rs3.getString("pkte").equals("ProNKA") || rs3.getString("pkte").equals("PlatinoNKA")) {
                                    if (tipoUsuario.equals("1")) {
                                        out.print("<li><a href='#NoKids'>Niños no</a></li>");
                                    }

                                }
                            }

                            String paquete = "";
                            ResultSet paqueton = datos.consulta1("call dimePaquete('','" + correin + "');");
                            while (paqueton.next()) {
                                paquete = paqueton.getString("pkte");
                            }

                            ResultSet habiNames = datos.consulta1("call habiNames('" + correin + "');");
                            int itera = 0;
                            String[] habNames = new String[6];
                            while (habiNames.next()) {
                                habNames[itera] = habiNames.getString("habiName");
                                itera = itera + 1;
                            }

                            String[] habPermitidas = new String[6];
                            int cuenta = 0;
                            if (tipoUsuario.equals("2")) {
                                ResultSet roomsJR = datos.consulta1("call dimePermiso('" + correin + "');");
                                while (roomsJR.next()) {
                                    habPermitidas[cuenta] = roomsJR.getString("roomName");
                                    cuenta = cuenta + 1;
                                }
                            }

                            if (paquete.equals("Basico") || paquete.equals("BasicoNKA")) {
                                if (tipoUsuario.equals("1")) {
                                    out.print("<li class='dropdown'>");
                                    out.print("<a class='dropdown-toggle' data-toggle='dropdown' href='#'>Habitaciones<span class='caret'></span></a>");
                                    out.print("<ul class='dropdown-menu'>");
                                    out.print("<li><a href='#Habitacion1'>" + habNames[0] + "</a></li>");
                                    out.print("<li><a href='#Habitacion2'>" + habNames[1] + "</a></li>");
                                    out.print("</ul>");
                                } else {
                                    out.print("<li class='dropdown'>");
                                    out.print("<a class='dropdown-toggle' data-toggle='dropdown' href='#'>Habitaciones<span class='caret'></span></a>");
                                    out.print("<ul class='dropdown-menu'>");

                                    for (cuenta = 0; cuenta < habPermitidas.length; cuenta++) {
                                        if (habPermitidas[cuenta] != null) {
                                            for (int n = 0; n < habNames.length; n++) {
                                                if (habPermitidas[cuenta].equals(habNames[n])) {
                                                    out.print("<li><a href='#Habitacion" + String.valueOf(n + 1) + "'>" + habPermitidas[cuenta] + "</a></li>");
                                                }
                                            }

                                        }
                                    }
                                    out.print("</ul>");
                                }
                            } else if (paquete.equals("Pro") || paquete.equals("ProNKA")) {
                                if (tipoUsuario.equals("1")) {
                                    out.print("<li class='dropdown'>");
                                    out.print("<a class='dropdown-toggle' data-toggle='dropdown' href='#'>Habitaciones<span class='caret'></span></a>");
                                    out.print("<ul class='dropdown-menu'>");
                                    out.print("<li><a href='#Habitacion1'>" + habNames[0] + "</a></li>");
                                    out.print("<li><a href='#Habitacion2'>" + habNames[1] + "</a></li>");
                                    out.print("<li><a href='#Habitacion3'>" + habNames[2] + "</a></li>");
                                    out.print("<li><a href='#Habitacion4'>" + habNames[3] + "</a></li>");
                                    out.print("</ul>");
                                } else {
                                    out.print("<li class='dropdown'>");
                                    out.print("<a class='dropdown-toggle' data-toggle='dropdown' href='#'>Habitaciones<span class='caret'></span></a>");
                                    out.print("<ul class='dropdown-menu'>");

                                    for (cuenta = 0; cuenta < habPermitidas.length; cuenta++) {
                                        if (habPermitidas[cuenta] != null) {
                                            for (int n = 0; n < habNames.length; n++) {
                                                if (habPermitidas[cuenta].equals(habNames[n])) {
                                                    out.print("<li><a href='#Habitacion" + String.valueOf(n + 1) + "'>" + habPermitidas[cuenta] + "</a></li>");
                                                }
                                            }

                                        }
                                    }
                                    out.print("</ul>");
                                }

                            } else if (tipoUsuario.equals("1")) {
                                out.print("<li class='dropdown'>");
                                out.print("<a class='dropdown-toggle' data-toggle='dropdown' href='#'>Habitaciones <span class='caret'></span></a>");
                                out.print("<ul class='dropdown-menu'>");
                                out.print("<li><a href='#Habitacion1'>" + habNames[0] + "</a></li>");
                                out.print("<li><a href='#Habitacion2'>" + habNames[1] + "</a></li>");
                                out.print("<li><a href='#Habitacion3'>" + habNames[2] + "</a></li>");
                                out.print("<li><a href='#Habitacion4'>" + habNames[3] + "</a></li>");
                                out.print("<li><a href='#Habitacion5'>" + habNames[4] + "</a></li>");
                                out.print("<li><a href='#Habitacion6'>" + habNames[5] + "</a></li>");
                                out.print("</ul>");
                            } else {
                                out.print("<li class='dropdown'>");
                                out.print("<a class='dropdown-toggle' data-toggle='dropdown' href='#'>Habitaciones<span class='caret'></span></a>");
                                out.print("<ul class='dropdown-menu'>");

                                for (cuenta = 0; cuenta < habPermitidas.length; cuenta++) {
                                    if (habPermitidas[cuenta] != null) {
                                        for (int n = 0; n < habNames.length; n++) {
                                            if (habPermitidas[cuenta].equals(habNames[n])) {
                                                out.print("<li><a href='#Habitacion" + String.valueOf(n + 1) + "'>" + habPermitidas[cuenta] + "</a></li>");
                                            }
                                        }

                                    }
                                }
                                out.print("</ul>");
                            }

                        %>
                        <%                            if (tipoUsuario.equals("1")) {


                        %>
                        <li>
                            <form class="navbar-form navbar-left" method="post" action="mandaDespensa" >
                                <input type="submit" class="btn btn-warning" value="Despensa">
                            </form>
                        </li>
                        <%                            }%>
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
    <!--Div Status-->
    <%
        if (tipoUsuario.equals("1")) {
    %>
    <div id="status" class="container-fluid noTePeguesArriba">
        <div class="row">
            <div class="page-header text-center noTePeguesArriba">
                <br><br><br>
                <strong>Status</strong>
            </div>
        </div>
        <div class="row-fluid">
            <%
                BD.cDatos datoss = new BD.cDatos();
                datoss.conectar();
                try {
                    ResultSet c = datos.consulta1("call statusGas('" + correin + "');");
                    int cont = 0;

                    String[] us = new String[2];
                    String[] name = new String[2];
                    while (c.next()) {
                        us[cont] = c.getString("estatus");
                        name[cont] = c.getString("llaveNombre");
                        cont = cont + 1;
                    }


            %>
            <div class="text-center">
                <br>
                <h3 class="status">Llaves de gas</h3>
            </div>
            <div class="col-md-3">
                <form name="Gas1" action="llavesGas" method="post">
                    Llave 1 
                    <% if (us[0].equals("0")) {
                            ppm = 900;
                            checado = "";
                        } else {
                            checado = "checked";
                            ppm = 0;
                        }
                    %>
                    <input type="checkbox" class="sliderEstilos" id="sliderLlave1" onclick="sendStat1()" <%=checado%>>
                    <label for="sliderLlave1"></label>
                    <input type="text" name="ppm1" value="<%= ppm%>" hidden>
                    <input type="text" name="key1" value="Llave principal" hidden>
                </form>
            </div>
            <%
                int ppm1 = 0;
                String checado1 = "";
                if (us[1].equals("0")) {
                    ppm1 = 900;
                    checado1 = "";
                } else {
                    ppm1 = 0;
                    checado1 = "checked";
                }
            %>
            <div class="col-md-3">
                <form name="Gas3" action="llavesGas" method="post">
                    Llave 2
                    <input type="checkbox" class="sliderEstilos" id="sliderLlave2" onclick="sendStat3()" <%=checado1%> >
                    <label for="sliderLlave2"></label>
                    <input type="text" name="ppm1" value="<%=ppm1%>" hidden>
                    <input type="text" name="key1" value="Llave2" hidden>
                </form>

            </div>
            <%
                } catch (Exception es) {

                }

            %>
        </div>
        <div class="row-fluid">
            <div class="text-center">
                <br><br><br><br>
                <h3 class="status">Activar Notificaciones</h3>
            </div>
            <%                ResultSet estadote;
                estadote = datos.consulta1("call dimeEstado('" + correin + "','Despensa');");
                String estado;
                while (estadote.next()) {
                    if (estadote.getString("estaduki").equals("activado")) {
                        estado = "checked";
                    } else {
                        estado = "";
                    }

            %>
            <div class="col-md-3">
                <form name="activaDespensuki" action="activaDespensa.jsp" method="post">
                    Despensa
                    <input type="checkbox" class="sliderEstilos"  id="despi" onclick="activa()" <%=estado%>>
                    <label for="despi"></label>
                    <input type="text" value="Despensa" name="tipoNoti" hidden>
                    <input type="submit" value="aceptar" name="tipoNoti" hidden>
                </form>
            </div>
            <%
                }
            %>
            <%
                ResultSet estadote1;
                estadote1 = datos.consulta1("call dimeEstado('" + correin + "','ForceClose');");
                String estado1 = "";
                while (estadote1.next()) {
                    if (estadote1.getString("estaduki").equals("activado")) {
                        estado1 = "checked";
                    }

            %>
            <div class="col-md-3">
                <form name="" action="" method="post">
                    ForceClose
                    <input type="checkbox" class="sliderEstilos"  id="close" <%=estado1%>>
                    <label for="close"></label>
                    <input type="text" value="Despensa" name="tipoNoti" hidden>
                    <input type="submit" value="aceptar" name="tipoNoti" hidden>
                </form>
            </div>
            <%

                }
            %>
        </div>
    </div>
    <%
        }
    %>
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

            try {

                rs = datos.consulta1("select nombre,aPaterno,aMaterno from usuarios where correo = '" + log + "';");

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
            <form class="form-horizontal" action="JSPConfig" method="post"><!-- Aquí van las funciones del form-->
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
                <input type="hidden" name="uX" value="<%=log%>">
            </form>
        </div>
        <%
            if (tipoUsuario.equals("1")) {
        %>
        <div class="row">
            <div class="text-center">
                <h4 class="cuenta">Agregar cuenta</h4>
            </div>            
        </div>
        <div class="row">
            <form class="form-horizontal" action="JSPAltaCuenta" method="post"><!-- Aquí van las funciones del form--> 
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
        <div class="row">
            <div class="text-center">
                <h4 class="cuenta">Cuentas de la Casa</h4>
            </div>            
        </div>
        <div class="row">
            <%
                ResultSet idCasa;
                String idCas = "";
                idCasa = datos.consulta1("select idCasa from relUsrCasa where correo='" + correin + "';");

                while (idCasa.next()) {
                    idCas = idCasa.getString("idCasa");
                }
                ResultSet users;
                users = datos.consulta1("select correo from relUsrCasa where idCasa='" + idCas + "';");

                out.print(
                        "<center><table><th>Correo</th><th>Tipo Usuario</th><th>Privilegios</th><th>Permisos Activos</th>");
                while (users.next()) {
                    String correok = users.getString("correo");
                    ResultSet tipo = datos.consulta1("call dimeTipo('" + correok + "');");

                    while (tipo.next()) {

                        if (tipo.getString("privilegio").equals("2")) {
                            out.print("<tr><td>" + correok + "</td><td>Junior</td>");

                            rs3 = datos.consulta1("call dimePaquete('','" + correin + "');");
                            int cantidad = 0;
                            while (rs3.next()) {
                                if (rs3.getString("pkte").equals("Basico") || rs3.getString("pkte").equals("BasicoNKA")) {
                                    cantidad = 2;
                                } else if (rs3.getString("pkte").equals("Pro") || rs3.getString("pkte").equals("ProNKA")) {
                                    cantidad = 4;
                                } else {
                                    cantidad = 6;
                                }
                            }

                            out.print("<td> <form action='daPrivi' method='post'>"
                                    + "<select name='idHabitacion'>");
                            for (int v = 0; v < cantidad; v++) {
                                out.print("<option>" + habNames[v] + "</option>");
                            }

                            out.print("</select><br>SI<input type='radio' name='permiso' value='SI'>&nbsp;NO<input type='radio' name='permiso' value='NO' checked>"
                                    + "<input type='text' name='correo' value='" + correok + "' hidden><input type='submit' value='Aceptar'>"
                                    + "</form></td>");
                            ResultSet roomsJR1 = datos.consulta1("call dimePermiso('" + correok + "');");
                            int cuenta1 = 0;
                            String habAllowed[] = new String[6];
                            while (roomsJR1.next()) {
                                habAllowed[cuenta1] = roomsJR1.getString("roomName");
                                cuenta1 = cuenta1 + 1;
                            }
                            out.print("<td><select name='Permisos'>");
                            for (int v = 0; v < 6; v++) {
                                if (habAllowed[v] != null) {
                                    out.print("<option>" + habAllowed[v] + "</option>");
                                }

                            }

                            out.print("</select></td></tr>");
                        } else {
                            out.print("<tr><td>" + correok + "</td><td>Premium</td><td>Todos</td><td>Todos</td></tr>");
                        }

                    }
                }

                out.print(
                        "</center></table>");

            %>
        </div>
    </div>
    <%        }  %>
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
            <%                ResultSet rs6;

                datos.conectar();
                rs6 = datos.consulta1("call dimeNoti('" + correin + "','Despensa',1);");

                out.println(
                        "<center><table><tr><th><h3>Correo</h3></th><th><h3>Accion</h3></th><th><h3>Fecha</h3></th></tr>");
                while (rs6.next()) {
                    out.print("<tr><td>" + rs6.getString("correin") + "</td>");
                    out.print("<td>" + rs6.getString("que") + "</td>");
                    out.print("<td>" + rs6.getString("prueba") + "</td>");
                    out.print("</tr>");
                }
                rs6 = datos.consulta1("call dimeNoti('" + correin + "','ForceClose',2);");

                while (rs6.next()) {
                    out.print("<tr><td>" + rs6.getString("correin") + "</td>");
                    out.print("<td>" + rs6.getString("que") + "</td>");
                    out.print("<td>" + rs6.getString("prueba") + "</td>");
                    out.print("</tr>");
                }

                out.print(
                        "</center></table>");
            %>
        </div>
    </div>
    <!--Div COnfiguración-->

    <%
        if (tipoUsuario.equals("1")) {
    %>
    <!--Div Cerradura-->
    <div id="cerraduras" class="container-fluid noTePeguesArriba" >
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
                Puerta Frente
                <%
                    ResultSet abierto = datos.consulta1("call dimeAbierto('" + correin + "','" + id[0] + "');");
                    String estado = "";
                    String abertura = "";
                    while (abierto.next()) {
                        estado = abierto.getString("state");
                    }
                    if (estado.equals("Abierta")) {
                        abertura = "checked";
                    }
                %>
                <form name="frontdoor" action="opCl" method="post">
                    <input type="checkbox" class="sliderEstilos" id="sliderCerradura1" onclick="cierra()"  <%=abertura%>>
                    <label for="sliderCerradura1"></label>
                    <input type="text" name="idPuerta" value="<%=id[0]%>" hidden>

                </form>
            </div>
            <div class="col-md-3">
                Puerta Atras
                <%
                    abierto = datos.consulta1("call dimeAbierto('" + correin + "','" + id[1] + "');");
                    String abertura1 = "";
                    while (abierto.next()) {
                        estado = abierto.getString("state");
                    }
                    if (estado.equals("Abierta")) {
                        abertura = "checked";
                    }
                %>
                <form name="backdoor" action="opCl" method="post">
                    <input type="checkbox" class="sliderEstilos" id="sliderCerradura2" onclick="cierra1()" <%=abertura1%>>
                    <label for="sliderCerradura2"></label>
                    <input type="text" name="idPuerta" value="<%=id[1]%>" hidden>
                </form>              
            </div>
        </div>
    </div>
    <!--Div Cerradura-->
    <!--Niños no-->
    <%
        rs3 = datos.consulta1("call dimePaquete('','" + correin + "');");

        while (rs3.next()) {
            if (rs3.getString("pkte").equals("BasicoNKA") || rs3.getString("pkte").equals("ProNKA") || rs3.getString("pkte").equals("PlatinoNKA")) {

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
                    <%String altuki = "", altot = "", correo = (String) session.getAttribute("sessionMail");
                        ResultSet rs2;

                        rs2 = datos.consulta1("call dimeAltura('" + correin + "')");
                        while (rs2.next()) {
                            if (rs2.getString("alto") != null && rs2.getString("bajo") != null) {
                                altuki = rs2.getString("alto");
                                altot = rs2.getString("bajo");
                            }

                        }

                    %>
                    <input type='text' name='alturaMax' size='3' value='<%=altuki%>' required>

                    <br/>
                    Altura del Sensor de Piso (centímetros)<!--<input id='Alturamin' type='range' min='0' max='2' step='0.1' />-->

                    <br/><br/>
                    <input type='text' size='3' name='alturaMin' value='<%=altot%>' required>
                    <br/>
                    Altura del Sensor mínima<!--<input id='Alturamin' type='range' min='0' max='2' step='0.1' />-->
                    <br/>
                    <button type='submit' name='Aceptar' class ='btn btn-success'>Confirmar</button>
                </form>
            </div>
        </div>
    </div>
    <%
                }

            }
        }
        /*                      HABITACIONES 1 Y 2
         ----------------------------------------------------------------
         ----------------------------------------------------------------
         */
        int coincidencia;
        coincidencia = 0;

        for (int iterator = 0; iterator < habPermitidas.length; iterator++) {
            if (habPermitidas[iterator] != null) {
                if (habPermitidas[iterator].equals(habNames[0])) {
                    coincidencia = 1;
                }
            }

        }

        if (tipoUsuario.equals("1") || coincidencia == 1) {
    %>
    <div id='Habitacion1' class= 'container-fluid noTePeguesArriba' >
        <div class='row'>
            <div class='page-header text-center noTePeguesArriba'>
                <br>
                <div id="HabName1">
                    <strong><%out.println(habNames[0]);%></strong><br>
                    <button type='button' class='btn btn-success' onclick="javascript:showMod1();"><i class='glyphicon glyphicon-pencil'></i></button>
                </div>
                <div id="modForm1" style="display:none; width: 20%; margin-left: 40%;">
                    <form name="Names1" action="changeHabName">
                        <input type="text" name="oldRoomName" value="<%out.println(habNames[0]);%>" hidden>
                        <input type="text" class='form-control' name="newRoomName" value="<%out.println(habNames[0]);%>">
                        <button type='submit' class='btn btn-success'><i class='glyphicon glyphicon-ok'></i></button>
                        <button type='button' class='btn btn-danger' onclick="javascript:hideMod1();"><i class='glyphicon glyphicon-remove'></i></button>
                    </form>
                </div>
            </div>
        </div>
        <div class='row'>
            <%
                //String correuki = (String) session.getAttribute("sessionMail");

                //cDatos datukis = new cDatos();
                datos.conectar();

                try {
                    ResultSet rs5 = datos.consulta1("call enchufeState('" + correin + "','" + habNames[0] + "');");
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
                    <%
                        String tipo = "";
                        if (uso[0].equals("0")) {
                            volt = 50;

                        } else {
                            volt = 0;
                            tipo = "checked";
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff1" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe1" onclick="apagaPrende1()" <%=tipo%>>
                                    <label for="Enchufe1"></label>
                                    <input type="text" value="<%=volt%>" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[0]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                    Enchufe 2
                    <br>
                    <%
                        String tipo1 = "checked";
                        int volt1 = 0;
                        if (uso[1].equals("0")) {
                            tipo1 = "";
                            volt = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff2" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe2" onclick="apagaPrende2()" <%=tipo1%>>
                                    <label for="Enchufe2"></label>
                                    <input type="text" value="<%=volt1%>" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[0]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                    Enchufe 3
                    <br>
                    <%
                        String tipo2 = "checked";
                        int volt2 = 0;
                        if (uso[2].equals("0")) {
                            volt2 = 50;
                            tipo2 = "";
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff3" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe3" onclick="apagaPrende3()" <%=tipo2%>>
                                    <label for="Enchufe3"></label>
                                    <input type="text" value="<%=volt2%>" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[0]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                    Luz Principal
                    <br>
                    <%
                        String tipo3 = "checked";
                        int volt3 = 0;
                        if (uso[3].equals("0")) {
                            tipo3 = "";
                            volt3 = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff4" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Luz" onclick="apagaPrende4()" <%=tipo3%>>
                                    <label for="Luz"></label>
                                    <input type="text" value="<%=volt3%>" name="Voltaje" hidden>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[0]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                </center>
                <!--</section>-->
            </div>
        </div>
        <%
                } catch (Exception errots) {
                    out.print(errots.getMessage());
                }
            }
            int coincidencia1 = 0;

            for (int iterator = 0; iterator < habPermitidas.length; iterator++) {
                if (habPermitidas[iterator] != null) {
                    if (habPermitidas[iterator].equals(habNames[1])) {
                        coincidencia1 = 1;
                    }
                }

            }

            if (tipoUsuario.equals("1") || coincidencia1 == 1) {
        %>
    </div>
    <div id='Habitacion2' class= 'container-fluid noTePeguesArriba' >
        <div class='row'>
            <div class='page-header text-center noTePeguesArriba'>
                <br>
                <div id="HabName2">
                    <strong><%out.println(habNames[1]);%></strong><br>
                    <button type='button' class='btn btn-success' onclick="javascript:showMod2();"><i class='glyphicon glyphicon-pencil'></i></button>
                </div>
                <div id="modForm2" style="display:none; width: 20%; margin-left: 40%;">
                    <form name="Names2" action="changeHabName">
                        <input type="text" name="oldRoomName" value="<%out.println(habNames[1]);%>" hidden>
                        <input type="text" class='form-control' name="newRoomName" value="<%out.println(habNames[1]);%>">
                        <button type='submit' class='btn btn-success'><i class='glyphicon glyphicon-ok'></i></button>
                        <button type='button' class='btn btn-danger' onclick="javascript:hideMod2();"><i class='glyphicon glyphicon-remove'></i></button>
                    </form>
                </div>
            </div>
        </div>
        <div class='row'>
            <%
                datos.conectar();

                try {
                    ResultSet rs5 = datos.consulta1("call enchufeState('" + correin + "','" + habNames[1] + "');");
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
                    <%
                        String tipo1 = "checked";
                        int volt1 = 0;
                        if (uso[0].equals("0")) {
                            tipo1 = "";
                            volt1 = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff5" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe5" onclick="apagaPrende5()" <%=tipo1%>>
                                    <label for="Enchufe5"></label>
                                    <input type="text" value="<%=volt1%>" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[1]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                    Enchufe 2
                    <br>
                    <%
                        String tipo2 = "checked";
                        int volt2 = 0;
                        if (uso[1].equals("0")) {
                            tipo2 = "";
                            volt2 = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff6" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe6" onclick="apagaPrende6()" <%=tipo2%>>
                                    <label for="Enchufe6"></label>
                                    <input type="text" value="<%=volt2%>" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[1]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                    Enchufe 3
                    <br>
                    <%
                        String tipo3 = "checked";
                        int volt3 = 0;
                        if (uso[2].equals("0")) {
                            tipo3 = "";
                            volt3 = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff7" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe7" onclick="apagaPrende7()" <%=tipo3%>>
                                    <label for="Enchufe7"></label>
                                    <input type="text" value="<%=volt3%>" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[1]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                    Luz Principal
                    <br>
                    <%
                        String tipo4 = "checked";
                        int volt4 = 0;
                        if (uso[3].equals("0")) {
                            tipo4 = "";
                            volt4 = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff8" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Luz2" onclick="apagaPrende8()" <%=tipo4%>>
                                    <label for="Luz2"></label>
                                    <input type="text" value="<%=volt4%>" name="Voltaje" hidden>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[1]);%>" name="habit" hidden>
                                </form>
                            </td>

                        </tr>
                    </table>
                    <br>
                </center>
                <!--</section>-->
            </div>
        </div>
        <%
                } catch (Exception errots) {
                    out.print(errots.getMessage());
                }
            }

        %>
    </div>
    <%        /*                      HABITACIONES 3 Y 4
         ----------------------------------------------------------------
         ----------------------------------------------------------------
         */
        if (paquete.equals("Pro") || paquete.equals("Platino") || paquete.equals("ProNKA") || paquete.equals("PlatinoNKA")) {
            coincidencia = 0;

            for (int iterator = 0; iterator < habPermitidas.length; iterator++) {
                if (habPermitidas[iterator] != null) {
                    if (habPermitidas[iterator].equals(habNames[2])) {
                        coincidencia = 1;
                    }
                }

            }

            if (tipoUsuario.equals("1") || coincidencia == 1) {
    %>
    <div id='Habitacion3' class= 'container-fluid noTePeguesArriba' >
        <div class='row'>
            <div class='page-header text-center noTePeguesArriba'>
                <br>
                <div id="HabName3">
                    <strong><%out.println(habNames[2]);%></strong><br>
                    <button type='button' class='btn btn-success' onclick="javascript:showMod3();"><i class='glyphicon glyphicon-pencil'></i></button>
                </div>
                <div id="modForm3" style="display:none; width: 20%; margin-left: 40%;">
                    <form name="Names3" action="changeHabName">
                        <input type="text" name="oldRoomName" value="<%out.println(habNames[2]);%>" hidden>
                        <input type="text" class='form-control' name="newRoomName" value="<%out.println(habNames[2]);%>">
                        <button type='submit' class='btn btn-success'><i class='glyphicon glyphicon-ok'></i></button>
                        <button type='button' class='btn btn-danger' onclick="javascript:hideMod3();"><i class='glyphicon glyphicon-remove'></i></button>
                    </form>
                </div>
            </div>
        </div>
        <div class='row'>
            <%
                datos.conectar();

                try {
                    ResultSet hab3 = datos.consulta1("call enchufeState('" + correin + "','" + habNames[2] + "');");
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
                    <%
                        String tipo1 = "checked";
                        int volt1 = 0;
                        if (uso[0].equals("0")) {
                            tipo1 = "";
                            volt1 = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff9" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe9" onclick="apagaPrende9()" <%=tipo1%>>
                                    <label for="Enchufe9"></label>
                                    <input type="text" value="<%=volt1%>" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[2]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                    Enchufe 2
                    <br>
                    <%
                        String tipo2 = "checked";
                        int volt2 = 0;
                        if (uso[1].equals("0")) {
                            tipo2 = "";
                            volt2 = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff10" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe10" onclick="apagaPrende10()" <%=tipo2%>>
                                    <label for="Enchufe10"></label>
                                    <input type="text" value="<%=volt2%>" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[2]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                    Enchufe 3
                    <br>
                    <%
                        String tipo3 = "checked";
                        int volt3 = 0;
                        if (uso[2].equals("0")) {
                            tipo3 = "";
                            volt3 = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff11" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe11" onclick="apagaPrende11()" <%=tipo3%>>
                                    <label for="Enchufe11"></label>
                                    <input type="text" value="<%=volt3%>" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[2]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                    Luz Principal
                    <br>
                    <%
                        String tipo4 = "checked";
                        int volt4 = 0;
                        if (uso[3].equals("0")) {
                            tipo4 = "";
                            volt4 = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff12" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Luz3" onclick="apagaPrende12()" <%=tipo4%>>
                                    <label for="Luz3"></label>
                                    <input type="text" value="<%=volt4%>" name="Voltaje" hidden>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[2]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                </center>
                <!--</section>-->
            </div>
        </div>
        <%
                } catch (Exception errots) {
                    out.print(errots.getMessage());
                }
            }
            coincidencia = 0;

            for (int iterator = 0; iterator < habPermitidas.length; iterator++) {
                if (habPermitidas[iterator] != null) {
                    if (habPermitidas[iterator].equals(habNames[3])) {
                        coincidencia = 1;
                    }
                }

            }

            if (tipoUsuario.equals("1") || coincidencia == 1) {
        %>
    </div>
    <div id='Habitacion4' class= 'container-fluid noTePeguesArriba' >
        <div class='row'>
            <div class='page-header text-center noTePeguesArriba'>
                <br>
                <div id="HabName4">
                    <strong><%out.println(habNames[3]);%></strong><br>
                    <button type='button' class='btn btn-success' onclick="javascript:showMod4();"><i class='glyphicon glyphicon-pencil'></i></button>
                </div>
                <div id="modForm4" style="display:none; width: 20%; margin-left: 40%;">
                    <form name="Names4" action="changeHabName">
                        <input type="text" name="oldRoomName" value="<%out.println(habNames[3]);%>" hidden>
                        <input type="text" class='form-control' name="newRoomName" value="<%out.println(habNames[3]);%>">
                        <button type='submit' class='btn btn-success'><i class='glyphicon glyphicon-ok'></i></button>
                        <button type='button' class='btn btn-danger' onclick="javascript:hideMod4();"><i class='glyphicon glyphicon-remove'></i></button>
                    </form>
                </div>
            </div>
        </div>
        <div class='row'>
            <%
                datos.conectar();

                try {
                    ResultSet hab4 = datos.consulta1("call enchufeState('" + correin + "','" + habNames[3] + "');");
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
                    <%
                        String tipo1 = "checked";
                        int volt1 = 0;
                        if (uso[0].equals("0")) {
                            tipo1 = "";
                            volt1 = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff13" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe13" onclick="apagaPrende13()" <%=tipo1%>>
                                    <label for="Enchufe13"></label>
                                    <input type="text" value="<%=volt1%>" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[3]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                    Enchufe 2
                    <br>
                    <%
                        String tipo2 = "checked";
                        int volt2 = 0;
                        if (uso[1].equals("0")) {
                            tipo2 = "";
                            volt2 = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff14" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe14" onclick="apagaPrende14()" <%=tipo2%>>
                                    <label for="Enchufe14"></label>
                                    <input type="text" value="<%=volt2%>" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[3]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                    Enchufe 3
                    <br>
                    <%
                        String tipo3 = "checked";
                        int volt3 = 0;
                        if (uso[2].equals("0")) {
                            tipo3 = "";
                            volt3 = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff15" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe15" onclick="apagaPrende15()" <%=tipo3%>>
                                    <label for="Enchufe15"></label>
                                    <input type="text" value="<%=volt3%>" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[3]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                    Luz Principal
                    <br>
                    <%
                        String tipo4 = "checked";
                        int volt4 = 0;
                        if (uso[3].equals("0")) {
                            tipo4 = "";
                            volt4 = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff16" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Luz4" onclick="apagaPrende16()" <%=tipo4%>>
                                    <label for="Luz4"></label>
                                    <input type="text" value="<%=volt4%>" name="Voltaje" hidden>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[3]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                </center>
                <!--</section>-->
            </div>
        </div>
        <%
                } catch (Exception errots) {
                    out.print(errots.getMessage());
                }
            }
        %>
    </div>
    <%
        }

        /*HABITACIONES 5 Y 6
         ------------------------------------------------------------------------------------------------------------------
         ------------------------------------------------------------------------------------------------------------------*/
    %>

    <%        if (paquete.equals("Platino") || paquete.equals("PlatinoNKA")) {
            coincidencia = 0;

            for (int iterator = 0; iterator < habPermitidas.length; iterator++) {
                if (habPermitidas[iterator] != null) {
                    if (habPermitidas[iterator].equals(habNames[4])) {
                        coincidencia = 1;
                    }
                }

            }

            if (tipoUsuario.equals("1") || coincidencia == 1) {
    %>
    <div id='Habitacion5' class= 'container-fluid noTePeguesArriba' >
        <div class='row'>
            <div class='page-header text-center noTePeguesArriba'>
                <br>
                <div id="HabName5">
                    <strong><%out.println(habNames[4]);%></strong><br>
                    <button type='button' class='btn btn-success' onclick="javascript:showMod5();"><i class='glyphicon glyphicon-pencil'></i></button>
                </div>
                <div id="modForm5" style="display:none; width: 20%; margin-left: 40%;">
                    <form name="Names5" action="changeHabName">
                        <input type="text" name="oldRoomName" value="<%out.println(habNames[4]);%>" hidden>
                        <input type="text" class='form-control' name="newRoomName" value="<%out.println(habNames[4]);%>">
                        <button type='submit' class='btn btn-success'><i class='glyphicon glyphicon-ok'></i></button>
                        <button type='button' class='btn btn-danger' onclick="javascript:hideMod5();"><i class='glyphicon glyphicon-remove'></i></button>
                    </form>
                </div>
            </div>
        </div>
        <div class='row'>
            <%
                datos.conectar();

                try {
                    ResultSet hab5 = datos.consulta1("call enchufeState('" + correin + "','" + habNames[4] + "');");
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
                    <%
                        String tipo1 = "checked";
                        int volt1 = 0;
                        if (uso[0].equals("0")) {
                            tipo1 = "";
                            volt1 = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff17" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe17" onclick="apagaPrende17()" <%=tipo1%>>
                                    <label for="Enchufe17"></label>
                                    <input type="text" value="<%=volt1%>" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[4]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                    Enchufe 2
                    <br>
                    <%
                        String tipo2 = "checked";
                        int volt2 = 0;
                        if (uso[1].equals("0")) {
                            tipo2 = "";
                            volt2 = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff18" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe18" onclick="apagaPrende18()" <%=tipo2%>>
                                    <label for="Enchufe18"></label>
                                    <input type="text" value="<%=volt2%>" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[4]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                    Enchufe 3
                    <br>
                    <%
                        String tipo3 = "checked";
                        int volt3 = 0;
                        if (uso[2].equals("0")) {
                            tipo3 = "";
                            volt3 = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff19" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe19" onclick="apagaPrende19()" <%=tipo3%>>
                                    <label for="Enchufe19"></label>
                                    <input type="text" value="<%=volt3%>" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[4]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                    Luz Principal
                    <br>
                    <%
                        String tipo4 = "checked";
                        int volt4 = 0;
                        if (uso[3].equals("0")) {
                            tipo4 = "";
                            volt4 = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff20" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Luz5" onclick="apagaPrende20()" <%=tipo4%>>
                                    <label for="Luz5"></label>
                                    <input type="text" value="<%=volt4%>" name="Voltaje" hidden>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[4]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                </center>
                <!--</section>-->
            </div>
        </div>
        <%
                } catch (Exception errots) {
                    out.print(errots.getMessage());
                }
            }
            coincidencia = 0;

            for (int iterator = 0; iterator < habPermitidas.length; iterator++) {
                if (habPermitidas[iterator] != null) {
                    if (habPermitidas[iterator].equals(habNames[5])) {
                        coincidencia = 1;
                    }
                }

            }

            if (tipoUsuario.equals("1") || coincidencia == 1) {
        %>
    </div>
    <div id='Habitacion6' class= 'container-fluid noTePeguesArriba' >
        <div class='row'>
            <div class='page-header text-center noTePeguesArriba'>
                <br>
                <div id="HabName6">
                    <strong><%out.println(habNames[5]);%></strong><br>
                    <button type='button' class='btn btn-success' onclick="javascript:showMod6();"><i class='glyphicon glyphicon-pencil'></i></button>
                </div>
                <div id="modForm6" style="display:none; width: 20%; margin-left: 40%;">
                    <form name="Names6" action="changeHabName">
                        <input type="text" name="oldRoomName" value="<%out.println(habNames[5]);%>" hidden>
                        <input type="text" class='form-control' name="newRoomName" value="<%out.println(habNames[5]);%>">
                        <button type='submit' class='btn btn-success'><i class='glyphicon glyphicon-ok'></i></button>
                        <button type='button' class='btn btn-danger' onclick="javascript:hideMod6();"><i class='glyphicon glyphicon-remove'></i></button>
                    </form>
                </div>
            </div>
        </div>
        <div class='row'>
            <%
                datos.conectar();

                try {
                    ResultSet hab6 = datos.consulta1("call enchufeState('" + correin + "','" + habNames[5] + "');");
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
                    <%
                        String tipo1 = "checked";
                        int volt1 = 0;
                        if (uso[0].equals("0")) {
                            tipo1 = "";
                            volt1 = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff21" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe21" onclick="apagaPrende21()" <%=tipo1%>>
                                    <label for="Enchufe21"></label>
                                    <input type="text" value="<%=volt1%>" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe1" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[5]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                    Enchufe 2
                    <br>
                    <%
                        String tipo2 = "checked";
                        int volt2 = 0;
                        if (uso[1].equals("0")) {
                            tipo2 = "";
                            volt2 = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff22" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe22" onclick="apagaPrende22()" <%=tipo2%>>
                                    <label for="Enchufe22"></label>
                                    <input type="text" value="<%=volt2%>" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe2" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[5]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                    Enchufe 3
                    <br>
                    <%
                        String tipo3 = "checked";
                        int volt3 = 0;
                        if (uso[2].equals("0")) {
                            tipo3 = "";
                            volt3 = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff23" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Enchufe23" onclick="apagaPrende23()" <%=tipo3%>>
                                    <label for="Enchufe23"></label>
                                    <input type="text" value="<%=volt3%>" name="Voltaje" hidden>
                                    <input type="text" value="Enchufe3" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[5]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                    Luz Principal
                    <br>
                    <%
                        String tipo4 = "checked";
                        int volt4 = 0;

                        if (uso[3].equals("0")) {
                            tipo4 = "";
                            volt4 = 50;
                        }
                    %>
                    <table style="width:30%">
                        <tr>
                            <td align="center">
                                <form name="OnOff24" action="apagadores" method="post">
                                    <input type="checkbox" class="sliderEstilos" id="Luz6" onclick="apagaPrende24()" <%=tipo4%>>
                                    <label for="Luz6"></label>
                                    <input type="text" value="<%=volt4%>" name="Voltaje" hidden>
                                    <input type="text" value="Luz" name="contacto" hidden>
                                    <input type="text" value="<%out.println(habNames[5]);%>" name="habit" hidden>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <br>
                </center>
                <!--</section>-->
            </div>
        </div>
        <%
                } catch (Exception errots) {
                    out.print(errots.getMessage());
                }
            }
        %>
    </div>
    <%
        }
    %>
</body>
<%
    }
%>
</html>