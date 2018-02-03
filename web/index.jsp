<%@ page import="com.servlet.LoginServlet" %><%--
  Created by IntelliJ IDEA.
  User: StarryZB
  Date: 2017/11/3
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
  <head>
  <title>登录页面</title>
      <script type="text/javascript">
          function check(){
              var flag = true;
              var admin = document.getElementById("name").value;
              var password = document.getElementById("password").value;
              if ("" == admin){
                  alert("请输入账号！");
                  flag = false;
                  return false;
              }
              else if ("" == password){
                  alert("请输入密码！");
                  flag = false;
                  return false;
              }
              if(flag == true){
                  document.getElementById("form").submit();
                  return true;
              }
          }
      </script>
  </head>
<body>
<%
  if (session.getAttribute("user") != null) {
    %>
<jsp:forward page="/login.action"></jsp:forward>
<%
  }
%>
  <div align="center" style="margin-top: 100px">
    <form action="login.action" method="post" id="form">
      账号: <input type="text" name="name" id="name" style="margin-bottom: 15px"> <br>
      密码: <input type="password" name="password" id="password" style="margin-bottom: 15px"> <br>
      <input type="button" value="登录" onclick="check()" class="btn btn-primary" style="margin-right: 20px">
      <input type="reset" value="重置" class="btn btn-primary">
    </form>
  </div>
  </body>
</html>
