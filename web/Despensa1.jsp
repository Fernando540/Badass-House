<%@page import="BD.cDatos"%>
<%
    cDatos datos = new cDatos();
    String correo = (String) session.getAttribute("sessionMail");
    String codigo = "";
    String nombre = "";
    codigo = request.getParameter("codigo");
    nombre = request.getParameter("nombre");
    try {
        datos.conectar();
        int res;
        res = datos.modificacion1("call altadespensuki('" + correo + "','" + codigo + "','" + nombre + "');");
        if (res == 1) {
            out.print("<script>alert('Alta Exitosa');</script>");
            out.print("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/Despensa.jsp'>");
        }else{
            out.print("<script>alert('Errorts');</script>");
            out.print("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/Despensa.jsp'>");
        }
    } catch (Exception e) {
        out.print(e);
    }

%>