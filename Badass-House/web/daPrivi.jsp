<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    BD.cDatos datos=new BD.cDatos();
    String correo="", idHabitacion="", permiso="";
    correo =request.getParameter("correo");
    idHabitacion=request.getParameter("idHabitacion");
    permiso=request.getParameter("permiso");
    datos.conectar();
    datos.consulta1("call altaPrivi('"+correo+"','"+idHabitacion+"','"+permiso+"')");
    out.print("<script> alert('Permiso actualizado');</script>");
    out.print("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://badasshouse.net23.net/home.jsp#Configuracion'>");
%>
