package com.service;

import com.dao.ProductDao;
import com.entity.Product;

import java.util.List;

/**
 * Created by StarryZB on 2018/2/3.
 * 商品相关业务功能
 */
public class ProductService {
    public List<Product> getListProduct(int begin, int rows) {
        ProductDao productDao = new ProductDao();
        return productDao.getListProduct(begin,rows);
    }

    public Product getProductById(String book_id) {
        ProductDao productDao = new ProductDao();
        return productDao.getProductById(book_id);
    }

    public List<Product> getProductByName(String book_name) {
        ProductDao productDao = new ProductDao();
        return productDao.getProductByName(book_name);
    }
}
