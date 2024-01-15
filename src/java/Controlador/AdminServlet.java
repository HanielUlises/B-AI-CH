package Controlador;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

public class AdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String action = request.getParameter("action");
        System.out.println(action);
        int userId = Integer.parseInt(request.getParameter("userId"));
        Administrador admin = new Administrador();
        
        try {
            switch (action) {
                case "insertAdmin":
                    admin.anadirAdministrador(userId);
                    System.out.println("llega?");
                    break;
                case "deleteUser":
                    admin.eliminarUsuario(userId);
                    break;
            }
        } catch (SQLException e) {
            System.out.println("error"+e);
        }

        response.sendRedirect("ListarUsuariosSerlvet");
    }
}