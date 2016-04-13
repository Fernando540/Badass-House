<%-- 
    Document   : registraHabitacion
    Created on : 14/02/2016, 02:56:43 PM
    Author     : Enriq
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ResultSet rs;
    String nombre="", registro = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://badasshouse.net23.net/Badass-House/web/miCuenta.jsp'>";
    String log = (String) session.getAttribute("sessionMail");
    BD.cDatos sql = new BD.cDatos();
    sql.conectar();
    
    if(request.getParameter("nombre").equals("")){
        out.print("<script> alert('Ingresa el nombre!!!!');</script>");
        out.print(registro);
    }else{
        nombre=request.getParameter("nombre");
    }
    rs = sql.consulta1("call relHab('"+log+"','"+nombre+"');");
    out.print("<script> alert('Habitacion Registrada');</script>");
    out.print(registro);
%>