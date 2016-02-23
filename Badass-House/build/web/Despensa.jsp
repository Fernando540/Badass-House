<%@page import="BD.cDatos"%>
<%@page import="java.sql.ResultSet"%>
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

<body>
    <%
        String x = (String) session.getAttribute("sessionStat");
        String gologin = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/login.html'>";

        if (x.equals("logueado")) {
    %>
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand">Cocina de ${sessionScope.sessionName}<!--Aquí va el nombre del cabrón ese--></a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="home.jsp">Regresar</a></li>
                    <!--<li><a href="#miCuenta">Mi cuenta</a></li>
                    <li><a href="#configuracion">Configuracion</a></li>
                    <li><a href="#cerraduras">Cerraduras</a></li>
                    <li><a href="#NoKids">Niños no</a></li>
                    <li><a href="Despensa.jsp">Alacena  </a> </li> -->
                    <li>
                        <form class="navbar-form navbar-left" method="post" action="Logout" >
                            <input type="submit" class="btn btn-default" value="Cerrar Sesion">
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <section style="margin-top:2% ;padding: 10px; background: rgba(256,256,256,0.1)">
        <center>
            <h1>Cocina de ${sessionScope.sessionName}</h1>
            <br>
            <br>
            <form method="post" action="Despensa1.jsp">
                Código de barras<input type="text" placeholder="Codigo de Barras" maxlenght="35" name="codigo" required>
                &nbsp;&nbsp;
                Nombre<input type="text" placeholder="Nombre para identificar" maxlenght="35" name="nombre" required>
                Avisar cuando haya...<input type="text" placeholder="cantidad" maxlenght="35" name="alerta">
                <input type="submit">
            </form>
            <br/><br/>
            <%
                String correo = (String) session.getAttribute("sessionMail");
                cDatos datukis = new cDatos();
                datukis.conectar();

                //res = datukis.modificacion1("insert into DespesaPRO(correo,produ, cod) values('" + correo + "','" + nombre + "','" + codigo + "');");
                ResultSet rs = datukis.consulta1("call inventario('" + correo + "');");
                out.println("<center><table><tr><td/><td><h3>Nombre</h3></td><td><h3>Codigo de Barras</h3></td><td><h3>Cantidad</h3></td><td/></tr>");

                while (rs.next()) {
                    if (rs.getString("alertuki") != null) {
                        int si = Integer.parseInt(rs.getString("alertuki"));
                        int compara = Integer.parseInt(rs.getString("numero"));
                        System.out.println(si);
                        System.out.println(compara);
                        if (compara <= si) {
                            out.print("<script> alert('Queda poco de " + rs.getString("produ") + "');</script>");
                        }
                    } else {
                        out.print("<script> alert('Le recomendamos ingresar una alerta de cantidad para: " + rs.getString("produ") + "');</script>");
                    }

                    out.println("<tr>");
                    out.println("<td><form action='BajaProducto' method='post' onsubmit='return confirmar()'>"
                            + "<input type='text' value='" + rs.getString("barcode") + "' name='codigo' hidden>"
                            + "<button type='submit' class='btn btn-primary'><i class='glyphicon glyphicon-trash'></i></button>"
                            + "</form></td>");
                    out.println("<td>" + rs.getObject("produ") + "</td>");
                    out.println("<td>" + rs.getObject("barcode") + "</td>");
                    out.println("<td>" + rs.getObject("numero") + "</td>");

                    int cont = Integer.parseInt(rs.getString("numero"));
                    out.println("<td><form action='UsoProducto' method='post'><select name='Cantidad'>");
                    for (int n = 1; n <= cont; n++) {
                        out.println("<option>" + n + "</option>");
                    }
                    out.println("</select><input type='text' value='" + rs.getString("barcode") + "' name='codigo' hidden><input type='submit' value='Usar'/></form></td>");
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
