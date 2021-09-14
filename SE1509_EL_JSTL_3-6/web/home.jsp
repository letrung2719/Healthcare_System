<%-- 
    Document   : home
    Created on : Jun 3, 2021, 10:31:30 AM
    Author     : TrungLT 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>JSTL Example</h1>
        <form>
            <label>Enter name:</label>
            <input type="text" name="name"><br>
            <input type="submit">
        </form>
        <h3 style="color:red">your name:<%=request.getParameter("name")%></h3>
        <h3 style="color:blue">your name:${param.name}</h3>
        <h3>Age: ${initParam.age}</h3>
        <h3>Hobbies: ${initParam.hobbies}</h3>
        <%
            String a = (String) session.getAttribute("account");
        %>
        <h2>Your account: <%=a%></h2>
        <h2>Your account: ${sessionScope.account}</h2>
        <h3>Pi: ${Math.PI}</h3>
        <h3>Pi: <fmt:formatNumber pattern="##.##" value="${Math.PI}"/></h3>
        <h3>Value: ${4 == 5}</h3>
        <h3>Value: ${4 eq 4}</h3>
        <h3>
            <c:set var="b" value="<%=new java.util.Date()%>"/>
            ${b}<br>
            <fmt:formatDate pattern="dd-MM-yyyy" value="${b}"/>
        </h3>
        <c:set var="name" value="Le Thanh Trung"/>
        <c:set var="word" value="${fn:split(name,' ')}"/>
        <h3>Number of words: ${fn:length(word)}</h3>

        <h3>
            <c:set var="b" value="<%=new java.util.Date()%>"/>
            ${b}

            <c:forEach items="${requestScope.data}" var="i">
                ${i}<br>
            </c:forEach>
            <br>
            <c:if test="${requestScope.gender}">
                <img src="images/male-icon.png">
            </c:if>
            <br>
            <c:if test="${!requestScope.gender}">
                <img src="images/female-icon.png">
            </c:if>
            <br>
            <c:set var="c" value="${requestScope.num}"/>
            <c:choose>
                <c:when test="${c eq 0}">
                    Zero
                </c:when>
                <c:when test="${c eq 1}">
                    One
                </c:when>
                <c:when test="${c eq 2}">
                    Two
                </c:when>
                <c:when test="${c eq 3}">
                    Three
                </c:when>
                <c:otherwise>
                    Not from 0 to 3
                </c:otherwise>
            </c:choose>
        </h3>
    </body>
</html>
