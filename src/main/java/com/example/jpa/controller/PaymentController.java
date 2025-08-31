package com.example.jpa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.jpa.dao.ProductDao;
import com.example.jpa.dao.UserDao;
import com.example.jpa.entity.Product;
import com.example.jpa.entity.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller			// Handles all payment-related requests
public class PaymentController {
	
	@Autowired
	UserDao ud;			// To fetch user details from DB
	
	@Autowired
	ProductDao pd;		// To fetch product details from DB
	
	
	// ---------------------- SET PAYMENT DETAILS ----------------------
	@GetMapping("/pdetails")
	public String setPaymentDetails(
			@RequestParam("price")String price,		// Get product price
			@RequestParam("email")String email,		// Get customer email
			@RequestParam("prodid")String pid,		// Get product id
			Model model,							// Model is used to pass data from backend to webpage
			HttpServletRequest request,				// Used to send temporary data at request level
			HttpSession session) {		// To store user data (like email, product id) during their login session
		
		User user=ud.findByEmail(email);			// Find user by email
		Product prod=pd.findById(pid).get();		// Find product by ID
		
		// Model is used here because user and product details need to be sent to the paymentPage
		// so they can be displayed, and Model is the Spring’s standard way to pass data from Controller to View.
		model.addAttribute("user",user);			// Send user details to frontend
		model.addAttribute("product",prod);			// Send product details to frontend
		
		// Request is used here because price is just temporary data for this paymentPage only
		// not stored permanently, and it disappears after response is sent
		request.setAttribute("price", price);		// Send price temporarily to request
		
		// HttpSession is used here because email and product id need to persist across multiple requests/pages
		// during the user's login session, unlike request data which disappears after one response.
		session.setAttribute("email", email);		// Store email in session for later use
		session.setAttribute("pid", pid);			// Store product id in session for later use
		return "paymentPage";
	}
}
