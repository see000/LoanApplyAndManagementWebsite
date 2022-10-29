/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.dao.LoanDao;
import com.model.Loan;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author seepa
 */
@WebServlet(name = "LoanController", urlPatterns = {"/LoanController"})
public class LoanController extends HttpServlet {

    private static String APPLY = "/applyLoan2.jsp";
    private static String EDIT = "/editLoan.jsp";
    private static String VIEW = "/checkLoan.jsp";
    private LoanDao dao;

    public LoanController() throws ClassNotFoundException {
        super();
        dao = new LoanDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward = "";
        String action = request.getParameter("action");
        Loan loan = new Loan();

        if (action.equalsIgnoreCase("apply")) {

            forward = APPLY;

        } else if (action.equalsIgnoreCase("edit")) {
            forward = EDIT;

        } else if (action.equalsIgnoreCase("view")) {
            request.setAttribute("loan", dao.getLoanDetailsByUser(loan.getUserName()));
            forward = VIEW;

        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        Loan loan = new Loan();
        String initialdate = request.getParameter("initialdate");
        String duration = request.getParameter("duration");
        String totalamount = request.getParameter("totalamount");

        loan.setUserName(request.getParameter("username"));
        loan.setName(request.getParameter("name"));
        loan.setLoanId(request.getParameter("loanid"));
        loan.setLoanType(request.getParameter("loantype"));
        loan.setInitialDate(request.getParameter("initialdate"));
        loan.setDuration(request.getParameter("duration"));
        loan.setInterestRate(request.getParameter("interestrate"));
        loan.setTotalAmount(request.getParameter("totalamount"));
        loan.setMonthlyLoan(totalamount, duration);

        /* For Apply Loan and alert Message about succeses login*/
        if (action.equalsIgnoreCase("apply")) {

            dao.applyLoan(loan);
        }

        RequestDispatcher view = request.getRequestDispatcher(VIEW);
        request.setAttribute("loan", dao.getLoanDetailsByUser(loan.getUserName()));

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
