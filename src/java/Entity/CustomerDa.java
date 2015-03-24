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
public class CustomerDa {

    @PersistenceContext
    EntityManager em;

    public CustomerDa(EntityManager em) {
        this.em = em;
    }

    public void addCustomer(Customer customer) {
        em.persist(customer);
    }

    public Customer getCustomer(int id) {
        return em.find(Customer.class, id);
    }

    public void deleteCustomer(int id) {
        em.remove(getCustomer(id));
    }

    public List<Customer> allCustomer() {
        return em.createNamedQuery("Customer.findAll").getResultList();
    }

    public Customer currentCustomer() {
        List<Customer> cusList = em.createNamedQuery("Comment.findAll").getResultList();
        Customer cus = new Customer(0);
        for (int i = 0; i < cusList.size(); i++) {
            if (cus.getId() < cusList.get(i).getId()) {
                cus = cusList.get(i);
            }

        }
        return cus;
    }
}
