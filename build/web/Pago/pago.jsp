<%-- 
    Document   : main
    Created on : 9 ene. 2024, 00:50:44
    Author     : Samuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controlador.Usuario"%>
<%
int id=0;
String usuario="";
String contrasena="";
HttpSession sessionOk = request.getSession();
if(sessionOk.getAttribute("id")==null){
    response.sendRedirect("../error.jsp?admrs=2");  
}else{
    usuario = (String)sessionOk.getAttribute("email");
    contrasena = (String)sessionOk.getAttribute("contra");
    id = (Integer)session.getAttribute("id");
    int estado = (Integer)session.getAttribute("estado");

    if (estado==0) {
    
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>B(AI)CH</title>
    <link rel="stylesheet" href="styles.css">
</head>
    <body>
    <header class="top-bar">
        <div class="headerbach"><a href="">
                <div class="logo"></div>
            </a>
            <a href="">
                <h1 class="h1-logo">BAICH</h1>
            </a>
        </div>
        <div class="profile-area">
            <p><%=usuario%></p>
            <img src="perfil.png" alt="Perfil" class="profile-icon">
        </div>

        <div class="dropdown">
            <button class="dropbtn" id="myBtn">▼</button>
            <div class="dropdown-content" id="myDropdown">
                <p class="pcontent">Signed in as</p>
                <p class="pmail"><%=usuario%></p>
                <div class="linea-texto">
                </div>

                <button><a href="../Settings/Settings.jsp">Settings </a></button>
                <div class="linea-texto">
                </div>
                <button><a href="../cerrarSesion">Sing out</a></button>
            </div>
        </div>
    </header>


    <div class="contenido">
    <div class="centro">
    <h1 style="color: white;">Confirmación de tarjeta</h1>
    <div class="color2">
        <div class="margen">
        <form name="tarjeta" action="../validarTarjeta">
            
            <input type="hidden" id="idU" name="idU" value="<%=id%>"/><br>
            <label for="numeroT">Numero de Tarjeta</label><br>
            <input type="text" id="numeroT" name="numTar"/><br>
            <br>
            <label>Fecha de vencimiento</label><br>
            <input type="text" name="mesTar" placeholder="Mes"/><br>
            <input type="text" name="anoTar" placeholder="Año"/><br>
            <input type="text" name="codTar" placeholder="CVV"/><br>
            <label>Nombre del tajeta habiente</label><br>
            <input type="text" name="nomTar" placeholder="Nombre Completo"/><br>
            
            <input class="boton2" type="submit" value="Aceptar" onclick=""><br>
        </form>
        </div>
    </div>

    </div>
    </div>
    </body>
    <style>
.contenido{
    background-image: url("fondo.png");
}
.color2{
    margin-top: 20px;
    width: 25rem;
    margin-left: auto;
    margin-right: auto;
    color:white;
    padding:20px;
    border: 3px solid black;
    background: black;
    font-size: 1.5rem;
}

.color2:hover{
    background: white;
}

.margen{
   border: 3px dashed white;
   padding: 10px;
   background-color: black;
}
.margen:hover{
   border: 3px dashed black;
   padding: 10px;
   background: white;
   color: black;
}

.centro{
    text-align: center;
}

input{
    border: 1px solid black;
    margin-top:1rem;
    
}
input:hover{
    color:white;
    background: black;
    border: 1px solid white;
}

.input{
    border: 1px solid black;
    margin-top:1rem;
    height: 2rem;
    width:9rem;
}
.input:hover{
    color:white;
    background: black;
    border: 1px solid white;
}

.boton2{
    border: 1px solid black;
    margin-top:1rem;
    font-weight: bold;
    padding: 1rem;
    height: 2em;
    padding-top: 0.5em;
}
.boton2:hover{
    color:white;
    background: black;
    border: 1px solid white;
}
    </style>
</html>
<%
    }
}
%>