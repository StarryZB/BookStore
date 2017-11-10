<%--
  Created by IntelliJ IDEA.
  User: 34432
  Date: 2017/11/3
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
  <title>登录页面</title>
  </head>
<body>
  <div align="center">
    <form action="login.do" method="post">
      账号: <input type="text" name="name"> <br>
      密码: <input type="password" name="password"> <br>
      <input type="submit" value="登录">
      <input type="reset" value="重置">
    </form>
  </div>
  </body>
</html>
