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
    String pass = "", pass1 = "", pass2 = "";
    int result;
    String clave = "";
    String nombre = "", aPaterno = "", aMaterno = "";
    String direccion = "", correo = "";
    String registro = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/miCuenta.jsp'>";
    String index = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/index.jsp'>";
    String tipoUsr = "", index1 = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/index1.jsp'>", numSerie = "";
    Pattern pat1 = Pattern.compile("[^A-Za-zá-úÁ-Ú ]");
    Pattern pat = Pattern.compile("[A-Za-z0-9._%+-]+@[AZa-z0-9.-]+\\.[a-z]{2,4}$");
    Matcher mat1;
    Matcher mat2;
    Matcher mat3;
    ResultSet rs;
    
    
    numSerie = (String)sesion.getAttribute("numSerie");
    direccion = (String) sesion.getAttribute("direccion");
    String sessionMail = (String) session.getAttribute("sessionMail");
   
//Inicio de getParameter

if (request.getParameter("nombre").equals("")) {
        out.print("<script> alert('Ingresa el usuario!!!!');</script>");
        out.print(registro);

    } else {
        nombre = request.getParameter("nombre");
    }
    if (request.getParameter("aPaterno").equals("")) {
        out.print("<script> alert('Ingresa el apellido!!!!');</script>");
        out.print(registro);

    } else {
        aPaterno = request.getParameter("aPaterno");
    }
    if (request.getParameter("aMaterno").equals("")) {
        out.print("<script> alert('Ingresa el apellido!!!!');</script>");
        out.print(registro);

    } else {
        aMaterno = request.getParameter("aMaterno");
    }
    if (request.getParameter("tipoUsr").equals("")) {
        out.print("<script> alert('Ingresa un tipo usuario');</script>");
        out.print(registro);
    } else {
        tipoUsr = request.getParameter("tipoUsr");
    } 
    if (request.getParameter("correo").equals("")) {
        out.print("<script> alert('Ingresa el correo!!!!');</script>");
        out.print(registro);

    } else {

        String correo1 = request.getParameter("correo");
        Matcher mat = pat.matcher(correo1);
        if (mat.find()) {
            correo = request.getParameter("correo");
        } else {
            out.print("<script> alert('Ingresa un correo valido!!!!');</script>");
            out.print(registro);
        }
    }
    if (request.getParameter("newPassword").equals("")) {
        out.print("<script> alert('Ingresa la nueva contraseña!!!!');</script>");
        out.print(registro);

    } else {
        pass1 = request.getParameter("newPassword");
    }
    if (request.getParameter("yourPassword").equals("")) {
        out.print("<script> alert('Ingresa tu contraseña!!!!');</script>");
        out.print(registro);

    } else {
        pass2 = request.getParameter("yourPassword");
    }
    out.print("<script> alert('Ingresa caracteres Validos >:V!!!!');</script>");
    out.print("<script> alert(Correo: "+sessionMail+" y Contraseña: "+pass2+");</script>");
    if (correo.equals("") || nombre.equals("") || aPaterno.equals("") || aMaterno.equals("") || pass1.equals("") || pass2.equals("")) {
        out.print("<script> alert('Ingresa bien tus datos!!!!');</script>");
        out.print(registro);
    } else {

        String nombre1 = request.getParameter("nombre");
        String aMaterno1 = request.getParameter("aMaterno");
        String aPaterno1 = request.getParameter("aPaterno");

        mat1 = pat1.matcher(nombre1);
        mat2 = pat1.matcher(aPaterno1);
        mat3 = pat1.matcher(aMaterno1);
        if (mat1.find() || mat2.find() || mat3.find()) {
            out.print("<script> alert('Ingresa caracteres Validos >:V!!!!');</script>");
            out.print(registro);
            } 
        
        
        //Final del getParameter
        else {
            
            try {
            BD.cDatos sql = new BD.cDatos();
            sql.conectar();
            rs = sql.consulta1("select * from usuarios where correo = '" + sessionMail + "' and contrasenia = '" + pass2 + "';");
            
            while (rs.next()) {
                out.print("<script> alert('Registro mal agregado');</script>");
                out.print(registro);
               /* try {
                try {
                    wsbadasshouse.CifraCesar_Service service = new wsbadasshouse.CifraCesar_Service();
                    wsbadasshouse.CifraCesar port = service.getCifraCesarPort();
                    pass = port.cifrar(pass1);
                } 
                catch (Exception ex) {
                    out.print(ex.getMessage());
                }

                try {
                    wsbadasshouse.CifraSha_Service service1 = new wsbadasshouse.CifraSha_Service();
                    wsbadasshouse.CifraSha port1 = service1.getCifraShaPort();

                    pass1 = port1.cifrar(pass);

                } 
                catch (Exception exD) {
                    out.print(exD.getMessage());
                    // TODO handle custom exceptions here
                }

                sql.conectar();
                clave = "777888222333";
                sql.setAccion(correo, pass1, clave);
                rs = sql.consulta();/*("call valida('" + correo + "','" + pass + "');");*/

                /*while (rs.next()) {
                    if (rs.getString("Estatus").equals("1")) {
                        out.print("<script> alert('Usuario ya Registrado');</script>");
                        out.print(registro);
                    } else { 
                        rs = sql.consulta1("call validaSerie('" + numSerie + "');");
                        while (rs.next()) {
                            if (rs.getString("resultado").equals("ira men no existe ese numero de serie")) {
                                System.out.println(numSerie);
                                System.out.println(rs.getString("resultado"));
                                System.out.println(rs.getString("estaduki"));
                                out.print("<script> alert('ira men no existe ese numero de serie');</script>");
                                out.print(registro);
                            } else {
                                sql.setAccion(correo, pass1, clave, nombre, aPaterno, aMaterno);
                                result = sql.modificacion();
                                sql.regCasa(direccion, correo, numSerie);
                                sql.modificacion();
                                //conectar.modificacion1("insert into usu(correo,tipo) values('" + correo + "','" + tipoUsr + "')");
                                sql.modificacion1("call altaTipo('" + correo + "','" + tipoUsr + "');");

                                if (result == 1) {
                                    rs = sql.consulta1("call dimeTipo('" + correo + "');");
                                    while (rs.next()) {

                                        if (rs.getString("privilegio").equals("1")) {
                                            ResultSet rs1 = sql.consulta1("call dimePaquete('" + correo + "','Basico')");
                                            while (rs1.next()) {
                                                if (rs1.getString("pkte").equals("Basico")) {
                                                    out.print("<script> alert('Bienvenido " + nombre + "');</script>");
                                                }
                                            }
                                        } else {
                                            out.print(index1);
                                        }
                                    }

                                } else {
                                    out.print("<script> alert('Error');</script>");
                                    out.print(registro);
                                }
                            }
                        }

                    }
                }

            } 
            catch (SQLException e) {
                out.print(e);
            }*/
            } 
        } 
            catch (Exception xd) {
            out.println("Error: " + xd);
        }
            
        }

    }
%>