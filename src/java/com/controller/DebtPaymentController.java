/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.DebtPayment;
import com.dao.DebtPaymentDao;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author seepa
 */
@WebServlet(name = "DebtPaymentController", urlPatterns = {"/DebtPaymentController"})
public class DebtPaymentController extends HttpServlet {

    private static String ADDPAYMENT = "/addpayment.jsp";
    private static String UPDATE = "/updatePayment.jsp";
    private static String VIEW = "/ViewAllTransaction.jsp";
    private DebtPaymentDao dao;

    public DebtPaymentController() throws ClassNotFoundException {
        super();
        dao = new DebtPaymentDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String forward = "";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("view")) {
            String username = request.getParameter("username");
            request.setAttribute("payments", dao.viewAllPaymentByUser(username));
            forward = VIEW;

        } else if (action.equalsIgnoreCase("addpayment")) {
            forward = ADDPAYMENT;

        } else if (action.equalsIgnoreCase("update")) {
            forward = UPDATE;
            String transid = request.getParameter("transid");
            DebtPayment payment = dao.viewPaymentByTransID(transid);
            request.setAttribute("payment", payment);

        } else if (action.equalsIgnoreCase("delete")) {
            String username = request.getParameter("username");
            String transid = request.getParameter("transid");
            dao.deletePayment(transid);
            forward = VIEW;
            request.setAttribute("payment", dao.viewAllPaymentByUser(username));

        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String action = request.getParameter("action");
        DebtPayment payment = new DebtPayment();

        /* For add Debt Payment */
        if (action.equalsIgnoreCase("addpayment")) {

            payment.setUsername(request.getParameter("username"));
            payment.setDebtid(request.getParameter("debtid"));
            payment.setBank(request.getParameter("bank"));
            payment.setAccountid(request.getParameter("accountid"));
            payment.setDate(request.getParameter("date"));
            payment.setAmount(request.getParameter("amount"));

            dao.addPayment(payment);
            System.out.println("Debt Payment successfully added");

            /* For update DebtPayment */
        } else if (action.equalsIgnoreCase("update")) {

            payment.setTransid(request.getParameter("transid"));
            payment.setDebtid(request.getParameter("debtid"));
            payment.setBank(request.getParameter("bank"));
            payment.setAccountid(request.getParameter("accountid"));
            payment.setDate(request.getParameter("date"));
            payment.setAmount(request.getParameter("amount"));

            dao.updatePayment(payment);
        }

        System.out.println("View payment by user loaded");
        request.setAttribute("payment", dao.viewAllPaymentByUser(username));
        RequestDispatcher view = request.getRequestDispatcher(VIEW);
        view.forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
