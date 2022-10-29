<%-- Document : FA_appointment Created on : 6 Jun 2022, 11:25:36 am Author : Acer --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/cover/">

        <link href="bootstrap.min.css" rel="stylesheet">
        <link href="cover.css" rel="stylesheet">
        <title>Appointment With Financial Advisor</title>

        <style>
            label {
                display: inline-block;
                width: 210px;
            }
        </style>
    </head>

    <body class="d-flex h-100 text-center text-white bg-dark">
        <% String err = (String) request.getAttribute("errorMsg");
            String alrt = (String) request.getAttribute("alertMsg");
            String username = (String) session.getAttribute("keyusername");

        %>

        <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
            <header>
                <div>
                    <h3 class="float-md-start mb-0">Group 8</h3>
                    <nav class="nav nav-masthead justify-content-center float-md-end">
                        <a class="nav-link" aria-current="page" href="home.jsp?keyusername=S58079">Home</a>
                        <a class="nav-link" href="debt.jsp">Debt</a>
                        <a class="nav-link" href="checkLoan.jsp">Loan</a>
                        <a class="nav-link active" href="makeAppt.jsp">Appointment</a>
                        <a class="nav-link" href="index.html">Logout</a>
                    </nav>
                </div>
            </header>


            <nav class="navbar navbar-expand-lg navbar-light bg-dark">
                <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <br><br>

                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav">
                            <a class="nav-link active" id="subnav" aria-current="page" href="makeAppt.jsp">Make
                                Appointment</a>
                            <a class="nav-link" id="subnav" href="viewAppt.jsp">View Appointment</a>
                            <a class="nav-link" id="subnav" href="editAppt.jsp">Update Appointment</a>
                        </div>
                    </div>
                </div>
            </nav>

            <main class="px-3">

                <h2>Make An Appointment With Our Experts!</h2>

                <br>

                <table class="table table-dark table-borderless">
                    <form action="makeAppt" method="POST">
                        <tr>
                            <td><label for="name">Enter your username:</label></td>
                            <td><input type="name" id="username" name="username" value="<%=username%>"
                                       style="width:250px" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="name">Enter your name:</label></td>
                            <td><input type="name" id="name" name="name"
                                       placeholder="E.g. Mohammad Ali bin Akal" style="width:250px" autofocus
                                       required></td>
                        </tr>

                        <tr>
                            <td><label for="telno">Contact Number:</label></td>
                            <td><input type="text" id="telno" name="telno" placeholder="E.g. 016-6667777"
                                       style="width:250px" required></td>
                        </tr>

                        <tr>
                            <td><label for="email">Email Address:</label></td>
                            <td><input type="email" id="email" name="email" placeholder="E.g. ali88@yahoo.com"
                                       style="width:250px" required></td>
                        </tr>

                        <tr>
                            <td><label for="date">Appointment date:</label></td>
                            <td><input type="date" id="date" name="date" placeholder="E.g. 20/2/2022"
                                       style="width:150px" required></td>
                        </tr>

                        <tr>
                            <td><label for="time">Select a time: <br> (between 9 A.M. - 6 P.M.)</label></td>
                            <td><input type="time" id="time" name="time" min="09:00" max="18:00"
                                       style="width:150px" required></td>
                        </tr>

                        <tr>
                            <td><input type="submit"
                                       class="btn btn-lg btn-secondary fw-bold border-white bg-white"
                                       value="Make Appointment"></td>
                            <td><input type="reset"
                                       class="btn btn-lg btn-secondary fw-bold border-white bg-white"
                                       value="Cancel"></td>
                        </tr>
                    </form>
                </table>
            </main>

            <footer class="mt-auto text-white-50">
                <p>All copyright reserved &copy;2022 - Gabriel, Loke, See</p>
            </footer>

        </div>
        <!--Javascript to related message pop up box-->
        <script type="text/javascript">

            var err = "<%=err%>";
            if (err === "null") {
            } else {
                alert(err);
            }

            var alertMsg = "<%=alrt%>";
            if (alertMsg === "null") {
            } else {
                alert(alertMsg);
            }

        </script>
    </body>

</html>up box