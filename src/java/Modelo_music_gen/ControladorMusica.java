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

public class ControladorMusica {

    private static final String API_URL = "https://api-inference.huggingface.co/models/facebook/musicgen-small";
    private static final String API_TOKEN = "..."; 

    public static void generarCancion() {
        try {
            String prompt = promptRecupBD();

            HttpClient client = HttpClient.newHttpClient();

            JSONObject json = new JSONObject();
            json.put("inputs", prompt);

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(API_URL))
                    .header("Authorization", "Bearer " + API_TOKEN)
                    .header("Content-Type", "application/json")
                    .POST(HttpRequest.BodyPublishers.ofString(json.toString()))
                    .build();

            HttpResponse<byte[]> response = client.send(request, BodyHandlers.ofByteArray());

            byte[] audioBytes = response.body();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static String promptRecupBD() throws SQLException {
        String prompt = "";

        // Consulta SQL
        String sql = "SELECT texto_prompt FROM Prompts_IA_Musica WHERE ...";

        Connection con = conexion.getConexion();
        PreparedStatement pstmt = con.prepareStatement(sql);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    prompt = rs.getString("texto_prompt");
                }
            }catch (Exception e) {
                e.printStackTrace();
            }
        
        return prompt;
    }
}
