<%-- 
    Document   : login
    Created on : May 27, 2021, 11:09:55 AM
    Author     : TrungLT 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Login Form</h1>
        
        <h3 style="color: red">${requestScope.error}</h3>
        
        <c:set var="cookie" value="${pageContext.request.cookies}"></c:set>
<!--        
        <% 
            Cookie[] cookie = request.getCookies();
        %>
        -->
        <form action="login" method="post">
            <label>Username:</label>
            <input type="text" name="user" value="${cookie.user.value}"><br>
            <label>Password:</label>
            <input type="password" name="pass" value="${cookie.pass.value}"><br>
            <input type="checkbox" ${(cookie.rem.value eq 'ON')?"checked":""} name="remember" value="ON">Remember me <br>
            <input type="submit" value="Login">&nbsp;&nbsp;&nbsp;
        </form>
    </body>
</html>
