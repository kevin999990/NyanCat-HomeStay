/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Kevin
 */
public class BookingDa {

    @PersistenceContext
    EntityManager em;

    public BookingDa(EntityManager em) {
        this.em = em;
    }

    public void addBooking(Booking booking) {
        em.persist(booking);
    }

    public Booking getBooking(int bookingId) {
        return em.find(Booking.class, bookingId);
    }

    public void deleteBooking(int bookingId) {
        em.remove(getBooking(bookingId));
    }

    public void updateBooking(Booking booking) {
        em.merge(booking);
    }

    public void setStatusToReserve(int bookingId) {
        BookingstatusDa bkstatusDa = new BookingstatusDa(em);
        Booking booking = getBooking(bookingId);
        booking.setStatus(bkstatusDa.getBookingstatus(1));
        updateBooking(booking);
    }

    public void setStatusToComplete(int bookingId) {
        BookingstatusDa bkstatusDa = new BookingstatusDa(em);
        Booking booking = getBooking(bookingId);
        booking.setStatus(bkstatusDa.getBookingstatus(3));
        updateBooking(booking);
    }

    public void setStatusToCheckedin(int bookingId) {
        BookingstatusDa bkstatusDa = new BookingstatusDa(em);
        Booking booking = getBooking(bookingId);
        booking.setStatus(bkstatusDa.getBookingstatus(2));
        updateBooking(booking);
    }

    public void setStatusToCancel(int bookingId) {
        BookingstatusDa bkstatusDa = new BookingstatusDa(em);
        Booking booking = getBooking(bookingId);
        booking.setStatus(bkstatusDa.getBookingstatus(4));
        updateBooking(booking);
    }

    public List<Booking> allBooking() {
        return em.createNamedQuery("Booking.findAll").getResultList();

    }

    public Booking currentBooking() {
        List<Booking> bookList = em.createNamedQuery("Booking.findAll").getResultList();
        Booking book = new Booking(0);
        for (int i = 0; i < bookList.size(); i++) {
            if (book.getId() < bookList.get(i).getId()) {
                book = bookList.get(i);
            }
        }
        return book;
    }

    public List<Booking> bookingPendingToCheckin() {
        List<Booking> bookList = em.createNamedQuery("Booking.findAll").getResultList();
        List<Booking> newbookList = new ArrayList<>();
        for (int i = 0; i < bookList.size(); i++) {
            if (bookList.get(i).getStatus().getId() <= 2 && bookList.get(i).getStatus().getId() >= 1) {
                newbookList.add(bookList.get(i));
            }
        }
        return newbookList;
    }
}
