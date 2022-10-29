<%@page import="com.model.Loan" %>
<%@page import="com.dao.LoanDao" %>
<!doctype html>
<html lang="en" class="h-100">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.84.0">
        <title>Loan</title>

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
                        <a class="nav-link " aria-current="page" href="home.jsp?keyusername=S58079">Home</a>
                        <a class="nav-link" href="debt.jsp">Debt</a>
                        <a class="nav-link active" href="checkLoan.jsp">Loan</a>
                        <a class="nav-link" href="makeAppt.jsp">Appointment</a>
                        <a class="nav-link" href="index.html">Logout</a>
                    </nav>
                </div>
            </header>

            <% String username = (String) session.getAttribute("keyusername");
                session.setAttribute("keyusername", username);
                LoanDao ViewLoandao = new LoanDao();
                Loan loan = new Loan();
                loan = ViewLoandao.getLoanDetailsByUser(username);
                String loanusername = null,
                        loanname = null, loantype = null, loaninitialdate = null, loanduration = null, loanamount = null,
                        loanmonthlyloan = null, loaninterestrate = null;
                loanusername = loan.getUsername();
                loanname = loan.getName();
                loantype = loan.getLoanType();
                loaninitialdate = loan.getInitialDate();
                loanduration = loan.getDuration();
                loanamount = loan.getTotalAmount();
                loanmonthlyloan = loan.getMonthlyLoan();
                loaninterestrate = loan.getInterestRate();%>

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
                                    <a class="nav-link active" id="subnav" aria-current="page"
                                       href="checkLoan.jsp">Check
                                        Loan</a>
                                    <a class="nav-link" id="subnav" href="ViewapplyLoan.jsp">Apply Loan</a>

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
                                    Username
                                </td>
                                <td>
                                    <%=loanusername%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Name
                                </td>
                                <td>
                                    <%=loanname%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Loan Type
                                </td>
                                <td>
                                    <%=loantype%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Initial Loan Date
                                </td>
                                <td>
                                    <%=loaninitialdate%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Duration
                                </td>
                                <td>
                                    <%=loanduration%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Total Amount (RM)
                                </td>
                                <td>
                                    <%=loanamount%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Monthly Loan
                                </td>
                                <td>
                                    <%=loanmonthlyloan%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Interest Rate
                                </td>
                                <td>
                                    <%=loaninterestrate%>
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