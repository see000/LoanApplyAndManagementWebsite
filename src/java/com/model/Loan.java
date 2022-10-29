/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author seepa
 */
public class Loan {

    private String loanId;
    private String loanType;
    private String initialDate;
    private String duration;
    private String totalAmount;
    private String loanReleases;
    private String monthlyLoan;
    private String loanRemain;
    private String username;
    private String name;
    private String interestRate;

    public Loan() {

    }

    public String getLoanId() {
        return loanId;
    }

    public void setLoanId(String loanId) {
        String loanIdWithPlan = "P-00" + loanId;
        this.loanId = loanIdWithPlan;
    }

    public String getLoanType() {
        return loanType;
    }

    public void setLoanType(String loanType) {
        this.loanType = loanType;
    }

    public String getInitialDate() {
        return initialDate;
    }

    public void setInitialDate(String initialDate) {
        this.initialDate = initialDate;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(String totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getLoanReleases() {
        return loanReleases;
    }

    public void setLoanReleases(String loanReleases) {
        this.loanReleases = loanReleases;
    }

    public String getMonthlyLoan() {
        return monthlyLoan;
    }

    public void setMonthlyLoan(String total, String duration) {
        double dtotal = Double.parseDouble(total);
        double dduration = Double.parseDouble(duration);

        double monthlyLoanDouble = dtotal / (dduration * 12);
        String monthlyLoan = String.valueOf(monthlyLoanDouble);

        this.monthlyLoan = monthlyLoan;
    }

    public String getLoanRemain() {
        return loanRemain;
    }

    public void setLoanRemain(String loanRemain) {
        this.loanRemain = loanRemain;
    }

    public String getUserName() {
        return username;
    }

    public void setUserName(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getInterestRate() {
        return interestRate;
    }

    public void setInterestRate(String interestRate) {
        this.interestRate = interestRate;
    }

}
