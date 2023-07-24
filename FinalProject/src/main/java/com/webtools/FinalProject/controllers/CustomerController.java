package com.webtools.FinalProject.controllers;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.webtools.FinalProject.daos.CartDao;
import com.webtools.FinalProject.daos.CustomerDao;
import com.webtools.FinalProject.pojos.Customer;
import com.webtools.FinalProject.pojos.Item;
import com.webtools.FinalProject.pojos.Cart;
import java.util.HashMap;
import java.util.Properties;

@Controller
public class CustomerController {

	@GetMapping({ "forgotPassword.htm" })
    public ModelAndView updateCustomerPassword(final HttpSession session, final CustomerDao customerDao, final HttpServletRequest request) {
        final ModelAndView mav = new ModelAndView();
        final String customerEmail = request.getParameter("email");
        final Customer customer = customerDao.getCustomerFromEmail(customerEmail);
        if (customer != null) {
            @SuppressWarnings("unused")
			final boolean mailCustomer = sendEmail(customer.getCustomerPassword(), customerEmail);
            mav.setViewName("login");
        }
        else {
            mav.addObject("error", (Object)"Customer Not Found");
            mav.setViewName("login");
        }
        return mav;
    }
    
    @PostMapping({"/changePassword.htm"})
    public ModelAndView changeCustomerPassword(final HttpSession session, final CustomerDao customerDao, final HttpServletRequest request) {
        final ModelAndView mav = new ModelAndView();
        String customerEmail = (String)session.getAttribute("customerEmail");
        final String newCustomerPassword = request.getParameter("newPassword");
        if (8 > newCustomerPassword.length() || 20 < newCustomerPassword.length()) {
            mav.addObject("error", (Object)"Password is small");
            mav.setViewName("error_signup");
        }
        else {
            customerEmail = (String)session.getAttribute("customerEmail");
            final boolean changedPassword = customerDao.updateCustomerPassword(customerEmail, newCustomerPassword);
            if (!changedPassword) {
                mav.addObject("error", (Object)"Try again. Password is not changed");
                mav.setViewName("error_signup");
            }
            else {
                mav.setViewName("login");
            }
        }
        return mav;
    }
    
	
	@PostMapping({"/customerLogin.htm"})
	public ModelAndView customerLogin(final HttpServletRequest request, final CustomerDao customerDao, final HttpSession session, final CartDao cartDao) {
		final ModelAndView mav = new ModelAndView();
		final String customerEmail = request.getParameter("customerEmail");
        final String customerPassword = request.getParameter("password");
        final Customer customer = customerDao.getCustomerFromEmail(customerEmail);
        if (customer == null) {
            mav.addObject("validEmail", (Object)"Not registered email");
            mav.setViewName("login");
        }
        else if (!customer.getCustomerPassword().equals(customerPassword)) {
            mav.addObject("incorrectPassword", (Object)"Incorrect Password");
            mav.setViewName("login");
        }
        else {
            mav.addObject("customer", (Object)customer);
            mav.setViewName("customerDashboard");
            final Cart cart = cartDao.getCartFromId(customer.getCart().getCartId());
            final HashMap<Item, Integer> itemsMap = new HashMap<Item, Integer>();
            for (final Item i : cart.getItemsCart()) {
                if (itemsMap.containsKey(i)) {
                	itemsMap.put(i, itemsMap.get(i) + 1);
                }
                else {
                	itemsMap.put(i, 1);
                }
            }
            session.setAttribute("cart", cart);
            session.setAttribute("customer", customer);
            session.setAttribute("items", itemsMap);
            session.setAttribute("placedOrder", false);
            session.setAttribute("countCart", customer.getCart().getItemsCart().size());
            session.setAttribute("customerEmail", customerEmail);
        }
        return mav;
	}

	public static boolean sendEmail(final String oldPassword, final String customerEmail) {
        final String username = "noreply.eatstreet@gmail.com";
        final String password = "";
        final Properties prop = new Properties();
        prop.put("mail.smtp.auth", true);
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        final Session session = Session.getInstance(prop, (Authenticator)new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        try {
            final Message message = (Message)new MimeMessage(session);
            message.setFrom((Address)new InternetAddress("noreply.eatstreet@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, (Address[])InternetAddress.parse(customerEmail));
            message.setSubject("Login Credentials");
            final String msg = "Your password is : " + oldPassword + "<p> Please Login with the link given below.</p>" + "<p> http://localhost:8080/FinalProject/login.htm </p>";
            final MimeBodyPart mimeBodyPart = new MimeBodyPart();
            mimeBodyPart.setContent((Object)msg, "text/html; charset=utf-8");
            final Multipart multipart = (Multipart)new MimeMultipart();
            multipart.addBodyPart((BodyPart)mimeBodyPart);
            message.setContent(multipart);
            Transport.send(message);
        }
        catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
