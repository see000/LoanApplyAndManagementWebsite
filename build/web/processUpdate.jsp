<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<!doctype html>
<html lang="en" class="h-100">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.84.0">
        <title>Cover Template · Bootstrap v5.0</title>

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
                        <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
                        <a class="nav-link" href="debt.jsp">Debt</a>
                        <a class="nav-link" href="checkLoan.jsp">Loan</a>
                        <a class="nav-link" href="appointment.jsp">Appointment</a>
                        <a class="nav-link" href="index.html">Logout</a>
                    </nav>
                </div>
            </header><br><br>

            <!--Scriptlet to call String object to store data to later be called from database-->

            <body>
                <% int result;
                    String password = null, name = null, birthdate = null, gender = null, address = null,
                            phonenumber = null;
                    String username = request.getParameter("username");
                    Class.forName("com.mysql.jdbc.Driver");
                    String myURL = "jdbc:mysql://localhost/3502project";
                    Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");
                    Statement st = myConnection.createStatement();
                    String sInsertQry = "SELECT * FROM users where username='" + username + "'";
                    ResultSet rs = st.executeQuery(sInsertQry);
                    if (rs.next()) {
                        password = rs.getString("password");
                        name = rs.getString("name");
                        birthdate = rs.getString("birthdate");
                        gender = rs.getString("gender");
                        address = rs.getString("address");
                        phonenumber = rs.getString("phonenumber");
                    }
                %>

                <main class="px-3">
                    <h1>Update Information</h1><br>
                    <!--Form action sent to updateServ to process the updating of database-->
                    <form action="updateServ" method="post">
                        <table class="table table-dark table-bordered">
                            <tr>
                                <td>
                                    Username :
                                </td>
                                <td>
                                    <input type="text" name="username" value="<%=username%>" readonly>
                                    <!--username is readonly because it cannot be changed-->
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Password :
                                </td>
                                <td>
                                    <input type="text" name="password" value="<%=password%>"
                                           placeholder="">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Name :
                                </td>
                                <td>
                                    <input type="text" name="name" value="<%=name%>" placeholder="">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Birth Date :
                                </td>
                                <td>
                                    <input type="text" name="birthdate" value="<%=birthdate%>"
                                           placeholder="">
                                </td>
                            </tr>
                            <!-- all the data is called from database but then can be edited from here to update database too -->
                            <tr>
                                <td>
                                    Gender
                                </td>
                                <td>
                                    <input type="text" name="gender" value="<%=gender%>" placeholder="">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Address :
                                </td>
                                <td>
                                    <input type="text" name="address" value="<%=address%>"
                                           placeholder="">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Phone Number :
                                </td>
                                <td>
                                    <input type="text" name="phonenumber" value="<%=phonenumber%>"
                                           placeholder="">
                                </td>
                            </tr>

                        </table><br>
                        <button type="submit" class="btn-primary btn" name="">Update</button>
                        <button type="reset" class="btn-warning btn" name="">Reset</button>
                        <br>
                    </form>
                </main>

                <footer class="mt-auto text-white-50">
                    <p>All copyright reserved &copy;2022 - Gabriel, Loke, See</p>
                </footer>
            </body>
        </div>



    </body>

</html>