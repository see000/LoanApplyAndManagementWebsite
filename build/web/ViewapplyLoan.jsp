<!doctype html>
<html lang="en" class="h-100">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.84.0">
        <title>Loans Offer</title>

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
                        <a class="nav-link " href="debt.jsp">Debt</a>
                        <a class="nav-link active" href="checkLoan.jsp">Loan</a>
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
                                    <a class="nav-link active" id="subnav" aria-current="page" href="checkLoan.jsp">Check
                                        Loan</a>
                                    <a class="nav-link" id="subnav" href="applyLoan.jsp">Apply Loan</a>

                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
                <div class="container">
                    <table class="table table-dark table-bordered">
                        <thead>
                        <th>Details</th>
                        <th>Plan 001</th>
                        <th>Plan 002</th>
                        <th>Plan 003</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <strong>Loan Type</strong>
                                </td>
                                <td>
                                    Personal Loan
                                </td>
                                <td>
                                    Home Loan
                                </td>
                                <td>
                                    Education Loan
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Total Amount</strong>
                                </td>
                                <td>
                                    RM 100,000.00
                                </td>
                                <td>
                                    RM 300,000.00
                                </td>
                                <td>
                                    RM 200,00.00
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Duration</strong>
                                </td>
                                <td>
                                    5 Years
                                </td>
                                <td>
                                    10 Years
                                </td>
                                <td>
                                    5 Years
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Interest Rate(%)</strong>
                                </td>
                                <td>
                                    3% per month
                                </td>
                                <td>
                                    1% per month
                                </td>
                                <td>
                                    5% per month
                                </td>
                            </tr>
                            <tr>
                                <td>

                                </td>
                                <td>
                                    <form action="applyLoan.jsp" method="post"><input type="hidden" name="loanid"
                                                                                      value="1"><button class="btn btn-primary">Apply Now</button></form>
                                </td>
                                <td>
                                    <form action="applyLoan.jsp" method="post"><input type="hidden" name="loanid"
                                                                                      value="2"><button class="btn btn-primary">Apply Now</button></form>
                                </td>
                                <td>
                                    <form action="applyLoan.jsp" method="post"><input type="hidden" name="loanid"
                                                                                      value="3"><button class="btn btn-primary">Apply Now</button></form>
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