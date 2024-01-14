/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo_music_gen;

import Controlador.conexion;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.JdbcTemplate;
import javazoom.jl.converter.Converter;

/**
 *
 * @author Samuel
 */
public class ArchivoAudio {
    private int userId;
    private int prompy_id;
    private byte[] bytesAudio;
    private JdbcTemplate jdbcTemplate;

    public int getUserId(){
        return userId;
    }
   
    public void setUserId(int userId){
        this.userId=userId;
    }

    public byte[] getBytesAudio(){
        return bytesAudio;
    }
    
    public void setBytesAudio(byte[] bytesAudio){
        this.bytesAudio=bytesAudio;
    }

    public int getPrompy_id() {
        return prompy_id;
    }

    public void setPrompy_id(int prompy_id) {
        this.prompy_id = prompy_id;
    }
    
    public void guardarRuta(byte[] audioBytes, int userId) throws SQLException {
        String sql = "INSERT INTO Generar_IA_Musica (user_id, archivo_audio) VALUES (?, ?)";
        jdbcTemplate.update(sql, userId, audioBytes);  
    }
    
    public void crearArchivoAudio(byte[] audio){
       
        String outputFileName = "archivo.mp3";

        try {
            // Crear un archivo temporal
            File archivo = new File("D:\\Documentos\\NetBeansProjects\\BAICH\\web\\Track ready\\archivo.wav");
            // Obtenemos un objeto File para la carpeta contenedora
           
            System.out.println("Path: "+archivo.getAbsolutePath());
            // Convertir los bytes a un archivo WAV temporal
            try (FileOutputStream fos = new FileOutputStream(archivo)) {
                fos.write(audio);
                System.out.println("Archivo wav creado con éxito.");
            } catch (IOException e) {
                e.printStackTrace();
            }
            

            // Eliminar el archivo WAV temporal si es necesario
            

            System.out.println("Se ha creado el archivo MP3: " + outputFileName);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

   

    
    
}
