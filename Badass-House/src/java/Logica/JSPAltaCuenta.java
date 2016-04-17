package Logica;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "JSPAltaCuenta", urlPatterns = {"/JSPAltaCuenta"})
public class JSPAltaCuenta extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String pass = "", pass1 = "", passOrig1 = "", passOrig2 = "";
            String clave = "", mail = "";
            String nombre = "", aPaterno = "", aMaterno = "";
            String direccion = "", correo = "", password = "";
            String registro = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=home.jsp#miCuenta'>";
            mail = (String) session.getAttribute("sessionMail");

            String tipoUsr = "", numSerie = "", passOrig = "";
            Pattern pat1 = Pattern.compile("[^A-Za-zá-úÁ-Ú ]");
            Pattern pat = Pattern.compile("[A-Za-z0-9._%+-]+@[AZa-z0-9.-]+\\.[a-z]{2,4}$");

            Matcher mat1;
            Matcher mat2;
            Matcher mat3;
            ResultSet rs;

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
            if (request.getParameter("passwordOrig").equals("")) {
                out.print("<script> alert('La contraseña de la cuenta original es necesaria!!!!');</script>");
                out.print(registro);
            } else {
                passOrig = request.getParameter("passwordOrig");
            }
            if (correo.equals("") || nombre.equals("") || aPaterno.equals("") || aMaterno.equals("") || password.equals("")) {
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

                    /*Cifrando pass de la cuenta principal*/
                    try {
                        wsbadasshouse.CifraCesar_Service service = new wsbadasshouse.CifraCesar_Service();
                        wsbadasshouse.CifraCesar port = service.getCifraCesarPort();
                        passOrig1 = port.cifrar(passOrig);
                    } catch (Exception ex) {
                        out.print(ex.getMessage());
                    }

                    try {
                        wsbadasshouse.CifraSha_Service service = new wsbadasshouse.CifraSha_Service();
                        wsbadasshouse.CifraSha port = service.getCifraShaPort();

                        passOrig2 = port.cifrar(passOrig1);

                    } catch (Exception exD) {
                        out.print(exD.getMessage());
                    }


                    /*Cifrando pass de la cuenta principal*/
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

                    BD.cDatos conectar = new BD.cDatos();
                    try {
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
                                ResultSet rs1 = conectar.consulta1("call validaSerie('" + numSerie + "');");
                                while (rs1.next()) {
                                    if (rs1.getString("resultado").equals("ira men no existe ese numero de serie")) {
                                        

                                        out.print("<script> alert('ira men no existe ese numero de serie');</script>");
                                        out.print(registro);
                                    } else {

                                        rs = conectar.consulta1("call altaUsu('" + numSerie + "','" + correo + "',AES_Encrypt('" + pass1 + "','" + clave + "'),'" + nombre + "','" + aPaterno + "','" + aMaterno + "','" + tipoUsr + "','" + mail + "',AES_Encrypt('" + passOrig2 + "','" + clave + "'));");
                                        while (rs.next()) {
                                            if (rs.getString("msj").equals("contra invalida")) {
                                                out.print("<script> alert('Contraseña de la cuenta invalida');</script>");
                                                out.print(registro);
                                            } else {
                                                out.print("<script> alert('Usuario registrado');</script>");
                                                out.print(registro);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } catch (SQLException e) {

                    }
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
