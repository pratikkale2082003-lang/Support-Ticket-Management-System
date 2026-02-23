package com.example.demo.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.UserRepository.TicketRepository;
import com.example.demo.model.Ticket;
import com.example.demo.model.UserModel;

@Service
public class TicketService {

    @Autowired
    private TicketRepository ticketrepo;

    public Ticket createTicket(Ticket t) {
        t.setStatus(Ticket.TicketStatus.open);
        t.setCreatedAt(LocalDateTime.now());
        return ticketrepo.save(t);
    }

    public List<Ticket> getTicketsByCustomer(int customerId) {
        return ticketrepo.findByCustomerId(customerId);
    }

    public List<Ticket> getAllTicket() {
        return ticketrepo.findAll();
    }

    public Ticket getById(Integer id) {
        return ticketrepo.findById(id).orElse(null);
    }

    public List<Ticket> getTicketsAssignedTo(UserModel staff) {
        return ticketrepo.findByAssignedTo(staff);
    }

    public Ticket saveTicket(Ticket t){
        return ticketrepo.save(t);
    }
    
    
//    update ticket
//    public void update(Ticket ticket) {
//
//        if (ticket.getId() == null) {
//            throw new IllegalArgumentException("Ticket ID must not be null");
//        }
//        Ticket existing = ticketrepo.findById(ticket.getId()).orElse(null);
//        if (existing != null) {
//            existing.setTitle(ticket.getTitle());
//            existing.setDescription(ticket.getDescription());
//            existing.setStatus(ticket.getStatus());
//            ticketrepo.save(existing);
//        }
//    }
    
    
    public void update(Ticket ticket) {
        Ticket existing = ticketrepo.findById(ticket.getId()).orElse(null);

        if (existing != null) {
            existing.setTitle(ticket.getTitle());
            existing.setDescription(ticket.getDescription());
            existing.setStatus(ticket.getStatus());
            ticketrepo.save(existing);
        }
    }
    
    
//     today Ticket
    public List<Ticket> getTodayTicket() {
        LocalDate today = LocalDate.now();
        return ticketrepo.findTicketsBetween(
                today.atStartOfDay(),
                today.atTime(LocalTime.MAX)
        );
    }
    // monthly ticket
    public List<Ticket> getmonthTicket() {
        LocalDate today = LocalDate.now();
        return ticketrepo.findTicketsBetween(
                today.withDayOfMonth(1).atStartOfDay(),
                today.withDayOfMonth(today.lengthOfMonth())
                        .atTime(LocalTime.MAX));
			
			 
		}
    public void updateTicketStatus(int ticketId, String status) {

        Ticket ticket = ticketrepo.findById(ticketId)
                .orElseThrow(() -> new RuntimeException("Ticket not found"));

        // Convert String to ENUM
        Ticket.TicketStatus ticketStatus =
                Ticket.TicketStatus.valueOf(status);

        ticket.setStatus(ticketStatus);
        ticketrepo.save(ticket);
    }
   
}
