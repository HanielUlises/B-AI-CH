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

function mostrarReportes() {
    const reportContainer = document.querySelector('#reportContainer');
    
    
    reportContainer.innerHTML = '<h2>Reportes:</h2><p>Reporte 1: ...</p><p>Reporte 2: ...</p>';
}


function borrarUsuario(userId) {
   
    usuarios = usuarios.filter(usuario => usuario.id !== userId);
   
    console.log(`Usuario con ID ${userId} borrado.`);
    llenarTabla();

}


llenarTabla();
