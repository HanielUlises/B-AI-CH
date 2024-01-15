<%-- 
    Document   : Gender
    Created on : 13 ene. 2024, 17:02:25
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
    String nombreTrack = request.getParameter("trackname");
    if (nombreTrack==null) {
            nombreTrack="default";
        }
    if (estado==0) {
    
%>
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Choose a gender</title>
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

    <div class="gender-container">
      <div class="header-gender">
        <h1>Choose the gender</h1>
      </div>

    <div class="gender-box">
        <form action="../Feeling/feeling.jsp" method="POST">
            <input type="hidden" value="<%=tempo%>"/>
            <input type="hidden" value="ambient"/>
            <button class="gene" type="submit" id="ambient">Ambient</button>
        </form>
        <form action="../Feeling/feeling.jsp"  method="POST">
            <input type="hidden" value="<%=tempo%>"/>
            <input type="hidden" value="pop"/>
            <button class="gene" type="submit" id="pop">Pop</button>
        </form>
        <form action="../Feeling/feeling.jsp"  method="POST">
            <input type="hidden" value="<%=tempo%>"/>
            <input type="hidden" value="rock"/>
            <button class="gene"  type="submit" id="Rock">Rock</button>
        </form>
      </div>

      <div class="gender-box">
        <form action="../Feeling/feeling.jsp"  method="POST">
            <input type="hidden" value="<%=tempo%>" />
            <input type="hidden" value="indie"/>
            <button class="gene" id="indie">Indie</button>
        </form>
        <form action="../Feeling/feeling.jsp"  method="POST">
            <input type="hidden" value="<%=tempo%>"/>
            <input type="hidden" value="hiphop"/>
            <button class="gene" type="submit" id="Rock">Hip Hop</button>
        </form>
        <form action="../Feeling/feeling.jsp" method="POST">
            <input type="hidden" value="<%=tempo%>"/>
            <input type="hidden" value="jazz"/>
            <button class="gene" type="submit" id="Rock">Jazz</button>
        </form>
            <button >

      </div>

      <div class="header-gender">
        <button class="apply" id="next"> <a href="">Apply</a></button>
      </div>
    </div>
  </body>
  <!--Event listener para guardar los géneros escogidos por usuario-->
  <script>
    document.addEventListener('DOMContentLoaded', function() {
        var buttons = document.querySelectorAll('.gender-box button');
        buttons.forEach(function(button) {
            button.addEventListener('click', function() {
                enviarGenero(button.id);
            });
        });
    });

    function enviarGenero(genero) {
        fetch('/api/guardar-genero', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ genero: genero }),
        })
        .then(response => response.json())
        .then(data => console.log(data));
    }
</script>
</html>
<%
    }else{
%>
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Choose a gender</title>
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

    <div class="gender-container">
      
      <div class="header-gender">
        <h1>Choose the gender</h1>
      </div>

    <div class="gender-box">
        <form action="../Feeling/feeling.jsp" method="POST">
            <input type='hidden' name="nombreTrack" value='<%=nombreTrack%>'>
            <input type="hidden" name="tempo" value="<%=tempo%>"/>
            <input type="hidden" name="genre" value="ambient"/>
            <button class="gene" type="submit" id="ambient">Ambient</button>
        </form>
        <form action="../Feeling/feeling.jsp"  method="POST">
            <input type='hidden' name="nombreTrack" value='<%=nombreTrack%>'>
            <input type="hidden" name="tempo" value="<%=tempo%>"/>
            <input type="hidden" name="genre" value="pop"/>
            <button class="gene" type="submit" id="pop">Pop</button>
        </form>
        <form action="../Feeling/feeling.jsp"  method="POST">
            <input type='hidden' name="nombreTrack" value='<%=nombreTrack%>'>
            <input type="hidden" name="tempo" value="<%=tempo%>"/>
            <input type="hidden" name="genre" value="rock"/>
            <button class="gene"  type="submit" id="Rock">Rock</button>
        </form>
      </div>

      <div class="gender-box">
        <form action="../Feeling/feeling.jsp"  method="POST">
            <input type='hidden' name="nombreTrack" value='<%=nombreTrack%>'>
            <input type="hidden" name="tempo" value="<%=tempo%>" />
            <input type="hidden" name="genre" value="indie"/>
            <button class="gene" id="indie">Indie</button>
        </form>
        <form action="../Feeling/feeling.jsp"  method="POST">
            <input type='hidden' name="nombreTrack" value='<%=nombreTrack%>'>
            <input type="hidden" name="tempo" value="<%=tempo%>"/>
            <input type="hidden" name="genre" value="hiphop"/>
            <button class="gene" type="submit" id="Rock">Hip Hop</button>
        </form>
        <form action="../Feeling/feeling.jsp" method="POST">
            <input type='hidden' name="nombreTrack" value='<%=nombreTrack%>'>
            <input type="hidden" name="tempo" value="<%=tempo%>"/>
            <input type="hidden" name="genre" value="jazz"/>
            <button class="gene" type="submit" id="Rock">Jazz</button>
        </form>

      </div>
    </div>
  </body>
  <!--Event listener para guardar los géneros escogidos por usuario-->
  <script>
    document.addEventListener('DOMContentLoaded', function() {
        var buttons = document.querySelectorAll('.gender-box button');
        buttons.forEach(function(button) {
            button.addEventListener('click', function() {
                enviarGenero(button.id);
            });
        });
    });

    function enviarGenero(genero) {
        fetch('/api/guardar-genero', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ genero: genero }),
        })
        .then(response => response.json())
        .then(data => console.log(data));
    }
</script>
</html>
<%
}
}
%>



