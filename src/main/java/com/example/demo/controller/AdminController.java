package com.example.demo.controller;

import com.example.demo.model.Ticket;
import com.example.demo.model.UserModel;
import com.example.demo.service.TicketService;
import com.example.demo.service.UserServices;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private UserServices usersr;

    @Autowired
    private TicketService ticketService;

    @GetMapping("/admin-dashboard")
    public String adminDashboard(
            @RequestParam(value = "keyword", required = false) String keyword,
            HttpSession session,
            Model model){

        UserModel user = (UserModel) session.getAttribute("user");

        if(user == null || user.getRole() != UserModel.Role.admin){
            model.addAttribute("error","Unauthorized");
            return "logincheck";
        }

        List<Ticket> tickets;

        if (keyword != null && !keyword.trim().isEmpty()) {
            tickets = ticketService.searchByCustomerUsername(keyword);
        } else {
            tickets = ticketService.getAllTicket();
        }

        model.addAttribute("tickets", tickets);
        model.addAttribute("user", user);

        return "admin-dashboard";
    }
// get all ticket
//        List<Ticket> tickets = ticketService.getAllTicket();
//        model.addAttribute("tickets", tickets);
//        model.addAttribute("user", user);
//
//        return "admin-dashboard";
//    }

    // assign ticket to staff
    @GetMapping("/assignTicket")
    public String assignTicketPage(@RequestParam("ticketId") Integer ticketId,
                                   Model model,
                                   HttpSession session) {

        Ticket ticket = ticketService.getById(ticketId);
        List<UserModel> staffList = usersr.getStaffUsers();

        model.addAttribute("ticket", ticket);
        model.addAttribute("staffList", staffList);
        model.addAttribute("user", session.getAttribute("user"));

        return "staff-dashboard";
    }

    @PostMapping("/assignTicket")
    public String assignTicket(@RequestParam("ticketId") Integer ticketId,
                               @RequestParam("staffId") Integer staffId) {

        Ticket ticket = ticketService.getById(ticketId);
        UserModel staff = usersr.getUserById(staffId);

        if (ticket != null && staff != null) {
            ticket.setAssignedTo(staff);
            ticket.setStatus(Ticket.TicketStatus.in_process);
            ticketService.saveTicket(ticket);
        }

        return "redirect:/admin-dashboard";
    }
    
    private boolean isAdmin(HttpSession session) {
        UserModel user = (UserModel) session.getAttribute("user");
        return user != null && user.getRole() == UserModel.Role.admin;
    }
    
//  daily report
    @GetMapping("/reportdaily")
    public String dailyReport(Model m , HttpSession s) {
    	 if (!isAdmin(s)) {
    		m.addAttribute("error", "Unathorized Acess");
    		 return "logincheck";
    	 }
    	 List<Ticket> dailyticket = ticketService.getTodayTicket();
    	 m.addAttribute("tickets", dailyticket);
    	 m.addAttribute("reportType", "Daily Ticket Report");
    	 
    	 return "admin-report";
    	 
    }
    
    
//     monthly ticket report
    @GetMapping("/reportmonthly")
    public String MonthlyReport(Model m, HttpSession s) {
    	if (!isAdmin(s)) {
            m.addAttribute("error", "Unauthorized Access");
            return "logincheck";
        }
    	
    	List<Ticket> monthlyticket = ticketService.getmonthTicket();
    	m.addAttribute("tickets", monthlyticket);
    	m.addAttribute("reportType", "Monthly Ticket Report");
   	 
		return "admin-report";
    }
    
    
    
//multiple delete 
    @PostMapping("/deleteSelectedCustomers")
    public  String deleteselect( @RequestParam("customerIds") List<Integer> ids) {
    	for(Integer id : ids){
            usersr.deleteUserById(id);
        }
    	return "redirect:/admin-dashboard";
    }
    
    
    }

