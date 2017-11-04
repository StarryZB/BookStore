package com.entity;

/**
 * Created by StarryZB on 2017/11/3.
 */
public class Product {
    public int book_id;
    public String book_name;
    public double book_price;

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public double getBook_price() {
        return book_price;
    }

    public void setBook_price(double book_price) {
        this.book_price = book_price;
    }

    @Override
    public String toString() {
        return "Product{" +
                "book_id=" + book_id +
                ", book_name='" + book_name + '\'' +
                ", book_price=" + book_price +
                '}';
    }
}
