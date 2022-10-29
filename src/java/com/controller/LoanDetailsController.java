/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.LoanDetailsDao;
import com.model.LoanDetails;
import com.sun.accessibility.internal.resources.accessibility;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author seepa
 */
@WebServlet(name = "LoanDetailsController", urlPatterns = {"/LoanDetailsController"})
public class LoanDetailsController extends HttpServlet {

    private static String APPLY = "/applyLoan.jsp";
    private LoanDetailsDao dao;

    public LoanDetailsController() throws ClassNotFoundException {
        super();
        dao = new LoanDetailsDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String forward = "";
        String action = request.getParameter("action");
        /* To retrieve the data from from the database about loan offers */
        if (action.equalsIgnoreCase("apply")) {
            String loanid = request.getParameter("loanid");
            dao.getLoanDetailsById(loanid);
            forward = APPLY;
            request.setAttribute("loanid", loanid);
        }
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
