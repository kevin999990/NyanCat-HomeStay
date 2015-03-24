/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Kevin
 */
@Entity
@Table(name = "BOOKING")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Booking.findAll", query = "SELECT b FROM Booking b"),
    @NamedQuery(name = "Booking.findById", query = "SELECT b FROM Booking b WHERE b.id = :id"),
    @NamedQuery(name = "Booking.findByBookingdate", query = "SELECT b FROM Booking b WHERE b.bookingdate = :bookingdate"),
    @NamedQuery(name = "Booking.findByDatefrom", query = "SELECT b FROM Booking b WHERE b.datefrom = :datefrom"),
    @NamedQuery(name = "Booking.findByDateto", query = "SELECT b FROM Booking b WHERE b.dateto = :dateto"),
    @NamedQuery(name = "Booking.findByNeedtopay", query = "SELECT b FROM Booking b WHERE b.needtopay = :needtopay"),
    @NamedQuery(name = "Booking.findByTotalpaid", query = "SELECT b FROM Booking b WHERE b.totalpaid = :totalpaid")})
public class Booking implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Column(name = "BOOKINGDATE")
    @Temporal(TemporalType.DATE)
    private Date bookingdate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DATEFROM")
    @Temporal(TemporalType.DATE)
    private Date datefrom;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DATETO")
    @Temporal(TemporalType.DATE)
    private Date dateto;
    @Column(name = "NEEDTOPAY")
    private Integer needtopay;
    @Column(name = "TOTALPAID")
    private Integer totalpaid;
    @JoinColumn(name = "STATUS", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Bookingstatus status;
    @JoinColumn(name = "CUSTOMER_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Customer customerId;

    public Booking() {
    }

    public Booking(Integer id) {
        this.id = id;
    }

    public Booking(Integer id, Date datefrom, Date dateto) {
        this.id = id;
        this.datefrom = datefrom;
        this.dateto = dateto;
    }

    public Booking(Date datefrom, Date dateto, Integer needtopay, Integer totalpaid, Bookingstatus status) {
        this.bookingdate = new Date();
        this.datefrom = datefrom;
        this.dateto = dateto;
        this.needtopay = needtopay;
        this.totalpaid = totalpaid;
        this.status = status;
    }
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getBookingdate() {
        return bookingdate;
    }

    public void setBookingdate(Date bookingdate) {
        this.bookingdate = bookingdate;
    }

    public Date getDatefrom() {
        return datefrom;
    }

    public void setDatefrom(Date datefrom) {
        this.datefrom = datefrom;
    }

    public Date getDateto() {
        return dateto;
    }

    public void setDateto(Date dateto) {
        this.dateto = dateto;
    }

    public Integer getNeedtopay() {
        return needtopay;
    }

    public void setNeedtopay(Integer needtopay) {
        this.needtopay = needtopay;
    }

    public Integer getTotalpaid() {
        return totalpaid;
    }

    public void setTotalpaid(Integer totalpaid) {
        this.totalpaid = totalpaid;
    }

    public Bookingstatus getStatus() {
        return status;
    }

    public void setStatus(Bookingstatus status) {
        this.status = status;
    }

    public Customer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customer customerId) {
        this.customerId = customerId;
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
        if (!(object instanceof Booking)) {
            return false;
        }
        Booking other = (Booking) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Booking[ id=" + id + " ]";
    }
    
}
