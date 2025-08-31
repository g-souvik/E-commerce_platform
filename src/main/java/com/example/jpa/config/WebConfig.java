package com.example.jpa.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
    	// This method is used to tell Spring where to find static resources (like images, files, etc.)
    	
    	// Map any URL starting with /upload/** to files inside the "upload" folder on the server
        registry.addResourceHandler("/upload/**")
                .addResourceLocations("file:upload/");
        // "file:upload/" means it will look inside the folder named "upload" in your project root
        // Example: If you stored a file "phone.jpg" in upload/, 
        //          then you can access it in the browser at: http://localhost:8080/upload/phone.jpg
    }
}
