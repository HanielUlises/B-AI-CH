package Modelo_music_gen;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GeneroMusicalService {

    @Autowired
    private PromptRepository promptRepository;

    public void guardarGenero(int userId, String genero) {
        promptRepository.insertarPrompt(userId, genero);
    }
}
