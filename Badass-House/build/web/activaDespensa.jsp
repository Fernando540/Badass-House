<%@page import="java.sql.SQLException"%>
<%
    BD.cDatos datos= new BD.cDatos();
    String tipoNoti="";
    String correo = (String) session.getAttribute("sessionMail");
    
    tipoNoti=request.getParameter("tipoNoti");
    try{
        datos.conectar();
        datos.consulta1("call activaNoti('"+correo+"','"+tipoNoti+"');");
        out.print("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://189.245.172.14:81/Badass-House/web/home.jsp#Status'>");
    }catch(SQLException e){
        out.print(e.getMessage());
    }
    
%>