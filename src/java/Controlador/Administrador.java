package Controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Administrador extends Usuario {
    private String privilegio;

    public Administrador() {
        super();
    }

    public String getPrivilegio() {
        return privilegio;
    }

    public void setPrivilegio(String privilegio) {
        this.privilegio = privilegio;
    }

    public int anadirAdministrador() throws SQLException {
        int estatus = -1;
        Connection con = conexion.getConexion();
        try {
            String q = "INSERT INTO Administradores (user_id, privilegio) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, this.getId());
            ps.setString(2, this.getPrivilegio());
            estatus = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al añadir administrador");
            e.printStackTrace();
        } finally {
            con.close();
        }
        return estatus;
    }

    public int actualizarContrasena(String nuevaContrasena, int idUsuario) throws SQLException {
        int estatus = 0;
        Connection con = conexion.getConexion();
    
        try {
            String sql = "UPDATE Usuarios SET contraseña = ? WHERE user_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nuevaContrasena);
            ps.setInt(2, idUsuario);
            estatus = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al actualizar la contraseña");
            e.printStackTrace();
        } finally {
            con.close();
        }
        return estatus;
    }

    public int eliminarUsuario(int idUsuario) throws SQLException {
        int estatus = 0;
        Connection con = conexion.getConexion();
    
        try {
            String sqlAdmin = "DELETE FROM Administradores WHERE user_id = ?";
            PreparedStatement psAdmin = con.prepareStatement(sqlAdmin);
            psAdmin.setInt(1, idUsuario);
            estatus += psAdmin.executeUpdate();
    
            String sqlUser = "DELETE FROM Usuarios WHERE user_id = ?";
            PreparedStatement psUser = con.prepareStatement(sqlUser);
            psUser.setInt(1, idUsuario);
            estatus += psUser.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar el usuario");
            e.printStackTrace();
        } finally {
            con.close();
        }
        return estatus;
    }
    
}
