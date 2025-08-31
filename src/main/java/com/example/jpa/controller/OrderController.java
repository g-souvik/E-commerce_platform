package com.example.jpa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.jpa.dao.OrderDao;
import com.example.jpa.dao.ProductDao;
import com.example.jpa.dao.UserDao;
import com.example.jpa.entity.Order;
import com.example.jpa.entity.Product;
import com.example.jpa.entity.User;

import jakarta.servlet.http.HttpSession;

@Controller			// Handles all order-related requests
public class OrderController {
	
	@Autowired
	ProductDao pd;		// To fetch product details from DB
	
	@Autowired
	UserDao ud;			// To fetch user details from DB
	
	@Autowired
	OrderDao od;		// To save and fetch order data from DB
	
	// Reads Razorpay Key ID from application.properties and stores in razorpayKeyId
	@Value("${razorpay.key.id}")
	private String razorpayKeyId;
	
	
	// ---------------------- VIEW ALL ORDERS ----------------------
	@GetMapping("/viewrecord")
	public String getAllData(Model model) {			// Model is used to pass data from backend to webpage
		List<Order> prod = od.findAll();			// Fetch all orders from DB
		model.addAttribute("odata", prod);			// Put orders list in model with the key "odata" to frontend
		return "allOrder";
	}
	
	
	// ---------------------- CREATE ORDER (before payment) ----------------------
	@PostMapping("/createOrder")
    public String createOrder(
    		@RequestParam String amount,  		// Get Order amount
            @RequestParam String name,    		// Get Customer name
            @RequestParam String email,   		// Get Customer email
            @RequestParam String contact, 		// Get Customer contact
            Model model) {						// Model is used to pass data from backend to webpage
		
        model.addAttribute("key", razorpayKeyId);		// Send Razorpay key to model
        
        // Add order details to model so checkout page can display them
        model.addAttribute("amount", amount);
        model.addAttribute("custName", name);
        model.addAttribute("custEmail", email);
        model.addAttribute("custContact", contact);
        return "checkout";
    }
	
	
	// ---------------------- SHOW ORDER FORM ----------------------
	@RequestMapping("/orderdetails")
	public String orderDetails() {
		return "orderDetails";
	}
	
	
	// ---------------------- SAVE ORDER AFTER PAYMENT ----------------------
	@PostMapping("/order")
	public String setOrderDetails(
			@RequestParam("address") String address,			// Get delivery address
			@RequestParam("tdetails") String transactionId,		// Get transaction/payment id
			HttpSession session) {		// To store user data (like email, product id) during their login session
		
		// Retrieve logged-in user's email and product id from session
		String email = (String)session.getAttribute("email");
		String pid = (String)session.getAttribute("pid");
		
		// Fetch product by id and user by email details from DB
		Product prod = pd.findById(pid).get();
		User user = ud.findByEmail(email); 
		
		// Create a new Order object and set details
		Order order = new Order();
		order.setCustId(user.getEmail());
		order.setName(user.getName());
		order.setAddress(address);
		order.setPhno(user.getPhno());
		order.setProdId(prod.getId());
		order.setProdName(prod.getName());
		order.setPrice(prod.getPrice());
		order.setTransDetails(transactionId);
		
		od.save(order);								// Save order details in DB
		return "orderSuccess";
	}	
}
