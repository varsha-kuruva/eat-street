package com.webtools.FinalProject.controllers;

import java.util.Properties;
import java.util.List;
import java.util.Map;

import javax.mail.Message;
import javax.mail.Address;
import javax.mail.Session;
import javax.mail.PasswordAuthentication;
import javax.mail.Authenticator;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.InternetAddress;
import javax.mail.Multipart;
import javax.mail.BodyPart;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeBodyPart;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.webtools.FinalProject.pojos.Customer;
import com.webtools.FinalProject.pojos.Item;
import com.webtools.FinalProject.pojos.Admin;
import com.webtools.FinalProject.daos.ItemDao;
import com.webtools.FinalProject.daos.CustomerDao;
import com.webtools.FinalProject.daos.AdminDao;


@Controller
public class AdminController
{
    @GetMapping({"/adminlogout.htm"})
    public ModelAndView handleLogoutAdmin(final HttpSession session, final AdminDao adminDao, final HttpServletRequest request) {
        final ModelAndView mav = new ModelAndView();
        session.invalidate();
        mav.addObject("logoutAdminMessage", (Object)"Admin has been logged out");
        mav.setViewName("adminLogin");
        return mav;
    }
    
    @PostMapping({"/adminchangePassword.htm"})
    public ModelAndView changeAdminPassword(final HttpSession session, final AdminDao adminDao, final HttpServletRequest request) {
        final ModelAndView mav = new ModelAndView();
        String adminEmail = (String)session.getAttribute("emailAdmin");
        final String newAdminPassword = request.getParameter("newPassword");
        if (8 > newAdminPassword.length() || 20 < newAdminPassword.length()) {
            mav.addObject("error", (Object)"Password is small");
            mav.setViewName("error_signup");
        }
        else {
            adminEmail = (String)session.getAttribute("emailAdmin");
            final boolean changedPassword = adminDao.updateAdminPassword(adminEmail, newAdminPassword);
            if (!changedPassword) {
                mav.addObject("error", (Object)"Try again. Password is not changed");
                mav.setViewName("error_signup");
            }
            else {
                mav.setViewName("adminLogin");
            }
        }
        return mav;
    }
    
    @GetMapping({ "adminforgotPassword.htm" })
    public ModelAndView forgotAdminPassword(final HttpSession session, final AdminDao adminDao, final HttpServletRequest request) {
        final ModelAndView mav = new ModelAndView();
        final String adminEmail = request.getParameter("email");
        final Admin admin = adminDao.getAdminFromEmail(adminEmail);
        if (admin != null) {
            @SuppressWarnings("unused")
			final boolean mail = sendEmail(admin.getAdminPassword(), adminEmail);
            mav.setViewName("adminLogin");
        }
        else {
            mav.addObject("error", (Object)"Admin Not Found");
            mav.setViewName("adminLogin");
        }
        return mav;
    }
    
    @PostMapping({"/adminLogin.htm"})
    public ModelAndView handleAdminLogin(final HttpServletRequest request, final AdminDao adminDao, final HttpSession session, final CustomerDao customerDao, final ItemDao itemDao) {
        final ModelAndView mav = new ModelAndView();
        final String email = request.getParameter("userEmail");
        final String password = request.getParameter("password");
        final Admin admin = adminDao.getAdminFromEmail(email);
        if (admin == null) {
            mav.addObject("validEmail", (Object)"Not Registered");
            mav.setViewName("adminLogin");
        }
        else if (!admin.getAdminPassword().equals(password)) {
            mav.addObject("passwordIncorrect", (Object)"Password is Incorrect");
            mav.setViewName("adminLogin");
        }
        else {
            mav.addObject("admin", (Object)admin);
            mav.setViewName("adminDashboard");
            session.setAttribute("admin", (Object)admin);
            final Map<Long, Item> itemsList = (Map<Long, Item>)itemDao.getAllMenuItems();
            session.setAttribute("itemsList", (Object)itemsList);
            final List<Customer> customersList = (List<Customer>)customerDao.getAllCustomers();
            session.setAttribute("customerList", (Object)customersList);
            session.setAttribute("emailAdmin", (Object)email);
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
            final String msg = "Your password is : " + oldPassword + "<p> Please use the link below to Login </p>" + "<p> http://localhost:8080/FinalProject/admin.htm </p>";
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

