/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author Kevin
 */
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class StaffDa {

    @PersistenceContext
    EntityManager em;

    public StaffDa(EntityManager em) {
        this.em = em;
    }

    public void addStaff(Staff staff) {
        em.persist(staff);
    }

    public Staff getStaff(int id) {
        return em.find(Staff.class, id);
    }

    public void deleteStaff(int id) {
        em.remove(getStaff(id));
    }

    public List<Staff> allStaff() {
        return em.createNamedQuery("Staff.findAll").getResultList();
    }
}
