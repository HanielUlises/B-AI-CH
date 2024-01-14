package Modelo_music_gen;

import org.springframework.jdbc.core.JdbcTemplate;

public class PromptRequest {
    private int userId;
    private String textoPrompt;
    private JdbcTemplate jdbcTemplate;

    public void insertarPrompt(int userId, String textoPrompt) {
        String sql = "INSERT INTO Prompts_IA_Musica (user_id, texto_prompt) VALUES (?, ?)";
        jdbcTemplate.update(sql, userId, textoPrompt);
    }
    public int getUserId(){
        return userId;
    }

    public String getTextoPrompt(){
        return textoPrompt;
    }
}