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
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import org.json.JSONObject;

public class HuggingfaceAPIExample {

    private static final String API_URL = "https://api-inference.huggingface.co/models/facebook/musicgen-small";
    private static final String API_TOKEN = "...";

    public static void main(String[] args) {
        try {
            HttpClient client = HttpClient.newHttpClient();

            // Cuerpo de la petición
            JSONObject json = new JSONObject();
            json.put("inputs", "liquid drum and bass, atmospheric synths, airy sounds");

            // Llamada a petición
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
}