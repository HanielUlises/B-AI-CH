<%-- 
    Document   : newjspTrack
    Created on : 13 ene. 2024, 16:44:44
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
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Crear una nueva pista</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <link rel="stylesheet" href="styles.css">
</head>

<body>
    <div class="headerbach">
      <button id="back-button">
        <h1>BACK</h1>
      </button>
      <div class="h1-logo"></div>
      <a href="">
        <div class="logo"></div>
      </a>
    </div>

    <div class="settings-container">
        <div class="header-settings">
          <h1>Create a new track</h1>
        </div>

        <form action="../Gender/Gender.jsp" method="POST">
            <div class="tittle">
              <h2>Track tittle</h2>
              <input type="text" id="trackname" name="trackname">
            </div>

            <div class="tempo">
              <h2>Tempo</h2>
              <div class="tooltip">
                <i class="fa-solid fa-circle-info"></i>
                <span class="tooltiptext">Choose how fast the track should be</span></div>
                <select id="tempo" name="tempo" >
                  <option value="slow">Slow</option>
                  <option value="medium" selected>Medium</option>
                  <option value="fast">Fast</option>
                </select>
            </div>
            <div class="header-settings"> 
                <button type="submit" id="next">Next</button>
            </div>
        </form>
     
    </div>

      
<script src="script.js"></script>
  </body>

</html>


<%
    }else{
%>
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Crear una nueva pista</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <link rel="stylesheet" href="styles.css">
</head>

<body>
    <div class="headerbach">
      <button id="back-button">
        <h1>BACK</h1>
      </button>
      <div class="h1-logo"></div>
      <a href="">
        <div class="logo"></div>
      </a>
    </div>

    <div class="settings-container">
        <div class="header-settings">
          <h1>Create a new track</h1>
        </div>

        <form action="../Gender/Gender.jsp" method="POST">
            <div class="tittle">
              <h2>Track tittle</h2>
              <input type="text" id="trackname" name="trackname">
            </div>

            <div class="tempo">
              <h2>Tempo</h2>
              <div class="tooltip">
                <i class="fa-solid fa-circle-info"></i>
                <span class="tooltiptext">Choose how fast the track should be</span></div>
                <select id="tempo" name="tempo" >
                  <option value="slow">Slow</option>
                  <option value="medium" selected>Medium</option>
                  <option value="fast">Fast</option>
                </select>
            </div>
            <div class="header-settings"> 
                <button type="submit" id="next">Next</button>
            </div>
        </form>
     
    </div>      
<script src="script.js"></script>
  </body>

</html>
<%
    }
}
%>
