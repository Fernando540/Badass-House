<%@page import="java.sql.SQLException"%>
<%
    BD.cDatos datos= new BD.cDatos();
    String tipoNoti="";
    String correo = (String) session.getAttribute("sessionMail");
    
    tipoNoti=request.getParameter("tipoNoti");
    System.out.println(tipoNoti);
    try{
        datos.conectar();
        datos.consulta1("call activaNoti('"+correo+"','"+tipoNoti+"');");
        out.print("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/home.jsp#Status'>");
    }catch(SQLException e){
        out.print(e.getMessage());
    }
    
%>