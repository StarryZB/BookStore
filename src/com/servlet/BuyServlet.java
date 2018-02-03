package com.servlet;

import com.entity.Product;
import com.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by StarryZB on 2017/11/4.
 * 购物车页面初始化
 */
public class BuyServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String book_id = req.getParameter("book_id");
        ProductService productService = new ProductService();
        Product product = productService.getProductById(book_id);//用book_id，通过id取得实体类
        product.setBook_id(Integer.parseInt(book_id));
        if (session.getAttribute("idproductmap") != null) {
            Map<String,Product> idproductmap = (Map<String, Product>) session.getAttribute("idproductmap");
            Map<String,Integer> idnummap = (Map<String, Integer>) session.getAttribute("idnummap");
            if (idnummap.get(book_id) != null) {
                int book_num = idnummap.get(book_id) + 1;
                idproductmap.put(book_id,product);
                idnummap.put(book_id,book_num);
                session.setAttribute("idproductmap",idproductmap);
                session.setAttribute("idnummap",idnummap);
            } else {
                int book_num = 1;//暂时定为1
                idproductmap.put(book_id,product);//键为id，值为实体类
                idnummap.put(book_id,book_num);//键为id，值为数目，可以改添加数量
                session.setAttribute("idproductmap",idproductmap);
                session.setAttribute("idnummap",idnummap);
            }

        } else {
            Map<String,Product> idproductmap = new HashMap<String,Product>();//id-product
            Map<String,Integer> idnummap = new HashMap<String,Integer>();//id-num
            int book_num = 1;//暂时定为1
            idproductmap.put(book_id,product);//键为id，值为实体类
            idnummap.put(book_id,book_num);//键为id，值为数目，可以改添加数量
            session.setAttribute("idproductmap",idproductmap);
            session.setAttribute("idnummap",idnummap);
        }
        req.getRequestDispatcher("cart.jsp").forward(req,resp);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("idproductmap") == null) {
            Map<String,Product> idproductmap = new HashMap<String,Product>();
            Map<String,Integer> idnummap = new HashMap<String,Integer>();
            session.setAttribute("idproductmap",idproductmap);
            session.setAttribute("idnummap",idnummap);
        }
        req.getRequestDispatcher("cart.jsp").forward(req,resp);
    }
}
