package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.example.demo.model.Ticket;
import com.example.demo.service.TicketService;
import com.example.demo.service.RemarkService;

@Controller
public class TicketDetailsController {

    @Autowired
    private TicketService ticketService;

    @Autowired
    private RemarkService remarkService;

    @GetMapping("/ticket/{id}")
    public String openTicket(@PathVariable Integer id, Model model) {
        Ticket ticket = ticketService.getById(id);
        model.addAttribute("ticket", ticket);
        return "ticket-details";
    }

    @PostMapping("/ticket/{id}/remark")
    public String addRemark(@PathVariable Integer id,
                            @RequestParam String remark) {

        remarkService.addRemark(id, remark);
        return "redirect:/ticket/" + id;
    }
}
