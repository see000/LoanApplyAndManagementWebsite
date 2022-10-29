<%@page import="com.model.DebtPayment"%>
<%@page import="com.dao.DebtPaymentDao"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" class="h-100">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.84.0">
        <title>View All Transactions</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/cover/">



        <!-- Bootstrap core CSS -->
        <link href="bootstrap.min.css" rel="stylesheet">

        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>


        <!-- Custom styles for this template -->
        <link href="cover.css" rel="stylesheet">

    </head>
    <%
        String username = (String) session.getAttribute("keyusername");
    %>
    <body class="d-flex h-100 text-center text-white bg-dark">

        <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
            <header>
                <div>
                    <h3 class="float-md-start mb-0">Group 8</h3>
                    <nav class="nav nav-masthead justify-content-center float-md-end">
                        <a class="nav-link" aria-current="page" href="home.jsp?username=<%=username%>"">Home</a>
                        <a class="nav-link active" href="debt.jsp?username=<%=username%>"">Debt</a>
                        <a class="nav-link" href="checkLoan.jsp?username=<%=username%>">Loan</a>
                        <a class="nav-link" href="makeAppt.jsp?username=<%=username%>">Appointment</a>
                        <a class="nav-link" href="index.html">Logout</a>
                    </nav>
                </div>
            </header>

            <body>

                <div class="container">

                    <nav class="navbar navbar-expand-lg navbar-light bg-dark">
                        <div class="container-fluid">
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                                <div class="navbar-nav navbar">
                                    <a class="nav-link" id="subnav" aria-current="page" href="debt.jsp">Debt Details</a>
                                    <a class="nav-link" id="subnav" href="addPayment.jsp">Payment</a>
                                    <a class="nav-link active" id="subnav" href="DebtPaymentController?action=view&username=<%=username%>">Transaction</a>

                                </div>
                            </div>
                        </div>
                    </nav>
                </div>

                <div class="container">
                    <h1>All Transactions</h1>
                    <table class="table table-dark table-bordered" border="1"'>
                        <thead>
                            <tr>
                                <th>Transaction ID</th>
                                <th>Username</th>
                                <th>Debt ID</th>
                                <th>Bank</th>
                                <th>Account ID</th>
                                <th>Date</th>
                                <th>Amount</th>
                                <th colspan="2">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${payments}" var="payment">
                                <tr>
                                    <td><c:out value="${payment.transid}"/></td>
                                    <td><c:out value="${payment.username}"/></td>
                                    <td><c:out value="${payment.debtid}"/></td>
                                    <td><c:out value="${payment.bank}"/></td>
                                    <td><c:out value="${payment.accountid}"/></td>
                                    <td><c:out value="${payment.date}"/></td>
                                    <td><c:out value="${payment.amount}"/></td>
                                    <td>
                                        <a href="DebtPaymentController?action=update&transid=<c:out value="${payment.transid}"/>"><button>Update</button></a>
                                    </td>

                                    <td>
                                        <a href="DebtPaymentController?action=delete&transid=<c:out value="${payment.transid}"/>"><button>Delete</button></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table></div>


                <footer class="mt-auto text-white-50">
                    <p>All copyright reserved &copy;2022 - Gabriel, Loke, See</p>
                </footer>
            </body>
        </div>



    </body>

</html>