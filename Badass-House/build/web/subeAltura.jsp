<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String alturaMax = "", alturaMin = "";
    String correo = (String) session.getAttribute("sessionMail");
    BD.cDatos sql = new BD.cDatos();
    int rs;
    if (request.getParameter("alturaMax").equals("") || request.getParameter("alturaMin").equals("")) {
        out.print("<script>alert('Ingresa los datos que se te piden');</script>");
        out.print("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://badasshouse.net23.net/Badass-House/web/home.jsp#NoKids'>");
    } else {
        alturaMax = request.getParameter("alturaMax");
        alturaMin = request.getParameter("alturaMin");
        sql.conectar();
        rs = sql.modificacion1("call ingresaAltura('" + correo + "','" + alturaMax + "','" + alturaMin + "');");
        if (rs == 1) {
            out.print("<script>alert('Altura ingresada');</script>");
            out.print("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://badasshouse.net23.net/Badass-House/web/home.jsp#NoKids'>");
        } else {
            out.print("<script>alert(errorts');</script>");
            out.print("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://badasshouse.net23.net/Badass-House/web/home.jsp#NoKids'>");
        }
    }


%>