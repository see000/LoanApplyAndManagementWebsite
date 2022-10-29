<%-- 
    Document   : applyLoan2
    Created on : Jun 7, 2022, 10:00:27 PM
    Author     : seepa
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
            <table>

                <tr>
                    <td>
                        Username :
                    </td>
                    <td>
                        <c:out value="${loan.username}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Name :
                    </td>
                    <td>
                        <c:out value="${loan.name}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Loan ID :
                    </td>
                    <td>
                        <c:out value="${loan.loanId}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Loan Type :
                    </td>
                    <td>
                        <c:out value="${loan.loanType}"/>                   
                    </td>
                </tr>
                <tr>
                    <td>
                        Initial Loan Date :
                    </td>
                    <td>
                        <c:out value="${loan.initialDate}"/>
                    </td>
                </tr><!-- comment -->
                
                <tr>
                    <td>
                        Duration
                    </td>
                    <td>
                        <c:out value="${loan.duration}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Total Amount Loan : 
                    </td>
                    <td>
                        <c:out value="${loan.totalAmount}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Monthly Loan : 
                    </td>
                    <td>
                        <c:out value="${loan.monthlyLoan}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Interest Rate :
                    </td>
                    <td>
                        <c:out value="${loan.interestRate}"/>
                    </td>
                </tr>

            </table>
        </form>


    </body>
</html>
