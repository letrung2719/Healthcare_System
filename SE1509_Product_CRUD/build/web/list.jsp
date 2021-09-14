<%-- 
    Document   : list
    Created on : May 25, 2021, 11:47:01 PM
    Author     : TrungLT 
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Management</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <h1>List of Products</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Status</th>
                <th>Action</th>
            </tr>

            <%
                List<Product> list = (List<Product>) request.getAttribute("data");
                for (Product p : list) {
            %>

            <tr>
                <td><%=p.getId()%></td>
                <td><%=p.getName()%></td>
                <td><%=p.getPrice()%></td>
                <td><%=p.getQuantity()%></td>
                <%
                    if (p.isStatus()) {
                %>
                <td>New</td>
                <%
                } else {
                %>
                <td>Second-hand</td>
                <%
                    }
                %>
                <td class="action">
                    <a href="update?id=<%=p.getId()%>">Update</a>&nbsp;&nbsp;&nbsp;
                    <a href="delete?id=<%=p.getId()%>">Delete</a>
                </td>
            </tr>    

            <%
                }
            %>
        </table>
        
        <div class="add">
            <a href="addNew.jsp">Add a new product</a>
        </div>
        
    </body>
</html>
