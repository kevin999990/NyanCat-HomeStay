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
public class RoomtypeDa {
    @PersistenceContext
    EntityManager em;

    public RoomtypeDa(EntityManager em) {
        this.em = em;
    }

    public void addRoomtype(Roomtype roomtype) {
        em.persist(roomtype);
    }

    public Roomtype getRoomtype(int id) {
        return em.find(Roomtype.class, id);
    }

    public void deleteRoomtype(int id) {
        em.remove(getRoomtype(id));
    }

    public List<Roomtype> allRoomtype() {
        return em.createNamedQuery("Roomtype.findAll").getResultList();

    }
}
