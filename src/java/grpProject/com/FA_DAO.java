/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grpProject.com;

import java.sql.*;

public class FA_DAO {

    // method for database connection
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

    // method for making new appointment
    public static int makeAppt(FAappt appt) {
        int status = 0;

        try {
            Connection con = FA_DAO.getConnection();
            String qry = "INSERT INTO faappointment(username,name,telno,email,date,time) VALUES(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(qry);
            ps.setString(1, appt.getUsername());
            ps.setString(2, appt.getName());
            ps.setString(3, appt.getTelno());
            ps.setString(4, appt.getEmail());
            ps.setString(5, appt.getDate());
            ps.setString(6, appt.getTime());

            status = ps.executeUpdate();

            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    // method for deleting an appointment
    public static int deleteAppt(String name) {
        int status = 0;

        try {
            Connection con = FA_DAO.getConnection();
            String qry = "DELETE from faappointment where name=?";
            PreparedStatement ps = con.prepareStatement(qry);

            ps.setString(1, name);
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    // method for updating an appointment
    public static int updateAppt(FAappt appt) {
        int status = 0;

        try {
            Connection con = FA_DAO.getConnection();
            String qry = "UPDATE faappointment SET telno=?,email=?,date=?,time=? WHERE name=?";
            PreparedStatement ps = con.prepareStatement(qry);

            ps.setString(1, appt.getTelno());
            ps.setString(2, appt.getEmail());
            ps.setString(3, appt.getDate());
            ps.setString(4, appt.getTime());
            ps.setString(5, appt.getName());

            status = ps.executeUpdate();

            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    // method to check if an appointment has already been made before
    public static int checkAppt(String username) {
        int status = 0;

        try {
            Connection con = FA_DAO.getConnection();

            PreparedStatement ps = con
                    .prepareStatement("select * from faappointment WHERE username='" + username + "'");

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
