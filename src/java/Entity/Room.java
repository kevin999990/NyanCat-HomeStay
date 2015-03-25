/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.List;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Kevin
 */
@Entity
@Table(name = "ROOM")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Room.findAll", query = "SELECT r FROM Room r"),
    @NamedQuery(name = "Room.findById", query = "SELECT r FROM Room r WHERE r.id = :id"),
    @NamedQuery(name = "Room.findByRoomnumber", query = "SELECT r FROM Room r WHERE r.roomnumber = :roomnumber"),
    @NamedQuery(name = "Room.findByAvailable", query = "SELECT r FROM Room r WHERE r.available = :available")})
public class Room implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ROOMNUMBER")
    private int roomnumber;
    @Column(name = "AVAILABLE")
    private Boolean available;
    @OneToMany(mappedBy = "roomId")
    private List<Bookinglist> bookinglistList;
    @JoinColumn(name = "ROOMTYPE", referencedColumnName = "ID")
    @ManyToOne
    private Roomtype roomtype;

    public Room() {
    }

    public Room(Integer id) {
        this.id = id;
    }

    public Room(int roomnumber, Roomtype roomtype) {
        this.roomnumber = roomnumber;
        this.roomtype = roomtype;
    }
    

    public Room(Integer id, int roomnumber) {
        this.id = id;
        this.roomnumber = roomnumber;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getRoomnumber() {
        return roomnumber;
    }

    public void setRoomnumber(int roomnumber) {
        this.roomnumber = roomnumber;
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    @XmlTransient
    public List<Bookinglist> getBookinglistList() {
        return bookinglistList;
    }

    public void setBookinglistList(List<Bookinglist> bookinglistList) {
        this.bookinglistList = bookinglistList;
    }

    public Roomtype getRoomtype() {
        return roomtype;
    }

    public void setRoomtype(Roomtype roomtype) {
        this.roomtype = roomtype;
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
        if (!(object instanceof Room)) {
            return false;
        }
        Room other = (Room) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Room[ id=" + id + " ]";
    }
    
}
