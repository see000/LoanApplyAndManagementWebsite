<%-- Document : viewAppt Created on : 10 Jun 2022, 3:21:41 pm Author : Acer --%>

<%@page import="java.sql.*" %>
<%@page import="grpProject.com.deleteAppt" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/cover/">

        <link href="bootstrap.min.css" rel="stylesheet">
        <link href="cover.css" rel="stylesheet">

        <title>Appointment Details</title>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <style>
            th,
            td {
                font-size: x-large;
            }
        </style>
    </head>

    <body class="d-flex h-100 text-center text-white bg-dark">
        <%
            
             
            
            String info = (String)request.getAttribute("infoMsg");
            String alrt = (String)request.getAttribute("alertMsg");
            String updated = (String)request.getAttribute("updatedMsg");
            
            String username = null;
            String name = null;
            String telno = null;
            String email = null;
            String date = null;
            String time = null;
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/3502project","root","admin");
            Statement s = con.createStatement();
            String qry = "SELECT * FROM faappointment WHERE username='"+(String)session.getAttribute("keyusername")+"'";
            ResultSet rs = s.executeQuery(qry);
            if(rs.next())
            {
                username = rs.getString("username");
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
                <table class="table table-dark table-borderless">
                    <thead>
                    <th>Appointment Details:</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Username: <%=username%>
                            </td>
                        </tr>
                        <tr>
                            <td>Name: <%=name%>
                            </td>
                        </tr>
                        <tr>
                            <td>Contact Number: <%=telno%>
                            </td>
                        </tr>
                        <tr>
                            <td>Email Address: <%=email%>
                            </td>
                        </tr>
                        <tr>
                            <td>Date: <%=date%>
                            </td>
                        </tr>
                        <tr>
                            <td>Time: <%=time%>
                            </td>
                        </tr>

                        <tr>
                            <td><a href="editAppt.jsp"
                                   class="btn btn-lg btn-secondary fw-bold border-white bg-white">Update</a>
                                <a onclick="myFunction()"
                                   class="btn btn-lg btn-secondary fw-bold border-white bg-white">Delete</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </main>

            <br>

            <footer class="mt-auto text-white-50">
                <p>All copyright reserved &copy;2022 - Gabriel, Loke, See</p>
            </footer>

        </div>

        <script>
            var msg = "<%=info%>";
            if(msg === "null")
            { } 
            else
            { alert(msg); }
            
            var msge = "<%=alrt%>";
            if(msge === "null")
            { } 
            else
            { alert(msge); }
            
            var msage = "<%=updated%>";
            if(msage === "null")
            { } 
            else
            { alert(msage); }
            
            function myFunction() {
                var text = confirm("Are you sure you want to delete the appointment?");
                if (text) {
                    window.location.href = "deleteAppt?name=<%=name%>";
                }   
            }
        </script>
    </body>

</html>