package com.example.jpa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		return "index";
	}
	
	@RequestMapping("reg")
	public String signup() {
		return "signup";
	}
	
	@RequestMapping("log")
	public String login() {
		return "login";
	}
	
	@RequestMapping("about")
	public String about() {
		return "about";
	}
	
	@RequestMapping("contact")
	public String contact() {
		return "contact";
	}
}
