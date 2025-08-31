package com.example.jpa.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.jpa.dao.ProductDao;
import com.example.jpa.entity.Product;

@Controller  // Marks this class as a Spring MVC controller (handles HTTP requests)
public class ProductController {
	
	@Autowired  // Automatically injects ProductDao (which is the repository for DB operations)
	ProductDao pd;
	
	
	// ------------------------ ADD FORM -----------------------
	@RequestMapping("/addform")
	public String addForm() {
		return "addForm";
	}	
	
	
	// ---------------------- ADD PRODUCT ----------------------
	@PostMapping("/additem")	// Handles form submission when adding new product
	public String addProd(
			@RequestParam("prodid") String id,			// Get product id from form
			@RequestParam("prodname") String name,  	// Get product name
			@RequestParam("category") String category,	// Get category
			@RequestParam("qty") String quantity,   	// Get quantity
			@RequestParam("price") String price,     	// Get price
			@RequestParam("brand") String brand,     	// Get brand
			@RequestParam("file") MultipartFile file,	// Get uploaded file
			ModelMap model) {                        	// To pass messages to frontend
		
		// Create a new Product object and set values
		Product prod = new Product();
		prod.setId(id);
		prod.setName(name);
		prod.setCategory(category);
		prod.setBrand(brand);
		prod.setQuantity(Integer.parseInt(quantity));	// Convert String → int
		prod.setPrice(Double.parseDouble(price));		// Convert String → double
		
		// Check if a file was uploaded
		if (!file.isEmpty()) {
			try {
				// Create upload folder if not present
			    File uploadDir = new File("upload/");
			    if (!uploadDir.exists())
			    	uploadDir.mkdirs();
			    
			    // Build file path where uploaded file will be stored
			    Path filePath = Paths.get("upload/", file.getOriginalFilename()) // create a path "upload/filename.jpg"
			    						.normalize()							 // clean the path (remove any ../ or extra slashes)
			    						.toAbsolutePath();						 // convert it into full system path: C:\Users\...
			    
			    // Copy uploaded file into the uploaded folder
			    Files.copy(file.getInputStream(),			  // Gets the raw file content in bytes of the uploaded file
			    		filePath,						 	  // This is the destination path where you want to save the file
			    		StandardCopyOption.REPLACE_EXISTING); // This tells Java to overwrite the file if another file with the same name already exists
			    
			    // Save relative file path into product object
			    prod.setFilePath("/upload/" + file.getOriginalFilename()); // This path is used to access the file
			    
			} catch (IOException e) {		// If error occurs
		        	e.printStackTrace();
			}
		}
		
		// Save product in DB
		pd.save(prod);
		model.put("msg", "Item is Added!");		// Success message
		return "addForm";
	}
	
	
	// ---------------------- VIEW ALL PRODUCTS ----------------------
	@GetMapping("/viewitem")
	public String getAllData(Model model) {		// Model is used to pass data from backend to webpage
		List<Product> prod = pd.findAll();      // Fetch all products from DB
		model.addAttribute("data", prod);		// Put prod list in model with the key "data" & sent to frontend
		return "dashboard";
	}
	
	
	// ---------------------- DELETE PRODUCT ------------------------
	@RequestMapping("/deleteProd/{id}")			// Used when data is part of the URL path, not in form body
	public String deleteProd(@PathVariable String id) {
		pd.deleteById(id);						// Delete product by id
		return "redirect:/viewitem";			// Redirect to view all products
	}
	
	
	// -------------------- VIEW SINGLE PRODUCT ---------------------
	@RequestMapping("/viewrecord/{id}")			// Used when data is part of the URL path, not in form body
	public String getSingleData(@PathVariable String id, Model model) {
		Product prod = pd.findById(id).get();	// Find single product by id
		model.addAttribute("prod", prod);		// Add product to model
		return "updateForm";
	}
	
	
	// ----------------------- UPDATE PRODUCT -----------------------
	@PostMapping("/update")
	public String updateRecord(
			@RequestParam("prodid") String id,
			@RequestParam("prodname") String name,
			@RequestParam("category") String category,
			@RequestParam("brand") String brand,
			@RequestParam("qty") String quantity,
			@RequestParam("price") String price,
			@RequestParam(value = "file", required = false) MultipartFile file) {	// Get file (optional) from form
		
		// Create new Product object with updated data
		Product prod = new Product();
		prod.setId(id);
		prod.setName(name);
		prod.setCategory(category);
		prod.setBrand(brand);
		prod.setQuantity(Integer.parseInt(quantity));
		prod.setPrice(Double.parseDouble(price));
		
		// Get the existing product from database using id
	    Product existing = pd.findById(id).orElse(null);

	    // If a new file is uploaded
	    if (file != null && !file.isEmpty()) {
	        try {
	        	// Delete old file (if exists)
	            if (existing != null && existing.getName() != null) {
	                File oldFile = new File("upload/" + existing.getName());
	                if (oldFile.exists()) {
	                    oldFile.delete();
	                }
	            }

	        	// Create upload folder if not exist
	            File uploadDir = new File("upload/");
	            if (!uploadDir.exists())
	            	uploadDir.mkdirs();
	            
	            // Build file path where uploaded file will be stored
	            Path filePath = Paths.get("upload/", file.getOriginalFilename()).normalize().toAbsolutePath(); // Full path
	            
	            // Saves the uploaded file into the uploaded folder
	            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
	            
	            // Save relative file path into product object
	            prod.setFilePath("/upload/" + file.getOriginalFilename()); // This path is used to access the file
	            
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    } else {
	        // If no new file is uploaded, keep the old file details
	        if (existing != null) {
	            prod.setFilePath(existing.getFilePath());
	        }
	    }
		
	    // Save product in database
		pd.save(prod);
		return "redirect:/viewitem";
	}
	
	
	// ---------------------- CATEGORY WISE PRODUCTS ----------------------
	@GetMapping("/mobile")
	public String getAllMobile(Model model) {
		List<Product> prod = pd.findByCategory("mobile");	// Fetch only mobile category
		model.addAttribute("product", prod);
		return "mobile";
	}
	
	
	@GetMapping("/laptop")
	public String getAllLaptop(Model model) {
		List<Product> prod = pd.findByCategory("laptop");	// Fetch only laptop category
		model.addAttribute("product", prod);
		return "laptop";
	}
	
	
	@GetMapping("/camera")
	public String getAllCamera(Model model) {
		List<Product> prod = pd.findByCategory("camera");	// Fetch only camera category
		model.addAttribute("product", prod);
		return "camera";
	}
	
	
	@GetMapping("/television")
	public String getAllTelevision(Model model) {
		List<Product> prod = pd.findByCategory("television");	// Fetch only television category
		model.addAttribute("product", prod);
		return "television";
	}
}
