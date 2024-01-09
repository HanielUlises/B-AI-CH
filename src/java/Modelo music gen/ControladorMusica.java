import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

@RestController
public class ControladorMusica {

    @PostMapping("/generate")
    public String generateMusic(@RequestBody String prompt) {
        final String uri = "https://api.huggingface.co/models/facebook/musicgen-small";
        
        RestTemplate restTemplate = new RestTemplate();
        
        String requestJson = "{\"prompt\":\"" + prompt + "\"}";
        
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        
        HttpEntity<String> entity = new HttpEntity<String>(requestJson,headers);
        String result = restTemplate.postForObject(uri, entity, String.class);
        
        return result;
    }
}
