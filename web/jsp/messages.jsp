<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/4/6
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core_1_1" prefix="c"%>
<html>
<head>
    <meta http-equiv="refresh" content="1">
    <title>Title</title>
    <link href="/webchat/css/bootstrap.min.css" rel="stylesheet">
    <script src="/webchat/js/jquery.min.js"></script>
    <script src="/webchat/js/bootstrap.min.js"></script>
</head>
<body>
<div onfocus="this.scrollTop=this.scrollHeight" onpropertychange>
<table class="table table-striped">
    <c:choose>
        <c:when test="${empty applicationScope.messages}">
        </c:when>
        <c:otherwise>
            <c:forEach var="message" items="${applicationScope.messages}" >
                ${message[0]}
                ${message[1]}
            </c:forEach>
        </c:otherwise>
    </c:choose>
    <%--java代码--%>
    <%--<%--%>
        <%--ArrayList list = (ArrayList) application.getAttribute("messages");--%>
        <%--if (list != null) {--%>
            <%--for (Object s : list) {--%>
                <%--out.println(s);--%>
            <%--}--%>
        <%--}--%>
    <%--%>--%>
</table>
</div>
</body>
</html>
