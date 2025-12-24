package com.example.demo.model;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class UserModel {

    public enum Role {
        admin, staff, user
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String username;

    @Column(nullable = false)
    private String password;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Role role = Role.user;

    @Column(nullable = false)
    private boolean active = true;

    // Relation to tickets
    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Ticket> tickets = new ArrayList<>();
    
    public UserModel() {
    }

    public UserModel(String username, String password, Role role) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.active = true;
    }

    // Getters & Setters
    public int getId() { return id; }
    
    public void setId(int id) { this.id = id; }
    
    public String getUsername() { return username; }
    
    public void setUsername(String username) { this.username = username; }
    
    public String getPassword() { return password; }
    
    public void setPassword(String password) { this.password = password; }
    
    public Role getRole() { return role; }
    
    public void setRole(Role role) { this.role = role; }
    
    public boolean isActive() { return active; }
    
    
    public void setActive(boolean active) { this.active = active; }

	public List<Ticket> getTickets() {
		return tickets;
	}

	public void setTickets(List<Ticket> tickets) {
		this.tickets = tickets;
	}
    
}
