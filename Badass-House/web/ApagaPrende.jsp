<%@page import="BD.cDatos"%>
<%
    cDatos datos = new cDatos();
    String correo = (String) session.getAttribute("sessionMail");
    String volt = request.getParameter("Voltaje");
    String contact = request.getParameter("contacto");
    String habit = request.getParameter("habit");
    try {
        datos.conectar();
        int res;
        res = datos.modificacion1("call simulaCorriente('" + correo + "','" + volt + "','" + contact + "','" + habit + "')");
        if (res == 1) {
            out.print("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/luces.jsp'>");
        } else {
            out.print("<script>alert('Errorts');</script>");
            out.print("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/luces.jsp'>");
        }
    } catch (Exception e) {
        out.print(e);
    }

%>
