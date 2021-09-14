<%-- 
    Document   : calculator
    Created on : May 27, 2021, 9:58:56 AM
    Author     : TrungLT 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculator Form</title>
    </head>
    <body>
        <h1>Calculator Form</h1>
        <jsp:useBean id="c" class="model.Calculator" />
        <jsp:setProperty name="c" property="*" />

        <form action="calculator.jsp">
            <label>Enter number 1:</label>
            <input type="text" name="num1" value="
                   <jsp:getProperty name="c" property="num1"/>"/><br>
            <label>Enter number 2:</label>
            <input type="text" name="num2" value="
                   <jsp:getProperty name="c" property="num2"/>"/><br>
            <label>Select operator</label>
            <select name="op" onchange="this.form.submit()">
                <option value="0">Select</option>
                <option value="+">+</option>
                <option value="-">-</option>
                <option value="x">x</option>
                <option value="/">/</option>
            </select>
        </form>
        <h2><jsp:getProperty name="c" property="result"/></h2>
    </body>
</html>
