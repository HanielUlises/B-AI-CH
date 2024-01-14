/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;

/**
 *
 * @author Samuel
 */
public class Usuario {
    private int id;
    private String email;
    private String password;
    private int estado;
    
    private int datosBancarios;

    public int AnadirUsuario(Usuario c) throws SQLException{
        int estatus = -1;
        try{
            Connection con = conexion.getConexion();
            
            String q1="insert into usuarios (correo_electronico,contrasena,estado_suscripcion) values (?,?,?)";
            PreparedStatement ps1 = con.prepareStatement(q1);
            ps1.setString(1, c.getEmail());
            ps1.setString(2, c.getPassword());
            ps1.setInt(3, 0);
            estatus=ps1.executeUpdate();
            System.out.println(estatus);
            con.close();
        }catch(Exception ed){
            System.out.println("Error al guardar usuario");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }
        return estatus;

    }
    public Usuario encontrarUsuario(String correo, String contr) throws SQLException{
        
        Usuario c = new Usuario ();
        Connection con = conexion.getConexion();
        
        try{

        String sql="select * from Usuarios where correo_electronico = ? and contrasena = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, correo);
        ps.setString(2, contr);
        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            c.setId(rs.getInt(1));
            c.setEmail(rs.getString(2));
            c.setPassword(rs.getString(3));
            c.setEstado(rs.getInt(4));
            break;
        }
        con.close();
        }catch(Exception e){
            con.close();
        }
        return c;
    }
    public int actualizarContrasena(String contra, int id) throws SQLException{
        int estatus = 0;
        Connection con = conexion.getConexion();
        String sql = "";
        PreparedStatement ps = null;
        try{
            sql= "update usuarios set contrasena=? where user_id =?";
            ps = con.prepareStatement(sql);
            ps.setString(1, contra);
            ps.setInt(2, id);
            estatus += ps.executeUpdate();
        }catch(Exception ed){
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }finally{
            ps.close();
            con.close();
        }
        return estatus;
    }
    public int EliminarUsuario(int id) throws SQLException{
        Connection con = null;
        PreparedStatement ps = null;
        String q=null;
        int estatus = 0;
        try{
            con = conexion.getConexion();
            q ="delete from usuarios where user_id=?";
            ps = con.prepareStatement(q);
            ps.setInt(1, id);
            estatus += ps.executeUpdate();
        }catch (Exception ed){
            System.out.println("No conecto a la tabla");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }finally{
            ps.close();
            con.close();
        }
        return estatus;   
    }
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getDatosBancarios() {
        return datosBancarios;
    }

    public void setDatosBancarios(int datosBancarios) {
        this.datosBancarios = datosBancarios;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int pagarSuscripcion(String idS) {
        int estatus = -1;
        int id = Integer.parseInt(idS);
        try{
            Connection con = conexion.getConexion();
            
            String q1="update usuarios set estado_suscripcion=? where user_id =?";
            PreparedStatement ps1 = con.prepareStatement(q1);
            ps1.setInt(1, 1);
            ps1.setInt(2, id);
            estatus=ps1.executeUpdate();
            System.out.println(estatus);
            con.close();
        }catch(SQLException ed){
            System.out.println("Error al guardar usuario");
            System.out.println(ed.getMessage());
            System.out.println(Arrays.toString(ed.getStackTrace()));
        }
        return estatus;
    }
    
    
}
