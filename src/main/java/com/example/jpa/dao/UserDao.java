package com.example.jpa.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.jpa.entity.User;

public interface UserDao extends JpaRepository<User, String> {
	
	// Find user by email and password (for login)
	User findByEmailAndPassword(String email, String pass);
	
	// Find all users by role (e.g., "customer", "admin")
	List<User> findByRole(String role);
	
	// Find single user by email
	User findByEmail(String email);
}
