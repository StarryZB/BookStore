<%@ page import="java.util.Map" %>
<%@ page import="com.entity.Product" %>
<%@ page import="java.text.DecimalFormat" %><%--
  Created by IntelliJ IDEA.
  User: StarryZB
  Date: 2017/11/4
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css">
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

<div align="center">
    <font face="楷体" size="6">购物车</font>
</div>
<div>
    <table class="table table-hover">
        <thead>
        <th width="20%">商品</th>
        <th width="40%">商品名称</th>
        <th width="20%">价格</th>
        <th></th>
        <th width="50px">数目</th>
        <th></th>
        </thead>
        <tbody>
        <%
            double sum = 0;
            for (String key : idproductmap.keySet()) {
                Product product = idproductmap.get(key);
                int book_num = idnummap.get(key);
                sum += product.getBook_price() * book_num;
                DecimalFormat df = new DecimalFormat("#.00");
                sum = Double.parseDouble(df.format(sum));
        %>
        <tr>
            <td><img width="20px" src="${pageContext.request.contextPath}/image/book.png"/></td>
            <td><%=product.getBook_name()%></td>
            <td><%=product.getBook_price()%></td>
            <td width="10">
                <form method="post" action="delete.do">
                    <input type="hidden" name="delete" value="<%=product.getBook_id()%>">
                    <input type="submit" value="减" class="btn btn-danger">
                </form>
            </td>
            <td width="50px"><%=book_num%></td>
            <td width="10">
                <form method="post" action="add.do">
                    <input type="hidden" name="add" value="<%=product.getBook_id()%>">
                    <input type="submit" value="加" class="btn btn-success">
                </form>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<div align="center">
    <form method="post" action="back.do">
        <input type="submit" value="返回商品信息页面" class="btn btn-info">
    </form>
</div>
<div style="float: right;margin-right: 50px">
    合计：<i class="fa fa-cny"></i> <b style="color: red;font-size: 20px"><%=sum%></b>
    <form method="post" action="checkout.do">
        <input type="submit" value="结算" class="btn btn-lg">
    </form>
</div>
</body>
</html>
