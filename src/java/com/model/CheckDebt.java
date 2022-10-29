/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

/**
 *
 * @author seepa
 */
public class CheckDebt {

    private String debtid;
    private String loanid;
    private String loantype;
    private String totaldebt;
    private String amountpaid;
    private String remainingdebt;

    public CheckDebt() {

    }

    public String getDebtid() {
        return debtid;
    }

    public void setDebtid(String debtid) {
        this.debtid = debtid;
    }

    public String getLoanid() {
        return loanid;
    }

    public void setLoanid(String loanid) {
        this.loanid = loanid;
    }

    public String getLoantype() {
        return loantype;
    }

    public void setLoantype(String loantype) {
        this.loantype = loantype;
    }

    public String getTotaldebt() {
        return totaldebt;
    }

    public void setTotaldebt(String totaldebt) {
        this.totaldebt = totaldebt;
    }

    public String getAmountpaid() {
        return amountpaid;
    }

    public void setAmountpaid(String amountpaid) {

        this.amountpaid = amountpaid;
    }

    public String getRemainingdebt() {
        return remainingdebt;
    }

    public void setRemainingdebt(String remainingdebt) {
        this.remainingdebt = remainingdebt;
    }

    public String CalculateRemaining(String totaldebt, String totalamount) {
        Double remainingDouble = Double.parseDouble(totaldebt) - Double.parseDouble(totalamount);
        String remaininString = Double.toString(remainingDouble);

        return remaininString;
    }

}
