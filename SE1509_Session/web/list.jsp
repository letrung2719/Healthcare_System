<%-- 
    Document   : list
    Created on : May 21, 2021, 12:39:50 AM
    Author     : TrungLT
--%>

<%@page import="model.Account"%>
<%@page import="java.util.List"%>
<%@page import="model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <h1>List of Employee</h1>
        <h2><a href="check?action=add">Add new</a></h2>
        <table border="1px">
            <tr>
                <th>ID</th>
                <th>Fullname</th>
                <th>Gender</th>
                <th>DOB</th>
                <th>Salary</th>
                <th>Action</th>
            <tr/>

            <%
                List<Employee> list = (List<Employee>) request.getAttribute("data");
                for (Employee i : list) {
            %>
            <tr>
                <td><%=i.getId()%></td>
                <td><%=i.getName()%></td>
                <%
                    if (i.getGender()) {
                %>
                <td><img src="images/male-icon.png"></td>
                    <%
                    } else {
                    %>
                <td><img src="images/female-icon.png"></td>
                    <%
                        }
                    %>
                <td><%=i.getDob()%></td>
                <td><%=i.getSalary()%></td>
                <td>
                    <a href="check?action=update&id=<%=i.getId()%>">Edit</a>&nbsp;&nbsp;&nbsp;
                    <a href="check?action=delete&id=<%=i.getId()%>">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <br>
        <form action="logout" method="post">
            <input type="submit" value="Logout">
        </form>
    </body>
</html>
