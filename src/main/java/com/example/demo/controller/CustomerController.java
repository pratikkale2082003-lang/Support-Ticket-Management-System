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

 

    // CUSTOMER DASHBOARD
    @GetMapping("/Customer-dashboard")
    public String dashboard(HttpSession session, Model model) {

        UserModel user = (UserModel) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login2";
        }

        model.addAttribute("user", user);
        model.addAttribute("tickets", ticketService.getTicketsByCustomer(user.getId()));

        return "Customer-dashboard";
    }

    // REGISTRATION PAGE
    @GetMapping("/register3")
    public String registerPage() {
        return "register3";
    }
//------------------------------------------------------------------------------------
    //REGISTRATION SUBMIT 
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

        // 🔥 IMPORTANT: reload saved user from DB
        UserModel savedUser = userrepo.getById(user.getId());
        session.setAttribute("user", savedUser);

        return "redirect:/Customer-dashboard";
    }
//---------------------------------------------------------------------------------------
    // TICKET CREATE PAGE
    @GetMapping("/ticket/create")
    public String createPage() {
        return "ticket-form";
    }

    //TICKET CREATE SUBMIT 
    @PostMapping("/ticket/create")
    public String createTicket(@RequestParam String title,
                               @RequestParam String description,
                               HttpSession session) {

        UserModel user = (UserModel) session.getAttribute("user");
        if (user == null) {
        	
        	 System.out.println("ticket sucessfully create");
            return "redirect:/login2";
        }

        Ticket t = new Ticket();
        t.setTitle(title);
        t.setDescription(description);
        t.setCustomer(user);
      
        ticketService.createTicket(t);

        return "redirect:/Customer-dashboard";
    }
    
 // Delete customer (Admin)
    @GetMapping("/delete9/{id}")
    public String delete(@PathVariable int id) {
        userrepo.delete(id);  // cascade deletes tickets
        return "redirect:/admin-dashboard";
    }
//    --------------------------------------------------------------------------------
//    Edit Customer (Admin)
    @GetMapping("/editCustomer/{id}")
    public String customerEdit(@PathVariable int id, Model model) {
        UserModel customer = userrepo.getById(id);
        model.addAttribute("customer", customer);
        return "editcustomer";   // ✅ JSP name
    }


@PostMapping("/update-customer")
public String updateCustomer(@ModelAttribute UserModel customer) {

    if (customer.getId() == 0) {
        throw new IllegalArgumentException("Customer ID missing");
    }

    userrepo.update(customer);
    return "redirect:/admin-dashboard";
}
//---------------------------------------------------------------------------------
// ================= EDIT TICKET =================
@GetMapping("/editTicket/{id}")
public String editTicket(@PathVariable int id, Model model) {
    // Fetch ticket from DB
    Ticket ticket = ticketService.getById(id);

    if (ticket == null) {
        // Optional: redirect if ticket not found
        return "redirect:/admin-dashboard";
    }

    // Add ticket to model (includes customer for read-only display)
    model.addAttribute("ticket", ticket);
    return "editticket"; // JSP page
}

// ================= UPDATE TICKET =================
@PostMapping("/update-ticket")
public String updateTicket(@ModelAttribute Ticket ticket) {
    // Fetch the existing ticket from DB
    Ticket existingTicket = ticketService.getById(ticket.getId());

    if (existingTicket == null) {
        throw new IllegalArgumentException("Ticket not found");
    }

    // Update only the ticket fields
    existingTicket.setTitle(ticket.getTitle());
    existingTicket.setDescription(ticket.getDescription());

    ticketService.update(existingTicket);

    return "redirect:/admin-dashboard";
}

//--------- user image ----------------------------------------------

@GetMapping("/user/image/{id}")
public ResponseEntity<byte[]> showImage(@PathVariable int id) {

    UserModel user = userrepo.getById(id);

    if (user == null || user.getImage() == null) {
        return ResponseEntity.notFound().build();
    }

    byte[] image = user.getImage();

    return ResponseEntity
            .ok()
            .contentType(MediaType.IMAGE_JPEG)
            .body(image);
}

}





