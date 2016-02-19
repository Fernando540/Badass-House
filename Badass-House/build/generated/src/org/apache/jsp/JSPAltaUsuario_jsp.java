package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import BD.cDatos;
import java.sql.ResultSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class JSPAltaUsuario_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

    String pass = "", pass1 = "";
    int result;
    String clave = "";
    String nombre = "", aPaterno = "", aMaterno = "";
    String direccion = "", correo = "", password = "", registro = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/registro.html'>";
    String index = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/index.jsp'>";
    String tipoUsr = "", index1 = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/index1.jsp'>", numSerie = "";
    Pattern pat1 = Pattern.compile("[^A-Za-zá-úÁ-Ú ]");
    Pattern pat = Pattern.compile("[A-Za-z0-9._%+-]+@[AZa-z0-9.-]+\\.[a-z]{2,4}$");
    Matcher mat1;
    Matcher mat2;
    Matcher mat3;
    ResultSet rs;
    HttpSession sesion = request.getSession();

    if (request.getParameter("numSerie").equals("") || request.getParameter("numSerie").length() > 6) {
        out.print("<script> alert('Ingresa bien el numero de serie!!!!');</script>");
        out.print(registro);
    } else {
        numSerie = request.getParameter("numSerie");
    }
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
    if (request.getParameter("direccion").equals("")) {
        out.print("<script> alert('Ingresa la direccion!!!!');</script>");
        out.print(registro);

    } else {
        direccion = request.getParameter("direccion");
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
    if (request.getParameter("password").equals("")) {
        out.print("<script> alert('Ingresa la contraseña!!!!');</script>");
        out.print(registro);

    } else {
        password = request.getParameter("password");
    }
    if (correo.equals("") || nombre.equals("") || aPaterno.equals("") || direccion.equals("") || aMaterno.equals("") || password.equals("")) {
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
        } else {
            try {
                try {
                    wsbadasshouse.CifraCesar_Service service = new wsbadasshouse.CifraCesar_Service();
                    wsbadasshouse.CifraCesar port = service.getCifraCesarPort();
                    pass = port.cifrar(password);
                } catch (Exception ex) {
                    out.print(ex.getMessage());
                }

                try {
                    wsbadasshouse.CifraSha_Service service1 = new wsbadasshouse.CifraSha_Service();
                    wsbadasshouse.CifraSha port1 = service1.getCifraShaPort();

                    pass1 = port1.cifrar(pass);

                } catch (Exception exD) {
                    out.print(exD.getMessage());
                    // TODO handle custom exceptions here
                }

                cDatos conectar = new cDatos();
                conectar.conectar();
                clave = "777888222333";
                //AES_DECRYPT('contraseña','llave')<----- Para desencriptar los datos (Nombre,Apellidos,etc...)*/
                conectar.setAccion(correo, pass1, clave);
                rs = conectar.consulta();/*("call valida('" + correo + "','" + pass + "');");*/

                while (rs.next()) {
                    if (rs.getString("Estatus").equals("1")) {
                        out.print("<script> alert('Usuario ya Registrado');</script>");
                        out.print(registro);
                    } else {
                        rs = conectar.consulta1("call validaSerie('" + numSerie + "');");
                        while (rs.next()) {
                            if (rs.getString("resultado").equals("ira men no existe ese numero de serie")) {
                                System.out.println(numSerie);
                                System.out.println(rs.getString("resultado"));
                                System.out.println(rs.getString("estaduki"));
                                out.print("<script> alert('ira men no existe ese numero de serie');</script>");
                                out.print(registro);
                            } else {
                                conectar.setAccion(correo, pass1, clave, nombre, aPaterno, aMaterno);
                                result = conectar.modificacion();
                                conectar.regCasa(direccion, correo, numSerie);
                                conectar.modificacion();
                                //conectar.modificacion1("insert into usu(correo,tipo) values('" + correo + "','" + tipoUsr + "')");
                                conectar.modificacion1("call altaTipo('" + correo + "','" + tipoUsr + "');");

                                if (result == 1) {
                                    rs = conectar.consulta1("call dimeTipo('" + correo + "');");
                                    while (rs.next()) {

                                        if (rs.getString("privilegio").equals("1")) {
                                            ResultSet rs1 = conectar.consulta1("call dimePaquete('" + correo + "','Basico')");
                                            while (rs1.next()) {
                                                if (rs1.getString("pkte").equals("Basico")) {
                                                    out.print("<script> alert('Bienvenido " + nombre + "');</script>");
                                                    sesion.setAttribute("sessionMail", correo);
                                                    sesion.setAttribute("sessionName", nombre);
                                                    sesion.setAttribute("numSerie",numSerie);
                                                    sesion.setAttribute("direccion",direccion);
                                                    sesion.setAttribute("sessionStat", "logueado");
                                                    String homeBasic="<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/homeBasic-test.jsp'>";
                                                    out.print(homeBasic);
                                                }
                                            }
                                        } else {
                                            out.print("<script> alert('Bienvenido " + nombre + "');</script>");
                                            sesion.setAttribute("sessionMail", correo);
                                            sesion.setAttribute("sessionName", nombre);
                                            sesion.setAttribute("sessionStat", "logueado");
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

            } catch (SQLException e) {
                out.print(e);
            }
        }

    }

      out.write('\r');
      out.write('\n');
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
