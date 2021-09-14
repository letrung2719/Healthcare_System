<%-- 
    Document   : list
    Created on : Jun 3, 2021, 12:03:55 PM
    Author     : TrungLT 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="color:red">List of Students</h1>
        <table border="1px">
            <tr>
                <th>ID</th>
                <th>Fullname</th>
                <th>DOB</th> 
                <th>Address</th>
                <th>Average</th>
            </tr>

            <c:forEach items="${requestScope.data}" var="i">
                <tr>
                    <td>${i.id}</td>
                    <td>${i.name}</td>
                    <fmt:parseDate var="d" pattern="dd/MM/yyyy" value="${i.dob}"/>
                    <td>
                        <fmt:formatDate pattern="dd-MM-yyyy" value="${d}"/>
                    </td> 
                    <td>${i.address}</td>
                    <td>${(i.mark1 + i.mark2)/2}</td> 
                </tr>
            </c:forEach>
        </table>
    </body>
</html>

