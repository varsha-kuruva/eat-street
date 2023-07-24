package com.webtools.FinalProject.controllers;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.servlet.ModelAndView;

import com.webtools.FinalProject.daos.CustomerDao;
import com.webtools.FinalProject.pojos.Customer;

@Controller
public class SignUpController {

	@PostMapping({"/createaccount.htm"})
	public ModelAndView handleCustomerSignUp(final HttpServletRequest request, final CustomerDao customerDao) {
       final ModelAndView mav = new ModelAndView();
       final String customerFullName = request.getParameter("customerFullName");
       final String customerEmail = request.getParameter("customerEmail");
       final String customerPhoneNo = request.getParameter("customerPhoneNo");
       final String customerPassword = request.getParameter("customerPassword");
       final String customerConfirmPassword = request.getParameter("customerConfirmPassword");
       final String alert = this.validateCustomer(customerDao, customerEmail, customerPhoneNo, customerPassword, customerConfirmPassword);
       if (!alert.equals("Successful")) {
           mav.addObject("error", (Object)alert);
           mav.setViewName("error_signup");
       }
       else {
           final long phNumber = Long.parseLong(customerPhoneNo);
           final LocalDateTime dateObject = LocalDateTime.now();
           final DateTimeFormatter formatObject = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
           final String dateFormatted = dateObject.format(formatObject);
           @SuppressWarnings("unused")
		final boolean customerStatus = customerDao.addNewCustomer(customerFullName, customerEmail, customerPassword, phNumber, dateFormatted);
           final Customer customer = customerDao.getCustomerFromEmail(customerEmail);
           mav.addObject("customer", (Object)customer);
           mav.setViewName("success_signup");
       }
       return mav;
   }

   private String validateCustomer(final CustomerDao customerDao, final String customerEmail, final String customerPhoneNo, final String customerPassword, final String customerConfirmPassword) {
       String alert = "";
       final Customer customer = customerDao.getCustomerFromEmail(customerEmail);
       if (customerPassword.length() < 8 || customerPassword.length() > 20) {
           alert = String.valueOf(alert) + "Password length should be 8 to 20 characters";
       }
       else if (!customerPassword.equals(customerConfirmPassword)) {
           alert = String.valueOf(alert) + "Please match the passwords";
       }
         else if (customerPhoneNo.length() != 10) {
           alert = String.valueOf(alert) + "Please enter 10 digits Phone Number, i.e. without Country Code";
       }
       else if (customer != null) {
           alert = String.valueOf(alert) + "Account already exists. Please enter a different Email Address";
       }
       else {
           alert = String.valueOf(alert) + "Successful";
       }
       return alert;
   }



}
