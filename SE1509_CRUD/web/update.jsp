<%-- 
    Document   : update
    Created on : May 25, 2021, 11:25:29 AM
    Author     : TrungLT 
--%>

<%@page import="model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Employee</title>
    </head>
    <body>
        <h1>Update Form</h1>
        <%
            Employee e = (Employee) request.getAttribute("emp");
        %>
        <form action="update" method="post">
            enter id:<input type="number" readonly name="id" value="<%=e.getId()%>"/><br/>
            enter name:<input type="text" name="name" value="<%=e.getName()%>"/><br/>
            select gender:
            <input type="radio" name="gender" value="1" <%=(e.getGender() ? "checked" : "")%>/>male
            <input type="radio" name="gender" value="0" <%=(e.getGender() ? "" : "checked")%>/>female<br/>
            enter dob:<input type="date" name="dob" value="<%=e.getDob()%>"/><br/>
            enter salary:<input type="number" name="salary" value="<%=e.getSalary()%>"/><br/>
            <input type="submit" value="Add"/>
        </form>
    </body>
</html>
