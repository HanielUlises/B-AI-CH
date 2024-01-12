/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import Controlador.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Samuel
 */
public class resetearContrasena extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int nivel=0;
            String oldcontra, newcontra;
            HttpSession sessionOk = request.getSession();
            String oldcontracomp = (String)sessionOk.getAttribute("contra");
            oldcontra= request.getParameter("old-password");
            if (!oldcontra.equals(oldcontracomp)) {
                response.sendRedirect("Settings/Settings.jsp?param=0");
            }else{
                newcontra=request.getParameter("new-password");
                int id = (Integer)sessionOk.getAttribute("id");

                try{
                    Usuario opc = new Usuario();
                    int estatus = opc.actualizarContrasena(newcontra,id);
                    if (estatus==1) {

                        
                        sessionOk.setAttribute("contra", newcontra);
                        response.sendRedirect("Settings/Settings.jsp?param=1");
                    }else{
                        response.sendRedirect("error.html");
                    }
            
                    /*
                HttpSession sesion = request.getSession(true);
                sesion.setAttribute("usuario", c);
                HttpSession sesionOK = request.getSession();
                sesionOK.setAttribute("usuario", noms);
                sesionOK.setAttribute("privilegio", privS);
                response.sendRedirect("administradorGeneral/administrarUsuarios.jsp");
                    */
                   
                
                }catch(Exception e){
                    System.out.println("Que pedo que pedo");
                    System.out.println(e.getMessage());
                    System.out.println(e.getStackTrace());
                }
            }
        }
        
    }
}
