package com.servlet;

import com.dao.ProductDao;
import com.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by StarryZB on 2017/11/12.
 */
public class PageServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int page = Integer.parseInt(req.getParameter("page"));
        int begin = page * 7;
        List<Product> listProduct = new ProductDao().getListProduct(begin,7);
        req.setAttribute("begin",begin);
        req.setAttribute("listproduct",listProduct);
        req.getRequestDispatcher("product.jsp").forward(req,resp);
    }
}
