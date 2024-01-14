package Modelo_music_gen;
public class PromptRequest {
    private static int userId;
    private static String textoPrompt;

    public static int getUserId(){
        return userId;
    }

    public static String getTextoPrompt(){
        return textoPrompt;
    }
}