package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import BD.cDatos;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Home</title>\r\n");
      out.write("        <link rel=\"shortcut icon\" href=\"https://cdn2.iconfinder.com/data/icons/social-messaging-productivity-1-1/128/home-512.png\">\r\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js\"></script>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"BS/css/bootstrap.css\" />\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"BS/css/bootstrap-theme.css\" />\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"BS/css/bootstrap-theme.min.css\" />\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"BS/css/bootstrap.min.css\" />\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/estilos.css\" />\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/SlidersStyles.css\" />\r\n");
      out.write("        <script src=\"BS/js/bootstrap.js\"/></script>\r\n");
      out.write("    <script src=\"js/scripts.js\"/></script>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"Estilos/estiloTabla.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    <nav class=\"navbar navbar-default navbar-fixed-top\">\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <center>\r\n");
      out.write("                <div class=\"navbar-header\">\r\n");
      out.write("                    <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#myNavbar\">\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                    </button>\r\n");
      out.write("                    <a class=\"navbar-brand\">Casa de ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.sessionName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("<!--Aquí va el nombre del cabrón ese--></a>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"myNavbar\">\r\n");
      out.write("                    <ul class=\"nav navbar-nav navbar-right\">\r\n");
      out.write("                        ");

                            BD.cDatos datos = new BD.cDatos();
                            String correin = (String) session.getAttribute("sessionMail");
                            String tipoUsuario = "";
                            datos.conectar();
                            ResultSet tipoUsr = datos.consulta1("call dimeTipo('" + correin + "');");
                            while (tipoUsr.next()) {
                                tipoUsuario = tipoUsr.getString("privilegio");
                            }
                            if (tipoUsuario.equals("1")) {
                        
      out.write("\r\n");
      out.write("\r\n");
      out.write("                        <li><a href=\"#status\">Status</a></li>\r\n");
      out.write("                        <li><a href=\"#miCuenta\">Mi cuenta</a></li>\r\n");
      out.write("                        <li><a href=\"#configuracion\">Configuracion</a></li>\r\n");
      out.write("                        <li><a href=\"#cerraduras\">Cerraduras</a></li>\r\n");
      out.write("                            ");

                            } else {


                            
      out.write("\r\n");
      out.write("\r\n");
      out.write("                        <!--<li><a href=\"#status\">Status</a></li>-->\r\n");
      out.write("                        <li><a href=\"#miCuenta\">Mi cuenta</a></li>\r\n");
      out.write("                        <li><a href=\"#configuracion\">Configuracion</a></li>\r\n");
      out.write("                        <!--<li><a href=\"#cerraduras\">Cerraduras</a></li>-->\r\n");
      out.write("                        ");
                         }
                        
      out.write("    \r\n");
      out.write("                        ");

                            datos.conectar();
                            ResultSet rs3;
                            rs3 = datos.consulta1("call dimePaquete('','" + correin + "');");
                            while (rs3.next()) {
                                if (rs3.getString("pkte").equals("BasicoNKA") || rs3.getString("pkte").equals("ProNKA") || rs3.getString("pkte").equals("PlatinoNKA")) {
                                    if (tipoUsuario.equals("1")) {
                                        out.print("<li><a href='#NoKids'>Niños no</a></li>");
                                    }

                                }
                            }

                            String paquete = "";
                            ResultSet paqueton = datos.consulta1("call dimePaquete('','" + correin + "');");
                            while (paqueton.next()) {
                                paquete = paqueton.getString("pkte");
                            }

                            ResultSet habiNames = datos.consulta1("call habiNames('" + correin + "');");
                            int itera = 0;
                            String[] habNames = new String[6];
                            while (habiNames.next()) {
                                habNames[itera] = habiNames.getString("habiName");
                                itera = itera + 1;
                            }

                            String[] habPermitidas = new String[6];
                            int cuenta = 0;
                            if (tipoUsuario.equals("2")) {
                                ResultSet roomsJR = datos.consulta1("call dimePermiso('" + correin + "');");
                                while (roomsJR.next()) {
                                    habPermitidas[cuenta] = roomsJR.getString("roomName");
                                    cuenta = cuenta + 1;
                                }
                            }

                            ResultSet rs4 = datos.consulta1("call dimePaquete('','" + correin + "');");
                            while (rs4.next()) {
                                if (rs4.getString("pkte").equals("Basico") || rs4.getString("pkte").equals("BasicoNKA")) {
                                    if (tipoUsuario.equals("1")) {
                                        out.print("<li class='dropdown'>");
                                        out.print("<a class='dropdown-toggle' data-toggle='dropdown' href='#'>Habitaciones<span class='caret'></span></a>");
                                        out.print("<ul class='dropdown-menu'>");
                                        out.print("<li><a href='#Habitacion1'>" + habNames[0] + "</a></li>");
                                        out.print("<li><a href='#Habitacion2'>" + habNames[1] + "</a></li>");
                                        out.print("</ul>");
                                    } else {
                                        out.print("<li class='dropdown'>");
                                        out.print("<a class='dropdown-toggle' data-toggle='dropdown' href='#'>Habitaciones<span class='caret'></span></a>");
                                        out.print("<ul class='dropdown-menu'>");

                                        for (cuenta = 0; cuenta < habPermitidas.length; cuenta++) {
                                            if (habPermitidas[cuenta] != null) {
                                                for (int n = 0; n < habNames.length; n++) {
                                                    if (habPermitidas[cuenta].equals(habNames[n])) {
                                                        out.print("<li><a href='#Habitacion" + String.valueOf(n + 1) + "'>" + habPermitidas[cuenta] + "</a></li>");
                                                    }
                                                }

                                            }
                                        }
                                        System.out.println(String.valueOf(cuenta + 1));
                                        out.print("</ul>");
                                    }
                                } else if (rs4.getString("pkte").equals("Pro") || rs4.getString("pkte").equals("ProNKA")) {
                                    if (tipoUsr.equals("1")) {
                                        out.print("<li class='dropdown'>");
                                        out.print("<a class='dropdown-toggle' data-toggle='dropdown' href='#'>Habitaciones<span class='caret'></span></a>");
                                        out.print("<ul class='dropdown-menu'>");
                                        out.print("<li><a href='#Habitacion1'>" + habNames[0] + "</a></li>");
                                        out.print("<li><a href='#Habitacion2'>" + habNames[1] + "</a></li>");
                                        out.print("<li><a href='#Habitacion3'>" + habNames[2] + "</a></li>");
                                        out.print("<li><a href='#Habitacion4'>" + habNames[3] + "</a></li>");
                                        out.print("</ul>");
                                    } else {
                                        out.print("<li class='dropdown'>");
                                        out.print("<a class='dropdown-toggle' data-toggle='dropdown' href='#'>Habitaciones<span class='caret'></span></a>");
                                        out.print("<ul class='dropdown-menu'>");

                                        for (cuenta = 0; cuenta < habPermitidas.length; cuenta++) {
                                            if (habPermitidas[cuenta] != null) {
                                                for (int n = 0; n < habNames.length; n++) {
                                                    if (habPermitidas[cuenta].equals(habNames[n])) {
                                                        out.print("<li><a href='#Habitacion" + String.valueOf(n + 1) + "'>" + habPermitidas[cuenta] + "</a></li>");
                                                    }
                                                }

                                            }
                                        }
                                        System.out.println(String.valueOf(cuenta + 1));
                                        out.print("</ul>");
                                    }

                                } else {
                                    if (tipoUsr.equals("1")) {
                                        out.print("<li class='dropdown'>");
                                        out.print("<a class='dropdown-toggle' data-toggle='dropdown' href='#'>Habitaciones <span class='caret'></span></a>");
                                        out.print("<ul class='dropdown-menu'>");
                                        out.print("<li><a href='#Habitacion1'>" + habNames[0] + "</a></li>");
                                        out.print("<li><a href='#Habitacion2'>" + habNames[1] + "</a></li>");
                                        out.print("<li><a href='#Habitacion3'>" + habNames[2] + "</a></li>");
                                        out.print("<li><a href='#Habitacion4'>" + habNames[3] + "</a></li>");
                                        out.print("<li><a href='#Habitacion5'>" + habNames[4] + "</a></li>");
                                        out.print("<li><a href='#Habitacion6'>" + habNames[5] + "</a></li>");
                                        out.print("</ul>");
                                    } else {
                                        out.print("<li class='dropdown'>");
                                        out.print("<a class='dropdown-toggle' data-toggle='dropdown' href='#'>Habitaciones<span class='caret'></span></a>");
                                        out.print("<ul class='dropdown-menu'>");

                                        for (cuenta = 0; cuenta < habPermitidas.length; cuenta++) {
                                            if (habPermitidas[cuenta] != null) {
                                                for (int n = 0; n < habNames.length; n++) {
                                                    if (habPermitidas[cuenta].equals(habNames[n])) {
                                                        out.print("<li><a href='#Habitacion" + String.valueOf(n + 1) + "'>" + habPermitidas[cuenta] + "</a></li>");
                                                    }
                                                }

                                            }
                                        }
                                        System.out.println(String.valueOf(cuenta + 1));
                                        out.print("</ul>");
                                    }

                                }
                            }
                        
      out.write("\r\n");
      out.write("                        ");

                            if (tipoUsuario.equals("1")) {


                        
      out.write("\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <form class=\"navbar-form navbar-left\" method=\"post\" action=\"mandaDespensa\" >\r\n");
      out.write("                                <input type=\"submit\" class=\"btn btn-warning\" value=\"Despensa\">\r\n");
      out.write("                            </form>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        ");
                            }
      out.write("\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <form class=\"navbar-form navbar-left\" method=\"post\" action=\"Logout\" >\r\n");
      out.write("                                <input type=\"submit\" class=\"btn btn-default\" value=\"Cerrar Sesion\">\r\n");
      out.write("                            </form>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("            </center>            \r\n");
      out.write("        </div>\r\n");
      out.write("    </nav>\r\n");
      out.write("    <!--Div Satus-->\r\n");
      out.write("    ");

        if (tipoUsuario.equals("1")) {
    
      out.write("\r\n");
      out.write("    <div id=\"status\" class=\"container-fluid noTePeguesArriba\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <div class=\" page-header text-center noTePeguesArriba\">\r\n");
      out.write("                <br>\r\n");
      out.write("                <strong>Status</strong>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!--<div class=\"row-fluid\">\r\n");
      out.write("            <div class=\"text-center\">\r\n");
      out.write("                <h4 class=\"status\">Puertas</h4>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-md-3\">\r\n");
      out.write("                Puerta de entrada\r\n");
      out.write("                <input type=\"checkbox\" class=\"sliderEstilos\" id=\"sliderPEntrada\">\r\n");
      out.write("                <label for=\"sliderPEntrada\"></label>\r\n");
      out.write("            </div> \r\n");
      out.write("            <div class=\"col-md-3\">\r\n");
      out.write("                Puerta dormitorio\r\n");
      out.write("                <input type=\"checkbox\" class=\"sliderEstilos\" id=\"sliderPDormitorio\">\r\n");
      out.write("                <label for=\"sliderPDormitorio\"></label>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-md-3\">\r\n");
      out.write("                Puerta cocina\r\n");
      out.write("                <input type=\"checkbox\" class=\"sliderEstilos\" id=\"sliderPCocina\">\r\n");
      out.write("                <label for=\"sliderPCocina\"></label>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-md-3\">\r\n");
      out.write("                Puerta sala\r\n");
      out.write("                <input type=\"checkbox\" class=\"sliderEstilos\" id=\"sliderWife\">\r\n");
      out.write("                <label for=\"sliderWife\"></label>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div-->\r\n");
      out.write("        <div class=\"row-fluid\">\r\n");
      out.write("            <div class=\"text-center\">\r\n");
      out.write("                <br><br><br><br>\r\n");
      out.write("                <h4 class=\"status\">Llaves de gas</h4>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-md-3\">\r\n");
      out.write("                Llave 1 \r\n");
      out.write("                <input type=\"checkbox\" class=\"sliderEstilos\" id=\"sliderLlave1\" checked>\r\n");
      out.write("                <label for=\"sliderLlave1\"></label>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-md-3\">\r\n");
      out.write("                Llave 2\r\n");
      out.write("                <input type=\"checkbox\" class=\"sliderEstilos\" id=\"sliderLlave2\" checked>\r\n");
      out.write("                <label for=\"sliderLlave2\"></label>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-md-3\">\r\n");
      out.write("                Llave 3\r\n");
      out.write("                <input type=\"checkbox\" class=\"sliderEstilos\" id=\"sliderLlave3\" checked>\r\n");
      out.write("                <label for=\"sliderLlave3\"></label>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-md-3\">\r\n");
      out.write("                Llave 4\r\n");
      out.write("                <input type=\"checkbox\" class=\"sliderEstilos\" id=\"sliderLlave4\" checked>\r\n");
      out.write("                <label for=\"sliderLlave4\"></label>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"row-fluid\">\r\n");
      out.write("            <div class=\"text-center\">\r\n");
      out.write("                <br><br><br><br>\r\n");
      out.write("                <h4 class=\"status\">Activar Notificaciones</h4>\r\n");
      out.write("            </div>\r\n");
      out.write("            ");

                ResultSet estadote;
                estadote = datos.consulta1("call dimeEstado('" + correin + "','Despensa');");

                while (estadote.next()) {
                    if (estadote.getString("estaduki").equals("activado")) {

            
      out.write("\r\n");
      out.write("            <div class=\"col-md-3\">\r\n");
      out.write("                <form name=\"activaDespensuki\" action=\"activaDespensa.jsp\" method=\"post\">\r\n");
      out.write("                    Despensa\r\n");
      out.write("                    <input type=\"checkbox\" class=\"sliderEstilos\"  id=\"despi\" onclick=\"activa()\" checked>\r\n");
      out.write("                    <label for=\"despi\"></label>\r\n");
      out.write("                    <input type=\"text\" value=\"Despensa\" name=\"tipoNoti\" hidden>\r\n");
      out.write("                    <input type=\"submit\" value=\"aceptar\" name=\"tipoNoti\" hidden>\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("            ");
            } else {
            
      out.write("\r\n");
      out.write("            <div class=\"col-md-3\">\r\n");
      out.write("                <form name=\"activaDespensuki\" action=\"activaDespensa.jsp\" method=\"post\">\r\n");
      out.write("                    Despensa\r\n");
      out.write("                    <input type=\"checkbox\" class=\"sliderEstilos\"  id=\"despi\" onclick=\"activa()\" >\r\n");
      out.write("                    <label for=\"despi\"></label>\r\n");
      out.write("                    <input type=\"text\" value=\"Despensa\" name=\"tipoNoti\" hidden>\r\n");
      out.write("                    <input type=\"submit\" value=\"aceptar\" name=\"tipoNoti\" hidden>\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("            ");

                    }
                }
            
      out.write("\r\n");
      out.write("            ");

                ResultSet estadote1;
                estadote1 = datos.consulta1("call dimeEstado('" + correin + "','ForceClose');");

                while (estadote1.next()) {
                    if (estadote1.getString("estaduki").equals("activado")) {

            
      out.write("\r\n");
      out.write("            <div class=\"col-md-3\">\r\n");
      out.write("                <form name=\"\" action=\"\" method=\"post\">\r\n");
      out.write("                    ForceClose\r\n");
      out.write("                    <input type=\"checkbox\" class=\"sliderEstilos\"  id=\"close\" checked>\r\n");
      out.write("                    <label for=\"close\"></label>\r\n");
      out.write("                    <input type=\"text\" value=\"Despensa\" name=\"tipoNoti\" hidden>\r\n");
      out.write("                    <input type=\"submit\" value=\"aceptar\" name=\"tipoNoti\" hidden>\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("            ");
            } else {
            
      out.write("\r\n");
      out.write("            <div class=\"col-md-3\">\r\n");
      out.write("                <form name=\"\" action=\"\" method=\"post\">\r\n");
      out.write("                    Despensa\r\n");
      out.write("                    <input type=\"checkbox\" class=\"sliderEstilos\"  id=\"close\">\r\n");
      out.write("                    <label for=\"close\"></label>\r\n");
      out.write("                    <input type=\"text\" value=\"Despensa\" name=\"tipoNoti\" hidden>\r\n");
      out.write("                    <input type=\"submit\" value=\"aceptar\" name=\"tipoNoti\" hidden>\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("            ");

                    }
                }
            
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    ");

        }
    
      out.write("\r\n");
      out.write("    <!--Div Satus-->\r\n");
      out.write("    <!--Div Mi Cuenta-->\r\n");
      out.write("    <div id=\"miCuenta\" class=\"container-fluid noTePeguesArriba\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <div class=\"page-header text-center noTePeguesArriba\">\r\n");
      out.write("                <br>\r\n");
      out.write("                <strong>Mi cuenta</strong>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        ");
            String nombre = "";
            String ap = "";
            String am = "";
            ResultSet rs;
            String x = (String) session.getAttribute("sessionStat");
            String log = (String) session.getAttribute("sessionMail");
            String numSerie = (String) session.getAttribute("numSerie");
            String gologin = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/login.html'>";

            try {

                rs = datos.consulta1("select * from usuarios where correo = '" + log + "';");

                while (rs.next()) {
                    nombre = rs.getString("nombre");
                    ap = rs.getString("aPaterno");
                    am = rs.getString("aMaterno");
                }
            } catch (Exception xd) {
                out.println("Error: " + xd);
            }

        
      out.write("\r\n");
      out.write("        <div class=\"text-center\">\r\n");
      out.write("            <h4 class=\"cuenta\">Mis datos</h4>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <form class=\"form-horizontal\" action=\"JSPConfig.jsp\" method=\"post\"><!-- Aquí van las funciones del form-->\r\n");
      out.write("                <div class=\"form-group\">                     \r\n");
      out.write("                    <label class=\"col-sm-4 control-label\">Cuenta: ");
      out.print(log);
      out.write("</label>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"form-group\">\r\n");
      out.write("                    <label class=\"col-sm-4 control-label\">Nombre:</label>\r\n");
      out.write("                    <div class=\"col-sm-6\">\r\n");
      out.write("                        <input type=\"text\" class=\"form-control\" placeholder=\"Nombre\" name=\"nom\" value=\"");
      out.print(nombre);
      out.write("\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"form-group\">\r\n");
      out.write("                    <label class=\"col-sm-4 control-label\">Apellido Paterno:</label>\r\n");
      out.write("                    <div class=\"col-sm-6\">\r\n");
      out.write("                        <input type=\"text\" class=\"form-control\" placeholder=\"Apellido Paterno\" name=\"ap\" value=\"");
      out.print(ap);
      out.write("\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"form-group\">\r\n");
      out.write("                    <label class=\"col-sm-4 control-label\">Apellido Materno:</label>\r\n");
      out.write("                    <div class=\"col-sm-6\">\r\n");
      out.write("                        <input type=\"text\" class=\"form-control\" placeholder=\"Apellido Materno\" name=\"am\" value=\"");
      out.print(am);
      out.write("\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"form-group\">\r\n");
      out.write("                    <label class=\"col-sm-4 control-label\">Contraseña nueva:</label>\r\n");
      out.write("                    <div class=\"col-sm-6\">\r\n");
      out.write("                        <input type=\"password\" class=\"form-control\" placeholder=\"Contraseña nueva\" name=\"pass2\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"form-group has-warning has-feedback\">\r\n");
      out.write("                    <label class=\"col-sm-4 control-label\">Contraseña actual: *</label>\r\n");
      out.write("                    <div class=\"col-sm-6\">\r\n");
      out.write("                        <input type=\"password\" class=\"form-control\" placeholder=\"Contraseña actual\" name=\"pass1\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <center>\r\n");
      out.write("                    <button type=\"submit\" class =\"btn btn-success\">Aceptar</button>\r\n");
      out.write("                    <button type=\"reset\" class=\"btn btn-warning\">Cancelar</button>                \r\n");
      out.write("                    <br><br>\r\n");
      out.write("\r\n");
      out.write("                    <small>*La contraseña actual es necesaria para cualquier cambio</small>\r\n");
      out.write("                </center>\r\n");
      out.write("                <input type=\"hidden\" name=\"uX\" value=\"");
      out.print(log);
      out.write("\">\r\n");
      out.write("            </form>\r\n");
      out.write("        </div>\r\n");
      out.write("        ");

            if (tipoUsuario.equals("1")) {
        
      out.write("\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <div class=\"text-center\">\r\n");
      out.write("                <h4 class=\"cuenta\">Agregar cuenta</h4>\r\n");
      out.write("            </div>            \r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <form class=\"form-horizontal\" action=\"JSPAltaCuenta.jsp\" method=\"post\"><!-- Aquí van las funciones del form--> \r\n");
      out.write("                <div class=\"form-group\">\r\n");
      out.write("                    <label class=\"col-sm-4 control-label\">Numero de serie:</label>\r\n");
      out.write("                    <div class=\"col-sm-6\">\r\n");
      out.write("                        <input type=\"text\" class=\"form-control\" name=\"numSerie\" maxlength=\"6\" required >\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div> \r\n");
      out.write("                <div class=\"form-group\">\r\n");
      out.write("                    <label class=\"col-sm-4 control-label\">Nombre:</label>\r\n");
      out.write("                    <div class=\"col-sm-6\">\r\n");
      out.write("                        <input type=\"text\" class=\"form-control\" name=\"nombre\" maxlength=\"35\" onkeypress=\"return noNumeros(event)\" required >\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"form-group\">\r\n");
      out.write("                    <label class=\"col-sm-4 control-label\">Apellido Paterno:</label>\r\n");
      out.write("                    <div class=\"col-sm-6\">\r\n");
      out.write("                        <input type=\"text\" class=\"form-control\" name=\"aPaterno\" maxlength=\"35\" onkeypress=\"return noNumeros(event)\" required >\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"form-group\">\r\n");
      out.write("                    <label class=\"col-sm-4 control-label\">Apellido Materno:</label>\r\n");
      out.write("                    <div class=\"col-sm-6\">\r\n");
      out.write("                        <input type=\"text\" class=\"form-control\" name=\"aMaterno\" maxlength=\"35\" onkeypress=\"return noNumeros(event)\" required >\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"form-group\">\r\n");
      out.write("                    <label class=\"col-sm-4 control-label\">Tipo Usuario:</label>\r\n");
      out.write("                    <div class=\"col-sm-6\">\r\n");
      out.write("                        <select class=\"form-control\" name=\"tipoUsr\" required>\r\n");
      out.write("                            <option>Premium</option>\r\n");
      out.write("                            <option>Junior</option>\r\n");
      out.write("                        </select>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"form-group\">\r\n");
      out.write("                    <label class=\"col-sm-4 control-label\">Correo electrónico:</label>\r\n");
      out.write("                    <div class=\"col-sm-6\">\r\n");
      out.write("                        <input type=\"email\" class=\"form-control\" name=\"correo\" placeholder=\"nombre@dominio.com\" required pattern=\"[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$\" >\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"form-group\">\r\n");
      out.write("                    <label class=\"col-sm-4 control-label\">Contraseña:</label>\r\n");
      out.write("                    <div class=\"col-sm-6\">\r\n");
      out.write("                        <input type=\"password\" class=\"form-control\" name=\"password\" maxlength=\"15\" placeholder=\"15 caract&eacute;res max\" required>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"form-group\">\r\n");
      out.write("                    <label class=\"col-sm-4 control-label\">Contraseña de la cuenta actual:</label>\r\n");
      out.write("                    <div class=\"col-sm-6\">\r\n");
      out.write("                        <input type=\"password\" class=\"form-control\" name=\"passwordOrig\" maxlength=\"15\" required>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <center>\r\n");
      out.write("                    <button type=\"submit\" class =\"btn btn-success\">Aceptar</button>\r\n");
      out.write("                    <button type=\"reset\" class=\"btn btn-warning\">Cancelar</button>                \r\n");
      out.write("                    <br><br>\r\n");
      out.write("                </center>\r\n");
      out.write("            </form>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <div class=\"text-center\">\r\n");
      out.write("                <h4 class=\"cuenta\">Cuentas de la Casa</h4>\r\n");
      out.write("            </div>            \r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            ");

                ResultSet idCasa;
                String idCas = "";
                idCasa = datos.consulta1("select idCasa from relUsrCasa where correo='" + correin + "';");

                while (idCasa.next()) {
                    idCas = idCasa.getString("idCasa");
                }
                ResultSet users;
                users = datos.consulta1("select correo from relUsrCasa where idCasa='" + idCas + "';");

                out.print(
                        "<center><table><th>Correo</th><th>Tipo Usuario</th><th>Privilegios</th>");
                while (users.next()) {
                    String correok = users.getString("correo");
                    ResultSet tipo = datos.consulta1("call dimeTipo('" + correok + "');");

                    while (tipo.next()) {

                        if (tipo.getString("privilegio").equals("2")) {
                            out.print("<tr><td>" + correok + "</td><td>Junior</td>");

                            rs3 = datos.consulta1("call dimePaquete('','" + correin + "');");
                            int cantidad = 0;
                            while (rs3.next()) {
                                if (rs3.getString("pkte").equals("Basico") || rs3.getString("pkte").equals("BasicoNKA")) {
                                    cantidad = 2;
                                } else {
                                    if (rs3.getString("pkte").equals("Pro") || rs3.getString("pkte").equals("ProNKA")) {
                                        cantidad = 4;
                                    } else {
                                        cantidad = 6;
                                    }
                                }
                            }

                            out.print("<td> <form action='daPrivi.jsp' method='post'>"
                                    + "<select name='idHabitacion'>");
                            for (int v = 0; v < cantidad; v++) {
                                out.print("<option>" + habNames[v] + "</option>");
                            }

                            out.print("</select>SI<input type='radio' name='permiso' value='SI'>&nbsp;NO<input type='radio' name='permiso' value='NO' checked>"
                                    + "<input type='text' name='correo' value='" + correok + "' hidden><input type='submit' value='Aceptar'>"
                                    + "</td></form></tr>");
                        } else {
                            out.print("<tr><td>" + correok + "</td><td>Premium</td><td>Todos</td></tr>");
                        }

                    }
                }

                out.print(
                        "</center></table>");

            
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    ");
        }  
      out.write("\r\n");
      out.write("    <!--Div Mi Cuenta-->\r\n");
      out.write("    <!--Div Configuración-->\r\n");
      out.write("    <div id=\"configuracion\" class=\"container-fluid noTePeguesArriba\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <div class=\" page-header text-center noTePeguesArriba\">\r\n");
      out.write("                <br>\r\n");
      out.write("                <strong>Configuración</strong>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"row-fluid\">\r\n");
      out.write("            <div class=\"text-center\">                \r\n");
      out.write("                <h4 class=\"status\">Notificaciones</h4>\r\n");
      out.write("            </div>\r\n");
      out.write("            ");
                ResultSet rs6;

                datos.conectar();
                rs6 = datos.consulta1("call dimeNoti('" + correin + "','Despensa',1);");

                out.println(
                        "<center><table><tr><th><h3>Correo</h3></th><th><h3>Accion</h3></th><th><h3>Fecha</h3></th></tr>");
                while (rs6.next()) {
                    out.print("<tr><td>" + rs6.getString("correin") + "</td>");
                    out.print("<td>" + rs6.getString("que") + "</td>");
                    out.print("<td>" + rs6.getString("prueba") + "</td>");
                    out.print("</tr>");
                }
                rs6 = datos.consulta1("call dimeNoti('" + correin + "','ForceClose',2);");

                while (rs6.next()) {
                    out.print("<tr><td>" + rs6.getString("correin") + "</td>");
                    out.print("<td>" + rs6.getString("que") + "</td>");
                    out.print("<td>" + rs6.getString("prueba") + "</td>");
                    out.print("</tr>");
                }

                out.print(
                        "</center></table>");
            
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <!--Div COnfiguración-->\r\n");
      out.write("\r\n");
      out.write("    ");

        if (tipoUsuario.equals("1")) {
    
      out.write("\r\n");
      out.write("    <!--Div Cerradura-->\r\n");
      out.write("    <div id=\"cerraduras\" class=\"container-fluid noTePeguesArriba\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <div class=\" page-header text-center noTePeguesArriba\">\r\n");
      out.write("                <br>\r\n");
      out.write("                <strong>Cerraduras</strong>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <div class=\"text-center\">                \r\n");
      out.write("                <h4>Cerraduras</h4>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-md-3\">\r\n");
      out.write("                Cerradura 1 \r\n");
      out.write("                <input type=\"checkbox\" class=\"sliderEstilos\" id=\"sliderCerradura1\" checked>\r\n");
      out.write("                <label for=\"sliderCerradura1\"></label>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-md-3\">\r\n");
      out.write("                Cerradura 2\r\n");
      out.write("                <input type=\"checkbox\" class=\"sliderEstilos\" id=\"sliderCerradura2\" checked>\r\n");
      out.write("                <label for=\"sliderCerradura2\"></label>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-md-3\">\r\n");
      out.write("                Cerradura 3\r\n");
      out.write("                <input type=\"checkbox\" class=\"sliderEstilos\" id=\"sliderCerradura3\" checked>\r\n");
      out.write("                <label for=\"sliderCerradura3\"></label>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-md-3\">\r\n");
      out.write("                Cerradura 4\r\n");
      out.write("                <input type=\"checkbox\" class=\"sliderEstilos\" id=\"sliderCerradura4\" checked>\r\n");
      out.write("                <label for=\"sliderCerradura4\"></label>\r\n");
      out.write("            </div>\r\n");
      out.write("            <br><br><br><br>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <!--Div Cerradura-->\r\n");
      out.write("    <!--Niños no-->\r\n");
      out.write("    ");

        rs3 = datos.consulta1("call dimePaquete('','" + correin + "');");

        while (rs3.next()) {
            if (rs3.getString("pkte").equals("BasicoNKA") || rs3.getString("pkte").equals("ProNKA") || rs3.getString("pkte").equals("PlatinoNKA")) {

    
      out.write("\r\n");
      out.write("    <div id='NoKids' class= 'container-fluid noTePeguesArriba' >\r\n");
      out.write("        <div class='row'>\r\n");
      out.write("            <div class='page-header text-center noTePeguesArriba'>\r\n");
      out.write("                <br>\r\n");
      out.write("                <strong>Niños no</strong>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class='row'>\r\n");
      out.write("            <div class='text-center'>                \r\n");
      out.write("                <h4 class='status'>Altura de sensor</h4>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class='col-md-8 col-md-offset-2 text-center'>\r\n");
      out.write("                <form method='post' action='subeAltura.jsp'>\r\n");
      out.write("                    ");
String altuki = "", altot = "", correo = (String) session.getAttribute("sessionMail");
                        ResultSet rs2;

                        rs2 = datos.consulta1("call dimeAltura('" + correin + "')");
                        while (rs2.next()) {
                            if (rs2.getString("alto") != null && rs2.getString("bajo") != null) {
                                altuki = rs2.getString("alto");
                                altot = rs2.getString("bajo");
                            }

                        }

                    
      out.write("\r\n");
      out.write("                    <input type='text' name='alturaMax' size='3' value='");
      out.print(altuki);
      out.write("' required>\r\n");
      out.write("\r\n");
      out.write("                    <br/>\r\n");
      out.write("                    Altura del Sensor de Piso (centímetros)<input id='Alturamin' type='range' min='0' max='2' step='0.1' />\r\n");
      out.write("\r\n");
      out.write("                    <br/><br/>\r\n");
      out.write("                    <input type='text' size='3' name='alturaMin' value='");
      out.print(altot);
      out.write("' required>\r\n");
      out.write("                    <br/>\r\n");
      out.write("                    Altura del Sensor mínima<input id='Alturamin' type='range' min='0' max='2' step='0.1' />\r\n");
      out.write("                    <br/>\r\n");
      out.write("                    <button type='submit' name='Aceptar' class ='btn btn-success'>Confirmar</button>\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    ");

                }

            }
        }
        /*                      HABITACIONES 1 Y 2
         ----------------------------------------------------------------
         ----------------------------------------------------------------
         */
        int coincidencia;
        coincidencia = 0;
        

        for (int iterator = 0; iterator < habPermitidas.length; iterator++) {
            if (habPermitidas[iterator] != null) {
                if (habPermitidas[iterator].equals(habNames[0])) {
                    coincidencia = 1;
                }
            }

        }

        if (tipoUsuario.equals("1") || coincidencia == 1) {
    
      out.write("\r\n");
      out.write("    <div id='Habitacion1' class= 'container-fluid noTePeguesArriba' >\r\n");
      out.write("        <div class='row'>\r\n");
      out.write("            <div class='page-header text-center noTePeguesArriba'>\r\n");
      out.write("                <br>\r\n");
      out.write("                <div id=\"HabName1\">\r\n");
      out.write("                    <strong>");
out.println(habNames[0]);
      out.write("</strong><br>\r\n");
      out.write("                    <button type='button' class='btn btn-success' onclick=\"javascript:showMod1();\"><i class='glyphicon glyphicon-pencil'></i></button>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div id=\"modForm1\" style=\"display:none; width: 20%; margin-left: 40%;\">\r\n");
      out.write("                    <form name=\"Names1\" action=\"changeHabName\">\r\n");
      out.write("                        <input type=\"text\" name=\"oldRoomName\" value=\"");
out.println(habNames[0]);
      out.write("\" hidden>\r\n");
      out.write("                        <input type=\"text\" class='form-control' name=\"newRoomName\" value=\"");
out.println(habNames[0]);
      out.write("\">\r\n");
      out.write("                        <button type='submit' class='btn btn-success'><i class='glyphicon glyphicon-ok'></i></button>\r\n");
      out.write("                        <button type='button' class='btn btn-danger' onclick=\"javascript:hideMod1();\"><i class='glyphicon glyphicon-remove'></i></button>\r\n");
      out.write("                    </form>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class='row'>\r\n");
      out.write("            ");

                //String correuki = (String) session.getAttribute("sessionMail");

                //cDatos datukis = new cDatos();
                datos.conectar();

                try {
                    ResultSet rs5 = datos.consulta1("call enchufeState('" + correin + "','" + habNames[0] + "');");
                    int contador = 0;

                    String[] uso = new String[4];
                    String[] nombres = new String[4];
                    while (rs5.next()) {
                        uso[contador] = rs5.getString("estatus");
                        nombres[contador] = rs5.getString("switchName");
                        contador = contador + 1;
                    }
            
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <div class=\"\">\r\n");
      out.write("                <div class=\" col-md-12 bienvenida text-center\">Luces</div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"\">\r\n");
      out.write("                <center>\r\n");
      out.write("                    <!--<section>-->\r\n");
      out.write("                    <!--<div class=\"form-group\">-->\r\n");
      out.write("                    <div class=\"page-header text-center\">\r\n");
      out.write("                        <h1>Gestión de Luces</h1>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    Enchufe 1\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[0].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff1\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe1\" onclick=\"apagaPrende1()\">\r\n");
      out.write("                                    <label for=\"Enchufe1\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[0]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[0]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff1\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe1\" onclick=\"apagaPrende1()\" checked>\r\n");
      out.write("                                    <label for=\"Enchufe1\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[0]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[0]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                    Enchufe 2\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[1].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff2\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe2\" onclick=\"apagaPrende2()\">\r\n");
      out.write("                                    <label for=\"Enchufe2\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[0]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[0]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff2\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe2\" onclick=\"apagaPrende2()\" checked>\r\n");
      out.write("                                    <label for=\"Enchufe2\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[0]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[0]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                    Enchufe 3\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[2].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff3\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe3\" onclick=\"apagaPrende3()\">\r\n");
      out.write("                                    <label for=\"Enchufe3\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[0]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[0]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff3\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe3\" onclick=\"apagaPrende3()\" checked>\r\n");
      out.write("                                    <label for=\"Enchufe3\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[0]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[0]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                    Luz Principal\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[3].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff4\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Luz\" onclick=\"apagaPrende4()\">\r\n");
      out.write("                                    <label for=\"Luz\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[0]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[0]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff4\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Luz\" onclick=\"apagaPrende4()\" checked>\r\n");
      out.write("                                    <label for=\"Luz\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[0]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[0]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                </center>\r\n");
      out.write("                <!--</section>-->\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        ");

                } catch (Exception errots) {
                    out.print(errots.getMessage());
                }
            }
            /*coincidencia = 0;
             for (int iterator = 0; iterator < habPermitidas.length; iterator++) {
             if (habPermitidas[iterator].equals(habNames[1])) {
             coincidencia = 1;
             }
             }
             //if (tipoUsuario.equals("1") || coincidencia == 1) {*/
        
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("    <div id='Habitacion2' class= 'container-fluid noTePeguesArriba' >\r\n");
      out.write("        <div class='row'>\r\n");
      out.write("            <div class='page-header text-center noTePeguesArriba'>\r\n");
      out.write("                <br>\r\n");
      out.write("                <div id=\"HabName2\">\r\n");
      out.write("                    <strong>");
out.println(habNames[1]);
      out.write("</strong><br>\r\n");
      out.write("                    <button type='button' class='btn btn-success' onclick=\"javascript:showMod2();\"><i class='glyphicon glyphicon-pencil'></i></button>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div id=\"modForm2\" style=\"display:none; width: 20%; margin-left: 40%;\">\r\n");
      out.write("                    <form name=\"Names2\" action=\"changeHabName\">\r\n");
      out.write("                        <input type=\"text\" name=\"oldRoomName\" value=\"");
out.println(habNames[1]);
      out.write("\" hidden>\r\n");
      out.write("                        <input type=\"text\" class='form-control' name=\"newRoomName\" value=\"");
out.println(habNames[1]);
      out.write("\">\r\n");
      out.write("                        <button type='submit' class='btn btn-success'><i class='glyphicon glyphicon-ok'></i></button>\r\n");
      out.write("                        <button type='button' class='btn btn-danger' onclick=\"javascript:hideMod2();\"><i class='glyphicon glyphicon-remove'></i></button>\r\n");
      out.write("                    </form>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class='row'>\r\n");
      out.write("            ");

                datos.conectar();

                try {
                    ResultSet rs5 = datos.consulta1("call enchufeState('" + correin + "','" + habNames[1] + "');");
                    int contador = 0;

                    String[] uso = new String[4];
                    String[] nombres = new String[4];
                    while (rs5.next()) {
                        uso[contador] = rs5.getString("estatus");
                        nombres[contador] = rs5.getString("switchName");
                        contador = contador + 1;
                    }
            
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <div class=\"\">\r\n");
      out.write("                <div class=\" col-md-12 bienvenida text-center\">Luces</div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"\">\r\n");
      out.write("                <center>\r\n");
      out.write("                    <!--<section>-->\r\n");
      out.write("                    <!--<div class=\"form-group\">-->\r\n");
      out.write("                    <div class=\"page-header text-center\">\r\n");
      out.write("                        <h1>Gestión de Luces</h1>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    Enchufe 1\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[0].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff5\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe5\" onclick=\"apagaPrende5()\">\r\n");
      out.write("                                    <label for=\"Enchufe5\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[1]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[1]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff5\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe5\" onclick=\"apagaPrende5()\" checked>\r\n");
      out.write("                                    <label for=\"Enchufe5\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[1]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[1]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                    Enchufe 2\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[1].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff6\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe6\" onclick=\"apagaPrende6()\">\r\n");
      out.write("                                    <label for=\"Enchufe6\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[1]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[1]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff6\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe6\" onclick=\"apagaPrende6()\" checked>\r\n");
      out.write("                                    <label for=\"Enchufe6\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[1]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[1]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                    Enchufe 3\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[2].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff7\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe7\" onclick=\"apagaPrende7()\">\r\n");
      out.write("                                    <label for=\"Enchufe7\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[1]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[1]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff7\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe7\" onclick=\"apagaPrende7()\" checked>\r\n");
      out.write("                                    <label for=\"Enchufe7\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[1]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[1]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                    Luz Principal\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[3].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff8\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Luz2\" onclick=\"apagaPrende8()\">\r\n");
      out.write("                                    <label for=\"Luz2\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[1]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[1]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff8\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Luz2\" onclick=\"apagaPrende8()\" checked>\r\n");
      out.write("                                    <label for=\"Luz2\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[1]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[1]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                </center>\r\n");
      out.write("                <!--</section>-->\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        ");

            } catch (Exception errots) {
                out.print(errots.getMessage());
            }

        
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("    ");
        /*                      HABITACIONES 3 Y 4
         ----------------------------------------------------------------
         ----------------------------------------------------------------
         */
        if (paquete.equals(
                "Pro") || paquete.equals("Platino") || paquete.equals("ProNKA") || paquete.equals("PlatinoNKA")) {
    
      out.write("\r\n");
      out.write("    <div id='Habitacion3' class= 'container-fluid noTePeguesArriba' >\r\n");
      out.write("        <div class='row'>\r\n");
      out.write("            <div class='page-header text-center noTePeguesArriba'>\r\n");
      out.write("                <br>\r\n");
      out.write("                <div id=\"HabName3\">\r\n");
      out.write("                    <strong>");
out.println(habNames[2]);
      out.write("</strong><br>\r\n");
      out.write("                    <button type='button' class='btn btn-success' onclick=\"javascript:showMod3();\"><i class='glyphicon glyphicon-pencil'></i></button>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div id=\"modForm3\" style=\"display:none; width: 20%; margin-left: 40%;\">\r\n");
      out.write("                    <form name=\"Names3\" action=\"changeHabName\">\r\n");
      out.write("                        <input type=\"text\" name=\"oldRoomName\" value=\"");
out.println(habNames[2]);
      out.write("\" hidden>\r\n");
      out.write("                        <input type=\"text\" class='form-control' name=\"newRoomName\" value=\"");
out.println(habNames[2]);
      out.write("\">\r\n");
      out.write("                        <button type='submit' class='btn btn-success'><i class='glyphicon glyphicon-ok'></i></button>\r\n");
      out.write("                        <button type='button' class='btn btn-danger' onclick=\"javascript:hideMod3();\"><i class='glyphicon glyphicon-remove'></i></button>\r\n");
      out.write("                    </form>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class='row'>\r\n");
      out.write("            ");

                datos.conectar();

                try {
                    ResultSet hab3 = datos.consulta1("call enchufeState('" + correin + "','" + habNames[2] + "');");
                    int contador = 0;

                    String[] uso = new String[4];
                    String[] nombres = new String[4];
                    while (hab3.next()) {
                        uso[contador] = hab3.getString("estatus");
                        nombres[contador] = hab3.getString("switchName");
                        contador = contador + 1;
                    }
            
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <div class=\"\">\r\n");
      out.write("                <div class=\" col-md-12 bienvenida text-center\">Luces</div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"\">\r\n");
      out.write("                <center>\r\n");
      out.write("                    <!--<section>-->\r\n");
      out.write("                    <!--<div class=\"form-group\">-->\r\n");
      out.write("                    <div class=\"page-header text-center\">\r\n");
      out.write("                        <h1>Gestión de Luces</h1>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    Enchufe 1\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[0].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff9\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe9\" onclick=\"apagaPrende9()\">\r\n");
      out.write("                                    <label for=\"Enchufe9\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[2]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[2]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff9\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe9\" onclick=\"apagaPrende9()\" checked>\r\n");
      out.write("                                    <label for=\"Enchufe9\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[2]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[2]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                    Enchufe 2\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[1].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff10\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe10\" onclick=\"apagaPrende10()\">\r\n");
      out.write("                                    <label for=\"Enchufe10\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[2]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[2]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff10\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe10\" onclick=\"apagaPrende10()\" checked>\r\n");
      out.write("                                    <label for=\"Enchufe10\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[2]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[2]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                    Enchufe 3\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[2].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff11\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe11\" onclick=\"apagaPrende11()\">\r\n");
      out.write("                                    <label for=\"Enchufe11\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[2]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[2]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff11\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe11\" onclick=\"apagaPrende11()\" checked>\r\n");
      out.write("                                    <label for=\"Enchufe11\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[2]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[2]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                    Luz Principal\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[3].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff12\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Luz3\" onclick=\"apagaPrende12()\">\r\n");
      out.write("                                    <label for=\"Luz3\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[2]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[2]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff12\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Luz3\" onclick=\"apagaPrende12()\" checked>\r\n");
      out.write("                                    <label for=\"Luz3\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[2]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[2]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                </center>\r\n");
      out.write("                <!--</section>-->\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        ");

            } catch (Exception errots) {
                out.print(errots.getMessage());
            }
        
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("    <div id='Habitacion4' class= 'container-fluid noTePeguesArriba' >\r\n");
      out.write("        <div class='row'>\r\n");
      out.write("            <div class='page-header text-center noTePeguesArriba'>\r\n");
      out.write("                <br>\r\n");
      out.write("                <div id=\"HabName4\">\r\n");
      out.write("                    <strong>");
out.println(habNames[3]);
      out.write("</strong><br>\r\n");
      out.write("                    <button type='button' class='btn btn-success' onclick=\"javascript:showMod4();\"><i class='glyphicon glyphicon-pencil'></i></button>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div id=\"modForm4\" style=\"display:none; width: 20%; margin-left: 40%;\">\r\n");
      out.write("                    <form name=\"Names4\" action=\"changeHabName\">\r\n");
      out.write("                        <input type=\"text\" name=\"oldRoomName\" value=\"");
out.println(habNames[3]);
      out.write("\" hidden>\r\n");
      out.write("                        <input type=\"text\" class='form-control' name=\"newRoomName\" value=\"");
out.println(habNames[3]);
      out.write("\">\r\n");
      out.write("                        <button type='submit' class='btn btn-success'><i class='glyphicon glyphicon-ok'></i></button>\r\n");
      out.write("                        <button type='button' class='btn btn-danger' onclick=\"javascript:hideMod4();\"><i class='glyphicon glyphicon-remove'></i></button>\r\n");
      out.write("                    </form>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class='row'>\r\n");
      out.write("            ");

                datos.conectar();

                try {
                    ResultSet hab4 = datos.consulta1("call enchufeState('" + correin + "','" + habNames[3] + "');");
                    int contador = 0;

                    String[] uso = new String[4];
                    String[] nombres = new String[4];
                    while (hab4.next()) {
                        uso[contador] = hab4.getString("estatus");
                        nombres[contador] = hab4.getString("switchName");
                        contador = contador + 1;
                    }
            
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <div class=\"\">\r\n");
      out.write("                <div class=\" col-md-12 bienvenida text-center\">Luces</div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"\">\r\n");
      out.write("                <center>\r\n");
      out.write("                    <!--<section>-->\r\n");
      out.write("                    <!--<div class=\"form-group\">-->\r\n");
      out.write("                    <div class=\"page-header text-center\">\r\n");
      out.write("                        <h1>Gestión de Luces</h1>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    Enchufe 1\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[0].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff13\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe13\" onclick=\"apagaPrende13()\">\r\n");
      out.write("                                    <label for=\"Enchufe13\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[3]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[3]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff13\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe13\" onclick=\"apagaPrende13()\" checked>\r\n");
      out.write("                                    <label for=\"Enchufe13\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[3]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[3]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                    Enchufe 2\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[1].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff14\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe14\" onclick=\"apagaPrende14()\">\r\n");
      out.write("                                    <label for=\"Enchufe14\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[3]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[3]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff14\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe10\" onclick=\"apagaPrende14()\" checked>\r\n");
      out.write("                                    <label for=\"Enchufe14\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[3]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[3]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                    Enchufe 3\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[2].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff15\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe15\" onclick=\"apagaPrende15()\">\r\n");
      out.write("                                    <label for=\"Enchufe15\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[3]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[3]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff15\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe15\" onclick=\"apagaPrende15()\" checked>\r\n");
      out.write("                                    <label for=\"Enchufe15\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[3]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[3]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                    Luz Principal\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[3].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff16\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Luz4\" onclick=\"apagaPrende16()\">\r\n");
      out.write("                                    <label for=\"Luz4\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[3]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[3]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff16\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Luz4\" onclick=\"apagaPrende16()\" checked>\r\n");
      out.write("                                    <label for=\"Luz4\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[3]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[3]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                </center>\r\n");
      out.write("                <!--</section>-->\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        ");

            } catch (Exception errots) {
                out.print(errots.getMessage());
            }
        
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("    ");

        }

        /*HABITACIONES 5 Y 6
         ------------------------------------------------------------------------------------------------------------------
         ------------------------------------------------------------------------------------------------------------------*/
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("    ");
        if (paquete.equals(
                "Platino") || paquete.equals("PlatinoNKA")) {
    
      out.write("\r\n");
      out.write("    <div id='Habitacion5' class= 'container-fluid noTePeguesArriba' >\r\n");
      out.write("        <div class='row'>\r\n");
      out.write("            <div class='page-header text-center noTePeguesArriba'>\r\n");
      out.write("                <br>\r\n");
      out.write("                <div id=\"HabName5\">\r\n");
      out.write("                    <strong>");
out.println(habNames[4]);
      out.write("</strong><br>\r\n");
      out.write("                    <button type='button' class='btn btn-success' onclick=\"javascript:showMod5();\"><i class='glyphicon glyphicon-pencil'></i></button>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div id=\"modForm5\" style=\"display:none; width: 20%; margin-left: 40%;\">\r\n");
      out.write("                    <form name=\"Names5\" action=\"changeHabName\">\r\n");
      out.write("                        <input type=\"text\" name=\"oldRoomName\" value=\"");
out.println(habNames[4]);
      out.write("\" hidden>\r\n");
      out.write("                        <input type=\"text\" class='form-control' name=\"newRoomName\" value=\"");
out.println(habNames[4]);
      out.write("\">\r\n");
      out.write("                        <button type='submit' class='btn btn-success'><i class='glyphicon glyphicon-ok'></i></button>\r\n");
      out.write("                        <button type='button' class='btn btn-danger' onclick=\"javascript:hideMod5();\"><i class='glyphicon glyphicon-remove'></i></button>\r\n");
      out.write("                    </form>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class='row'>\r\n");
      out.write("            ");

                datos.conectar();

                try {
                    ResultSet hab5 = datos.consulta1("call enchufeState('" + correin + "','" + habNames[4] + "');");
                    int contador = 0;

                    String[] uso = new String[4];
                    String[] nombres = new String[4];
                    while (hab5.next()) {
                        uso[contador] = hab5.getString("estatus");
                        nombres[contador] = hab5.getString("switchName");
                        contador = contador + 1;
                    }
            
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <div class=\"\">\r\n");
      out.write("                <div class=\" col-md-12 bienvenida text-center\">Luces</div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"\">\r\n");
      out.write("                <center>\r\n");
      out.write("                    <!--<section>-->\r\n");
      out.write("                    <!--<div class=\"form-group\">-->\r\n");
      out.write("                    <div class=\"page-header text-center\">\r\n");
      out.write("                        <h1>Gestión de Luces</h1>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    Enchufe 1\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[0].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff17\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe17\" onclick=\"apagaPrende17()\">\r\n");
      out.write("                                    <label for=\"Enchufe17\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[4]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[4]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff17\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe17\" onclick=\"apagaPrende17()\" checked>\r\n");
      out.write("                                    <label for=\"Enchufe17\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[4]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[4]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                    Enchufe 2\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[1].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff18\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe18\" onclick=\"apagaPrende18()\">\r\n");
      out.write("                                    <label for=\"Enchufe18\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[4]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[4]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff18\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe18\" onclick=\"apagaPrende18()\" checked>\r\n");
      out.write("                                    <label for=\"Enchufe18\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[4]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[4]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                    Enchufe 3\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[2].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff19\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe19\" onclick=\"apagaPrende19()\">\r\n");
      out.write("                                    <label for=\"Enchufe19\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[4]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[4]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff19\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe19\" onclick=\"apagaPrende19()\" checked>\r\n");
      out.write("                                    <label for=\"Enchufe19\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[4]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[4]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                    Luz Principal\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[3].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff20\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Luz5\" onclick=\"apagaPrende20()\">\r\n");
      out.write("                                    <label for=\"Luz5\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[4]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[4]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff20\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Luz5\" onclick=\"apagaPrende20()\" checked>\r\n");
      out.write("                                    <label for=\"Luz5\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[4]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[4]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                </center>\r\n");
      out.write("                <!--</section>-->\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        ");

            } catch (Exception errots) {
                out.print(errots.getMessage());
            }
        
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("    <div id='Habitacion6' class= 'container-fluid noTePeguesArriba' >\r\n");
      out.write("        <div class='row'>\r\n");
      out.write("            <div class='page-header text-center noTePeguesArriba'>\r\n");
      out.write("                <br>\r\n");
      out.write("                <div id=\"HabName6\">\r\n");
      out.write("                    <strong>");
out.println(habNames[5]);
      out.write("</strong><br>\r\n");
      out.write("                    <button type='button' class='btn btn-success' onclick=\"javascript:showMod6();\"><i class='glyphicon glyphicon-pencil'></i></button>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div id=\"modForm6\" style=\"display:none; width: 20%; margin-left: 40%;\">\r\n");
      out.write("                    <form name=\"Names6\" action=\"changeHabName\">\r\n");
      out.write("                        <input type=\"text\" name=\"oldRoomName\" value=\"");
out.println(habNames[5]);
      out.write("\" hidden>\r\n");
      out.write("                        <input type=\"text\" class='form-control' name=\"newRoomName\" value=\"");
out.println(habNames[5]);
      out.write("\">\r\n");
      out.write("                        <button type='submit' class='btn btn-success'><i class='glyphicon glyphicon-ok'></i></button>\r\n");
      out.write("                        <button type='button' class='btn btn-danger' onclick=\"javascript:hideMod6();\"><i class='glyphicon glyphicon-remove'></i></button>\r\n");
      out.write("                    </form>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class='row'>\r\n");
      out.write("            ");

                datos.conectar();

                try {
                    ResultSet hab6 = datos.consulta1("call enchufeState('" + correin + "','" + habNames[5] + "');");
                    int contador = 0;

                    String[] uso = new String[4];
                    String[] nombres = new String[4];
                    while (hab6.next()) {
                        uso[contador] = hab6.getString("estatus");
                        nombres[contador] = hab6.getString("switchName");
                        contador = contador + 1;
                    }
            
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <div class=\"\">\r\n");
      out.write("                <div class=\" col-md-12 bienvenida text-center\">Luces</div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"\">\r\n");
      out.write("                <center>\r\n");
      out.write("                    <!--<section>-->\r\n");
      out.write("                    <!--<div class=\"form-group\">-->\r\n");
      out.write("                    <div class=\"page-header text-center\">\r\n");
      out.write("                        <h1>Gestión de Luces</h1>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    Enchufe 1\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[0].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff21\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe21\" onclick=\"apagaPrende21()\">\r\n");
      out.write("                                    <label for=\"Enchufe21\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[5]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[5]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff21\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe21\" onclick=\"apagaPrende21()\" checked>\r\n");
      out.write("                                    <label for=\"Enchufe21\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[5]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[0] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe1\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[5]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                    Enchufe 2\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[1].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff22\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe22\" onclick=\"apagaPrende22()\">\r\n");
      out.write("                                    <label for=\"Enchufe22\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[5]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[5]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff22\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe22\" onclick=\"apagaPrende22()\" checked>\r\n");
      out.write("                                    <label for=\"Enchufe22\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[5]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[1] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe2\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[5]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                    Enchufe 3\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[2].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff23\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe23\" onclick=\"apagaPrende23()\">\r\n");
      out.write("                                    <label for=\"Enchufe23\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[5]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[5]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff23\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Enchufe23\" onclick=\"apagaPrende23()\" checked>\r\n");
      out.write("                                    <label for=\"Enchufe23\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[5]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[2] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Enchufe3\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[5]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                    Luz Principal\r\n");
      out.write("                    <br>\r\n");
      out.write("                    ");
 if (uso[3].equals("0")) {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff24\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Luz6\" onclick=\"apagaPrende24()\">\r\n");
      out.write("                                    <label for=\"Luz6\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"50\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[5]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[5]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");
 } else {
                    
      out.write("\r\n");
      out.write("                    <table style=\"width:30%\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form name=\"OnOff24\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    <input type=\"checkbox\" class=\"sliderEstilos\" id=\"Luz6\" onclick=\"apagaPrende24()\" checked>\r\n");
      out.write("                                    <label for=\"Luz6\"></label>\r\n");
      out.write("                                    <input type=\"text\" value=\"0\" name=\"Voltaje\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[5]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left:30px ; padding-top: 18px\">\r\n");
      out.write("                                <form class=\"form-horizontal\" action=\"apagadores.jsp\" method=\"post\">\r\n");
      out.write("                                    ");

                                        out.println("<input type='text' class='form-control' name='Voltaje' value='" + uso[3] + "' placeholder='Voltaje' size='30'>");
                                    
      out.write("\r\n");
      out.write("                                    <input type=\"text\" value=\"Luz\" name=\"contacto\" hidden>\r\n");
      out.write("                                    <input type=\"text\" value=\"");
out.println(habNames[5]);
      out.write("\" name=\"habit\" hidden>\r\n");
      out.write("                                    <input type=\"submit\" class=\"btn btn-warning\" value=\"Mándalo\">\r\n");
      out.write("                                </form>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("                    <br>\r\n");
      out.write("                </center>\r\n");
      out.write("                <!--</section>-->\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        ");

            } catch (Exception errots) {
                out.print(errots.getMessage());
            }
        
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("    ");

        }
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
