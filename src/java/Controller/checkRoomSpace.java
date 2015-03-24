/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//PENDING TO WORK WITH
package Controller;

import Entity.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;

/**
 *
 * @author Kevin
 */
public class checkRoomSpace extends HttpServlet {

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

        try {
            BookingDa bookingDa = new BookingDa(em);
            BookinglistDa bookinglistDa = new BookinglistDa(em);
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
   //         Date dateFrom = dateFormat.parse(request.getParameter("checkinDate"));
     //       Date dateTo = dateFormat.parse(request.getParameter("checkoutDate"));

            List<Booking> book = bookingDa.allBooking();
            List<Booking> newBook = new ArrayList<>();

            List<Bookinglist> bookList = bookinglistDa.allBookinglist();
            List<Bookinglist> newBookList = new ArrayList<>();

            List<Room> roomList = new RoomDa(em).allRoom();
            int room1 = 0;
            int room2 = 0;
            int room3 = 0;
            
            for (int i = 0; i < roomList.size(); i++) {
                if (roomList.get(i).getRoomtype().getId() == 1) {
                    room1++;
                } else if (roomList.get(i).getRoomtype().getId() == 2) {
                    room2++;
                } else if (roomList.get(i).getRoomtype().getId() == 3) {
                    room3++;
                }
            }

            //to get booklist which condition is reserve or checkin
            for (int i = 0; i < book.size(); i++) {
                if (bookList.get(i).getBookingId().getStatus().getId() <= 2 && bookList.get(i).getBookingId().getStatus().getId() >= 1) {
                    newBookList.add(bookList.get(i));
                }
            }
            /*
            for (int i = 0; i < newBookList.size(); i++) {
                if(newBookList.get(i).getBookingId().getDatefrom().)
            }*/

        } catch (Exception e) {
            System.out.println(e.getMessage());
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
