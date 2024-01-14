package Controlador;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int userId = Integer.parseInt(request.getParameter("userId"));
        Administrador admin = new Administrador();
        
        try {
            switch (action) {
                case "updatePassword":
                    String newPassword = request.getParameter("newPassword");
                    admin.actualizarContrasena(newPassword, userId);
                    break;
                case "deleteUser":
                    admin.eliminarUsuario(userId);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("admins.html");
    }
}