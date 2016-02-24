<%@page import="BD.cDatos"%>
<%
    cDatos datos = new cDatos();
    String correo = (String) session.getAttribute("sessionMail");
    String volt = request.getParameter("Voltaje");
    String contact = request.getParameter("contacto");
    String habit = request.getParameter("habit");
    String redirect = "";

    if (habit.equals("Habitacion 1")) {
        redirect = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/home.jsp#Habitacion1'>";
    } else {
        if (habit.equals("Habitacion 2")) {
            redirect = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/home.jsp#Habitacion2'>";
        } else {
            if (habit.equals("Habitacion 3")) {
                redirect = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/home.jsp#Habitacion3'>";
            } else {
                if (habit.equals("Habitacion 4")) {
                    redirect = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/home.jsp#Habitacion4'>";
                }
            }
        }
    }

    try {
        datos.conectar();
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