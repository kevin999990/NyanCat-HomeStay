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
public class RoomDa {
     @PersistenceContext
    EntityManager em;
     
     public RoomDa(EntityManager em) {
        this.em = em;
    }

    public void addRoom(Room room) {
        em.persist(room);
    }

    public Room getRoom(int id) {
        return em.find(Room.class, id);
    }

    public void deleteRoom(int id) {
        em.remove(getRoom(id));
    }
    
    public void updateRoom(Room room) {
        em.merge(room);
    }
    
    public void changeRoomtoNotAvailable(int id){
         Room room =em.find(Room.class, id);
         room.setAvailable(Boolean.FALSE);
         updateRoom(room);
    }
    public void changeRoomtoAvailable(int id){
         Room room =em.find(Room.class, id);
         room.setAvailable(Boolean.TRUE);
         updateRoom(room);
    }

    public List<Room> allRoom() {
        return em.createNamedQuery("Room.findAll").getResultList();
    }
}
