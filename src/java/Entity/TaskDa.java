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
public class TaskDa {
    @PersistenceContext
    EntityManager em;

    public TaskDa(EntityManager em) {
        this.em = em;
    }

    public void addTask(Task task) {
        em.persist(task);
    }

    public Task getTask(int id) {
        return em.find(Task.class, id);
    }

    public void deleteTask(int id) {
        em.remove(getTask(id));
    }

    public List<Task> allTask() {
        return em.createNamedQuery("Task.findAll").getResultList();

    }
}
