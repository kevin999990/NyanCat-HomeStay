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

    public List<Bookinglist> activeBookinglist() {

        List<Bookinglist> bookList = em.createNamedQuery("Bookinglist.findAll").getResultList();
        List<Bookinglist> newbookList = new ArrayList<>();
        for (int i = 0; i < bookList.size(); i++) {
            if (bookList.get(i).getBookingId().getStatus().getId() <= 2 && bookList.get(i).getBookingId().getStatus().getId() >= 1) {
                newbookList.add(bookList.get(i));
            }
        }
        return newbookList;
    }

    public List<Bookinglist> activeBookinglistbyQuery() {
        return em.createNativeQuery("select * from BOOKING b, BOOKINGLIST bb where b.ID = bb.BOOKING_ID and b.STATUS= 1 or b.STATUS=2;", Bookinglist.class).getResultList();
    }
}
