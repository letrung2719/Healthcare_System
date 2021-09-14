<%-- 
    Document   : home
    Created on : Jul 1, 2021, 11:48:02 AM
    Author     : TrungLT 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                min-height: 700px;
            }

            #test{
                position: ralative;
                top: 680px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h1>Hello ${name}</h1>
        <h2>Number of access: ${counter}</h2>
        <div id="test">
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
