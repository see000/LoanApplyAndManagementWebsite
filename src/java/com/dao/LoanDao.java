/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.model.Loan;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.model.Loan;
import com.util.DBConnection;

/**
 *
 * @author seepa
 */
public class LoanDao {

    private Connection myconnection;

    public LoanDao() throws ClassNotFoundException {
        myconnection = DBConnection.getConnection();
    }

    /* Insert Apply loan details to userloan database */
    public void applyLoan(Loan loan) {
        try {
            System.out.println("LoanDao Apply loaded");
            String myQry = "INSERT INTO userloan (username,name,loanid ,loantype,initialdate,duration ,totalamount, monthlyloan, interestrate) VALUES(?,?,?,?,?,?,?,?,?)";
            PreparedStatement myPS = myconnection.prepareStatement(myQry);

            myPS.setString(1, loan.getUserName());
            myPS.setString(2, loan.getName());
            myPS.setString(3, loan.getLoanId());
            myPS.setString(4, loan.getLoanType());
            myPS.setString(5, loan.getInitialDate());
            myPS.setString(6, loan.getDuration());
            myPS.setString(7, loan.getTotalAmount());
            myPS.setString(8, loan.getMonthlyLoan());
            myPS.setString(9, loan.getInterestRate());

            myPS.executeUpdate();

        } catch (Exception e) {
        }
    }

    /* Retrieve all userloan from userloan database by Username */
    public Loan getLoanDetailsByUser(String username) {
        Loan loan = new Loan();
        try {
            String myQry = "SELECT * FROM userloan where username=?";
            PreparedStatement myPS = myconnection.prepareStatement(myQry);
            myPS.setString(1, username);
            ResultSet rs = myPS.executeQuery();

            while (rs.next()) {
                loan.setUserName(rs.getString("username"));
                loan.setName(rs.getString("name"));
                loan.setLoanType(rs.getString("loantype"));
                loan.setInitialDate(rs.getString("initialdate"));
                loan.setDuration(rs.getString("duration"));
                loan.setTotalAmount(rs.getString("totalamount"));
                loan.setMonthlyLoan(rs.getString("totalamount"), rs.getString("duration"));
                loan.setInterestRate(rs.getString("interestrate"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return loan;
    }

    /* Update Loan by Username */
    public void updateLoanByUser(Loan loan) {
        try {
            String myQry = "UPDATE user set name=? where username=?";
            PreparedStatement myPS = myconnection.prepareStatement(myQry);
            myPS.setString(1, loan.getName());
            myPS.setString(2, loan.getUserName());
            myPS.executeUpdate();

        } catch (Exception e) {
        }
    }
}
