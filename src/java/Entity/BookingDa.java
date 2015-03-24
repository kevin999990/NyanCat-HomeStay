/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

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

    public Booking getBooking(int id) {
        return em.find(Booking.class, id);
    }

    public void deleteBooking(int id) {
        em.remove(getBooking(id));
    }

    public void updateBooking(Booking booking) {
        em.merge(booking);
    }

    public void setStatusToReserve(int id) {
        BookingstatusDa bkstatusDa = new BookingstatusDa(em);
        Booking booking = getBooking(id);
        booking.setStatus(bkstatusDa.getBookingstatus(1));
        updateBooking(booking);
    }

    public void setStatusToComplete(int id) {
        BookingstatusDa bkstatusDa = new BookingstatusDa(em);
        Booking booking = getBooking(id);
        booking.setStatus(bkstatusDa.getBookingstatus(3));
        updateBooking(booking);
    }

    public void setStatusToCheckedin(int id) {
        BookingstatusDa bkstatusDa = new BookingstatusDa(em);
        Booking booking = getBooking(id);
        booking.setStatus(bkstatusDa.getBookingstatus(2));
        updateBooking(booking);
    }

    public void setStatusToCancel(int id) {
        BookingstatusDa bkstatusDa = new BookingstatusDa(em);
        Booking booking = getBooking(id);
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
}
