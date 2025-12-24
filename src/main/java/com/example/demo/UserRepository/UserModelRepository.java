package com.example.demo.UserRepository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.demo.model.UserModel;

import java.util.List;
import java.util.Optional;

public interface UserModelRepository extends JpaRepository<UserModel, Integer> {
    Optional<UserModel> findByUsername(String username);

    List<UserModel> findByRole(UserModel.Role role);

	List<UserModel> findByRole(String string);

	
}
