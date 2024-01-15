<%-- 
    Document   : Feeling
    Created on : 13 ene. 2024, 19:29:33
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
    String tempo = request.getParameter("tempo");
    String gender = request.getParameter("genre");
    String nombreTrack = request.getParameter("nombreTrack");
    if (estado==0) {
    
%>
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Choose a feeling</title>
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

    <form action="action">
    <div class="feeling-container">
      <div class="header-feeling">
        <h1>What feeling would you like to asign to this track?</h1>
      </div>

    <div class="feeling-box">
            <div class="feeling-img">
                <img src="15.png" alt="Sad" id="sadimg">
                <button id="sad">Sad</button>
            </div>
            <div class="feeling-img">
                <img src="16.png" alt="Calm">
                <button id="calm">Calm</button>
            </div>
            <div class="feeling-img">
                <img src="17.png" alt="Happy">
                <button id="happy">Happy</button>
            </div>
    </div>


    <div class="feeling-box">
        <div class="feeling-img">
            <img src="18.png" alt="Sad">
            <button id="moved">Moved</button>
        </div>    
        <div class="feeling-img">
            <img src="19.png" alt="Sad">
            <button id="angry">Angry</button>
        </div>
        <div class="feeling-img">
            <img src="20.png" alt="Sad">
            <button id="motivational">Motivational</button>
        </div>    
    </div>

      <div class="header-feeling">
      <button class="apply" id="next"> <a href="">Apply</a></button>
    </div>
    </div>
        
    </form>

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
  <title>Choose a feeling</title>
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


    <div class="feeling-container">
      <div class="header-feeling">
        <h1>What feeling would you like to asign to this track?</h1>
      </div>
        <form name="form1" action="../Reloj/wait.jsp" method="POST">
        
            <input type="hidden" name="gender" value="<%=gender%>"/>
            <input type="hidden" name="tempo" value="<%=tempo%>"/>
            <input type='hidden' name="nombreTrack" value='<%=nombreTrack%>'>
            <input type="hidden" name="feeling" id="feeling">
            <div class="feeling-box">
                <div class="feeling-img">
                    <img src="15.png" alt="Sad" id="sadimg">
                    <button type="submit" onclick="cambiarValor('sad')" id="sad">Sad</button>
                </div>
                <div class="feeling-img">
                    <img src="16.png" alt="Calm">
                    <button type="submit" onclick="cambiarValor('calm')" id="calm">Calm</button>
                </div>
                <div class="feeling-img">
                    <img src="17.png" alt="Happy">
                    <button  type="submit" onclick="cambiarValor('happy')" id="happy">Happy</button>
                </div>
            </div>
            <div class="feeling-box">
                <div class="feeling-img">
                    <img src="18.png" alt="Sad">
                    <button  type="submit" onclick="cambiarValor('moved')" id="moved">Moved</button>
                </div>    
                <div class="feeling-img">
                    <img src="19.png" alt="Sad">
                    <button  type="submit" onclick="cambiarValor('andry')" id="angry">Angry</button>
                </div>
                <div class="feeling-img">
                    <img src="20.png" alt="Sad">
                    <button onclick="cambiarValor('motivational')" id="motivational">Motivational</button>
                </div>    
            </div>
        </form>
      <div class="header-feeling">
    

    </div>
    </div>


  </body>

</html>
<script>
  function cambiarValor(valor){
    let i=document.getElementById('feeling').value=valor;
  }
</script>
</html>


<%
    }
}

%>

