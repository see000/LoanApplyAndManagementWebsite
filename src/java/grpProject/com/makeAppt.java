/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grpProject.com;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Acer
 */
public class makeAppt extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String username = request.getParameter("username");
            String name = request.getParameter("name");
            String telno = request.getParameter("telno");
            String email = request.getParameter("email");
            String date = request.getParameter("date");
            String time = request.getParameter("time");

            FAappt appt = new FAappt();
            appt.setUsername(username);
            appt.setName(name);
            appt.setTelno(telno);
            appt.setEmail(email);
            appt.setDate(date);
            appt.setTime(time);

            // check if an appointment has been made before or not
            int ada = FA_DAO.checkAppt(username);

            if (ada > 0) {
                request.setAttribute("infoMsg", "Make appointment failed. An appointment has already been made.");
                request.getRequestDispatcher("viewAppt.jsp").forward(request, response);
            } else {
                int status = FA_DAO.makeAppt(appt);

                if (status > 0) {
                    request.setAttribute("alertMsg", "Appointment successfully made!");
                    request.getRequestDispatcher("viewAppt.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMsg", "An error occured. Please try again!");
                    request.getRequestDispatcher("makeAppt.jsp").forward(request, response);
                }
            }
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
