/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

/**
 *
 * @author Alumno
 */
@WebServlet(name = "UsoProducto", urlPatterns = {"/UsoProducto"})
public class UsoProducto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            cDatos datos = new cDatos();
            HttpSession sesion = request.getSession();
            String correo = (String) sesion.getAttribute("sessionMail");
            String code = request.getParameter("codigo");;
            String canti = request.getParameter("Cantidad");
            String redirect = ("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=Despensa.jsp'>");
            

            try {
                datos.conectar();
                int res;
                if (canti.equals("0")|| canti.equals(null)) {
                    out.print("<script>alert('Ya no hay de eso!!');</script>");
                    out.print(redirect);
                } else {
                    res = datos.modificacion1("call UsoProducto('" + correo + "','" + code + "','" + canti + "');");
                    if (res == 1) {
                        out.print("<script>alert('Se han usado los elementos');</script>");
                        out.print(redirect);
                    } else {
                        out.print("<script>alert('Errorts');</script>");
                        out.print(redirect);
                    }
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
