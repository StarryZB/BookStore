package com.servlet;

import com.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

/**
 * Created by StarryZB on 2017/11/11.
 * 添加商品
 */
public class AddServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Map<String,Product> idproductmap = (Map<String, Product>) session.getAttribute("idproductmap");
        Map<String,Integer> idnummap = (Map<String, Integer>) session.getAttribute("idnummap");
        String book_id = req.getParameter("add");
        int book_num = idnummap.get(book_id);
        book_num = book_num + 1;
        idnummap.put(book_id,book_num);
        session.setAttribute("idnummap",idnummap);
        req.getRequestDispatcher("cart.jsp").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
