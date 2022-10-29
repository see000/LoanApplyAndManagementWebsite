<%-- Document : storeKey Created on : Jun 16, 2022, 9:26:50 PM Author : seepa --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <!--this jsp is used to store username sent from Login as keyusername-->
    <% String username = (String) request.getAttribute("keyusername");
        session.setAttribute("keyusername", username);
        String popUpMessage = (String) request.getAttribute("alertMsg");
        RequestDispatcher view = request.getRequestDispatcher("home.jsp");
        view.forward(request, response);

    %>

    <script type="text/javascript">

        var popMessage = "<%=popUpMessage%>";
        if (err === "null") {
        } else {
            alert(popMessage);
        }


    </script>

    <body>

    </body>

</html>