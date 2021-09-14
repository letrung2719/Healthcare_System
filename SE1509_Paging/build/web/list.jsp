<%-- 
    Document   : list
    Created on : Jun 8, 2021, 11:20:07 AM
    Author     : TrungLT 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Paging Demo</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <h1>List of Phones</h1>
        
        <div class="pagination">
            <c:set var="page" value="${requestScope.page}"/>
            <c:forEach begin="1" end="${requestScope.numPage}" var="i">
                <a class="${page==i?"active":""}" href="list?page=${i}">${i}</a>
            </c:forEach>
        </div>
        
        <table border="1px" style="border-collapse:collapse;">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Image</th>
                <th>Release Date</th>
                <th>Describe</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Category</th>
            </tr>
            <c:forEach items="${requestScope.arr}" var="p">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.name}</td>
                    <td>${p.image}</td>
                    <td>${p.releaseDate}</td>
                    <td>${p.describe}</td>
                    <td>${p.quantity}</td>
                    <td>${p.price}</td>
                    <td>${p.cate.id}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
