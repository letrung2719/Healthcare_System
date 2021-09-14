<%-- 
    Document   : login
    Created on : May 27, 2021, 11:09:55 AM
    Author     : TrungLT 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Session Demo</title>
    </head>
    <body>
        <%
            if (request.getAttribute("account") == null) {
        %>
        <h3 style="color: blue">You must login first!</h3>
        <%
            }
        %>

        <h1>Login Form</h1>
                
        <%
            if (request.getAttribute("error") != null) {
        %>
        <h3 style="color: red">Invalid Account! If you don't have account, register a new one please!</h3>
        <%
            }
        %>
        
        <form action="login" method="post">
            <label>Username:</label>
            <input type="text" name="user"><br>
            <label>Password:</label>
            <input type="password" name="pass"><br>
            <input type="submit" value="Login">&nbsp;&nbsp;&nbsp;
            <button><a href="register.jsp" style="text-decoration: none; color:black">Register</a></button>
        </form>
    </body>
</html>
