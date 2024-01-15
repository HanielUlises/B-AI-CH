<%-- 
    Document   : admins.jsp
    Created on : 14 ene. 2024, 13:20:11
    Author     : Samuel
--%>

<%@page import="java.util.List"%>
<%@page import="Controlador.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Controlador.Usuario" %>
<%

HttpSession sessionOk = request.getSession();
String permiso = (String)sessionOk.getAttribute("permisos");
if(sessionOk.getAttribute("id")==null || permiso!="1"){
    response.sendRedirect("../error.jsp?admrs=2");  
}else{
    int id = (Integer)session.getAttribute("id");
  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <script src="script.js"></script>
    <link rel="stylesheet" href="admin-styles.css">
    <style>
    body {
    font-family: Arial, sans-serif;
    background-color: #1d1d1d;
    margin: 0;
    padding: 0;
    color: white;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
}

h1 {
    margin-bottom: 20px;
}

.form-container, .change-password, .delete-user,.userList {
    background-color: #333;
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
    width: 70%;
    max-width: 500px;
}

input[type="number"],
input[type="password"] {
    width: calc(100% - 22px);
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #555;
    background-color: #222;
    color: white;
    border-radius: 4px;
}

button {
    background-color: #D65882;
    color: black;
    padding: 10px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1rem;
    transition: background-color 0.3s, color 0.3s;
    width: 100%;
}

button:hover {
    background-color: #bb4768;
    color: white;
}

a {
    color: #D65882;
    text-decoration: none;
    padding: 5px 10px;
    display: inline-block; 
    border-radius: 4px;
}

a:hover {
    text-decoration: underline;
}
table {
    border-collapse: collapse;
    width: 80%;
    margin: 20px auto;
}

th, td {
    border: 1px solid black;
    padding: 8px;
    text-align: left;
}

th {
    background-color: black;
    
}
#reportContainer {
    margin: 20px auto;
}

.headerbach {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    text-decoration: none;
    max-width: 200%;
    height: 95px;
    font-family: Arial, sans-serif;
    text-decoration: none;
    color: white;
    padding: 0px 50px;
}


.logo {
    display: flex;
    background-image: url(logo.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    width: 78px;
    height: 78px;
}

.h1-logo {
    padding-top: 2px;
    font-size: 40px;
    color: white;
    font-weight: bold;
}

#back-button {
    height: 40%;
    width: 100%;
    background-color: #1d1d1d;
    padding: 0;
    margin: 0;
    border-radius: 15px;
    color: #D65882;
    border: 1px solid #D65882;
    cursor: pointer;
    text-align: center;
    align-items: center;
    justify-content: center;
    transition: 0.3s;
}

 #back-button a{
    text-decoration: none;
    color: #D65882;
 }

#back-button:hover {
    transition: 0.9s;
    background-color: white;
    border: 2px solid #D65882;
}


.report-container {
    background-color: #D65882;
    color: white;
    max-width: 500px;
    margin: auto;
    padding: 20px;
    border-radius: 8px;
}

.header-report {
    display: flex;
    align-items: center;
    justify-content: center;
}

.header-report a{
    
    text-decoration: none;
    color: white;
}

.report-container button{
    background: orange;
   border-top: none;
   border-left: none;
   border-right: 5px solid yellow;
   border-bottom: 5px solid yellow ; 
 
   color: white;
   font-size: 0.9rem;
   font-weight: 800;
   text-align: center;
   width: 100%;
   height: 50px;
   border-radius: 40px;
   cursor: pointer;
   transition: all 0.8s ease;
 }
  
 
 button:hover{
     transform: scale(1.1);
     box-shadow: 0 12px 18px rgba(0, 0, 0, 0.15); 
 }


</style>
</head>
<body>
        <div class="headerbach">
            <a href="cerrarSesion">
        <button id="back-button">
            <h1>Cerrar Sesion</h1>
        </button>
                </a>
      </div>
    <h1>Admin Dashboard</h1>
    <div class = "change-password">
        <form action="AdminServlet" method="post">
            <input type="hidden" name="action" value="insertAdmin">
            <input type="number" name="userId" placeholder="User ID" required>
            <button type="submit" onclick="alert('Adminitrador agregado')">Update to Admin</button>
        </form>
    </div>
    <div class="delete-user">
        <form action="AdminServlet" method="post">
            <input type="hidden" name="action" value="deleteUser">
            <input type="number" name="userId" placeholder="User ID" required>
            <button type="submit" onclick="alert('Usuario Eliminado')">Delete User</button>
        </form>
    </div>
    <div class="userList">
    <%
    List<Usuario> usuarios = (List<Usuario>) request.getAttribute("listaUsuarios");
    if (usuarios!=null) {   
        
    %>
    <table border="1">
        <tr>
            <th>User ID</th>
            <th>Email</th>
        </tr>
        <% 
            for (Usuario usuario : usuarios) {
        %>
        <tr>
            <td><%= usuario.getId() %></td>
            <td><%= usuario.getEmail() %></td>
        </tr>
        <% } %>
    </table>
    <%
    }
    %>
    </div>
</body>
<script>
    unction actualizarContrasena(userId) {
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

</script>
</html>
<%
    }
%>
