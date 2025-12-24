package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.example.demo.model.UserModel;
import com.example.demo.service.UserServices;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

    @Autowired
    private UserServices usersr;
    
    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/login2")
    public String loginpage() {
        return "logincheck";
    }

    @PostMapping("/login2")
    public String doLogin(@RequestParam String username,
                          @RequestParam String password,
                          HttpSession session) {

        UserModel user = usersr.login(username, password);

        if (user == null || !user.isActive()) {
            session.setAttribute("error", "Invalid username or password");
            return "logincheck";
        }

        session.setAttribute("user", user);

        
        switch (user.getRole()) {

            case admin:
                return "redirect:/admin-dashboard";

            case staff:
                return "redirect:/staff-dashboard";

            default:
                return "redirect:/Customer-dashboard";
     
        }
        
        
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "logout";
    }
    
}
