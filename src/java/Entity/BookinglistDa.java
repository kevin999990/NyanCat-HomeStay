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
public class BookinglistDa {
    @PersistenceContext
    EntityManager em;

    public BookinglistDa(EntityManager em) {
        this.em = em;
    }

   
    public void addBookinglist(Bookinglist bookinglist) {
        em.persist(bookinglist);
    }

    public Bookinglist getBookinglist(int id) {
        return em.find(Bookinglist.class, id);
    }

    public void deleteBookinglist(int id) {
        em.remove(getBookinglist(id));
    }

    public List<Bookinglist> allBookinglist() {
        return em.createNamedQuery("Bookinglist.findAll").getResultList();

    }
}
