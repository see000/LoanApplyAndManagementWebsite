<%-- Document : editAppt Created on : 10 Jun 2022, 4:29:16 pm Author : Acer --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/cover/">

        <link href="bootstrap.min.css" rel="stylesheet">

        <!--link to related css-->
        <link href="cover.css" rel="stylesheet">

        <title>Update Appointment</title>
        <style>
            label {
                display: inline-block;
                width: 200px;
            }
        </style>
    </head>

    <body class="d-flex h-100 text-center text-white bg-dark">
        <% //Retrieve data from specific user 
            String err = (String) request.getAttribute("errorMsg");
            String username = (String) session.getAttribute("keyusername");
            String name = null;
            String telno = null;
            String email = null;
            String date = null;
            String time = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/3502project", "root", "admin");
            Statement s = con.createStatement();
            String qry = "SELECT * FROM faappointment WHERE username='"
                    + username + "'";
            ResultSet rs = s.executeQuery(qry);
            if (rs.next()) {
                name = rs.getString("name");
                telno = rs.getString("telno");
                email = rs.getString("email");
                date = rs.getString("date");
                time = rs.getString("time");
            }
        %>

        <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">

            <header>
                <div>
                    <h3 class="float-md-start mb-0">Group 8</h3>
                    <nav class="nav nav-masthead justify-content-center float-md-end">
                        <a class="nav-link" aria-current="page" href="home.jsp">Home</a>
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
                            <a class="nav-link active" id="subnav" aria-current="page"
                               href="makeAppt.jsp">Make Appointment</a>
                            <a class="nav-link" id="subnav" href="viewAppt.jsp">View Appointment</a>
                            <a class="nav-link" id="subnav" href="editAppt.jsp">Update
                                Appointment</a>
                        </div>
                    </div>
                </div>
            </nav>

            <main class="px-3">

                <!--Update form with initial values already displayed-->
                <h2>Update Appointment Details:</h2>
                <br>
                <table class="table table-dark table-borderless">
                    <form action="editAppt">
                        <tr>
                            <td><label for="name">Enter your name:</label></td>
                            <td><input type="text" name="name" id="name" readonly="readonly"
                                       value="<%=name%>" required></td>
                        </tr>

                        <tr>
                            <td><label for="telno">Contact Number:</label></td>
                            <td><input type="text" name="telno" id="telno" value="<%=telno%>"
                                       placeholder="E.g. 016-6667777" required autofocus /></td>
                        </tr>

                        <tr>
                            <td><label for="email">Email Address:</label></td>
                            <td><input type="email" name="email" id="email" value="<%=email%>"
                                       placeholder="E.g. ali88@yahoo.com" required /></td>
                        </tr>

                        <tr>
                            <td><label for="date">Appointment date:</label></td>
                            <td><input type="date" name="date" id="date" value="<%=date%>"
                                       placeholder="E.g. 20/2/2022" required /></td>
                        </tr>

                        <tr>
                            <td><label for="time">Select a time: <br> (between 9 A.M. - 6
                                    P.M.)</label></td>
                            <td><input type="time" name="time" id="time" value="<%=time%>"
                                       min="09:00" max="18:00" required /></td>
                        </tr>

                        <tr>
                            <td><input type="submit"
                                       class="btn btn-lg btn-secondary fw-bold border-white bg-white"
                                       value="Save changes"></td>
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

        <!--Alert message pop up box-->
        <script type="text/javascript">

            var msg = "<%=err%>";
            if (msg === "null") {
            } else {
                alert(msg);
            }
        </script>
    </body>

</html>