<%-- 
    Document   : addNew
    Created on : May 26, 2021, 9:32:22 PM
    Author     : TrungLT 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a new product</title>
    </head>
    <body>
        <h1>Add a new product</h1>
        
        <% 
            if(request.getAttribute("error") != null){
        %>
        <h3 style="color:red"><%=request.getAttribute("error")%></h3>
        <%
            }
        %>
        
        <form action="add" method="get">
            <label>ID:</label><br>
            <input type="number" name="id"><br>
            <label>Name:</label><br>
            <input type="text" name="name"><br>
            <label>Price:</label><br>
            <input type="number" name="price"><br>
            <label>Quantity:</label><br>
            <input type="number" name="quantity"><br>
            <label>Status:</label><br>
            <select name="status">
                <option value="1">New</option>
                <option value="0">Second-hand</option>
            </select><br>
            
            <input type="submit" value="Add">
        </form>
    </body>
</html>
