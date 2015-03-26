/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author Kevin
 */
public class LoginOut extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    @Resource
    UserTransaction utx;

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            HttpSession session = request.getSession();
            if (session != null) {
                session.invalidate();
            }
            RequestDispatcher rd = request.getRequestDispatcher("index.html");
            rd.forward(request, response);
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
        try {
            HttpSession session = request.getSession();
            BookingDa bookingDa = new BookingDa(em);
            StaffDa staffDa = new StaffDa(em);
            String action = (String) request.getParameter("action");

            List<Booking> pendingToCheckin = bookingDa.activeBooking();

            //login
            if (action.equalsIgnoreCase("login")) {
                String username = (String) request.getParameter("userName");
                String password = (String) request.getParameter("password");

                List<Staff> staffs = staffDa.allStaff();
                Staff staff = null;
                boolean login = false;
                for (int i = 0; i < staffs.size(); i++) {
                    if (staffs.get(i).getUsername().equalsIgnoreCase(username)) {
                        if (staffs.get(i).getPassword().equals(password)) {
                            login = true;
                            staff = staffs.get(i);
                            break;
                        }
                    }
                }
                if (login) {
                    session.setAttribute("loginStaff", staff);
                    if (staff.getTask().getTaskname().equalsIgnoreCase("Manager")) {
                        response.sendRedirect("./secureManager/managerControlPanel.jsp");

                    } else if (staff.getTask().getTaskname().equalsIgnoreCase("Receptionist")) {
                        response.sendRedirect("ReservationControl");
                    } else if (staff.getTask().getTaskname().equalsIgnoreCase("Staff")) {
                        response.sendRedirect("./error/cannotEnter.html");
                    }

                } else {
                    response.sendRedirect("./error/loginError.html");
                }
            } else if (action.equalsIgnoreCase("forgot")) {
                List<Staff> staffs = staffDa.allStaff();
                session.removeAttribute("allStaffList");
                session.setAttribute("allStaffList", staffs);
                session.removeAttribute("message");
                session.setAttribute("message", " ");
                response.sendRedirect("resetPassword.jsp");

            } else if (action.equalsIgnoreCase("reset")) {
                List<Staff> staffs = staffDa.allStaff();
                String username = request.getParameter("userName");
                String ic = request.getParameter("userIc");
                String password = request.getParameter("password");
                boolean success = false;
                for (Staff s : staffs) {
                    if (s.getIc().equalsIgnoreCase(ic) && s.getUsername().equalsIgnoreCase(username)) {
                        s.setPassword(password);
                        utx.begin();
                        staffDa.updateStaff(s);
                        success = true;
                        utx.commit();
                        session.removeAttribute("message");
                        response.sendRedirect("loginPage.jsp");
                    }

                }

                if (!success) {
                    session.removeAttribute("message");
                    session.setAttribute("message", "Wrong username or password");
                    response.sendRedirect("resetPassword.jsp");

                }

            }

        } catch (Exception e) {
        }
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
