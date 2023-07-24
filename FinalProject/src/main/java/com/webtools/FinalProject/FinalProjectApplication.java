package com.webtools.FinalProject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
@ComponentScan({ "com.webtools.FinalProject.controllers", "com.webtools.FinalProject.daos", "com.webtools.FinalProject.pojos" })
public class FinalProjectApplication extends SpringBootServletInitializer implements WebMvcConfigurer {

	public static void main(String[] args) {
		System.setProperty("spring.devtools.restart.enabled", "false");
		SpringApplication.run(FinalProjectApplication.class, args);
	}
	
//	@Bean(name = { "multipartResolver" })
//    public CommonsMultipartResolver multipartResolver() {
//        final CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
//        multipartResolver.setMaxUploadSize(10000000L);
//        return multipartResolver;
//    }
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("index");
	}

}