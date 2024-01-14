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

    public byte[] generarCancion(String feeling, String tempo, String genre, int idUsu)  {
        
        byte[] audioBytes=null;
        try {
            
            HttpClient client = HttpClient.newHttpClient();

            String enviar=genre+" track with tempo "+tempo+" and "+feeling+" melody";

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(API_URL))
                    .header("Authorization", "Bearer " + API_TOKEN)
                    .header("Content-Type", "application/json")
                    .POST(HttpRequest.BodyPublishers.ofString(enviar))
                    .build();

            HttpResponse<byte[]> response = client.send(request, BodyHandlers.ofByteArray());

            audioBytes = response.body();
            ArchivoAudio arau=new ArchivoAudio();
            //arau.guardarRuta(audioBytes,idUsu);
            System.out.println(Arrays.toString(audioBytes));
        
        } catch (IOException ex) {
            Logger.getLogger(ControladorMusica.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InterruptedException ex) {
            Logger.getLogger(ControladorMusica.class.getName()).log(Level.SEVERE, null, ex);
        }
        return audioBytes;
    }

    public static List<ArchivoAudio> obtenerCanciones(int idUsu) throws SQLException{
        ArrayList<ArchivoAudio> lista = new ArrayList<>();
        Connection con = conexion.getConexion();
        String sql = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            sql="select * from Generar_IA_Musica where user_id=?";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            ps.setInt(1, idUsu);
            while(rs.next()){
                ArchivoAudio arau = new ArchivoAudio();
                    arau.setPrompy_id(rs.getInt(1));
                    arau.setBytesAudio(rs.getBytes(2));   
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
    private byte[] obtenerCancion(int idCancion) throws SQLException {
        byte[] cancion=null;

        // Consulta SQL
        String sql = "SELECT archivo_audio FROM Generar_IA_Musica WHERE prompt_id = ?";

        Connection con = conexion.getConexion();
        PreparedStatement pstmt = con.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        pstmt.setInt(1, idCancion);

        while (rs.next()) {
            cancion = rs.getBytes(1);
        }
        return cancion;
    }
}
