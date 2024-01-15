<%-- 
    Document   : wait
    Created on : 14 ene. 2024, 10:16:34
    Author     : Samuel
--%>

<%@page import="org.apache.tomcat.jni.Time"%>
<%@page import="Modelo_music_gen.ArchivoAudio"%>
<%@page import="java.util.Arrays"%>
<%@page import="Modelo_music_gen.ControladorMusica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String feeling = request.getParameter("feeling");
String genre = request.getParameter("gender");
String tempo = request.getParameter("tempo");
String nombreTrack= request.getParameter("nombreTrack");
int id =0;
HttpSession sessionOk = request.getSession();
if(sessionOk.getAttribute("id")==null){
    response.sendRedirect("../error.jsp?admrs=2");  
}else{
    id = (Integer)session.getAttribute("id");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Waiting for track</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="gender-container">
        <div class="header-gender">
            <h1>Please wait while your track <br>
                is being generated</h1>
          </div>
        <div id=hourglassBox title="Compatible Chr/Op, FF, IE"></div>
    </div>    
</body>
</html>
<script>

function redireccionar(){
    window.location.href = "wait2.jsp?feeling=<%=feeling%>&gender=<%=genre%>&tempo=<%=tempo%>&nombreTrack=<%=nombreTrack%>&";
}
setTimeout("redireccionar()", 1000);

</script>
<%
      
}
%>