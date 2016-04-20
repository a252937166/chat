<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/4/6
  Time: 9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta http-equiv="refresh" content="1">
    <title>Title</title>
    <link href="/webchat/css/font-awesome.min.css" rel="stylesheet">
    <link href="/webchat/css/bootstrap.min.css" rel="stylesheet">
    <script src="/webchat/js/jquery.min.js"></script>
    <script src="/webchat/js/bootstrap.min.js"></script>
</head>
<body>
<table class="table table-bordered table-hover">
    <%--${applicationScope.users}--%>
    <%--${applicationScope.userList}--%>
    <%--${sessionScope.user}--%>
    <c:choose>
        <c:when test=""></c:when>
        <c:otherwise>
            <c:forEach var="list" varStatus="status" items="${applicationScope.userList}">
                <c:choose>
                    <c:when test="${applicationScope.userList[status.count-1] eq sessionScope.user}">
                        <tr><td style='color:red;'>${applicationScope.users[status.count-1]}</td></tr>
                    </c:when>
                    <c:otherwise>
                        <tr><td>${applicationScope.users[status.count-1]}</td></tr>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </c:otherwise>
    </c:choose>
<%--java代码<%--%>
    <%--ArrayList list = (ArrayList) application.getAttribute("users");--%>
    <%--ArrayList userList = (ArrayList) application.getAttribute("userList");--%>
    <%--String theUser = (String) session.getAttribute("user");--%>
    <%--if (list != null) {--%>
        <%--for (int i=0; i < list.size(); i++) {--%>
            <%--String s = (String) list.get(i);--%>
            <%--String user = (String) userList.get(i);--%>
            <%--if(user.equals(theUser)) {--%>
                <%--out.println("<tr><td style='color:red;'>" + s+ "</td></tr>");--%>
            <%--} else {--%>
                <%--out.println("<tr><td >" + s+ "</td></tr>");--%>
            <%--}--%>
        <%--}--%>
    <%--}--%>
<%--%>--%>
</table>
</body>
</html>
