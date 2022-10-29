/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.List;
import com.model.LoanDetails;
import com.mysql.cj.CharsetMapping;
import com.util.DBConnection;
import java.sql.DriverManager;

/**
 *
 * @author seepa
 */
public class LoanDetailsDao {

    private Connection connection;

    /* establish connection with database */
    public LoanDetailsDao() throws ClassNotFoundException {
        connection = DBConnection.getConnection();
    }

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csf3107", "root", "admin");
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return con;
    }

    /* Retrive all the data from loan details database */
    public static List<LoanDetails> getAllUsers() {
        List<LoanDetails> list = new ArrayList<LoanDetails>();

        try {
            Connection con = LoanDetailsDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from loandetails");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                LoanDetails e = new LoanDetails();
                e.setLoanId(rs.getString(1));
                e.setLoanType(rs.getString(2));
                e.setDuration(rs.getString(3));
                e.setInterestRate(rs.getString(4));
                e.setTotalAmount(rs.getString(5));
                list.add(e);
            }
            con.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    /* Retrieve all data from loan details database by Loan id */
    public LoanDetails getLoanDetailsById(String loanid) {

        LoanDetails loandetails = new LoanDetails();
        try {
            System.out.println("value in dao by id :" + loanid);
            String myQry = "SELECT * FROM loandetails where loanid=1";
            PreparedStatement myPS = connection.prepareStatement(myQry);
            myPS.setString(1, loanid);
            ResultSet rs = myPS.executeQuery();

            while (rs.next()) {
                loandetails.setLoanId(rs.getString("loanid"));
                loandetails.setLoanType(rs.getString("loantype"));
                loandetails.setDuration(rs.getString("duration"));
                loandetails.setInterestRate(rs.getString("interestrate"));
                loandetails.setTotalAmount(rs.getString("totalamount"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return loandetails;
    }

}
