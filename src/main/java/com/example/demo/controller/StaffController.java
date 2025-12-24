package com.example.demo.controller;

import com.example.demo.model.Ticket;
import com.example.demo.model.UserModel;
import com.example.demo.service.TicketService;
import jakarta.servlet.http.HttpSession;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StaffController {

    @Autowired
    private TicketService ticketService;

    @GetMapping("/staff-dashboard")
    public String staffDashboard(HttpSession session, Model model) {

        UserModel user = (UserModel) session.getAttribute("user");
        if (user == null || user.getRole() != UserModel.Role.staff) {
            return "redirect:/login2";
        }

        // Fetch tickets assigned to this staff
        List<Ticket> tickets = ticketService.getTicketsAssignedTo(user);

        model.addAttribute("tickets", tickets);
        model.addAttribute("user", user);

        return "staff-dashboard";
    }

    // ================= UPDATE TICKET STATUS =================
    @PostMapping("/updateTicketStatus")
    public String updateTicketStatus(
            @RequestParam("ticketId") Integer ticketId,
            @RequestParam("status") String status,
            HttpSession session
    ) {

        UserModel user = (UserModel) session.getAttribute("user");

        if (user == null || user.getRole() != UserModel.Role.staff) {
            return "redirect:/login2";
        }

        ticketService.updateTicketStatus(ticketId, status);

        return "redirect:/staff-dashboard";
    }
}


