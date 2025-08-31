package com.example.jpa.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.jpa.entity.Order;

public interface OrderDao extends JpaRepository<Order, Integer> {
	
}
