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
public class BookingstatusDa {
    @PersistenceContext
    EntityManager em;

    public BookingstatusDa(EntityManager em) {
        this.em = em;
    }

    public void addBookingstatus(Bookingstatus bookingStatus) {
        em.persist(bookingStatus);
    }

    public Bookingstatus getBookingstatus(int id) {
        return em.find(Bookingstatus.class, id);
    }

    public void deleteBookingstatus(int id) {
        em.remove(getBookingstatus(id));
    }

    public List<Bookingstatus> allBookingstatus() {
        return em.createNamedQuery("Bookingstatus.findAll").getResultList();

    }
}
