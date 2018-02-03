package com.dao;

import java.sql.*;

/**
 * Created by StarryZB on 2017/11/3.
 * 数据库工具类
 */
public class DBUtil {
    private static final String driver = "com.mysql.jdbc.Driver"; //数据库驱动
    private static final String url="jdbc:mysql://localhost:3306/bookstore";//连接数据库的URL地址
    private static final String username="root";//数据库的用户名
    private static final String password="123456";//数据库的密码


    public static Connection getConn() {
        Connection conn = null;
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("找不到驱动类");
        }
        try {
            conn = DriverManager.getConnection(url,username,password);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("连接失败");
        }
        return conn;
    }
    public static Statement createStmt(Connection conn) {
        Statement stmt = null;
        try {
            stmt = conn.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stmt;
    }
    public static ResultSet executeQuery(Statement stmt, String sql) {
        ResultSet rs = null;
        try {
            rs = stmt.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
    public static void closers(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public static void closestmt(Statement stmt) {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public static void closeconn(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
