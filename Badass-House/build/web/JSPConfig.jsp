<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="BD.cDatos"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import=" java.sql.*;"%>
<%@page import="java.sql.DriverManager;"%>
<%@page import="java.sql.ResultSet;"%>
<%@page import=" java.sql.SQLException;"%>
<%@page import="java.sql.Statement;"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    String correo = "";
    String nombre = "";
    String ap = "";
    String am = "";
    String opass = "";
    String npass = "";
    String conf = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://badasshouse.net23.net/Badass-House/web/home.jsp'>";
    correo = request.getParameter("uX");
    nombre = request.getParameter("nom");
    ap = request.getParameter("ap");
    am = request.getParameter("am");
    opass = request.getParameter("pass1");
    String pass = "", pass1 = "", npass1 = "", npass2 = "";
    ResultSet rs;
    sesion.setAttribute("sessionMail", correo);
    sesion.setAttribute("sessionName", nombre);
    sesion.setAttribute("sessionStat", "logueado");
    sesion.setMaxInactiveInterval(40 * 60);
    String gologin = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://badasshouse.net23.net/Badass-House/web/login.html'>";

    if (nombre.equals("") || ap.equals("") || am.equals("")) {
        out.print("<script> alert('Completa el formulario!!!!');</script>");
        out.print(conf);
    }
    if (request.getParameter("pass2").equals("")) {
        npass = "";
    } else {
        npass = request.getParameter("pass2");
        try {
            wsbadasshouse.CifraCesar_Service service = new wsbadasshouse.CifraCesar_Service();
            wsbadasshouse.CifraCesar port = service.getCifraCesarPort();
            npass1 = port.cifrar(npass);

        } catch (Exception ex) {

        }
        try {
            wsbadasshouse.CifraSha_Service service = new wsbadasshouse.CifraSha_Service();
            wsbadasshouse.CifraSha port = service.getCifraShaPort();
            npass2 = port.cifrar(npass1);
        } catch (Exception ex) {

        }
    }
    try {
        wsbadasshouse.CifraCesar_Service service = new wsbadasshouse.CifraCesar_Service();
        wsbadasshouse.CifraCesar port = service.getCifraCesarPort();
        pass = port.cifrar(opass);

    } catch (Exception ex) {

    }
    try {
        wsbadasshouse.CifraSha_Service service = new wsbadasshouse.CifraSha_Service();
        wsbadasshouse.CifraSha port = service.getCifraShaPort();
        pass1 = port.cifrar(pass);
    } catch (Exception ex) {

    }

    String clave = "777888222333";
    BD.cDatos sql = new BD.cDatos();
    sql.conectar();
    if (npass.equals("")) {
        rs = sql.consulta1("call actualiza('" + correo + "','" + nombre + "','" + ap + "','" + am + "',AES_Encrypt('" + pass1 + "','" + clave + "'),' ');");
        while (rs.next()) {
            if (rs.getString("mensaje").equals("0")) {
                out.print("<script> alert('La contraseña original es necesaria para cambios!!!!');</script>");
                out.print(conf);

            } else {
                out.print("<script> alert('Registro actualizado');</script>");
                out.print(conf);
            }
        }
    } else {
        rs = sql.consulta1("call actualiza('" + correo + "','" + nombre + "','" + ap + "','" + am + "',AES_Encrypt('" + pass1 + "','" + clave + "'),AES_encrypt('" + npass2 + "','" + clave + "'));");
        while (rs.next()) {
            if (rs.getString("mensaje").equals("0")) {
                out.print("<script> alert('La contraseña original es necesaria para cambios!!!!');</script>");
                out.print(conf);

            } else {
                out.print("<script> alert('Registro actualizado');</script>");
                out.print(conf);
            }
        }
    }


%>