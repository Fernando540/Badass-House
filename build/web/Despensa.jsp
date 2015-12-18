<%@page import="BD.cDatos"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style=" background: url(Imagenes/background.jpg)"> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        
        <link rel="stylesheet" href="BS/css/bootstrap.css" />
        <link rel="stylesheet" href="BS/css/bootstrap-theme.css" />
        <link rel="stylesheet" href="BS/css/bootstrap-theme.min.css" />
        <link rel="stylesheet" href="BS/css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/estilos.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="BS/js/bootstrap.js"/></script>
        
        
        
        <link rel="shortcut icon" href="Imagenes/homeIcon.png">

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">


        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="Estilos/bootstrap-responsive.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,800,800italic,700italic,700,600italic,600,400italic,300italic,300|Yellowtail' rel='stylesheet'>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:700,300' rel='stylesheet'>
        <link rel="stylesheet" href="http://static.boredsoft.com/boredsoft/static/base.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="http://static.boredsoft.com/boredsoft/static/sidebar.css" type="text/css" media="screen" />

        <title>Cocina</title>

        <style>
            h1,h3{font-family: "Montserrat", sans-serif;color:#000;}
        </style>
        <link rel="stylesheet" href="Estilos/estiloTabla.css">

        <script>
            function confirmar() {
                if (confirm("Esta seguro que desea eliminarlo?"))
                {
                    return true;
                }
                return false;
            }
        </script>

    </head>
    
    <body style="background: url(Imagenes/background.jpg)">
        <%
            String x = (String) session.getAttribute("sessionStat");
            String gologin = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/login.html'>";

            if (x.equals("logueado")) { 
        %>
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
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true">In ur wife's room<span class="caret"></span></a>
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
        <section style="padding: 10px; background: rgba(256,256,256,0.1)">
            <center>
                <h1>Cocina de ${sessionScope.sessionName}</h1>
                <br>
                <br>
                <form method="post" action="Despensa1.jsp">
                    Código de barras<input type="text" placeholder="Codigo de Barras" maxlenght="35" name="codigo" required>
                    &nbsp;&nbsp;
                    Nombre<input type="text" placeholder="Nombre para identificar" maxlenght="35" name="nombre" required>
                    <input type="submit">
                </form>
                <br/><br/>
                <%
                    String correo = (String) session.getAttribute("sessionMail");
                    cDatos datukis = new cDatos();
                    datukis.conectar();

                    //res = datukis.modificacion1("insert into DespesaPRO(correo,produ, cod) values('" + correo + "','" + nombre + "','" + codigo + "');");
                    ResultSet rs = datukis.consulta1("select * from DespensaPRO where correo='" + correo + "'");
                    out.println("<center><table><tr><td/><td><h3>Nombre</h3></td><td><h3>Codigo de Barras</h3></td><td><h3>Cantidad</h3></td><td/></tr>");

                    while (rs.next()) {

                        out.println("<tr>");
                        out.println("<td><form action='BajaProducto' method='post' onsubmit='return confirmar()'>"
                                + "<input type='text' value='" + rs.getString("cod") + "' name='codigo' hidden>"
                                + "<button type='submit' class='btn btn-primary'><i class='glyphicon glyphicon-trash'></i></button>"
                                + "</form></td>");
                        out.println("<td>" + rs.getObject("produ") + "</td>");
                        out.println("<td>" + rs.getObject("cod") + "</td>");
                        out.println("<td>" + rs.getObject("cantidad") + "</td>");

                        int cont = Integer.parseInt(rs.getString("cantidad"));
                        out.println("<td><form action='UsoProducto' method='post'><select name='Cantidad'>");
                        for (int n = 1; n <= cont; n++) {
                            out.println("<option>" + n + "</option>");
                        }
                        out.println("</select><input type='text' value='" + rs.getString("cod") + "' name='codigo' hidden><input type='submit' value='Usar'/></form></td>");
                        out.println("</tr>");
                    }
                    out.println("</table></center>");
                %>
            </center>
        </section>
        
    </div>
    </body>
</html>

<% } else {
        out.print(gologin);
    }
%>
