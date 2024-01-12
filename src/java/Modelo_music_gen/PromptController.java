import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PromptController {

    @Autowired
    private PromptService promptService;

    @PostMapping("/api/guardar-prompt")
    public ResponseEntity<?> guardarPrompt(@RequestBody PromptRequest promptRequest) {
        promptService.guardarPrompt(promptRequest.getUserId(), promptRequest.getTextoPrompt());
        return ResponseEntity.ok().build();
    }
}
