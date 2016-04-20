<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/4/6
  Time: 9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core_1_1" prefix="c"%>
<head>
    <title>Title</title>
    <link href="/webchat/css/font-awesome.min.css" rel="stylesheet">
    <link href="/webchat/css/bootstrap.min.css" rel="stylesheet">
    <link href="/webchat/css/button.css" rel="stylesheet">
    <script src="/webchat/js/jquery.min.js"></script>
    <script src="/webchat/js/bootstrap.min.js"></script>
    <script>
        function check() {
            var messages = document.getElementById("messages");
            var sendButton = document.getElementById("sendButton");
            if (messages.value.length>0) {
                sendButton.removeAttribute("disabled");
            } else {
                sendButton.setAttribute("disabled","disabled");
            }
        }
        function  input1() {
            var messages = document.getElementById("messages");
            messages.value="你好！";
            var sendButton = document.getElementById("sendButton");
            if (messages.value.length>0) {
                sendButton.removeAttribute("disabled");
            } else {
                sendButton.setAttribute("disabled","disabled");
            }
        }
        function  input2() {
            var messages = document.getElementById("messages");
            messages.value="再见！";
            var sendButton = document.getElementById("sendButton");
            if (messages.value.length>0) {
                sendButton.removeAttribute("disabled");
            } else {
                sendButton.setAttribute("disabled","disabled");
            }
        }
        function  input3() {
            var messages = document.getElementById("messages");
            messages.value="呵呵！";
            var sendButton = document.getElementById("sendButton");
            if (messages.value.length>0) {
                sendButton.removeAttribute("disabled");
            } else {
                sendButton.setAttribute("disabled","disabled");
            }
        }
    </script>
</head>
<body>
<c:set var="user" value="${sessionScope.user}" scope="request"></c:set>
<%--java代码<%--%>
    <%--String user = (String) session.getAttribute("user");--%>
    <%--request.setAttribute("user",user);--%>
<%--%>--%>
<form action="/webchat/SendBizServlet" method="post">
    <div class="input-group input-group-lg">
        <span class="input-group-addon"><label for="messages"><span class="glyphicon glyphicon-font" style="color: rgb(96, 96, 95); text-shadow: rgb(106, 130, 130) 5px 5px 5px;"></span></label></span>
        <input type="text" class="form-control" id="messages" name="messages" placeholder="请输入要发送的消息" onkeyup="check()">
    </div>
    <div class="dropdown" style="float: left;margin-left: 10px;margin-top: 10px">
        <button type="button" class="btn button-primary dropdown-toggle" id="dropdownMenu1"
                data-toggle="dropdown">
            此处选择快捷输入
            <span class="caret"></span>
        </button>
        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
            <li role="presentation">
                <a role="menuitem" tabindex="-1" onclick="input1()" href="###">你好！</a>
            </li>
            <li role="presentation" class="divider"></li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" onclick="input2()" href="###">再见！</a>
            </li>
            <li role="presentation" class="divider"></li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" onclick="input3()" href="###">呵呵！</a>
            </li>
        </ul>
    </div>
    <button class="button button-3d button-primary button-circle button-jumbo" type="submit" disabled="disabled" id="sendButton" style="float: right;margin-right: 10px;margin-top: 10px;"><i class="fa fa-send"></i></button>

</form>
</body>
</html>
