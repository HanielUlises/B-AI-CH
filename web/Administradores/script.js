function actualizarContrasena(userId) {
    var nuevaContrasena = prompt("Ingrese la nueva contraseña para el usuario ID " + userId);
    if (nuevaContrasena) {
        var form = document.createElement('form');
        form.method = 'post';
        form.action = 'AdminServlet';

        form.appendChild(crearInput('action', 'updatePassword'));
        form.appendChild(crearInput('userId', userId));
        form.appendChild(crearInput('newPassword', nuevaContrasena));

        document.body.appendChild(form);
        form.submit();
    }
}

function confirmarEliminar(userId) {
    if (confirm("¿Está seguro de que desea eliminar el usuario ID " + userId + "?")) {
        var form = document.createElement('form');
        form.method = 'post';
        form.action = 'AdminServlet';

        form.appendChild(crearInput('action', 'deleteUser'));
        form.appendChild(crearInput('userId', userId));

        document.body.appendChild(form);
        form.submit();
    }
}

function crearInput(name, value) {
    var input = document.createElement('input');
    input.type = 'hidden';
    input.name = name;
    input.value = value;
    return input;
}