
var btn = document.getElementById("myBtn");
var dropdownContent = document.getElementById("myDropdown");

//Mneú
btn.addEventListener("click", function() {
    event.stopPropagation();

    // Alternar la visibilidad del menú desplegable
    dropdownContent.style.display = dropdownContent.style.display === "block" ? "none" : "block"; 
   
});

document.addEventListener("click", function(event) {
    if (dropdownContent.style.display === "block" && !dropdownContent.contains(event.target) && !btn.contains(event.target)) {
        dropdownContent.style.display = "none";
    }
});


//Imagenes
var imageUrls = [
    '6.png','7.png','8.png','newpro.png','fondo.png'
];


//Nuevos proyectos
document.getElementById('newproject').addEventListener('click', function() {
    
    var container = document.getElementById('projectcont');
    
    var newProjectCard = document.createElement('div');
    newProjectCard.className = 'project-card';

    var randomImageUrl = imageUrls[Math.floor(Math.random() * imageUrls.length)];

    newProjectCard.innerHTML = `
       
        <img src="${randomImageUrl}" alt="Project Image">
        <a href="#"><span>New Project</span></a>

    `;

    container.appendChild(newProjectCard);
});



// Obtén el modal
var modal = document.getElementById("premiumModal");

// Obtén el botón que abre el modal
var btn = document.getElementById("upgradeBtn");

// Obtén el elemento <span> que cierra el modal
var span = document.getElementsByClassName("close")[0];

// Cuando el usuario hace clic en el botón, abre el modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// Cuando el usuario hace clic en <span> (x), cierra el modal
span.onclick = function() {
    modal.style.display = "none";
}

// Cuando el usuario hace clic en cualquier lugar fuera del modal, cierra el modal
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
