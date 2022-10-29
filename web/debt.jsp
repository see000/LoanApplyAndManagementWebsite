<%@page import="com.model.CheckDebt"%>
<%@page import="com.dao.CheckDebtDao"%>
<!doctype html>
<html lang="en" class="h-100">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.84.0">
        <title>Debt</title>

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

        String keyusername = (String) session.getAttribute("keyusername");
        session.setAttribute("keyusername", keyusername);
        System.out.println("My key :" + keyusername);
        CheckDebtDao CheckDebtdao = new CheckDebtDao();
        CheckDebt check = new CheckDebt();

        check = CheckDebtdao.getDebtIdFromDebtPayment(keyusername);
        check = CheckDebtdao.getDetailsFromLoan(keyusername);
        check = CheckDebtdao.getPaymentFromDebtPayment(keyusername);

        String debtdebtid = null, debtloanid = null, debtloantype = null, debttotaldebt = null, debttotalamount = null, remaining = null;

        debtdebtid = check.getDebtid();
        debtloanid = check.getLoanid();
        debtloantype = check.getLoantype();
        debttotaldebt = check.getTotaldebt();
        debttotalamount = check.getAmountpaid();
        try {
            String remainingdebt = check.CalculateRemaining(debttotaldebt, debttotalamount);
            check.setRemainingdebt(remainingdebt);
        } catch (Exception e) {
        }

        remaining = check.getRemainingdebt();
    %>
    <body class="d-flex h-100 text-center text-white bg-dark">

        <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
            <header>
                <div>
                    <h3 class="float-md-start mb-0">Group 8</h3>
                    <nav class="nav nav-masthead justify-content-center float-md-end">
                        <a class="nav-link" aria-current="page" href="home.jsp?keyusername=S58079">Home</a>

                        <a class="nav-link active" href="debt.jsp">Debt</a>
                        <a class="nav-link" href="checkLoan.jsp">Loan</a>
                        <a class="nav-link" href="makeAppt.jsp">Appointment</a>
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
                                <div class="navbar-nav">
                                    <a class="nav-link active" id="subnav" aria-current="page" href="debt.jsp">Debt
                                        Details</a>
                                    <a class="nav-link" id="subnav" href="addPayment.jsp">Payment</a>
                                    <a class="nav-link" id="subnav" href="DebtPaymentController?action=view&username=<%=keyusername%>">Transaction</a>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
                <div class="container">
                    <table class="table table-dark table-bordered">
                        <thead>
                        <th></th>
                        <th>Details</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    Debt ID
                                </td>
                                <td>
                                    <%=debtdebtid%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Loan ID
                                </td>
                                <td>
                                    <%=debtloanid%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Loan Type
                                </td>
                                <td>
                                    <%=debtloantype%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Total Debt
                                </td>
                                <td>
                                    <%=debttotaldebt%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Total Amount Paid
                                </td>
                                <td>
                                    <%=debttotalamount%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Remaining Debt
                                </td>
                                <td>
                                    <%=remaining%>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>


                <footer class="mt-auto text-white-50">
                    <p>All copyright reserved &copy;2022 - Gabriel, Loke, See</p>
                </footer>
            </body>
        </div>



    </body>

</html>