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
<!DOCTYPE html>
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

    <div class="top-bar">
        <button id="newproject" class="btn">Start a new project</button>
        <button id="upgradeBtn" class="btn premium">Upgrade to premium</button>
        
    </div>
    <div id="premiumModal" class="modal">
        <!-- Contenido del modal -->
        <div class="modal-content">
            <span class="close">&times;</span>
            <h1>★  Become premium</h1>
            <h2>Great for musicians, influencers, cinema directors and any creator in general!</h2>
            <ul>
                <div class="lineapay"></div>
                <p>✓   15 min tracks duration</p>
                <div class="lineapay"></div>
                <p>✓   Get pcense for downloaded music</p>
                <div class="lineapay"></div>
                <p>✓   Direct access to new features</p>
                <div class="lineapay"></div>
                
            </ul>
            
            <button class="premiumModal">Upgrade for $6</button>
        </div>
    </div>

    <main>

        <h1 class="h1-tittle">My projects</h1>
        <div id="projectcont" class="project-container">
            <div class="project-card">
                <img src="logo.jpg" alt="Dolor y gloria" height="100%">
                <a href="#"><span>Dolor y gloria</span></a>
            </div>
        </div>

    </main>
    <script src="script.js"></script>
</body>

</html>
<%
    }else{
%>
<!DOCTYPE html>
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

    <div class="top-bar">
        <button id="newproject" class="btn">Start a new project</button>
        
    </div>
    <div id="premiumModal" class="modal">
        <!-- Contenido del modal -->
        <div class="modal-content">
            <span class="close">&times;</span>
            <h1>★  Become premium</h1>
            <h2>Great for musicians, influencers, cinema directors and any creator in general!</h2>
            <ul>
                <div class="lineapay"></div>
                <p>✓   15 min tracks duration</p>
                <div class="lineapay"></div>
                <p>✓   Get pcense for downloaded music</p>
                <div class="lineapay"></div>
                <p>✓   Direct access to new features</p>
                <div class="lineapay"></div>
                
            </ul>
            
            <button class="premiumModal">Upgrade for $6</button>
        </div>
    </div>

    <main>

        <h1 class="h1-tittle">My projects</h1>
        <div id="projectcont" class="project-container">
            <div class="project-card">
                <img src="logo.jpg" alt="Dolor y gloria" height="100%">
                <a href="#"><span>Dolor y gloria</span></a>
            </div>
        </div>

    </main>
    <script src="script.js"></script>
</body>

</html>

<%
    }
}
%>