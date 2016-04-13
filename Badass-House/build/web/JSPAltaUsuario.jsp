<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="BD.cDatos"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%
    String pass = "", pass1 = "";
    int result;
    String clave = "";
    String nombre = "", aPaterno = "", aMaterno = "";
    String direccion = "", correo = "", password = "", registro = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://badasshouse.net23.net/Badass-House/web/registroBasico.jsp'>";
    String index = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://badasshouse.net23.net/Badass-House/web/home.jsp'>";
    String tipoUsr = "", index1 = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://badasshouse.net23.net/Badass-House/web/index1.jsp'>", numSerie = "";
    Pattern pat1 = Pattern.compile("[^A-Za-zá-úÁ-Ú ]");
    Pattern pat = Pattern.compile("[A-Za-z0-9._%+-]+@[AZa-z0-9.-]+\\.[a-z]{2,4}$");
    String nka = "";
    Matcher mat1;
    Matcher mat2;
    Matcher mat3;
    ResultSet rs;
    String resultado = "";
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
    /*if (request.getParameter("tipoUsr").equals("")) {
     out.print("<script> alert('Ingresa un tipo usuario');</script>");
     out.print(registro);
     } else {
     tipoUsr = request.getParameter("tipoUsr");
     }*/
    if (request.getParameter("direccion").equals("")) {
        out.print("<script> alert('Ingresa la direccion!!!!');</script>");
        out.print(registro);

    } else {
        direccion = request.getParameter("direccion");
    }
    if (request.getParameter("correo1").equals("")) {
        out.print("<script> alert('Ingresa el correo!!!!');</script>");
        out.print(registro);

    } else {

        String correo1 = request.getParameter("correo1");
        Matcher mat = pat.matcher(correo1);
        if (mat.find()) {
            correo = request.getParameter("correo1");
        } else {
            out.print("<script> alert('Ingresa un correo valido!!!!');</script>");
            out.print(registro);
        }
    }
    if (request.getParameter("password1").equals("")) {
        out.print("<script> alert('Ingresa la contraseña!!!!');</script>");
        out.print(registro);

    } else {
        password = request.getParameter("password1");
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
            try {
                wsbadasshouse.WSAltaUsuario_Service service = new wsbadasshouse.WSAltaUsuario_Service();
                wsbadasshouse.WSAltaUsuario port = service.getWSAltaUsuarioPort();

                resultado = port.wsAltaUsuario(correo, pass1, numSerie, nombre, aPaterno, aMaterno, direccion);

            } catch (Exception ex) {
                // TODO handle custom exceptions here
            }

            if (resultado.equals("Usuario ya Registrado")) {
                out.print("<script> alert('Usuario ya Registrado');</script>");
                out.print(registro);
            } else {

                if (resultado.equals("ira men no existe ese numero de serie")) {
                    out.print("<script> alert('ira men no existe ese numero de serie');</script>");
                    out.print(registro);
                } else {

                    if (resultado.equals("Ingresa a tu cuenta principal para agregar una nueva cuenta")) {
                        out.print("<script> alert('Ingresa a tu cuenta principal para agregar una nueva cuenta');</script>");
                        out.print(registro);

                    } else {
                        out.print("<script> alert('Bienvenido " + nombre + "');</script>");
                        sesion.setAttribute("sessionMail", correo);
                        sesion.setAttribute("sessionName", nombre);
                        sesion.setAttribute("numSerie", numSerie);
                        sesion.setAttribute("direccion", direccion);
                        sesion.setAttribute("sessionStat", "logueado");

                        out.print(index);
                    }

                }

            }

        }

    }
%>
