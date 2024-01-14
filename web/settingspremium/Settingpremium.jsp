<%-- 
    Document   : Settingpremium.jsp
    Created on : 13 ene. 2024, 16:07:43
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

    if (estado==1) {
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
            <h1>BACK</h1>
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
                    <p>Generico23</p>
                    <p>Generico23@gmail.com</p>
                </div>
            </div>
            <div class="suscription-section">
                <div class="information">
                    <h3>Suscription:</h3>
                    <div class="status">
                        <h3>Premium</h3>
                    </div>
                </div>
            </div>
        </div>

        <div class="settings-options">
            <div class="reset-delete">
                <h2>Reset Pssword</h2>
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




    <div id="passModal" class="modal">
        <div class="pass-content">
            <span class="close">&times;</span>
            <h1>Reset Pssword</h1>
            <div class="password-box">
                <h2>Old password</h2>
                <input type="text" id="old-password">
                <h2>New password</h2>
                <input type="password" id="new-password">
                <h2>Repeat ypur new password</h2>
                <input type="password" id="new-password-repeat">
            </div>
            <button id="confirm-reset-password">Reset password</button>
        </div>
    </div>



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
            <button id="confirm-delete">Delete account</button>
        </div>
    </div>
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
