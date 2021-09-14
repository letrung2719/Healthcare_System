<%-- 
    Document   : home
    Created on : May 27, 2021, 12:01:22 PM
    Author     : TrungLT 
--%>

<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>

        <%
            Account ac = (Account) session.getAttribute("account");
        %>
        <h1 style="color: red">Hello <%=ac.getUsername()%> !</h1>

    </body>
</html>
