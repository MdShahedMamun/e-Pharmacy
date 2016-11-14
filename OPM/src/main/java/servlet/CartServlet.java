/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Log;
import service.CartService;

@WebServlet(name = "CartServlet", urlPatterns = {"/CartServlet"})
public class CartServlet extends HttpServlet {

    private double total;
    private ArrayList<Log> logList;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {

            if (request.getSession().getAttribute("creatLogListObject") == null) {
                logList = new ArrayList<>();
                request.getSession().setAttribute("creatLogListObject", "ashse");
            }

            if (request.getParameter("quantity") != null) {
                int currentProduct_id = Integer.parseInt(request.getParameter("product_id"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                Log log = new Log();
                log.setProduct_id(currentProduct_id);
                log.setQuantity_sold(quantity);
                logList.add(log);

                double perUnitPrice = CartService.pricePerUnit(currentProduct_id);

                Double currentTotal = quantity * perUnitPrice;
                Double previousTotal;

                if (request.getSession().getAttribute("total") == null) {
                    previousTotal = 0.0;
                } else {
                    previousTotal = (Double) request.getSession().getAttribute("total");
                }

//                System.out.println("perUnitPrice: " + perUnitPrice + "  quantity: " + quantity + "  currentTotal: " + currentTotal + "  previousTotal: " + previousTotal);
                total = currentTotal + previousTotal;

                request.getSession().setAttribute("total", total);

                RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
                rd.forward(request, response);

            } else if (request.getParameter("checkOut") != null) {

                CartService.insertLogListData(logList);

                logList.clear();
                RequestDispatcher rd = request.getRequestDispatcher("checkOut.jsp");
                rd.forward(request, response);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
