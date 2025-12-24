package com.example.demo.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "remarks")
public class TicketRemarkModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(length = 2000)
    private String remark;

    private LocalDateTime createdAt;

    @ManyToOne
    @JoinColumn(name = "ticket_id")
    private Ticket ticket;

    public Integer getId() { return id; }
    public void setId(Integer id) { 
    	this.id = id; 
    	}

    public String getRemark() {
    	return remark; 
    	}
    public void setRemark(String remark) { 
    	this.remark = remark; 
    	}

    public LocalDateTime getCreatedAt() { 
    	return createdAt; 
    	}
    public void setCreatedAt(LocalDateTime createdAt) {
    	this.createdAt = createdAt;
    	}

    public Ticket getTicket() { 
    	return ticket; 
    	}
    public void setTicket(Ticket ticket) {
    	this.ticket = ticket; 
    }
}
