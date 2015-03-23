/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Booking;
import Entity.Bookingstatus;
import Entity.Room;
import Entity.RoomDa;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GuestReservation</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GuestReservation at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        try {
            HttpSession session = request.getSession();
            RoomDa roomDa = new RoomDa(em);
            List<Booking> newBooking = new ArrayList<Booking>();
            List<Room> roomList = roomDa.allRoom();
            List<Room> newRoomList = new ArrayList<Room>();
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
                response.sendRedirect("#");
            } else {
                List<Room> bookedRoomList = new ArrayList<Room>();

                for (int i = 0; i < numberOfRoom; i++) {
                    bookedRoomList.add(newRoomList.get(i));
                }

                for (int i = 0; i < bookedRoomList.size(); i++) {
                    needToPaid += bookedRoomList.get(i).getRoomtype().getPrice();
                }

                int numberOfNight = checkDateDefference(dateFrom, dateTo);
                needToPaid = needToPaid * numberOfNight;

                for (int i = 0; i < numberOfRoom; i++) {
                    newBooking.add(new Booking(dateFrom, dateTo, needToPaid, 0, new Bookingstatus(1), null, newRoomList.get(i)));
                }
                session.setAttribute("newBooking", newBooking);
                session.setAttribute("numberOfNight", numberOfNight);
                response.sendRedirect("guestReservation.jsp");
            }
        } catch (Exception e) {
            response.sendRedirect("#");
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

    private int checkDateDefference(Date dateFrom, Date dateTo) throws ParseException {
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

        long timeDiff = Math.abs(dateTo.getTime() - dateFrom.getTime());
        double diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
        return (int) diffDays;
    }
}
