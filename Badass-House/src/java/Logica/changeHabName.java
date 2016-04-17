/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import BD.cDatos;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ferna
 */
@WebServlet(name = "changeHabName", urlPatterns = {"/changeHabName"})
public class changeHabName extends HttpServlet {

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
            String oldRName = request.getParameter("oldRoomName");
            String newRName = request.getParameter("newRoomName");
            String redirect = "";

            try {
                datos.conectar();
                ResultSet habiNames = datos.consulta1("call habiNames('" + correo + "');");
                int itera = 0;
                String[] habNames = new String[6];
                while (habiNames.next()) {
                    habNames[itera] = habiNames.getString("habiName");
                    itera = itera + 1;
                }

                if (oldRName.equals(habNames[0])) {
                    redirect = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=home.jsp#Habitacion1'>";
                } else if (oldRName.equals(habNames[1])) {
                    redirect = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=home.jsp#Habitacion2'>";
                } else if (oldRName.equals(habNames[2])) {
                    redirect = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=home.jsp#Habitacion3'>";
                } else if (oldRName.equals(habNames[3])) {
                    redirect = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=home.jsp#Habitacion4'>";
                } else if (oldRName.equals(habNames[4])) {
                    redirect = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=home.jsp#Habitacion5'>";
                } else {
                    redirect = "<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=home.jsp#Habitacion6'>";
                }

            } catch (Exception ex) {
                out.print(ex);
            }

            try {
                int res;
                res = datos.modificacion1("call changeHabName('" + correo + "','" + oldRName + "','" + newRName + "');");
                if (res == 1) {
                    out.print(redirect);
                } else {
                    out.print("<script>alert('Errorts');</script>");
                    out.print(redirect);
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
