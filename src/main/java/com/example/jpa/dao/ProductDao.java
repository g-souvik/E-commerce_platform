package com.example.jpa.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.jpa.entity.Product;

public interface ProductDao extends JpaRepository<Product, String> {
	
	// Fetch products by category
	List<Product> findByCategory(String category);
}
