<%-- 
    Document   : trackready
    Created on : 14 ene. 2024, 01:44:28
    Author     : Samuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controlador.Usuario"%>
<%
int id=0;
String usuario="";
String contrasena="";
HttpSession sessionOk = request.getSession();
String feeling = request.getParameter("feeling");
String genre = request.getParameter("gender");
String tempo = request.getParameter("tempo");
String nombreTrack = request.getParameter("nombreTrack");
if(sessionOk.getAttribute("id")==null){
    response.sendRedirect("../error.jsp?admrs=2");  
}else{
    usuario = (String)sessionOk.getAttribute("email");
    contrasena = (String)sessionOk.getAttribute("contra");
    id = (Integer)session.getAttribute("id");
    int estado = (Integer)session.getAttribute("estado");
    
    String idC = request.getParameter("idC");
    
    if (estado==0) {
%>
<!DOCTYPE html>
<html>
<head>
    <title>Track Ready</title>
    
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="headerbach">
        <div class="h1-logo"></div>
        <a href="">
          <div class="logo"></div>
        </a>
      </div>

      <div class="settings-container">
        <div class="header-settings">
            <h1>Your track is ready</h1>
        </div>

        <div class="play-box">
            <i class="fa-solid fa-circle-play"></i>
            <div class="music">
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>

                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
            </div>
        </div>

        <div class="gender-box">
            <button id="indie">Regenerate</button>
            <button id="hiphop">Downloand</button>
            <button id="jazz">Menu</button>
          </div>
    </div>
    <script src="path_to_your_script.js"></script>
</body>
</html>
<%
    }else{
%>
<!DOCTYPE html>
<html>
<head>
    <title>Track Ready</title>
    
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="headerbach">
        <div class="h1-logo"></div>
        <a href="">
          <div class="logo"></div>
        </a>
      </div>
        

      <div class="settings-container">
        <div class="header-settings">
            <h1>Your track is ready</h1>
            <audio src="archivo.wav" autoplay>
                Your browser does not support the <code>audio</code> element.
            </audio>
        </div>

        <div class="play-box">
            <i class="fa-solid fa-circle-play"></i>
            <div class="music">
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>

                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
            </div>
        </div>

        <div class="gender-box">
            <audio controls autoplay="true" loop>
                <source src="archivo.wav">
                Your browser does not support the audio.
            </audio>
            <button id="indie" onclick="redireccionarRegenerate()">Regenerate</button>
            <button id="jazz" onclick="redireccionarMenu()">Menu</button>
          </div>
    </div>
    <script src="path_to_your_script.js"></script>
</body>
</html>
<script>
    
function redireccionarMenu(){
    window.location.href = "../mainbach/main.jsp";
}
function redireccionarRegenerate(){
    window.location.href = "../Reloj/wait.jsp?feeling=<%=feeling%>&gender=<%=genre%>&tempo=<%=tempo%>&nombreT=<%=nombreTrack%>";
}
</script>
<%
    }
}
%>
