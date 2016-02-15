<%@page import="java.sql.ResultSet"%>
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

        <form class="form-horizontal" method="post" action="registraHabitacion.jsp">
            <div class="form-group">
                <label class="col-sm-4 control-label">Nombre de la Habitación:</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" placeholder="Nombre" name="nombre" required>
                </div>
                <button type="submit" class ="btn btn-success">Aceptar</button>
            </div>
        </form>
        <%
            String correo = (String) session.getAttribute("sessionMail");
            BD.cDatos datukis = new BD.cDatos();
            datukis.conectar();

            //res = datukis.modificacion1("insert into DespesaPRO(correo,produ, cod) values('" + correo + "','" + nombre + "','" + codigo + "');");
            ResultSet rs1 = datukis.consulta1("select idCasa from relUsrCasa where correo='" + correo + "'");
            while (rs1.next()) {
                String idCasa = rs1.getString("idCasa");
                ResultSet rs = datukis.consulta1("select habitaciones.nombre,relCasaHab.idCasa from habitaciones inner join relCasaHab on habitaciones.idHabitacion=relCasaHab.idHabitacion;");
                //'" + idCasa + "' where idCasa='"+idCasa+"'
                out.println("<center><table><td><h3>Nombre</h3></td></tr>");

                while (rs.next()) {

                    out.println("<tr>");
                    /*out.println("<td><form action='BajaProducto' method='post' onsubmit='return confirmar()'>"
                     + "<input type='text' value='" + rs.getString("cod") + "' name='codigo' hidden>"
                     + "<button type='submit' class='btn btn-primary'><i class='glyphicon glyphicon-trash'></i></button>"
                     + "</form></td>");*/
                    out.println("<td>" + rs.getObject("nombre") + "</td>");
                    /*out.println("<td>" + rs.getObject("cod") + "</td>");
                     out.println("<td>" + rs.getObject("cantidad") + "</td>");

                     int cont = Integer.parseInt(rs.getString("cantidad"));
                     out.println("<td><form action='UsoProducto' method='post'><select name='Cantidad'>");
                     for (int n = 1; n <= cont; n++) {
                     out.println("<option>" + n + "</option>");
                     }
                     out.println("</select><input type='text' value='" + rs.getString("cod") + "' name='codigo' hidden><input type='submit' value='Usar'/></form></td>");
                     */
                    out.println("</tr>");
                }
                out.println("</table></center>");
            }

        %>
    </div>
</body>
</html>