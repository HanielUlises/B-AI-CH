package Controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

    public int anadirAdministrador(int id) throws SQLException {
        int estatus = -1;
        Connection con = conexion.getConexion();
        System.out.println("ese we");
        try {
            String q = "INSERT INTO Administradores (user_id) VALUES (?)";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, id);
            estatus = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al añadir administrador");
            e.printStackTrace();
        } finally {
            con.close();
        }
        return estatus;
    }

    public static Administrador encontrarAdministrador(int idUsuario) throws SQLException {

        Connection con = conexion.getConexion();
        Administrador a = new Administrador();
    
        try {
            String sql = "Select * from Administradores WHERE user_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idUsuario);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                a.setId(rs.getInt(1));

                break;
            }
            con.close();
        } catch (SQLException e) {
            System.out.println("Error al actualizar la contraseña");
            e.printStackTrace();
        } finally {
            con.close();
        }
        return a;
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
