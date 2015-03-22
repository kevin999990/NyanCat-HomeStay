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

    public List<Booking> allBooking() {
        return em.createNamedQuery("Booking.findAll").getResultList();

    }
}
