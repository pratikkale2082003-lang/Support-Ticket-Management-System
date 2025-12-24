package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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

    //REGISTRATION SUBMIT 
    @PostMapping("/register3")
    public String register(UserModel user, HttpSession session, Model model) {

        userrepo.register(user);
        System.out.println("Successfully Registered");

        // Save logged in user to session
        session.setAttribute("user", user);

        return "redirect:/Customer-dashboard";
    }

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
}






    
////    edit ticket
//    @GetMapping("/editTicket/{id}")
//    public String editTicket(@PathVariable int id, Model model) {
//        Ticket ticket = ticketService.getById(id);
//        model.addAttribute("ticket", ticket);
//        return "editcustomer";
//    }
//
//    @PostMapping("/update-ticket")
//    public String updateTicket(Ticket ticket) {
//        ticketService.update(ticket);
//        return "redirect:/admin-dashboard";
//    }
///

 