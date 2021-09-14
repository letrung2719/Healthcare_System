
<%@page import="java.util.List"%>
<%@page import="model.Item"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            a{
                text-decoration: none;
                color: chocolate;
                font-size: 22px;
                font-weight: bold;
            }
            table{
                border-collapse: collapse;
            }
            .ta{
                text-align: right
            }
        </style>
    <script >
    
    </script>
    </head>
    <body>
        <h1>Shopping cart online</h1>
        <table border="1px" width="50%">
            <tr>
                <th>No</th>
                <th>Name</th>
                <th>quantity</th>
                <th>price</th>
                <th>Total money</th>
                <th>action</th>
            </tr>
            <c:set var="o" value="${sessionScope.cart}"/>
            <c:set var="t" value="0"/>
                <c:forEach items="${o.items}" var="i"> 
                <c:set var="t" value="${t+1}"/>               
            <tr>                
                <td>${t}</td>
                <td>${i.product.name}</td>
                
                <td style="text-align: center">
                    <button ><a href="process?num=-1&id=${i.product.id}">-</a></button>
                    <input type="text" readonly  value="${i.quantity}"/>
                    <button><a href="process?num=1&id=${i.product.id}">+</a></button>
                    
                </td>
                
                <td class="ta">
                    $<fmt:formatNumber pattern="##.#" value="${i.price}"/>
                </td>
                <td class="ta">
                    $<fmt:formatNumber pattern="##.#" value="${i.quantity*i.price}"/>
                </td>
                <td style="text-align: center">
                    <form action="process" method="post">
                        <input type="hidden" name="id" value="${i.product.id}"/>
                        <input type="submit" value="Return item"/>   
                    </form>    
                </td>
            </tr>
            </c:forEach>                    
        </table>
                <p></p>        
        <form action="checkout" method="post">
            <input type="submit" value="Check out"/>
        </form>
        <hr/>        
        <a href="MyEShop.jsp">CLICK ME CONTINUE SHOPPING</a>
    </body>
</html>
    