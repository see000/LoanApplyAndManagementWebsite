<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" class="h-100">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.84.0">
        <title>Home</title>

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
        <!--Scriptlet to receive data from database users to fill in the string that is called in the scriptlet to
        display out the string called in the jsp-->

        <% int result;
            String password = null, name = null, birthdate = null, gender = null, address = null,
                    phonenumber = null;
            String username = (String) session.getAttribute("keyusername");
            System.out.println("This is the keyusername received at home.jsp :" + username);
            Class.forName("com.mysql.jdbc.Driver");
            String myURL = "jdbc:mysql://localhost/3502project";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");
            Statement st = myConnection.createStatement();
            String sInsertQry = "SELECT * FROM users where username='"
                    + username + "'";
            ResultSet rs = st.executeQuery(sInsertQry);
            if (rs.next()) {
                password = rs.getString("password");
                name = rs.getString("name");
                birthdate = rs.getString("birthdate");
                gender = rs.getString("gender");
                                address = rs.getString("address");
                                phonenumber = rs.getString("phonenumber");
                            }%>
        <!--Header for jsp-->
        <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
            <header class="mb-auto">
                <div>
                    <h3 class="float-md-start mb-0">Group 8</h3>
                    <nav class="nav nav-masthead justify-content-center float-md-end">
                        <a class="nav-link active" aria-current="page" href="home.jsp?keyusername="
                           +<%=username%>>Home</a>
                        <a class="nav-link" href="debt.jsp">Debt</a>
                        <a class="nav-link" href="checkLoan.jsp">Loan</a>
                        <a class="nav-link" href="makeAppt.jsp">Appointment</a>
                        <a class="nav-link" href="index.html">Logout</a>
                    </nav>
                </div>
            </header>

            <main class="px-3">
                <!--form action to send info to processUpdate.jsp to update the data from database
                all the strings called here are received from the database users to be filled with.-->
                <h1>Personal Information</h1><br>
                <form action="processUpdate.jsp">
                    <table class="table table-dark table-bordered">
                        <input type="hidden" name="username" value="<%=username%>">
                        <tr>
                            <td>
                                Username :
                            </td>
                            <td>

                                <%=username%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Password :
                            </td>
                            <td>
                                <%=password%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Name :
                            </td>
                            <td>
                                <%=name%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Birthdate :
                            </td>
                            <td>
                                <%=birthdate%>
                            </td>
                        </tr><!-- comment -->
                        <tr>
                            <td>
                                Gender
                            </td>
                            <td>
                                <%=gender%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Address :
                            </td>
                            <td>
                                <%=address%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Phone Number :
                            </td>
                            <td>
                                <%=phonenumber%>
                            </td>
                        </tr>

                    </table><br>
                    <button type="submit" class="btn-primary btn" name="">Update</button></a>
                    <button type="reset" class="btn-warning btn" name="">Reset</button>
                    <br>
                </form>
            </main>

            <!--Footer-->
            <footer class="mt-auto text-white-50">
                <p>All copyright reserved &copy;2022 - Gabriel, Loke, See</p>
            </footer>
        </div>



    </body>

</html>