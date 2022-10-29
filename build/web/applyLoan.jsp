<%@page import="java.sql.*"%>

<!doctype html>
<html lang="en" class="h-100">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.84.0">
        <title>Apply Loan</title>

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
                    <h3 class="float-md-start mb-0">Cover</h3>
                    <nav class="nav nav-masthead justify-content-center float-md-end">
                        <a class="nav-link" aria-current="page" href="home.jsp">Home</a>
                        <a class="nav-link active" href="debt.jsp">Debt</a>
                        <a class="nav-link" href="checkLoan.jsp">Loan</a>
                        <a class="nav-link" href="makeAppt.jsp">Appointment</a>
                        <a class="nav-link" href="index.html">Logout</a>
                    </nav>
                </div>
            </header>
            <% int result;
            
                String id = null, loantype = null, duration = null, interestrate = null, totalamount = null;
                String loanid = request.getParameter("loanid");
                Class.forName("com.mysql.jdbc.Driver");
                String myURL = "jdbc:mysql://localhost/3502project";
                Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");
                Statement st = myConnection.createStatement();
                String sInsertQry = "SELECT * FROM loandetails where loanid='" + loanid+ "'";
                ResultSet rs = st.executeQuery(sInsertQry);
                if (rs.next()) {
                    id = rs.getString("loanid");
                    loantype = rs.getString("loantype");
                    duration = rs.getString("duration");
                    interestrate = rs.getString("interestrate");
                    totalamount = rs.getString("totalamount");
                }%>

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
                                    <a class="nav-link" id="subnav" href="ViewAllTransaction.jsp">Transaction</a>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>

                <div class="container">
                    <h1>Applying Loan</h1>
                    <form action="LoanController" method="post">
                        <input type="hidden" name="action" value="apply">
                        <form>
                            <table class="table table-dark table-bordered">

                                <tbody>
                                    <tr>
                                        <td>
                                            Username :
                                        </td>
                                        <td>:</td>
                                        <td>
                                            <input type="text" name="username">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Name :
                                        </td>
                                        <td>:</td>
                                        <td>
                                            <input type="text" name="name">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Loan ID :
                                        </td>
                                        <td>:</td>
                                        <td>
                                            <input type="text" name="loanid" value="<%=id%>" readonly>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Loan Type :
                                        </td>
                                        <td>:</td>
                                        <td>
                                            <input type="text" name="loantype" value="<%=loantype%>"
                                                   placeholder="<%=loantype%>" readonly>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Initial Loan Date :
                                        </td>
                                        <td>:</td>
                                        <td>
                                            <input name="initialdate" id="datefield" type='date' min='1899-01-01'
                                                   onclick="myfunction()">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Duration (Years)
                                        </td>
                                        <td>:</td>
                                        <td>
                                            <input type="text" name="duration" value="<%=duration%>"
                                                   placeholder="<%=duration%>" readonly>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Total Amount Loan :
                                        </td>
                                        <td>:</td>
                                        <td>
                                            <input type="text" name="totalamount" value="<%=totalamount%>"
                                                   placeholder="<%=totalamount%>" readonly>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Interest Rate :
                                        </td>
                                        <td>:</td>
                                        <td>
                                            <input type="text" name="interestrate" value="<%=interestrate%>"
                                                   placeholder="<%=interestrate%>" readonly>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <button class="btn btn-primary">Submit</button>
                            <button class="btn btn-primary">Reset</button>
                        </form>

                </div>


                <footer class="mt-auto text-white-50">
                    <p>All copyright reserved &copy;2022 - Gabriel, Loke, See</p>
                </footer>
            </body>
        </div>



    </body>

</html>