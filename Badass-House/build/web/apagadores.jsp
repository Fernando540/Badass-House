<%@page import="java.sql.ResultSet"%>
<%@page import="BD.cDatos"%>
<%
    cDatos datos = new cDatos();
    String correo = (String) session.getAttribute("sessionMail");
    String volt = request.getParameter("Voltaje");
    String contact = request.getParameter("contacto");
    String habit = request.getParameter("habit");
    String redirect = "";

    try {
        datos.conectar();
        ResultSet habiNames = datos.consulta1("call habiNames('" + correo + "');");
        int itera = 0;
        String[] habNames = new String[6];
        while (habiNames.next()) {
            habNames[itera] = habiNames.getString("habiName");
            itera = itera + 1;
        }

        if (habit.equals(habNames[0])) {
            redirect = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=home.jsp#Habitacion1'>";
        } else if (habit.equals(habNames[1])) {
            redirect = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=home.jsp#Habitacion2'>";
        } else if (habit.equals(habNames[2])) {
            redirect = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=home.jsp#Habitacion3'>";
        } else if (habit.equals(habNames[3])) {
            redirect = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=home.jsp#Habitacion4'>";
        } else if (habit.equals(habNames[4])) {
            redirect = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=home.jsp#Habitacion5'>";
        } else {
            redirect = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=home.jsp#Habitacion6'>";
        }
        
    } catch (Exception ex) {
        out.print(ex);
    }

    try {

        int res;
        res = datos.modificacion1("call simulaCorriente('" + correo + "','" + volt + "','" + contact + "','" + habit + "')");
        if (res == 1) {
            out.print(redirect);
        } else {
            out.print("<script>alert('Errorts');</script>");
            out.print(redirect);
        }
    } catch (Exception e) {
        out.print(e);
    }

%>