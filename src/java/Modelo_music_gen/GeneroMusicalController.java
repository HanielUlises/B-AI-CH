@RestController
public class GeneroMusicalController {

    @Autowired
    private GeneroMusicalService generoMusicalService;

    @PostMapping("/api/guardar-genero")
    public ResponseEntity<?> guardarGenero(@RequestBody Map<String, String> datos) {
        String genero = datos.get("genero");
        generoMusicalService.guardarGenero(111,genero);
        return ResponseEntity.ok().build();
    }
}