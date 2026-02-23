package com.example.demo.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.UserRepository.RemarkRepository;
import com.example.demo.UserRepository.TicketRepository;
import com.example.demo.model.Ticket;
import com.example.demo.model.TicketRemarkModel;
import com.example.demo.model.UserModel;

import jakarta.servlet.http.HttpSession;

@Service
public class RemarkService {

    @Autowired
    private RemarkRepository remarkRepo;

    @Autowired
    private TicketRepository ticketRepo;

    @Autowired
    private HttpSession session;

    public TicketRemarkModel addRemark(Integer ticketId, String remarkText) {
        Ticket ticket = ticketRepo.findById(ticketId).orElse(null);
        if (ticket == null) throw new RuntimeException("Ticket not found");

        TicketRemarkModel remark = new TicketRemarkModel();
        remark.setRemark(remarkText);
        remark.setTicket(ticket);
        remark.setCreatedAt(LocalDateTime.now());

        // logged-in user from session
        UserModel currentUser = (UserModel) session.getAttribute("user");
        remark.setCreatedBy(currentUser);

        TicketRemarkModel saved = remarkRepo.save(remark);
        ticket.getRemarks().add(saved);
        ticketRepo.save(ticket);

        return saved;
    }

    public List<TicketRemarkModel> getRemarksByTicket(Integer ticketId) {
        Ticket ticket = ticketRepo.findById(ticketId).orElse(null);
        if (ticket == null) throw new RuntimeException("Ticket not found");
        return ticket.getRemarks();
    }
}
