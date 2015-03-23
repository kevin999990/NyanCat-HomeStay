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
public class CommentDa {

    @PersistenceContext
    EntityManager em;

    public CommentDa(EntityManager em) {
        this.em = em;
    }

    public void addComment(Comment comment) {
        em.persist(comment);
    }

    public Comment getComment(int id) {
        return em.find(Comment.class, id);
    }

    public void deleteComment(int id) {
        em.remove(getComment(id));
    }

    public List<Comment> allComment() {
        return em.createNamedQuery("Comment.findAll").getResultList();

    }
}
