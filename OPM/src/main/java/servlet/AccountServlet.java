/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;
import service.AccountService;

/**
 *
 * @author shahed
 */
@WebServlet(name = "AccountServlet", urlPatterns = {"/AccountServlet"})
public class AccountServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String oldEmail = (String) request.getSession().getAttribute("userEmail");
            String oldPassword = request.getParameter("oldPassword");
            String newPassword = request.getParameter("newPassword");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            boolean passFlag;

            if (request.getParameter("changereq") != null) {
                String s = AccountService.getOldPassword(oldEmail);
//                System.out.println("s: " + s);
                passFlag = oldPassword.equals(AccountService.getOldPassword(oldEmail));
//                System.out.println("1");
//                System.out.println("passFlag: " + passFlag);
                request.setAttribute("passFlag", passFlag);
//                System.out.println("2");
                if (passFlag) {
//                    System.out.println("3");
                    User user = new User();
                    user.setEmail(email);
                    user.setName(name);
                    user.setPassword(newPassword);
                    AccountService.updateUser(user, oldEmail);
//                    System.out.println("4");
                }
                User user = AccountService.getDetails(oldEmail);
                request.setAttribute("user", user);
            } else {
//                System.out.println("else ");
                request.setAttribute("passFlag", null);
                User user = AccountService.getDetails(oldEmail);
                request.setAttribute("user", user);
            }
            RequestDispatcher rd = request.getRequestDispatcher("account.jsp");
            rd.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
