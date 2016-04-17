<%@page import="java.util.regex.Matcher"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="BD.cDatos"%>
<%@page import="java.util.regex.Pattern"%>
<%
    String clave = "";
    String correo = "";
    String password = "";
    String pass = "";
    String pass1 = "";
    String resultado = "";
    String login = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=login.html'>";
    String index = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=home.jsp'>";
    String index1 = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=index1.jsp'>";
    cDatos bD = new cDatos();
    ResultSet rs;
    HttpSession sesion = request.getSession();

    correo = request.getParameter("usuario");
    password = request.getParameter("password");
    if (correo.equals("") || password.equals("")) {
        out.print("<script> alert('Ingresa tus datos!!!!');</script>");
        out.print(login);

    } else {
        Pattern pat = Pattern.compile("[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[a-z]{2,4}$");
        String correo1 = request.getParameter("usuario");
        Matcher mat = pat.matcher(correo1);
        if (mat.find()) {
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
            }

            try {
                wsbadasshouse.WSLogin_Service service = new wsbadasshouse.WSLogin_Service();
                wsbadasshouse.WSLogin port = service.getWSLoginPort();

                resultado = port.wsLogin(correo, pass1);
                 
            } catch (Exception ex) {
            }

            if (resultado.equals("invalido") || resultado.equals("")) {
                out.print("<script> alert('Usuario Invalido');</script>");
                out.print(login);

            } else {
                out.print("<script> alert('Bienvenido " + resultado + "');</script>");
                sesion.setAttribute("sessionMail", correo);
                sesion.setAttribute("sessionName", resultado);
                sesion.setAttribute("sessionStat", "logueado");
                sesion.setMaxInactiveInterval(40 * 60);

                out.print(index);

            }

        } else {
            out.print("<script> alert('Ingresa un correo valido!!!!');</script>");
            out.print(login);
        }
    }

%>

