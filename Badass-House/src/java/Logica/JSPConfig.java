package Logica;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "JSPConfig", urlPatterns = {"/JSPConfig"})
public class JSPConfig extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession sesion = request.getSession();
            String correo = "";
            String nombre = "";
            String ap = "";
            String am = "";
            String opass = "";
            String npass = "";
            String conf = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/home.jsp#miCuenta'>";
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
            String gologin = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=http://localhost:8080/BadassHouse/login.html'>";

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
            try {
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
            } catch (SQLException e) {

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
