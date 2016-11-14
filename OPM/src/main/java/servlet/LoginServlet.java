/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;
import service.UserService;

/**
 *
 * 
 */
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            try {
                int flag = 0;
                User user = new User();
                user.setEmail(request.getParameter("email").trim());
                user.setPassword(request.getParameter("password").trim());

                if ("square@gmail.com".equals(user.getEmail()) && "square".equals(user.getPassword())) {
                    request.getSession().setAttribute("company", "square");
                    RequestDispatcher rd = request.getRequestDispatcher("test.jsp");
                    rd.forward(request, response);
                    return;
                }
                else if ("admin@gmail.com".equals(user.getEmail()) && "admin".equals(user.getPassword())) {
                    RequestDispatcher rd = request.getRequestDispatcher("insertNew.jsp");
                    rd.forward(request, response);
                    return;
                }
                else if (UserService.verifyUser(user)) {
                    flag = 1;
                    request.getSession().setAttribute("userEmail", user.getEmail());
//                    System.out.println("usermail: "+user.getEmail());
                } else {
                    flag = 2;
                }

                request.setAttribute("flag", flag);

                RequestDispatcher rd = request.getRequestDispatcher("loginSignupConfirm.jsp");
                rd.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(SignupServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
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
