package com.example.jpa;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication		// Marks this as the main Spring Boot application class
public class JpaApplication {
	
	public static void main(String[] args) {
		
		// Bootstraps and runs the Spring Boot application
		SpringApplication.run(JpaApplication.class, args);
	}

}
