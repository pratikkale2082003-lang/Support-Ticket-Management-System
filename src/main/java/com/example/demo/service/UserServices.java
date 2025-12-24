package com.example.demo.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.UserRepository.UserModelRepository;
import com.example.demo.model.UserModel;

@Service
public class UserServices {

    @Autowired
    private UserModelRepository userRepo;
    
    
// login page
    
    public UserModel login(String username, String password) {
        return userRepo.findByUsername(username).filter(u -> u.getPassword().equals(password)).orElse(null);
    }
//save the all data
    public UserModel register(UserModel user) {
        return userRepo.save(user);
    }
    
    public UserModel getUserById(Integer id) {
        return userRepo.findById(id).orElse(null);
    }

//    staff user automatically
    public List<UserModel> getStaffUsers() {
        return userRepo.findByRole(UserModel.Role.staff); // Only staff
    }
    
 // Corrected delete method (cascade deletes tickets automatically)
    public void delete(int customerId) {
        UserModel user = userRepo.findById(customerId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        // JPA will automatically delete tickets due to cascade
        userRepo.delete(user);
    }

    
    
//    edit customer
    public UserModel getById(int id) {
        return userRepo.findById(id).orElse(null);
    }
    
    
    
    
//    update customer
    public void update(UserModel formUser) {

        UserModel dbUser = getById(formUser.getId());

        dbUser.setUsername(formUser.getUsername());
        dbUser.setPassword(formUser.getPassword());
        dbUser.setRole(formUser.getRole());
        dbUser.setActive(formUser.isActive());

        userRepo.save(dbUser);
    }



}
