package Logica;

import BD.cDatos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Despensa1", urlPatterns = {"/Despensa1"})
public class Despensa1 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            cDatos datos = new cDatos();
            String correo = (String) session.getAttribute("sessionMail");
            String codigo = "";
            String nombre = "";
            String alerta = "";
            codigo = request.getParameter("codigo");
            nombre = request.getParameter("nombre");
            alerta = request.getParameter("alerta");
            try {
                datos.conectar();
                int res;
                res = datos.modificacion1("call altadespensuki('" + correo + "','" + codigo + "','" + nombre + "','" + alerta + "');");
                if (res == 1) {
                    out.print("<script>alert('Alta Exitosa');</script>");
                    out.print("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=Despensa.jsp'>");
                } else {
                    out.print("<script>alert('Errorts');</script>");
                    out.print("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=Despensa.jsp'>");
                }
            } catch (Exception e) {
                out.print(e);
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
