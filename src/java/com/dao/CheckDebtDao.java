/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import java.sql.Connection;

import java.lang.ref.Cleaner;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.*;

import com.model.CheckDebt;
import java.sql.DriverManager;

/**
 *
 * @author seepa
 */
public class CheckDebtDao {

    CheckDebt check = new CheckDebt();

    /* Database */
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/3502project", "root", "admin");
        } catch (Exception e) {
        }
        return con;
    }

    /* Get User Loan by Username */
    public CheckDebt getDetailsFromLoan(String username) {

        try {
            System.out.println("Get Details Loan class loaded");
            Connection con = CheckDebtDao.getConnection();
            String myQry = "SELECT * FROM userloan WHERE username=?";
            PreparedStatement myPS = con.prepareStatement(myQry);
            myPS.setString(1, username);
            ResultSet rs = myPS.executeQuery();
            if (rs.next()) {
                check.setLoanid(rs.getString(3));
                check.setLoantype(rs.getString(4));
                check.setTotaldebt(rs.getString(7));
                System.out.println("Call get from other dao: Debt Id :" + check.getDebtid());
                System.out.println("loan id: " + check.getLoanid());
                System.out.println("Loan Type: " + check.getLoantype());
                System.out.println("Total debt: " + check.getTotaldebt());
            }

            System.out.println("Get Details Loan class completed");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }

    /* Sum Up all the payment in the Payment database */
    public CheckDebt getPaymentFromDebtPayment(String username) {

        try {

            System.out.println("Get Payment class loaded");

            Connection con = CheckDebtDao.getConnection();
            String myQry = "SELECT SUM(amount) FROM debtpayment where username=?";
            PreparedStatement myPS = con.prepareStatement(myQry);
            myPS.setString(1, username);

            ResultSet rs = myPS.executeQuery();
            if (rs.next()) {
                check.setAmountpaid(rs.getString(1));
                System.out.println("Amount payment: " + check.getAmountpaid());
            }
            System.out.println("Call get from other dao: Debt Id :" + check.getDebtid());
            System.out.println("Get Payment class completed");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    /* Get all the Debt payment by username */
    public CheckDebt getDebtIdFromDebtPayment(String username) {

        try {

            System.out.println("Get Debt id loaded");
            Connection con = CheckDebtDao.getConnection();
            String myQry = "SELECT * FROM debtpayment WHERE username=?";
            PreparedStatement myPS = con.prepareStatement(myQry);
            myPS.setString(1, username);
            ResultSet rs = myPS.executeQuery();
            if (rs.next()) {

                check.setDebtid(rs.getString(3));
                System.out.println("Debt id: " + check.getDebtid());
            }
            System.out.println("Get Debt id completed");
        } catch (SQLException ex) {
            Logger.getLogger(CheckDebtDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;

    }
}
