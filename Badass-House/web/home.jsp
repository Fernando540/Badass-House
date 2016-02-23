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
                    <li><a href="#NoKids">Niños no</a></li>
                    <li><a href="#alacena">Alacena</a></li>                                        
                </ul>
            </div>
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
        <%
            String nombre = "";
            String ap = "";
            String am = "";
            ResultSet rs;
            String x = (String) session.getAttribute("sessionStat");
            String log = (String) session.getAttribute("sessionMail");
            String numSerie = (String) session.getAttribute("numSerie");
            String gologin = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/login.html'>";

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
                </center>
                <small>*La contraseña actual es necesaria para cualquier cambio</small>
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
                    <label class="col-sm-4 control-label">Correo electrónico:</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" name="password" maxlength="15" placeholder="15 caract&eacute;res max" required>
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
    <div id="NoKids" class= "container-fluid noTePeguesArriba" >
        <div class="row">
            <div class="page-header text-center noTePeguesArriba">
                <br>
                <strong>Niños no</strong>
            </div>
        </div>
        <div class="row">
            <div class="text-center">                
                <h4 class="status">Altura de sensor</h4>
            </div>
            <div class="col-md-8 col-md-offset-2 text-center">
                <form method="post" action="subeAltura.jsp">
                    <%
                        BD.cDatos datos = new BD.cDatos();
                        String altuki = "", altot = "", correo = (String) session.getAttribute("sessionMail");
                        ResultSet rs2;
                        datos.conectar();
                        rs2 = datos.consulta1("call dimeAltura('" + correo + "')");
                        while (rs2.next()) {
                            if (rs2.getString("alto") != null && rs2.getString("bajo") != null) {
                                altuki = rs2.getString("alto");
                                altot = rs2.getString("bajo");
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
    </div>
    <!--Niños no-->
    <!--Despensa-->
    <div id="alacena" class="container-fluid noTePeguesArriba">
        <div class="row">
            <div class=" page-header text-center noTePeguesArriba">
                <br>
                <strong>Alacena</strong>
            </div>
        </div>
        <div class="col-md-10 col-md-offset-1">
            <form method="post" action="Despensa1.jsp">
                Código de barras<input type="text" placeholder="Codigo de Barras" maxlenght="35" name="codigo" required>
                &nbsp;&nbsp;
                Nombre<input type="text" placeholder="Nombre para identificar" maxlenght="35" name="nombre" required>
                Avisar cuando haya...<input type="text" placeholder="cantidad" maxlenght="35" name="alerta">
                &nbsp;&nbsp;
                <button type="submit" name="Aceptar" class ="btn btn-success">Confirmar</button>
            </form>
            <%
                //String correo = (String) session.getAttribute("sessionMail");
                cDatos datukis = new cDatos();
                datukis.conectar();

                //res = datukis.modificacion1("insert into DespesaPRO(correo,produ, cod) values('" + correo + "','" + nombre + "','" + codigo + "');");
                ResultSet rs1 = datukis.consulta1("call inventario('" + correo + "');");
                out.println("<center><table><tr><td/><td><h3>Nombre</h3></td><td><h3>Codigo de Barras</h3></td><td><h3>Cantidad</h3></td><td/></tr>");

                while (rs1.next()) {
                    if (rs1.getString("alertuki") != null) {
                        int si = Integer.parseInt(rs1.getString("alertuki"));
                        int compara = Integer.parseInt(rs1.getString("numero"));
                        System.out.println(si);
                        System.out.println(compara);
                        if (compara <= si) {
                            out.print("<script> alert('Queda poco de " + rs1.getString("produ") + "');</script>");
                        }
                    } else {
                        out.print("<script> alert('Le recomendamos ingresar una alerta de cantidad para: " + rs1.getString("produ") + "');</script>");
                    }

                    out.println("<tr>");
                    out.println("<td><form action='BajaProducto' method='post' onsubmit='return confirmar()'>"
                            + "<input type='text' value='" + rs1.getString("barcode") + "' name='codigo' hidden>"
                            + "<button type='submit' class='btn btn-primary'><i class='glyphicon glyphicon-trash'></i></button>"
                            + "</form></td>");
                    out.println("<td>" + rs1.getObject("produ") + "</td>");
                    out.println("<td>" + rs1.getObject("barcode") + "</td>");
                    out.println("<td>" + rs1.getObject("numero") + "</td>");

                    int cont = Integer.parseInt(rs1.getString("numero"));
                    out.println("<td><form action='UsoProducto' method='post'><select name='Cantidad'>");
                    for (int n = 1; n <= cont; n++) {
                        out.println("<option>" + n + "</option>");
                    }
                    out.println("</select><input type='text' value='" + rs1.getString("barcode") + "' name='codigo' hidden><input type='submit' value='Usar'/></form></td>");
                    out.println("</tr>");
                }
                out.println("</table></center>");
            %>
        </div>
    </div>
    <!--Despensa-->
</body>
</html>