package com.entity;

import java.util.List;

/**
 * Created by StarryZB on 2017/11/4.
 * 用户实体类
 */
public class User {
    public String name;
    public String psssword;
    public List<Product> productList;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPsssword() {
        return psssword;
    }

    public void setPsssword(String psssword) {
        this.psssword = psssword;
    }

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", psssword='" + psssword + '\'' +
                ", productList=" + productList +
                '}';
    }
}
