package Modelo_music_gen;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GeneroMusicalController {

    @Autowired
    private GeneroMusicalService generoMusicalService;

    @PostMapping("/api/guardar-feeling")
    public ResponseEntity<?> guardarGenero(@RequestBody Map<String, String> datos) {
        String genero = datos.get("genero");
        generoMusicalService.guardarGenero(111,genero);
        return ResponseEntity.ok().build();
    }
}