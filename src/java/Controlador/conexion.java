/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;
import java.sql.*;

/**
 *
 * @author Samuel
 */
public class conexion {
    
    public static Connection getConexion(){
    
        Connection con = null;
        String url, username, password;
        
        url="jdbc:mysql://localhost/BAICHDB";
        username="root";
        password="8403";
        
        try{
        
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url,username,password);
            System.out.println("Se conectó uwu");
            
        }catch(Exception e){
            System.out.println("No se conectó unu");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        
        
        return con;
    }
    
    
    
}
