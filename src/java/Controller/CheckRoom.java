/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Bookinglist;
import Entity.BookinglistDa;
import Entity.Room;
import Entity.RoomDa;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
public class CheckRoom extends HttpServlet {

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

        try {

            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            Date dateFrom = dateFormat.parse(request.getParameter("checkinDate"));
            Date dateTo = dateFormat.parse(request.getParameter("checkoutDate"));

            int[] roomNumber = checkRoomAvailable(dateFrom, dateTo);
            session.removeAttribute("roomNumber");
            session.removeAttribute("dateTo");
            session.removeAttribute("dateFrom");
            session.setAttribute("roomNumber", roomNumber);
            session.setAttribute("dateFrom", dateFrom);
            session.setAttribute("dateTo", dateTo);
            session.setAttribute("action", request.getParameter("action"));
            
            response.sendRedirect("checkRoom.jsp");

        } catch (Exception e) {
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

    public int[] checkRoomAvailable(Date dateFrom, Date dateTo) {
        List<Bookinglist> bookingList = new BookinglistDa(em).activeBookinglist();
        List<Room> roomList = new RoomDa(em).allRoom();
        int room1 = 0;
        int room2 = 0;
        int room3 = 0;

        for (Room roomList1 : roomList) {
            if (roomList1.getRoomtype().getId() == 1) {
                room1++;
            }
            if (roomList1.getRoomtype().getId() == 2) {
                room2++;
            }
            if (roomList1.getRoomtype().getId() == 3) {
                room3++;
            }
        }

        for (Bookinglist bkList : bookingList) {
            //check if customer dateFrom is overlap with reserved or checkin date
            if ((bkList.getBookingId().getDateto().after(dateFrom) || bkList.getBookingId().getDateto().equals(dateFrom))
                    && (bkList.getBookingId().getDatefrom().before(dateFrom) || bkList.getBookingId().getDateto().equals(dateFrom))) {
                if (bkList.getRoomtypeId().getId() == 1) {
                    room1--;
                } else if (bkList.getRoomtypeId().getId() == 2) {
                    room2--;
                } else if (bkList.getRoomtypeId().getId() == 3) {
                    room3--;
                }
            } else if ((bkList.getBookingId().getDateto().after(dateTo) || bkList.getBookingId().getDateto().equals(dateTo))
                    && (bkList.getBookingId().getDatefrom().before(dateTo) || bkList.getBookingId().getDateto().equals(dateTo))) {
                if (bkList.getRoomtypeId().getId() == 1) {
                    room1--;
                } else if (bkList.getRoomtypeId().getId() == 2) {
                    room2--;
                } else if (bkList.getRoomtypeId().getId() == 3) {
                    room3--;
                }
            } else if ((bkList.getBookingId().getDatefrom().after(dateFrom) || bkList.getBookingId().getDatefrom().equals(dateFrom))
                    && (bkList.getBookingId().getDateto().before(dateTo) || bkList.getBookingId().getDateto().equals(dateTo))) {
                if (bkList.getRoomtypeId().getId() == 1) {
                    room1--;
                } else if (bkList.getRoomtypeId().getId() == 2) {
                    room2--;
                } else if (bkList.getRoomtypeId().getId() == 3) {
                    room3--;
                }
            }
        }// close of for loop
        int[] roomnumber = new int[]{room1, room2, room3};
        return roomnumber;
    }//close of function
}
