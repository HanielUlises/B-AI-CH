/* Ejemplo proveído por inference API en javascript
 * async function query(data) {
		const response = await fetch(
			"https://api-inference.huggingface.co/models/facebook/musicgen-small",
			{
				headers: { Authorization: "Bearer {API_TOKEN}" },
				method: "POST",
				body: JSON.stringify(data),
			}
		);
			const result = await response.blob();
			return result;
		}
		query({"inputs": "liquid drum and bass, atmospheric synths, airy sounds"}).then((response) => {
			// Returns a byte object of the Audio wavform. Use it directly!
		});
 */

package Modelo_music_gen;

import Controlador.conexion;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import org.json.JSONObject;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladorMusica {

    private static final String API_URL = "https://api-inference.huggingface.co/models/facebook/musicgen-small";
    private static final String API_TOKEN = "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"; 

    public byte[] generarCancion(String feeling, String tempo, String genre, int idUsu, String nombreTrack) throws SQLException  {
        
        byte[] audioBytes=null;
        try {
            
            HttpClient client = HttpClient.newHttpClient();

            String enviar=genre+" track with tempo "+tempo+" and a feeling of "+feeling;
            System.out.println("Request: "+enviar);

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(API_URL))
                    .header("Authorization", "Bearer " + API_TOKEN)
                    .header("Content-Type", "application/json")
                    .POST(HttpRequest.BodyPublishers.ofString(enviar))
                    .build();

            HttpResponse<byte[]> response = client.send(request, BodyHandlers.ofByteArray());

            audioBytes = response.body();
            ArchivoAudio arau=new ArchivoAudio();
            arau.guardarRuta(audioBytes,idUsu, nombreTrack);
            System.out.println(Arrays.toString(audioBytes));
        
        } catch (IOException ex) {
            Logger.getLogger(ControladorMusica.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InterruptedException ex) {
            Logger.getLogger(ControladorMusica.class.getName()).log(Level.SEVERE, null, ex);
        }
        return audioBytes;
    }

    public List<ArchivoAudio> obtenerCanciones(int idUsu) throws SQLException{
        ArrayList<ArchivoAudio> lista = new ArrayList<>();
        Connection con = conexion.getConexion();
        String sql = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            sql="select * from Generar_IA_Musica where user_id=?";
            ps = con.prepareStatement(sql);
            
            ps.setInt(1, idUsu);
            rs = ps.executeQuery();
            while(rs.next()){
                ArchivoAudio arau = new ArchivoAudio();
                    arau.setPrompy_id(rs.getInt(1));
                    arau.setBytesAudio(rs.getBytes(3));   
                    arau.setNombreTrack(rs.getString(4));
                lista.add(arau);
            }
        }catch(Exception ed){
            System.out.println("Sí tiene error");
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }finally{
            rs.close();
            ps.close();
            con.close();
        }
        return lista;        
    }
    public byte[] obtenerCancion(int idCancion) throws SQLException {
        byte[] cancion=null;
System.out.println(idCancion);
        // Consulta SQL
        String sql = "SELECT archivo_audio FROM Generar_IA_Musica WHERE prompt_id = ?";
        
        Connection con = conexion.getConexion();
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, idCancion);
        ResultSet rs = pstmt.executeQuery();
        

        while (rs.next()) {
            cancion = rs.getBytes(1);
        }
        return cancion;
    }
}
