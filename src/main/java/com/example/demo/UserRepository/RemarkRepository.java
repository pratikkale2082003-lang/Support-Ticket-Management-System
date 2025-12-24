package com.example.demo.UserRepository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.demo.model.TicketRemarkModel;

public interface RemarkRepository extends JpaRepository<TicketRemarkModel, Integer> {
}
