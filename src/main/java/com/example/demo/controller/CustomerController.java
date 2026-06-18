package com.example.demo.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.Ticket;
import com.example.demo.model.UserModel;
import com.example.demo.service.TicketService;
import com.example.demo.service.UserServices;

import jakarta.servlet.http.HttpSession;

@Controller
public class CustomerController {

    @Autowired
    private UserServices userrepo;

    @Autowired
    private TicketService ticketService;

    // ================= CUSTOMER DASHBOARD =================
    @GetMapping("/customer-dashboard")
    public String dashboard(HttpSession session, Model model) {

        UserModel user = (UserModel) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login2";
        }

        model.addAttribute("user", user);
        model.addAttribute("tickets",
                ticketService.getTicketsByCustomer(user.getId()));

        return "Customer-dashboard";
    }

    // ================= REGISTRATION PAGE =================
    @GetMapping("/register3")
    public String registerPage() {
        return "register3";
    }

    // ================= REGISTRATION SUBMIT =================
    @PostMapping("/register3")
    public String register(@ModelAttribute UserModel user,
                           @RequestParam("imageFile") MultipartFile file,
                           HttpSession session) {

        try {
            if (!file.isEmpty()) {
                user.setImage(file.getBytes());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        userrepo.register(user);

        // Reload saved user from DB
        UserModel savedUser = userrepo.getById(user.getId());
        session.setAttribute("user", savedUser);

        return "redirect:/customer-dashboard";
    }

    // ================= CREATE TICKET PAGE =================
    @GetMapping("/ticket/create")
    public String createPage(HttpSession session) {

        if (session.getAttribute("user") == null) {
            return "redirect:/login2";
        }

        return "ticket-form";
    }

    // ================= CREATE TICKET =================
    @PostMapping("/ticket/create")
    public String createTicket(@RequestParam String title,
                               @RequestParam String description,
                               HttpSession session) {

        UserModel user = (UserModel) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login2";
        }

        Ticket t = new Ticket();
        t.setTitle(title);
        t.setDescription(description);
        t.setCustomer(user);

        ticketService.createTicket(t);

        return "redirect:/customer-dashboard";
    }

    // ================= EDIT TICKET =================
    @GetMapping("/editTicket/{id}")
    public String editTicket(@PathVariable int id, Model model) {

        Ticket ticket = ticketService.getById(id);

        if (ticket == null) {
            return "redirect:/admin-dashboard";
        }

        model.addAttribute("ticket", ticket);
        return "editticket";
    }

    // ================= UPDATE TICKET =================
    @PostMapping("/update-ticket")
    public String updateTicket(@ModelAttribute Ticket ticket) {

        Ticket existingTicket =
                ticketService.getById(ticket.getId());

        if (existingTicket == null) {
            throw new IllegalArgumentException("Ticket not found");
        }

        existingTicket.setTitle(ticket.getTitle());
        existingTicket.setDescription(ticket.getDescription());

        ticketService.update(existingTicket);

        return "redirect:/admin-dashboard";
    }

    // ================= DELETE CUSTOMER (ADMIN) =================
    @GetMapping("/delete9/{id}")
    public String delete(@PathVariable int id) {
        userrepo.delete(id);
        return "redirect:/admin-dashboard";
    }

    // ================= EDIT CUSTOMER (ADMIN) =================
    @GetMapping("/editCustomer/{id}")
    public String customerEdit(@PathVariable int id, Model model) {

        UserModel customer = userrepo.getById(id);
        model.addAttribute("customer", customer);

        return "editcustomer";
    }

    @PostMapping("/update-customer")
    public String updateCustomer(@ModelAttribute UserModel customer) {

        if (customer.getId() == 0) {
            throw new IllegalArgumentException("Customer ID missing");
        }

        userrepo.update(customer);

        return "redirect:/admin-dashboard";
    }

    // ================= SHOW USER IMAGE =================
    @GetMapping("/user/image/{id}")
    public ResponseEntity<byte[]> showImage(@PathVariable int id) {

        UserModel user = userrepo.getById(id);

        if (user == null || user.getImage() == null) {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity
                .ok()
                .contentType(MediaType.IMAGE_JPEG)
                .body(user.getImage());
    }

    // ================= UPLOAD / CHANGE PROFILE IMAGE =================
    @PostMapping("/user/upload-image")
    public String uploadImage(@RequestParam("imageFile") MultipartFile file,
                              HttpSession session) {

        UserModel sessionUser = (UserModel) session.getAttribute("user");

        if (sessionUser == null) {
            return "redirect:/login2";
        }

        try {
            if (!file.isEmpty()) {

                UserModel dbUser = userrepo.getById(sessionUser.getId());

                System.out.println("Uploading image size: " + file.getSize());

                dbUser.setImage(file.getBytes());

                userrepo.update(dbUser);

                session.setAttribute("user", dbUser);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:/customer-dashboard";
    }
}
