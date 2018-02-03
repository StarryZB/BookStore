package com.servlet;

import com.entity.Product;
import com.entity.User;
import com.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by StarryZB on 2017/11/3.
 * 商品展示页面初始化
 */
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("user") == null) {
            User user = new User();
            String name = req.getParameter("name");
            String password = req.getParameter("password");
            user.setName(name);
            user.setPsssword(password);
            session.setAttribute("user",user);
        }
        String bookname = req.getParameter("bookname");
        List<Product> listProduct;
        if (bookname != null && !"".equals(bookname)) {
            ProductService productService = new ProductService();
            listProduct = productService.getProductByName(bookname);
        } else {
            ProductService productService = new ProductService();
            listProduct = productService.getListProduct(0,7);
        }
        req.setAttribute("begin",0);
        req.setAttribute("listproduct",listProduct);
        req.getRequestDispatcher("product.jsp").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
