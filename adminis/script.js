// Datos de ejemplo de usuarios
let usuarios = [
    { id: 1, nombre: 'Usuario 1', email: 'usuario1@gmail.com' },
    { id: 2, nombre: 'Usuario 2', email: 'usuario2@gmail.com' },
   
];


function llenarTabla() {
    const tbody = document.querySelector('#userTable tbody');
    tbody.innerHTML = ''; 

    usuarios.forEach(usuario => {
        const row = document.createElement('tr');
        row.innerHTML = `<td>${usuario.id}</td><td>${usuario.nombre}</td><td>${usuario.email}</td><td><button onclick="borrarUsuario(${usuario.id})">Borrar</button></td>`;
        tbody.appendChild(row);
    });
}

function toggleReportes() {
    const reportContainer = document.querySelector('#reportContainer');
    const toggleButton = document.querySelector('#toggleReportButton');

    
    if (reportContainer.style.display === 'none' || reportContainer.style.display === '') {
        // Mostrar reportes
        reportContainer.style.display = 'block';
        toggleButton.textContent = 'Ocultar Reportes';
        mostrarReportes();
    } else {
        // Ocultar reportes
        reportContainer.style.display = 'none';
        toggleButton.textContent = 'Mostrar Reportes';
    }
}


function mostrarReportes() {
    const reportContainer = document.querySelector('#reportContainer');
        
        if (usuariosBorrados.length > 0) {
        
            let tableHtml = '<h2>Reportes:</h2><table><thead><tr><th>ID Usuario Borrado</th><th>Reason</th><th>Feedback</th></tr></thead><tbody>';
    
        
            usuariosBorrados.forEach(userId => {
        
                tableHtml += `<tr><td>${userId}</td><td>Info reason</td><td>Info feedback</td></tr>`;
            });
    
       
            tableHtml += '</tbody></table>';
    
       
            reportContainer.innerHTML = tableHtml;
        } else {
       
            reportContainer.innerHTML = '<p>No hay usuarios borrados.</p>';
        }
    
    
}


function borrarUsuario(userId) {
   
    usuarios = usuarios.filter(usuario => usuario.id !== userId);
    usuariosBorrados.push(userId);
    console.log(`Usuario con ID ${userId} borrado.`);
    llenarTabla();

}
let usuariosBorrados = [];

llenarTabla();
