package com.food.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.food.dao.UserDAO;
import com.food.model.User;
import com.food.util.DBConnection;


import java.sql.*;

import com.food.dao.UserDAO;
import com.food.model.User;
import com.food.util.DBConnection;

public class UserDAOImpl implements UserDAO {

    @Override
    public boolean registerUser(User user) {

        try {

            Connection con = DBConnection.getConnection();

            String sql =
            "insert into users(name,email,password,gender,phone) values(?,?,?,?,?)";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ps.setString(1,user.getName());
            ps.setString(2,user.getEmail());
            ps.setString(3,user.getPassword());
            ps.setString(4,user.getGender());
            ps.setString(5,user.getPhone());

            return ps.executeUpdate()>0;

        } catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public User loginUser(String email,String password) {

        User user=null;

        try {

            Connection con=DBConnection.getConnection();

            String sql=
            "select * from users where email=? and password=?";

            PreparedStatement ps=
            con.prepareStatement(sql);

            ps.setString(1,email);
            ps.setString(2,password);

            ResultSet rs=ps.executeQuery();

            if(rs.next()) {

                user=new User(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("gender"),
                    rs.getString("phone")
                );
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public boolean updatePassword(String email,String password) {

        try {

            Connection con=DBConnection.getConnection();

            String sql=
            "update users set password=? where email=?";

            PreparedStatement ps=
            con.prepareStatement(sql);

            ps.setString(1,password);
            ps.setString(2,email);

            return ps.executeUpdate()>0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    
    @Override
    public boolean resetPassword(String email, String password) {

        try {

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE users SET password=? WHERE email=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, password);
            ps.setString(2, email);

            int result = ps.executeUpdate();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    } 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}