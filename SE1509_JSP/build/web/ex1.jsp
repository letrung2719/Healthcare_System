<%-- 
    Document   : ex1
    Created on : May 25, 2021, 12:33:47 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Student" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Example for JSP</h1>
        <h2>
            <%
                //trong day la java
                out.println("Hello World!<br/>");
                SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
            %>  
        </h2>    
        <h2 style="color: red">
            <%
                out.println("Today is "+ f.format(new Date()));
            %>
        </h2>
        <%
            List<Student> list = new ArrayList<Student>();
            list.add(new Student(1, "Le Thanh Trung"));
            list.add(new Student(2, "Nguyen The Kien"));
            list.add(new Student(3, "Mai Trong Dai"));
            list.add(new Student(4, "Hoang Anh Minh"));
            list.add(new Student(5, "Nguyen Quang Huy"));
        %>
        <table border="1px" width="30%">
            <tr>
                <th>ID</th>
                <th>Fullname</th>
            </tr>
            <%
                for (Student i : list) {
            %>
            <tr>
                <th><%=i.getId()%></th>
                <th><%=i.getName()%></th>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
