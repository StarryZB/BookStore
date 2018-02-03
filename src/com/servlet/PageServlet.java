package com.servlet;

import com.entity.Product;
import com.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by StarryZB on 2017/11/12.
 * 商品翻页初始化
 */
public class PageServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int page = Integer.parseInt(req.getParameter("page"));
        int begin = page * 7;
        ProductService productService = new ProductService();
        List<Product> listProduct = productService.getListProduct(begin,7);
        req.setAttribute("begin",begin);
        req.setAttribute("listproduct",listProduct);
        req.getRequestDispatcher("product.jsp").forward(req,resp);
    }
}
