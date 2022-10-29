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
 * @author seepa
 */
public class editAppt extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            // Retrieve updated datas from editAppt.jsp
            String name = request.getParameter("name");
            String telno = request.getParameter("telno");
            String email = request.getParameter("email");
            String date = request.getParameter("date");
            String time = request.getParameter("time");

            FAappt appt = new FAappt();
            appt.setName(name);
            appt.setTelno(telno);
            appt.setEmail(email);
            appt.setDate(date);
            appt.setTime(time);

            // Invoke the update method and execute it
            int status = FA_DAO.updateAppt(appt);

            // actions if the update is successful
            if (status > 0) {
                request.setAttribute("updatedMsg", "Appointment successfully updated!");
                request.getRequestDispatcher("viewAppt.jsp").forward(request, response);
            } // actions if update unsuccessful
            else {
                request.setAttribute("errorMsg", "An error occured. Please try again!");
                request.getRequestDispatcher("editAppt.jsp").forward(request, response);
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
