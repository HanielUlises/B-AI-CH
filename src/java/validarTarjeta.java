/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import Controlador.Sistema;
import Controlador.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Samuel
 */
public class validarTarjeta extends HttpServlet {


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
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
          
            String numTar=request.getParameter("numTar");
            String mesTar=request.getParameter("mesTar");
            String anoTar=request.getParameter("anoTar");
            String codTar=request.getParameter("codTar");
            String nomTar=request.getParameter("nomTar");
            String idU=request.getParameter("idU");

            if(numTar==null || mesTar==null || anoTar==null || codTar==null || nomTar==null ){
                response.sendRedirect("Pago/pago.jsp?error=1");
            }else{
                Sistema sis = new Sistema();
                boolean exp = sis.validarPago(nomTar, codTar, anoTar, mesTar, numTar);
                if (exp==false) {
                    response.sendRedirect("Pago/pago.jsp?error=1");
                }else{
                    Usuario u = new Usuario();
                    int estado =u.pagarSuscripcion(idU);
                    if (estado==1) {
                        
                        response.sendRedirect("nuevoingreso/sign-up-sign-in.html");
                    }else{
                        response.sendRedirect("Pago/pago.jsp?error=1");
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

}
