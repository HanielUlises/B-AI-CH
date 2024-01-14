package Controlador;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ListarUsuariosServlet")
public class ListarUsuariosServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Usuario> listaUsuarios = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = conexion.getConexion();
            String sql = "SELECT user_id, correo_electronico FROM Usuarios";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("user_id"));
                usuario.setEmail(rs.getString("correo_electronico"));
                listaUsuarios.add(usuario);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {};
            try { if (ps != null) ps.close(); } catch (Exception e) {};
            try { if (con != null) con.close(); } catch (Exception e) {};
        }

        request.setAttribute("listaUsuarios", listaUsuarios);
        request.getRequestDispatcher("../../web/Administradores/listaUsuarios.jsp").forward(request, response);
    }
}
