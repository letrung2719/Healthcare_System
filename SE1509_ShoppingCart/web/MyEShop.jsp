

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="dal.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #bag{
                text-align: right;
                margin-right: 30px;
                margin-top: 30px;
            }
            table{
                border-collapse: collapse;
            }
            .ta{
                text-align: right
            }
            a{
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <c:set var="size" value="${sessionScope.size}"/>
        Hello ${sessionScope.acount.name}
        <p id="bag">
            <img src="images/icon.png" width="50" height="50"/>
            <a href="MyEcart.jsp"> 
                Mybag (${size}) items
            </a>
        </p> 
        <h1>The list of products</h1>
        <form name="f" action="" method="post">
            Enter the number of items to by:
            <input style="text-align: center" type="number" name="num" value="1"/>
        <hr/>    
        <table border="1px" width="40%">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
            <jsp:useBean id="db" class="dal.ProductDAO"/>
            <c:forEach items="${db.all}" var="p">
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td class="ta">${p.quantity}</td>
                <td class="ta">$<fmt:formatNumber pattern="##.#" value="${p.price*1.2}"/></td>
                <td style="text-align: center">
                    <input type="submit" onclick="buy('${p.id}','${p.quantity}')" value="Buy item"/>
                </td>
            </tr>
            </c:forEach>
        </table>
            </form>  
    </body>
</html>
<script type="text/javascript">
    function buy(id,quantity){
        var m=document.f.num.value;
        if(m>quantity){
            alert("Khong du hang");
            return ;
        }else{
          document.f.action="buy?id="+id;
          document.f.submit();
      }
    }
</script>    