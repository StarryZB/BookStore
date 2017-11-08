<%@ page import="java.util.Map" %>
<%@ page import="com.entity.Product" %><%--
  Created by IntelliJ IDEA.
  User: 34432
  Date: 2017/11/4
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<head>
    <title>购物清单</title>
</head>
<body>
<%
    Map<String,Product> idproductmap = (Map<String, Product>) session.getAttribute("idproductmap");
    Map<String,Integer> idnummap = (Map<String, Integer>) session.getAttribute("idnummap");
%>

<div>
    <table class="table table-hover">
        <thead>
        <th>商品</th>
        <th>商品名称</th>
        <th>价格</th>'
        <th>数目</th>
        </thead>
        <tbody>
        <%
            double sum = 0;
            for (String key : idproductmap.keySet()) {
                Product product = idproductmap.get(key);
                int book_num = idnummap.get(key);
                sum += product.getBook_price() * book_num;
        %>
        <tr>
            <td><img width="20px" src="book.png"/></td>
            <td><%=product.getBook_name()%></td>
            <td><%=product.getBook_price()%></td>
            <td><%=book_num%></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<div align="center">
    总价格为：<%=sum%><br/>
    <form method="post" action="checkout.do">
        <input type="submit" value="结账">
    </form>
</div>


</body>
</html>
