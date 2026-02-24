package com.example.demo.UserRepository;

import com.example.demo.model.Ticket;
import com.example.demo.model.UserModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.List;

public interface TicketRepository extends JpaRepository<Ticket, Integer> {

    List<Ticket> findByCustomerId(Integer customerId);

    List<Ticket> findByAssignedTo(UserModel staff);

    
    @Query("""
        SELECT t FROM Ticket t
        WHERE t.createdAt BETWEEN :start AND :end
    """)
    List<Ticket> findTicketsBetween(
            @Param("start") LocalDateTime start,
            @Param("end") LocalDateTime end
    );

    @Query("""
    	    SELECT t FROM Ticket t
    	    WHERE LOWER(t.customer.username) LIKE LOWER(CONCAT('%', :username, '%'))
    	""")
    	List<Ticket> searchByCustomerUsername(@Param("username") String username);
//	 List<Ticket> findByCustomerUsernameContainingIgnoreCase(String username);
}
