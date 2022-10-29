package project.com;

import java.sql.*;
import java.util.*;
import project.com.User;

public class UserDAO {

    // get connection is used to connect the tomcat server to the database created
    // by ourselves.
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/3502project", "root", "admin");
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return con;
    }

    // updateUser dao is used by the updateServ to process update action to update
    // data in the database
    public static int updateUser(User user) {
        int status = 0;
        try {
            Connection con = UserDAO.getConnection();
            String update = "update users set password=?,name=?,birthdate=?,gender=?,address=?,phonenumber=? where username=?";
            PreparedStatement ps = con.prepareStatement(update);
            ps.setString(7, user.getUsername());
            ps.setString(1, user.getPassword());
            ps.setString(2, user.getName());
            ps.setString(3, user.getBirthdate());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAddress());
            ps.setString(6, user.getPhonenumber());

            status = ps.executeUpdate();
            System.out.println("function");

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return status;
    }

    // loginUser is used to allow user to login to the homepage after using the
    // correct username and password
    public static int loginUser(String username, String password) {
        int status = 0;
        try {
            Connection con = UserDAO.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from users where username=? and password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            System.out.println("Username in LoginDao :" + username + "and the password :" + password);
            ResultSet rs = ps.executeQuery();
            System.out.println("");
            System.out.println("query executed");
            if (rs.next()) {
                status = 1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    // Register is used to register new user into the database by inserting new
    // data.
    public static User Register(User user) {
        try {
            Connection con = UserDAO.getConnection();
            String myQry = "INSERT INTO users (username,password,name,birthdate,gender,address,phonenumber) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(myQry);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getName());
            ps.setString(4, user.getBirthdate());
            ps.setString(5, user.getGender());
            ps.setString(6, user.getAddress());
            ps.setString(7, user.getPhonenumber());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    // allows users to login to existing data from database
    public static int checkLogin(String username, String password) {
        int status = 0;

        try {
            Connection con = UserDAO.getConnection();

            PreparedStatement ps = con.prepareStatement("select * from users where username=? and password=?");

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                status = 1;
            }
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

}
