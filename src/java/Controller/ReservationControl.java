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
public class ReservationControl extends HttpServlet {

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
        HttpSession session = request.getSession();
        BookingDa bookingDa = new BookingDa(em);
        List<Room> roomList = new RoomDa(em).allRoom();

        List<Booking> pendingToCheckin = bookingDa.activeBooking();
        session.removeAttribute("allRoomList");
        session.removeAttribute("bookingPendingCheckin");
        session.setAttribute("allRoomList", roomList);
        session.setAttribute("bookingPendingCheckin", pendingToCheckin);
        response.sendRedirect("./secureReceptionist/reservationMenu.jsp");
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
        request.getSession().setAttribute("message", " ");
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
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            session.removeAttribute("message");
            String action = request.getParameter("action");
            BookingDa bookingDa = new BookingDa(em);
            RoomDa roomDa = new RoomDa(em);

            if (action.equalsIgnoreCase("cancel")) {
                utx.begin();
                bookingDa.setStatusToCancel(bookingId);
                utx.commit();
                session.setAttribute("message", "Success Cancel Reservation");

            } else if (action.equalsIgnoreCase("Checkin")) {
                Booking currentBooking = (Booking) session.getAttribute("currentBooking");
                BookingstatusDa bkStatusDa = new BookingstatusDa(em);
                utx.begin();
                for (Bookinglist bklist : currentBooking.getBookinglistList()) {
                    roomDa.changeToNotAvailable(bklist.getRoomId().getId());
                }
                currentBooking.setStatus(bkStatusDa.getBookingstatus(2));
                bookingDa.updateBooking(currentBooking);
                utx.commit();
                session.setAttribute("message", "Success Check-in");

            } else if (action.equalsIgnoreCase("Checkout")) {
//                Booking currentBooking = (Booking) session.getAttribute("currentBooking");
//
//                utx.begin();
//                for (Bookinglist bklist : currentBooking.getBookinglistList()) {
//                    roomDa.changeToNotAvailable(bklist.getRoomId().getId());
//                }
//                bookingDa.setStatusToCheckedin(currentBooking.getId());
//                utx.commit();
//                session.setAttribute("message", "Success Cancel Reservation");

            }

            processRequest(request, response);
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
