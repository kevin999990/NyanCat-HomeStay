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
public class RoomControl extends HttpServlet {

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

        List<Room> roomList = new RoomDa(em).allRoom();
        List<Roomtype> roomtypeList = new RoomtypeDa(em).allRoomtype();

        session.removeAttribute("allRoomList");
        session.removeAttribute("allRoomTypeList");
        session.setAttribute("allRoomList", roomList);
        session.setAttribute("allRoomTypeList", roomtypeList);
        response.sendRedirect("secureManager/roomMenu.jsp");
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
        session.setAttribute("message", "");
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
            RoomDa roomDa = new RoomDa(em);
            session.removeAttribute("message");

            String action = request.getParameter("action");

            int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));
            Roomtype roomtype = getRoomtype(request.getParameter("roomtype"));

            if (action.equalsIgnoreCase("add")) {
                Room room = new Room(roomNumber, roomtype);
                utx.begin();
                roomDa.addRoom(room);
                utx.commit();
                session.setAttribute("message", "Success Add Room");

            } else if (action.equalsIgnoreCase("Update")) {
                int id = Integer.parseInt(request.getParameter("roomId"));
                Room room = roomDa.getRoom(id);
                room.setRoomnumber(roomNumber);
                room.setRoomtype(roomtype);

                utx.begin();
                roomDa.updateRoom(room);
                utx.commit();
                List<Room> roomList = new RoomDa(em).allRoom();
                session.setAttribute("allRoomList",roomList);
                session.setAttribute("message", "Success Update Room");

            } else if (action.equalsIgnoreCase("Delete")) {
                int id = Integer.parseInt(request.getParameter("roomId"));

                utx.begin();
                roomDa.deleteRoom(id);
                utx.commit();
                session.setAttribute("message", "Success Delete Room");
            }

            processRequest(request, response);
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }

    }

    public Roomtype getRoomtype(String roomType) {
        List<Roomtype> roomtypeList = new RoomtypeDa(em).allRoomtype();
        Roomtype rt = new Roomtype();
        for (int i = 0; i < roomtypeList.size(); i++) {
            if (roomtypeList.get(i).getDescription().equalsIgnoreCase(roomType)) {
                rt = roomtypeList.get(i);
            }
        }
        return rt;
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
