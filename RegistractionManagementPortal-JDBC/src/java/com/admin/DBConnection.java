package com.admin;

import java.sql.*;

public class DBConnection {
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        // Load driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // DB URL, username, password
        String url = "jdbc:mysql://localhost:3307/admin_db";
        String user = "root";       // your MySQL username
        String pass = "Dikshit@2002";   // your MySQL password

        return DriverManager.getConnection(url, user, pass);
    }
}
