<%-- 
    Document   : Settings
    Created on : 9 ene. 2024, 01:03:21
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
    <title>Settings Page</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <div class="headerbach">
        <button id="back-button">
            <h1><a href="../mainbach/main.jsp">BACK</a></h1>
        </button>
        <div class="h1-logo">Settings</div>
        <a href="">
            <div class="logo"></div>
        </a>
    </div>

    <div class="settings-container">
        <div class="header-settings">
            <div class="profile-section">
                <div class="profile-image"></div>
                <div class="profile-info">
                   
                    <p><%=usuario%></p>
                </div>
            </div>
            <div class="suscription-section">
                <div class="information">
                    <h3>Suscription:</h3>
                    <div class="status">
                        <h3>Basic</h3>
                    </div>
                </div>
                <button id="upgrade-button">Upgrade to premium</button>
            </div>
        </div>

        <div class="settings-options">
            <div class="reset-delete">
                <h2>Reset Password</h2>
                <div class="linea"></div>
                <p>If you signed-up using your email and password, then you can reset it by clicking the button.</p>
                <button id="reset-password">Reset password</button>
            </div>

            <div class="reset-delete">
                <h2>Delete account</h2>
                <div class="linea"></div>
                <p>This action cannot be undone. You will loose all projects and data associated with it.</p>
                <button id="delete-account">Delete account</button>
            </div>


        </div>
    </div>

    <div id="premiumModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h1>★ Become premium</h1>
            <h2>Great for musicians, influencers, cinema directors and any creator in general!</h2>
            <ul>
                <div class="lineapay"></div>
                <p>✓ 15 min tracks duration</p>
                <div class="lineapay"></div>
                <p>✓ Get pcense for downloaded music</p>
                <div class="lineapay"></div>
                <p>✓ Direct access to new features</p>
                <div class="lineapay"></div>

            </ul>

            <a href="../Pago/pago.jsp"><button class="premiumModal">Upgrade for $6</button></a>
        </div>
    </div>

    <form action="../resetearContrasena" method="POST">
    <div id="passModal" class="modal">
        <div class="pass-content">
            <span class="close">&times;</span>
            <h1>Reset Password</h1>
            <div class="password-box">
                
                <h2>Old password</h2>
                <input type="text" id="old-password" name="old-password">
                <h2>New password</h2>
                <input type="password" id="new-password" name="new-password">
                <h2>Repeat your new password</h2>
                <input type="password" id="new-password-repeat" name="new-password-reapeat">
            </div>
            <button type="submit" id="confirm-reset-password">Reset password</button>
             
        </div>
    </div>
    </form>

    <form action="../eliminarCuenta">
    <div id="deleteModal" class="modal">
        <div class="delete-content">
            <span class="close">&times;</span>
            <h1>Delete account</h1>
            <h5>Help us understand the reason for deleting your account</h5>
            <div class="delete-box">
                <h2>Reason</h2>
                <textarea id="reason" placeholder="Please explain" name="explain"></textarea>
                <h2>Feedback for improvement</h2>
                <textarea id="feedback" placeholder="Your feedback will help us improve the product"
                    name="feed"></textarea>
            </div>
            <button id="confirm-delete">Delete Account!</button>
        </div>
    </div>
    </form>
    <script src="script.js"></script>
    <%
    String param = request.getParameter("param");

    if(param!=null){
        if (param.equals("0")) {
    %>
        
    <script>
        alert("No corresponden las contraseñas actuales")
    </script>
    <%
        }else if(param.equals("1")){
    %>
    <script>
        alert("Se ha reseteado la contraseña")
    </script>
    <%
        }
    }
    %>
</body>

</html>
<%    
    }
%>
<%
}
%>