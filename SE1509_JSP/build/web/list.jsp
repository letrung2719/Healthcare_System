<%-- 
    Document   : list
    Created on : May 25, 2021, 1:42:55 AM
    Author     : TrungLT 
--%>

<%@page import="model.Employee"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>List of Employee</h1>
        <table border="1px" width="30%">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Mark</th>
            </tr>
            <%
                List<Employee> list = (List<Employee>) request.getAttribute("data");
                for (Employee i : list) {
            %>
            <tr>
                <td><%=i.getId()%></td>
                <td><%=i.getName()%></td>
                <%
                    if (i.isGender()) {
                %>
                <td><img src="images/male-icon.png"></td>
                    <%
                    } else {
                    %>
                <td><img src=images/female-icon.png></td>
                    <%
                        }
                    %>
                <td><%=i.getMark()%></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
