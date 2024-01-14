/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import Modelo_music_gen.ArchivoAudio;
import Modelo_music_gen.ControladorMusica;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Samuel
 */
public class generar_cancion extends HttpServlet {

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
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        
        String feeling = request.getParameter("feeling");
        String genre = request.getParameter("gender");
        String tempo = request.getParameter("tempo");
       
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "<head>\n" +
                "<meta charset=\"UTF-8\">\n" +
                "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "<title>Waiting for track</title>\n" +
                "<link rel=\"stylesheet\" href=\"Reloj/styles.css\">\n" +
                "</head>\n" +
                "<body>\n" +
                    "<div class=\"gender-container\">\n" +
                    "<div class=\"header-gender\">\n" +
                    "<h1>Please wait while your track <br>\n" +
                    "      is being generated</h1>\n" +
                    "</div>\n" +
                    "<div id=hourglassBox title=\"Compatible Chr/Op, FF, IE\"></div>\n" +
                "</div>\n" +
            "</body>\n" +
            "</html>");
            try {
                Thread.sleep(1000);
                ControladorMusica controla = new ControladorMusica();
                HttpSession session = request.getSession();
                int idUsu = (Integer)session.getAttribute("id");
                System.out.println("aasdddddddddddddddsadasdasd");
                byte[] ab=controla.generarCancion(feeling, tempo, genre, idUsu);
                System.out.println("este es ab: "+Arrays.toString(ab));
                if (ab!=null) {
                    ArchivoAudio arau = new ArchivoAudio();
                    arau.crearArchivoAudio(ab);            
                    response.sendRedirect("Track ready/trackready.jsp");
                }else{
                    response.sendRedirect("error.jsp");
                }
            } catch (InterruptedException ex) {
                Logger.getLogger(generar_cancion.class.getName()).log(Level.SEVERE, null, ex);
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

}
