package com.example.jpa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.jpa.dao.UserDao;
import com.example.jpa.entity.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller			// Handles all user-related requests (like registration, login, logout)
public class UserController {
	
	@Autowired
	UserDao ud;		// To fetch and save user details in DB
	
	
	// ---------------------- REGISTER USER ----------------------
	@PostMapping("/regproc")
	public String addUser(
			@RequestParam("name") String name,			// Get user name
			@RequestParam("email") String email,		// Get user email
			@RequestParam("phone") String phno,			// Get user phone number
			@RequestParam("password") String pass,		// Get user password
			ModelMap model) {							// To pass messages to frontend
		
		// Create new User object (to store registration data)
		User user = new User();
		user.setName(name);
		user.setEmail(email);
		user.setPhno(phno);
		user.setPassword(pass);
		user.setRole("customer");		// Default role is "customer"
		
		ud.save(user);					// Save user details in DB
		model.put("msg", "Registered Succesfully!");	// Send success message to login page
		return "login";
	}
	
	
	// ---------------------- USER LOGIN ----------------------
	@PostMapping("/logproc")
	public String loginprocess(
			@RequestParam("email") String email,		// Get user email
			@RequestParam("password") String pass,		// Get user password
			ModelMap model,								// To send messages to frontend if login fails
			HttpSession session) {						// To store user data (like email) during their session
		
		User user = null;
		user = ud.findByEmailAndPassword(email, pass);		// Validate user credentials
		
		if(user != null)		// If user exists
		{
			String role = user.getRole();					// Fetch user role
			
			if(role.equals("customer"))		// If normal customer
			{
				session.setAttribute("udata", email);		// Store user email in session
				return "index";								// Redirect customer to home page 
			}
			else		// If admin
			{
				return "redirect:/viewitem";				// Redirect admin to item management page
			}
		}
		else		// If user not found
		{
			model.put("msg", "Wrong Credential!");			// Invalid login
			return "login";									// Show login page again
		}
	}
	
	
	// ---------------------- LOGOUT ----------------------
	@RequestMapping("/logout")
	public String destroy(HttpServletRequest request) {
		request.getSession().invalidate();		// Clear all session data
		return "index";
	}
	
	
	// ---------------------- VIEW USER PROFILE ----------------------
	@RequestMapping("/profile/{email}")				// Maps request like /profile/abc@gmail.com
	public String viewProfile(
			@PathVariable String email,				// Get email directly from URL path
			Model model) {							// Used to pass data to webpage
		
		User user = ud.findByEmail(email);			// Fetch user details from DB using email
		model.addAttribute("details", user);		// Send user details to frontend with key "details"
		return "profile";
	}
	
	
	// ---------------------- EDIT USER PROFILE ----------------------
	@PostMapping("/edit")			// Handles form submission for updating user profile
	public String editUser(
			@RequestParam ("email") String email,
			@RequestParam ("name") String name,
			@RequestParam ("phone") String phno,
			@RequestParam ("password") String pass,
			ModelMap model,
			HttpServletRequest request) {		// To know which page user came from
		
		User user = ud.findByEmail(email);		// Fetch existing user record from DB
		
		// Update user details with new values from form
		user.setEmail(email);
		user.setName(name);
		user.setPhno(phno);
		user.setPassword(pass);
		user.setRole("customer");
		ud.save(user);
		model.put("msg", "Yor profile is updated!");
		
		// Redirect back to the same page where user came from (Referer header)
		return "redirect:" + request.getHeader("Referer");
	}
	
	
	// ---------------------- VIEW ALL CUSTOMERS ----------------------
	@RequestMapping("/viewuser")
	public String getAllUser(Model model) {
		List<User> user = (List<User>) ud.findByRole("customer");	// Fetch all users with role = "customer"
		model.addAttribute("udata", user);							// Send customers list to frontend
		return "allUser";
	}
	
	
	// ---------------------- DELETE USER ----------------------
	@RequestMapping("/del/{email}")
	public String deleteUser(@PathVariable String email) {		// Extracts {email} from URL
		ud.deleteById(email);		// Delete user by email
		return "redirect:/viewuser";
	}
}
