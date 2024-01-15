/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import Controlador.Administrador;
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
public class iniciarSesion extends HttpServlet {

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
            String noms, cons;
            noms=request.getParameter("mailin");
            cons=request.getParameter("contrain");
            
            try{
                Usuario opc = new Usuario();
                Usuario c = opc.encontrarUsuario(noms, cons);
                
                System.out.println("aaaaaaaaa"+c.getEmail());
                if (c.getEmail()==null) {
                    response.sendRedirect("error.html");
                }else{
                    Administrador a = Administrador.encontrarAdministrador(c.getId());
                    System.out.println(a.getId());
                    if (a.getId()!=0) {
                        
                        HttpSession sesion = request.getSession(true);
                        sesion.setAttribute("usuario", a);
                        HttpSession sesionOK = request.getSession();
                        sesionOK.setAttribute("id", a.getId());
                        sesionOK.setAttribute("permisos", "1");
                        response.sendRedirect("ListarUsuariosSerlvet");
                    }else{
                        HttpSession sesion = request.getSession(true);
                        sesion.setAttribute("usuario", c);
                        HttpSession sesionOK = request.getSession();
                        sesionOK.setAttribute("id", c.getId());
                        sesionOK.setAttribute("email", noms);
                        sesionOK.setAttribute("contra", cons);
                        sesionOK.setAttribute("estado", c.getEstado());
                        response.sendRedirect("mainbach/main.jsp");
                    }
                    
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
                System.out.println("Jajja");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            }
            
        }
        
    }
}
