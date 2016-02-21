package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.SQLException;
import java.sql.ResultSet;

public final class miCuenta_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    String nombre = "";
    String ap = "";
    String am = "";
    ResultSet rs;
    String x = (String) session.getAttribute("sessionStat");
    String log = (String) session.getAttribute("sessionMail");
    String numSerie = (String) session.getAttribute("numSerie");
    String gologin = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/login.html'>";
    if (x.equals("logueado")) {

        try {
            BD.cDatos sql = new BD.cDatos();
            sql.conectar();
            rs = sql.consulta1("select * from usuarios where correo = '" + log + "';");

            while (rs.next()) {
                nombre = rs.getString("nombre");
                ap = rs.getString("aPaterno");
                am = rs.getString("aMaterno");
            }
        } catch (Exception xd) {
            out.println("Error: " + xd);
        }

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <link rel=\"shortcut icon\" href=\"https://cdn2.iconfinder.com/data/icons/social-messaging-productivity-1-1/128/home-512.png\">\r\n");
      out.write("        <title>Badass House Menú</title>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"BS/css/bootstrap.css\" />\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"BS/css/bootstrap-theme.css\" />\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"BS/css/bootstrap-theme.min.css\" />\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"BS/css/bootstrap.min.css\" />\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/estilos.css\" />\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"Estilos/estiloTabla.css\">\r\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js\"></script>\r\n");
      out.write("        <script src=\"BS/js/bootstrap.js\"/></script>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <style>\r\n");
      out.write("        body {\r\n");
      out.write("            background: url(\"Imagenes/fondo_menu_principal.jpg\") no-repeat fixed center;\r\n");
      out.write("            -webkit-background-size: cover;\r\n");
      out.write("            -moz-background-size: cover;\r\n");
      out.write("            -o-background-size: cover;\r\n");
      out.write("            background-size: cover;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <nav class=\"navbar navbar-default\">\r\n");
      out.write("            <div class=\"container-fluid\">\r\n");
      out.write("                <!-- Brand and toggle get grouped for better mobile display -->\r\n");
      out.write("                <div class=\"navbar-header\">\r\n");
      out.write("                    <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\" aria-expanded=\"false\">\r\n");
      out.write("                        <span class=\"sr-only\">Toggle navigation</span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                    </button>\r\n");
      out.write("                    <a class=\"navbar-brand\" href=\"index.jsp\">Badass House</a>\r\n");
      out.write("                </div>\r\n");
      out.write("                <!-- Collect the nav links, forms, and other content for toggling -->\r\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">\r\n");
      out.write("                    <ul class=\"nav navbar-nav\">\r\n");
      out.write("                        <li><a href=\"pForceClose.html\">Force Close <span class=\"sr-only\">(current)</span></a></li>\r\n");
      out.write("                        <li><a href=\"pNKA.html\">No Kids Allowed</a></li>\r\n");
      out.write("                        <li class=\"dropdown\">\r\n");
      out.write("                            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\">In da' kithcen <span class=\"caret\"></span></a>\r\n");
      out.write("                            <ul class=\"dropdown-menu\">\r\n");
      out.write("                                <li><a href=\"Despensa.jsp\">Despensa</a></li>\r\n");
      out.write("                                <li><a href=\"#\">Gas</a></li>\r\n");
      out.write("                                <li><a href=\"#\">Enchufes</a></li>\r\n");
      out.write("                                <li role=\"separator\" class=\"divider\"></li>\r\n");
      out.write("                                <li><a href=\"luces.html\">Luces</a></li>\r\n");
      out.write("                                <li role=\"separator\" class=\"divider\"></li>\r\n");
      out.write("                                <li><a href=\"#\">Algo más</a></li>\r\n");
      out.write("                            </ul>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"dropdown\">\r\n");
      out.write("                            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\">In ur wife's room<span class=\"caret\"></span></a>\r\n");
      out.write("                            <ul class=\"dropdown-menu\">\r\n");
      out.write("                                <li><a href=\"luces.html\">Luces</a></li>\r\n");
      out.write("                                <li><a href=\"#\">Enchufes</a></li>\r\n");
      out.write("                                <li><a href=\"#\">Cortinas</a></li>\r\n");
      out.write("                            </ul>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        ");
      out.write("\r\n");
      out.write("                    </ul>\r\n");
      out.write("                    <ul class=\"nav navbar-nav navbar-right\">\r\n");
      out.write("\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <form class=\"navbar-form navbar-left\" method=\"post\" action=\"Logout\" >\r\n");
      out.write("                                <input type=\"submit\" class=\"btn btn-default\" value=\"Cerrar Sesion\">\r\n");
      out.write("                            </form>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div><!-- /.navbar-collapse -->\r\n");
      out.write("            </div><!-- /.container-fluid -->\r\n");
      out.write("        </nav>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <div class=\" \">\r\n");
      out.write("            <div class=\" col-md-12 bienvenida text-center\">Configuración</div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\" \">\r\n");
      out.write("            <div class=\"col-md-6 fondoConfig noTePeguesArriba text-center\" > <!--Ajustes predeterminados-->\r\n");
      out.write("                <div class=\"page-header\">\r\n");
      out.write("                    <h1>Información general</h1>\r\n");
      out.write("                </div>\r\n");
      out.write("                <section style=\"padding-bottom: 51px\">\r\n");
      out.write("                    <br>\r\n");
      out.write("                    <form class=\"form-horizontal\" action=\"JSPConfig.jsp\" method=\"post\"><!-- Aquí van las funciones del form-->\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            \r\n");
      out.write("                            <label class=\"col-sm-4 control-label\">Cuenta: ");
      out.print(log);
      out.write("</label>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <label class=\"col-sm-4 control-label\">Nombre:</label>\r\n");
      out.write("                            <div class=\"col-sm-6\">\r\n");
      out.write("                                <input type=\"text\" class=\"form-control\" placeholder=\"Nombre\" name=\"nom\" value=\"");
      out.print(nombre);
      out.write("\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <label class=\"col-sm-4 control-label\">Apellido Paterno:</label>\r\n");
      out.write("                            <div class=\"col-sm-6\">\r\n");
      out.write("                                <input type=\"text\" class=\"form-control\" placeholder=\"Apellido Paterno\" name=\"ap\" value=\"");
      out.print(ap);
      out.write("\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <label class=\"col-sm-4 control-label\">Apellido Materno:</label>\r\n");
      out.write("                            <div class=\"col-sm-6\">\r\n");
      out.write("                                <input type=\"text\" class=\"form-control\" placeholder=\"Apellido Materno\" name=\"am\" value=\"");
      out.print(am);
      out.write("\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <!--<div class=\"form-group\">\r\n");
      out.write("                            <label class=\"col-sm-4 control-label\">Correo:</label>\r\n");
      out.write("                            <div class=\"col-sm-6\">\r\n");
      out.write("                                <input type=\"email\" class=\"form-control\" placeholder=\"nombre@dominio.com\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>-->\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <label class=\"col-sm-4 control-label\">Contraseña nueva:</label>\r\n");
      out.write("                            <div class=\"col-sm-6\">\r\n");
      out.write("                                <input type=\"password\" class=\"form-control\" placeholder=\"Contraseña nueva\" name=\"pass2\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group has-warning has-feedback\">\r\n");
      out.write("                            <label class=\"col-sm-4 control-label\">Contraseña actual: *</label>\r\n");
      out.write("                            <div class=\"col-sm-6\">\r\n");
      out.write("                                <input type=\"password\" class=\"form-control\" placeholder=\"Contraseña actual\" name=\"pass1\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <button type=\"submit\" class =\"btn btn-success\">Aceptar</button>\r\n");
      out.write("                        <button type=\"reset\" class=\"btn btn-warning\">Cancelar</button>\r\n");
      out.write("                        <br><br>\r\n");
      out.write("                        *La contraseña actual es necesaria para cualquier cambio\r\n");
      out.write("                        <input type=\"hidden\" name=\"uX\" value=\"");
      out.print(log);
      out.write("\">\r\n");
      out.write("                    </form>\r\n");
      out.write("                    <br><br><br><br>\r\n");
      out.write("                </section>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"col-md-6 fondoConfig noTePeguesArriba\">\r\n");
      out.write("            <div class=\"form-group\">\r\n");
      out.write("                <div class=\"page-header\">\r\n");
      out.write("                    <h1>Agregar una nueva Cuenta</h1>\r\n");
      out.write("                </div>\r\n");
      out.write("                <section style=\"padding-bottom: 51px\">\r\n");
      out.write("                    <form method=\"post\" action=\"JSPAltamiCuenta.jsp\">\r\n");
      out.write("\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <label>Nombre</label>\r\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"nombre\" maxlength=\"35\" onkeypress=\"return noNumeros(event)\" required >\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <label>Apellido Paterno</label>\r\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"aPaterno\" maxlength=\"35\" onkeypress=\"return noNumeros(event)\" required >\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <label>Apellido Materno</label>\r\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"aMaterno\" maxlength=\"35\" onkeypress=\"return noNumeros(event)\" required >\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <label>Tipo Usuario</label>\r\n");
      out.write("                            <select class=\"form-control\" name=\"tipoUsr\" required>\r\n");
      out.write("                                <option>Premium</option>\r\n");
      out.write("                                <option>Junior</option>\r\n");
      out.write("                            </select>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <label>Correo electrónico</label>\r\n");
      out.write("                            <input type=\"email\" class=\"form-control\" name=\"correo\" placeholder=\"nombre@dominio.com\" required pattern=\"[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$\" >\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <label>Contraseña</label>\r\n");
      out.write("                            <input type=\"password\" class=\"form-control\" name=\"password\" maxlength=\"15\" placeholder=\"15 caract&eacute;res max\" required>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <label>Contraseña de la cuenta actual:</label>\r\n");
      out.write("                            <input type=\"password\" class=\"form-control\" name=\"passwordOrig\" maxlength=\"15\" placeholder=\"15 caract&eacute;res max\" required>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <button type=\"submit\" name=\"Aceptar\" class =\"btn btn-success\">Confirmar</button>\r\n");
      out.write("\r\n");
      out.write("                        <br><br>\r\n");
      out.write("                    </form>\r\n");
      out.write("                </section>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
 } else {
        out.print(gologin);
    }

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
