<%@ page import="java.util.List" %>
<%@ page import="com.entity.Product" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: StarryZB
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
    <form action="serach.action" id="serach" method="post">
        <table>
            <tbody>
            <tr>
                <td width="90" align="right">书本名称：</td>
                <td>
                    <input name="bookname" type="text" class="form-control" placeholder="请输入搜索内容"/>
                </td>
                <td width="85" align="right"><input type="submit" class="btn btn-default" value="查 询" /></td>
            </tr>
            </tbody>
        </table>
    </form>
</div>

<div>
    <table class="table table-hover">
        <thead>
        <th width="20%">商品</th>
        <th width="40%">商品名称</th>
        <th width="20%">价格</th>'
        <th width="50px">买买买</th>
        </thead>
        <tbody>
        <%
            List<Product> productList = (List<Product>) request.getAttribute("listproduct");
            Iterator<Product> iterator = productList.iterator();
            while (iterator.hasNext()) {
                Product product = iterator.next();
        %>
        <tr id="<%=product.getBook_id()%>">
            <td><img width="20px" src="${pageContext.request.contextPath}/image/book.png"/></td>
            <td><%=product.getBook_name()%></td>
            <td><%=product.getBook_price()%></td>
            <td>
                <form action="buy.action" method="post">
                    <input type="hidden" name="book_id" value="<%=product.getBook_id()%>">
                    <input type="submit" value="加入购物车" class="btn btn-primary">
                </form>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<%
    int lastbegin = (int) request.getAttribute("begin") - 7;
    int nextbegin = (int) request.getAttribute("begin") + 7;
    int lastpagenum = lastbegin / 7;
    int nextpagenum = nextbegin / 7;
%>

<div align="center">
    <form method="get" action="/buy.action">
        <input type="submit" value="查看购物车" class="btn btn-info">
    </form>
</div>

<div align="center">
    <%
        if (lastpagenum < 0) {
            %>
    <div style="display:inline-block;">
        <form>
            <input type="button" value="上一页" class="btn btn disabled">
        </form>
    </div>
    <%
        } else {
            %>
    <div style="display:inline-block;">
        <form method="get" action="page.action">
            <input type="hidden" name="page" value="<%=lastpagenum%>">
            <input type="hidden" name="way" value="last">
            <input type="submit" value="上一页" class="btn btn-default">
        </form>
    </div>
    <%
        }
    %>
    <%
        if (nextpagenum > 2) {
    %>
    <div style="display:inline-block;">
        <form>
            <input type="button" value="下一页" class="btn btn disabled">
        </form>
    </div>
    <%
    } else {
    %>
    <div style="display:inline-block;">
        <form method="get" action="page.action">
            <input type="hidden" name="page" value="<%=nextpagenum%>">
            <input type="hidden" name="way" value="next">
            <input type="submit" value="下一页" class="btn btn-default">
        </form>
    </div>
    <%
        }
    %>
</div>

</body>
</html>
