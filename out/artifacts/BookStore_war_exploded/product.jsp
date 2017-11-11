<%@ page import="java.util.List" %>
<%@ page import="com.entity.Product" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 34432
  Date: 2017/11/3
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<head>
    <title>商品信息</title>
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
%>
<div align="center">
    <font face="楷体" size="6">欢迎用户：<%=user.getName()%></font>

</div>

<div>
    <table class="table table-hover">
        <thead>
        <th>商品</th>
        <th>商品名称</th>
        <th>价格</th>'
        <th>买买买</th>
        </thead>
        <tbody>
        <%
            List<Product> productList = (List<Product>) request.getAttribute("listproduct");
            Iterator<Product> iterator = productList.iterator();
            while (iterator.hasNext()) {
                Product product = iterator.next();
        %>
        <tr id="<%=product.getBook_id()%>">
            <td><img width="20px" src="book.png"/></td>
            <td><%=product.getBook_name()%></td>
            <td><%=product.getBook_price()%></td>
            <td>
                <form action="buy.do" method="post">
                    <input type="hidden" name="book_id" value="<%=product.getBook_id()%>">
                    <input type="submit" value="加入购物车" class="btn btn-info">
                </form>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>


</body>
</html>
