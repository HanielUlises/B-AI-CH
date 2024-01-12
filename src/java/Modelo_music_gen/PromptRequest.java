public class PromptRequest {
    private int userId;
    private String textoPrompt;

    public static int getUserId(){
        return userId;
    }

    public static String getPrompt(){
        return textoPrompt;
    }
}