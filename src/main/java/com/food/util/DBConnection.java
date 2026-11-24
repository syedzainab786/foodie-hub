package com.food.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try {
                con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/foodiehub?useSSL=false&allowPublicKeyRetrieval=true",
                    "root",
                    "root"
                );
            } catch (Exception ex) {
                con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/foodiehub?useSSL=false&allowPublicKeyRetrieval=true",
                    "root",
                    "2005"
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}