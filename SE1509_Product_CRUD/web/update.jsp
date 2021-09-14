<%-- 
    Document   : update
    Created on : May 27, 2021, 2:33:19 AM
    Author     : TrungLT 
--%>

<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update product</title>
    </head>
    <body>
        <h1>Update product</h1>
        <% 
            Product p = (Product) request.getAttribute("product");
        %>
        <form action="update" method="post">
            <label>ID:</label><br>
            <input type="number" readonly name="id" value="<%=p.getId()%>"><br>
            <label>Name:</label><br>
            <input type="text" name="name" value="<%=p.getName()%>"><br>
            <label>Price:</label><br>
            <input type="number" name="price" value="<%=p.getPrice()%>"><br>
            <label>Quantity:</label><br>
            <input type="number" name="quantity" value="<%=p.getQuantity()%>"><br>
            <label>Status:</label><br>
            <select name="status">
                <option value="1" <%=(p.isStatus())?"selected":""%>>New</option>
                <option value="0" <%=(p.isStatus())?"":"selected"%>>Second-hand</option>
            </select><br>

            <input type="submit" value="Update">
        </form>
    </body>
</html>
