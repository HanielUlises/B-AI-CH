import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PromptService {

    @Autowired
    private PromptRepository promptRepository;

    public void guardarPrompt(int userId, String textoPrompt) {
        promptRepository.insertarPrompt(userId, textoPrompt);
    }
}
