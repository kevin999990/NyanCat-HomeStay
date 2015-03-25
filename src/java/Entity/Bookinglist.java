/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Kevin
 */
@Entity
@Table(name = "BOOKINGLIST")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Bookinglist.findAll", query = "SELECT b FROM Bookinglist b"),
    @NamedQuery(name = "Bookinglist.findById", query = "SELECT b FROM Bookinglist b WHERE b.id = :id")})
public class Bookinglist implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @JoinColumn(name = "BOOKING_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Booking bookingId;
    @JoinColumn(name = "ROOM_ID", referencedColumnName = "ID")
    @ManyToOne
    private Room roomId;
    @JoinColumn(name = "ROOMTYPE_ID", referencedColumnName = "ID")
    @ManyToOne
    private Roomtype roomtypeId;

    public Bookinglist() {
    }

    public Bookinglist(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public Bookinglist(Roomtype roomtypeId) {
        this.roomtypeId = roomtypeId;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Booking getBookingId() {
        return bookingId;
    }

    public void setBookingId(Booking bookingId) {
        this.bookingId = bookingId;
    }

    public Room getRoomId() {
        return roomId;
    }

    public void setRoomId(Room roomId) {
        this.roomId = roomId;
    }

    public Roomtype getRoomtypeId() {
        return roomtypeId;
    }

    public void setRoomtypeId(Roomtype roomtypeId) {
        this.roomtypeId = roomtypeId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Bookinglist)) {
            return false;
        }
        Bookinglist other = (Bookinglist) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Bookinglist[ id=" + id + " ]";
    }

}
