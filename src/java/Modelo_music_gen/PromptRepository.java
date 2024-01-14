package Modelo_music_gen;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PromptRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void insertarPrompt(int userId, String textoPrompt) {
        String sql = "INSERT INTO Prompts_IA_Musica (user_id, texto_prompt) VALUES (?, ?)";
        jdbcTemplate.update(sql, userId, textoPrompt);
    }
}