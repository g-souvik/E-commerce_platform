package com.example.jpa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.jpa.dao.CartDao;
import com.example.jpa.dao.ProductDao;
import com.example.jpa.dao.UserDao;
import com.example.jpa.entity.Cart;
import com.example.jpa.entity.Product;
import com.example.jpa.entity.User;

import jakarta.servlet.http.HttpServletRequest;

@Controller			// Handles cart-related requests
public class CartController {
	
	@Autowired
	UserDao userDao;		// To fetch user details from DB
	
	@Autowired
	ProductDao productDao;	// To fetch product details from DB
	
	@Autowired
	CartDao cartDao;		// To save, fetch, and delete cart
	
	
	// ---------------------- VIEW CART ----------------------
	@RequestMapping("/cart")
	public String viewCart(
			@RequestParam("email") String email,		// Get "email" parameter from request
			Model model) {								// Model is used to pass data from backend to webpage
		
		User user = userDao.findByEmail(email);			// Find the user in DB using email
		List<Cart> carts = cartDao.findByUser(user);	// Fetch all cart items for that user
		model.addAttribute("cdata", carts);				// Put cart list in model with the key "cdata" & sent to frontend
		return "cart";
	}
	
	
	// ---------------------- ADD TO CART ----------------------
	@RequestMapping("/cdetails")
	public String addToCart(
			@RequestParam("email") String customer_id,				// Get "email" from request
			@RequestParam("prodid") String product_id,				// Get product id from request
			HttpServletRequest request) {							// To know which page user came from
		
		User user = userDao.findByEmail(customer_id);				// Find the user by email
		Product product = productDao.findById(product_id).get();	// Find the product by id
		
		// Create a new Cart object and set details
		Cart cart = new Cart();
        cart.setUser(user);				// Set user
        cart.setProduct(product);		// Set product
        //cart.setQuantity();
        
        cartDao.save(cart);				// Save cart item in DB
        
        // Redirect back to the same page where user clicked "Add to Cart"
        return "redirect:" + request.getHeader("Referer");
	}
	
	
	// ---------------------- DELETE FROM CART ----------------------
	@RequestMapping("/deleteItem")
	public String deleteItem(
			@RequestParam("itemid") Integer id,		// Get cart item id
			HttpServletRequest request) {			// To know which page user came from
		
		cartDao.deleteById(id);						// Delete the cart item from DB by its ID
		
		// Redirect back to the same page where user clicked "Add to Cart"
		return "redirect:" + request.getHeader("Referer");
	}
}
