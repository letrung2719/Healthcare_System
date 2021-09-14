<%-- 
    Document   : register
    Created on : Jun 1, 2021, 11:05:33 AM
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
        <h1>Register Form</h1>
        <% 
            if(request.getAttribute("error")!=null){
        %>
        <h3 style="color:red"><%=request.getAttribute("error")%></h3>
        <% 
            }
        %>
        <form action="register" method="post">
            <label>Username:</label>
            <input type="text" name="user"><br>
            <label>Password:</label>
            <input type="password" name="pass"><br>
            <input type="submit" value="Create account">&nbsp;&nbsp;&nbsp;
        </form>
    </body>
</html>
