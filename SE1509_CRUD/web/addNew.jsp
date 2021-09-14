<%-- 
    Document   : addNew
    Created on : May 25, 2021, 10:32:08 AM
    Author     : TrungLT 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add JSP</title>
    </head>
    <body>
        <h1>Add a new employee</h1>
                
        <%
            if (request.getAttribute("error") != null) {
        %>
        <h2 style="color: red"><%= request.getAttribute("error")%></h2>
        <%
            }
        %> 
        
        <form action="add" method="get">
            enter id:<input type="number" name="id"/><br/>
            enter name:<input type="text" name="name"/><br/>
            select gender:
            <input type="radio" name="gender" value="1" checked/>Male
            <input type="radio" name="gender" value="0"/>Female<br/>
            enter dob:<input type="date" name="dob"/><br/>
            enter salary:<input type="number" name="salary"/><br/>
            <input type="submit" value="Add"/>
        </form>
    </body>
</html>
