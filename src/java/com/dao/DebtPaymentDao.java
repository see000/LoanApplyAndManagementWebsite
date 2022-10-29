/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.model.DebtPayment;
import com.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author seepa
 */
public class DebtPaymentDao {

    private Connection myConnection;

    /* establish database connection */
    public DebtPaymentDao() throws ClassNotFoundException {
        myConnection = DBConnection.getConnection();
    }

    /* Insert payment into Debt Payment database */
    public void addPayment(DebtPayment payment) {
        try {
            String myQry = "INSERT INTO debtpayment(username,debtid,bank,accountid, date, amount) VALUES  (?,?,?,?,?,?)";
            PreparedStatement myPS = myConnection.prepareStatement(myQry);
            myPS.setString(1, payment.getUsername());
            myPS.setString(2, payment.getDebtid());
            myPS.setString(3, payment.getBank());
            myPS.setString(4, payment.getAccountid());
            myPS.setString(5, payment.getDate());
            myPS.setString(6, payment.getAmount());
            System.out.println("data dao loaded");
            myPS.executeUpdate();
            System.out.println("data dao executed");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /* Delete a payment from Debt Payment Database */
    public void deletePayment(String transid) {
        try {
            String myQry = "DELETE FROM debtpayment WHERE transid=? ";
            PreparedStatement myPS = myConnection.prepareStatement(myQry);
            myPS.setString(1, transid);
            myPS.executeUpdate();

        } catch (Exception e) {
        }

    }

    /* Retrieve all the payments from Debt Payment database By Username */
    public List<DebtPayment> viewAllPaymentByUser(String username) {
        List<DebtPayment> payments = new ArrayList<DebtPayment>();

        try {
            System.out.println("ViewPaymentUser loaded");
            Statement statement = myConnection.createStatement();
            ResultSet rs = statement.executeQuery("select * from debtpayment where username='" + username + "'");
            while (rs.next()) {
                DebtPayment payment = new DebtPayment();
                payment.setTransid(rs.getString("transid"));
                payment.setUsername(rs.getString("username"));
                payment.setDebtid(rs.getString("debtid"));
                payment.setBank(rs.getString("bank"));
                payment.setAccountid(rs.getString("accountid"));
                payment.setDate(rs.getString("date"));
                payment.setAmount(rs.getString("amount"));

                System.out.println("Payment list is being added");
                payments.add(payment);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return payments;
    }

    /* Retrieve All payment from Debt Payment by transaction id */
    public DebtPayment viewPaymentByTransID(String transid) {
        DebtPayment payment = new DebtPayment();
        try {

            String myQry = "SELECT * FROM debtpayment WHERE transid=?";
            PreparedStatement myPS = myConnection.prepareStatement(myQry);
            myPS.setString(1, transid);
            ResultSet rs = myPS.executeQuery();
            while (rs.next()) {
                payment.setTransid(rs.getString("transid"));
                payment.setUsername(rs.getString("username"));
                payment.setDebtid(rs.getString("debtid"));
                payment.setBank(rs.getString("bank"));
                payment.setAccountid(rs.getString("accountid"));
                payment.setDate(rs.getString("date"));
                payment.setAmount(rs.getString("amount"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return payment;
    }

    /* Update a payment in Debt payment Database by transid */
    public void updatePayment(DebtPayment payment) {
        try {
            String myQry = "UPDATE debtpayment SET debtid=?, bank=? , accountid=?, date=?, amount=? WHERE transid=?";
            PreparedStatement myPS = myConnection.prepareStatement(myQry);
            myPS.setString(1, payment.getDebtid());
            myPS.setString(2, payment.getBank());
            myPS.setString(3, payment.getAccountid());
            myPS.setString(4, payment.getDate());
            myPS.setString(5, payment.getAmount());
            myPS.setString(6, payment.getTransid());

            myPS.executeUpdate();

        } catch (Exception e) {
        }
    }

}
