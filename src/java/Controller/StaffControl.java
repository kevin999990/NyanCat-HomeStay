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
public class StaffControl extends HttpServlet {

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

        List<Staff> staffList = new StaffDa(em).allStaff();
        List<Task> taskList = new TaskDa(em).allTask();

        session.removeAttribute("allStaffList");
        session.removeAttribute("allTaskList");

        session.setAttribute("allStaffList", staffList);
        session.setAttribute("allTaskList", taskList);
        response.sendRedirect("secureManager/staffMenu.jsp");
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
            StaffDa staffDa = new StaffDa(em);
            session.removeAttribute("message");
            String name = request.getParameter("staffName");
            String ic = request.getParameter("staffIc");
            String phoneNumber = request.getParameter("phoneNumber");
            String addredd = request.getParameter("staffAddress");
            String username = request.getParameter("staffUsername");
            String password = request.getParameter("staffPassword");
            String task = request.getParameter("task");
            String action = request.getParameter("action");
            if (action.equalsIgnoreCase("add")) {
                Staff staff = new Staff(name, ic, phoneNumber, addredd, username, password, getTask(task));
                utx.begin();
                staffDa.addStaff(staff);
                utx.commit();
                session.setAttribute("message", "Success Add Staff");

            } else if (action.equalsIgnoreCase("Update")) {
                int id = Integer.parseInt(request.getParameter("staffId"));
                Staff staff = new Staff(name, ic, phoneNumber, addredd, username, password, getTask(task));
                staff.setId(id);
                utx.begin();
                staffDa.updateStaff(staff);
                utx.commit();
                session.setAttribute("message", "Success Update Staff");

            } else if (action.equalsIgnoreCase("Delete")) {
                int id = Integer.parseInt(request.getParameter("staffId"));

                utx.begin();
                staffDa.deleteStaff(id);
                utx.commit();
                session.setAttribute("message", "Success Delete Staff");
            }

            processRequest(request, response);
        } catch (Exception e) {
            System.out.print(e.getMessage());
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

    public Task getTask(String t) {
        List<Task> ts = new TaskDa(em).allTask();
        Task task = new Task();
        for (int i = 0; i < ts.size(); i++) {
            if (ts.get(i).getTaskname().equalsIgnoreCase(t)) {
                task = ts.get(i);

            }
        }
        return task;
    }
}
