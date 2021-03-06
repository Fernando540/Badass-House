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
<style>
    body {
        background: url("Imagenes/background.jpg") no-repeat fixed center;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
    }
</style>

<script>
    function confirmar() {
        if (confirm("Esta seguro que desea eliminarlo?"))
        {
            return true;
        }
        return false;
    }
</script>
<%
    if (session.getAttribute("sessionMail") == null) {
        out.print("<script>alert('La sesion ha expirado');</script>");
        out.print("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=login.html'>");
    } else {
%>
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
                <a class="navbar-brand">Cocina de ${sessionScope.sessionName}<!--Aquí va el nombre del cabrón ese--></a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <form class="navbar-form navbar-left" method="post" action="goBack" >
                            <input type="submit" class="btn btn-warning" value="Regresar a Home">
                        </form>
                    </li>
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
            <form method="post" action="Despensa1">
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
                out.println("<center><table class='flat-table'><tr><th/><th><h3>Nombre</h3></th><th><h3>Codigo de Barras</h3></th><th><h3>Cantidad</h3></th><th/></tr>");

                while (rs.next()) {
                    if (rs.getString("alertuki") != null) {
                        int si = Integer.parseInt(rs.getString("alertuki"));
                        int compara = Integer.parseInt(rs.getString("numero"));
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
                    String valid = rs.getString("numero");
                    if (valid.equals(null) || valid.equals("0")) {
                        out.println("<td><form action='UsoProducto' method='post'><select name='Cantidad'>");
                        out.println("<option>0</option>");
                    } else {
                        out.println("<td><form action='UsoProducto' method='post'><select name='Cantidad'>");
                        for (int n = 1; n <= cont; n++) {
                            out.println("<option>" + n + "</option>");
                        }
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

<% }
%>
