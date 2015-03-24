/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.*;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;

/**
 *
 * @author Kevin
 */
public class GuestReservation extends HttpServlet {

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
        HttpSession session = request.getSession();
        RoomDa roomDa = new RoomDa(em);
        try {

            List<Room> roomList = roomDa.allRoom();
            List<Room> newRoomList = new ArrayList<>();
            List<Bookinglist> newBooklist = new ArrayList<>();
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

            int needToPaid = 0;
            int roomType = Integer.parseInt(request.getParameter("roomType"));
            Date dateFrom = dateFormat.parse(request.getParameter("checkinDate"));
            Date dateTo = dateFormat.parse(request.getParameter("checkoutDate"));
            int numberOfRoom = Integer.parseInt(request.getParameter("numberOfRoom"));

            //check room availability
            for (int i = 0; i < roomList.size(); i++) {
                if (roomList.get(i).getRoomtype().getId().equals(roomType) && roomList.get(i).getAvailable()) {
                    newRoomList.add(roomList.get(i));
                }
            }

            if (newRoomList.size() < numberOfRoom) {
                session.setAttribute("massage", "Sorry, the number of room are not available.");
                response.sendRedirect("error/roomNumberError.html");
            } else {

                for (int i = 0; i < numberOfRoom; i++) {
                    newBooklist.add(new Bookinglist(newRoomList.get(i)));
                }

                for (int i = 0; i < newBooklist.size(); i++) {
                    needToPaid += newBooklist.get(i).getRoomId().getRoomtype().getPrice();
                }

                int numberOfNight = checkDateDefference(dateFrom, dateTo);
                needToPaid = needToPaid * numberOfNight;

                Booking newBooking = new Booking(dateFrom, dateTo, needToPaid, 0, new BookingstatusDa(em).getBookingstatus(1));

                session.setAttribute("newBooklist", newBooklist);
                session.setAttribute("newBooking", newBooking);
                session.setAttribute("numberOfNight", numberOfNight);
                response.sendRedirect("guestReservation.jsp");
            }
        } catch (Exception e) {

        }
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
        HttpSession session = request.getSession();
        RoomDa roomDa = new RoomDa(em);
        BookingDa bookingDa = new BookingDa(em);
        CustomerDa customerDa = new CustomerDa(em);
        BookinglistDa bookinglistDa = new BookinglistDa(em);

        try {
            /* TODO output your page here. You may use following sample code. */
            Customer newCustomer = new Customer();
            Booking newBooking = (Booking) session.getAttribute("newBooking");
            List<Bookinglist> booklist = (List<Bookinglist>) session.getAttribute("newBooklist");

            newCustomer.setAddress(request.getParameter("address"));
            newCustomer.setCustomername(request.getParameter("customerName"));
            newCustomer.setEmail(request.getParameter("email"));
            newCustomer.setPhonenumber(request.getParameter("phoneNumber"));

            utx.begin();
            customerDa.addCustomer(newCustomer);
            newBooking.setCustomerId(customerDa.currentCustomer());
            bookingDa.addBooking(newBooking);
            for (int i = 0; i < booklist.size(); i++) {
                booklist.get(i).setBookingId(bookingDa.currentBooking());
                bookinglistDa.addBookinglist(booklist.get(i));
              //  roomDa.changeRoomtoNotAvailable(booklist.get(i).getRoomId().getId());
            }
            utx.commit();

            session.removeAttribute("newBooking");
            session.removeAttribute("newBooklist");
            response.sendRedirect("reservationSuccess.html");

        } catch (NotSupportedException | SystemException | RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException ex) {
            Logger.getLogger(GuestReservation.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getMessage());
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

    private int checkDateDefference(Date dateFrom, Date dateTo) throws ParseException {
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

        long timeDiff = Math.abs(dateTo.getTime() - dateFrom.getTime());
        double diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
        return (int) diffDays;

    }

}
