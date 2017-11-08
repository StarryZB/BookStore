package com.servlet;

import com.dao.ProductDao;
import com.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by StarryZB on 2017/11/4.
 */
public class BuyServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Map<String,Product> idproductmap;
        Map<String,Integer> idnummap;
        String book_id = req.getParameter("book_id");
        Product product = new ProductDao().getProductById(book_id);//用book_id，通过id取得实体类

        if (session.getAttribute("idproductmap") == null) {
            idproductmap = (Map<String, Product>) session.getAttribute("idproductmap");
            idnummap = (Map<String, Integer>) session.getAttribute("idnummap");
        } else {
            idproductmap = new HashMap<String,Product>();//id-product

            idnummap = new HashMap<String,Integer>();//id-num
            idnummap.put("aaa",1);
        }
        System.out.println(idproductmap);
        System.out.println(idnummap);

        if (idnummap == null ) {
            int book_num = 1;//暂时定为1
            idproductmap.put(book_id,product);//键为id，值为实体类
            idnummap.put(book_id,book_num);//键为id，值为数目，可以改添加数量
        } else {
            int book_num = idnummap.get(book_id) + 1;
            idproductmap.put(book_id,product);
            idnummap.put(book_id,book_num);
        }

        session.setAttribute("idproductmap",idproductmap);
        session.setAttribute("idnummap",idnummap);
        req.getRequestDispatcher("cart.jsp").forward(req,resp);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
