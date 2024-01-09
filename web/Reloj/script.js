function animarRelojDeArena() {
    var parteSuperior = document.getElementById('parteSuperior');
    var parteInferior = document.getElementById('parteInferior');

    // Invertir la escala en Y para simular el flujo de la arena
    parteSuperior.style.transform = 'scaleY(0)';
    parteInferior.style.transform = 'scaleY(1)';

    // Reiniciar la animación cada 10 segundos
    setTimeout(function() {
        parteSuperior.style.transform = '';
        parteInferior.style.transform = '';
    }, 5000);
}

// Iniciar la animación
setInterval(animarRelojDeArena, 1000);
