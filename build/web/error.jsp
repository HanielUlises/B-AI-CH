<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <link rel="stylesheet" href="mainbach/styles.css">
    </head>
    <body>
        <style>
            h1, a{
                margin-left: 3rem;
                color: white;
            }
            
        </style> 
        <div class="contenedor-principal">
            <nav class="menu">
               <div class="logo">
                  
               </div>
            </nav>
                 
        <% 
            String parametro=request.getParameter("admrs");
            if (parametro==null) {
        %>
        <h1 >Se ha presentado un error inesperado</h1>
        <a href='index.html'>Regresar</a>
        <%
            }else{
                if (parametro.equals("1")) {
        %>
        <h1>Correo o contraseña incorrectos<br><a href='nuevoingreso/sign-up-sign-in.html'>Regresar</a></h1>
        <%
                }else if(parametro.equals("2")){
        %>
        <h1>Es necesario identificarse<br><a href='index.html'>Regresar</a></h1>
        <%
                }else if(parametro.equals("3")){
        %>
        <h1>Lo sentimos, la fecha elegida y hora elegidas ya están ocupadas. Por favor, escoja otro horario</h1>
            <a href=''>Regresar</a>
        
        <%
                }else if(parametro.equals("4")){
        %>
        <h1>No se pueden hacer pedidos con productos de distintas cafeterias</h1>
            <a href='usuario/inicioUsuarios.jsp'>Regresar</a>
        <%
                }
            }
        %>
        </div>
    </body>
</html>
