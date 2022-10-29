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
        <title>Add Payment</title>

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

    <body class="d-flex h-100 text-center text-white bg-dark">

        <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
            <header>
                <div>
                    <h3 class="float-md-start mb-0">Group 8</h3>
                    <nav class="nav nav-masthead justify-content-center float-md-end">
                        <a class="nav-link" aria-current="page" href="home.jsp">Home</a>
                        <a class="nav-link active" href="debt.jsp">Debt</a>
                        <a class="nav-link" href="checkLoan.jsp">Loan</a>
                        <a class="nav-link" href="makeAppt.jsp">Appointment</a>
                        <a class="nav-link" href="index.html">Logout</a>
                    </nav>
                </div>
            </header>
            <%
                String keyusername = (String) session.getAttribute("keyusername");
                CheckDebtDao CheckDebtdao = new CheckDebtDao();
                CheckDebt check = new CheckDebt();

                check = CheckDebtdao.getDebtIdFromDebtPayment(keyusername);
                check = CheckDebtdao.getDetailsFromLoan(keyusername);

                String debtdebtid = null, debtloanid = null;

                debtdebtid = check.getDebtid();
                debtloanid = check.getLoanid();


            %>

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
                                <div class="navbar-nav navbar-dark">
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
                    <h1>Add New Payment</h1>
                    <form action="DebtPaymentController" method="post">
                        <table class="table table-dark table-bordered">
                            <input type="hidden" name="action" value="addpayment">
                            <tbody>
                                <tr>
                                    <td>
                                        Username :
                                    </td>
                                    <td>:</td>
                                    <td>
                                        <input type="text" name="username" value="<%=keyusername%>" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Debt ID :
                                    </td>
                                    <td>:</td>
                                    <td>
                                        <input type="text" name="debtid" value="<%=debtloanid%>" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Bank
                                    </td>
                                    <td>:</td>
                                    <td>

                                        <select name="bank">
                                            <option value="CIMB">CIMB</option>
                                            <option value="Maybank">Maybank</option>
                                            <option value="Hong Leong Bank">Hong Leong Bank</option>
                                            <option value="Bank Rakyat">Bank Rakyat</option>
                                            <option value="RHB Bank">RHB Bank</option>
                                            <option value="Public Bank">Public Bank</option>
                                            <option value="OCBC Bank">OCBC Bank</option>
                                            <option value="Bank Islam Malaysia">Bank Islam Malaysia</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Account ID
                                    </td>
                                    <td>:</td>
                                    <td>
                                        <input type="text" name="accountid">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Date
                                    </td>
                                    <td>:</td>
                                    <td>
                                        <input type="date" name="date">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Amount
                                    </td>
                                    <td>:</td>
                                    <td>
                                        <input type="number" step="any" name="amount">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <button type="submit" class="btn btn-primary">Reset</button>
                    </form>

                </div>


                <footer class="mt-auto text-white-50">
                    <p>All copyright reserved &copy;2022 - Gabriel, Loke, See</p>
                </footer>
            </body>
        </div>



    </body>

</html>