package com.example.jpa.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.jpa.entity.Cart;
import com.example.jpa.entity.User;

public interface CartDao extends JpaRepository<Cart, Integer> {
	
	// Find all cart items for a specific user
	List<Cart> findByUser(User user);
}
