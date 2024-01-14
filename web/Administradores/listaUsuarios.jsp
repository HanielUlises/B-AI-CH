<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Controlador.Usuario" %>
<html>
<head>
    <title>User List</title>
</head>
<body>
    <h1>User List</h1>
    <table border="1">
        <tr>
            <th>User ID</th>
            <th>Email</th>
        </tr>
        <% 
            List<Usuario> usuarios = (List<Usuario>) request.getAttribute("listaUsuarios");
            for (Usuario usuario : usuarios) {
        %>
        <tr>
            <td><%= usuario.getId() %></td>
            <td><%= usuario.getEmail() %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>