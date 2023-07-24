package com.webtools.FinalProject.controllers;

import com.webtools.FinalProject.pojos.Orders;

import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import com.webtools.FinalProject.pojos.Item;
import java.util.ArrayList;
import com.webtools.FinalProject.pojos.Customer;
import com.webtools.FinalProject.pojos.Cart;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import com.webtools.FinalProject.daos.CartDao;
import com.webtools.FinalProject.daos.OrdersDao;

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

@Controller
public class CreateNewOrderController
{
    @SuppressWarnings({ "rawtypes", "unchecked", "unused" })
            @PostMapping({"/createOrder.htm"})
    public ModelAndView handleOrderCreation(final HttpSession session, final OrdersDao ordersDao, final CartDao cartDao, final HttpServletRequest request) {
        final ModelAndView mav = new ModelAndView();
        Cart cart = (Cart)session.getAttribute("cart");
        final Customer customer = (Customer)session.getAttribute("customer");
        final boolean orderCheck = (boolean)session.getAttribute("placedOrder");
        final boolean fromCartCheck = (boolean)session.getAttribute("fromCustomerCart");
        if (!orderCheck && fromCartCheck) {
            final List<Item> itemsList = new ArrayList<Item>();
            itemsList.addAll(cart.getItemsCart());
            ordersDao.createNewOrder((List)itemsList, customer);
            cartDao.clearCart(cart.getCartId());
            cart = cartDao.getCartFromId(cart.getCartId());
            final HashMap<Item, Integer> items = new HashMap<Item, Integer>();
            for (final Item i : cart.getItemsCart()) {
                if (items.containsKey(i)) {
                	items.put(i, items.get(i) + 1);
                }
                else {
                	items.put(i, 1);
                }
            }
            final String customerEmail = customer.getCustomerEmail();
            final boolean mailCustomer = sendEmail(customerEmail);
            final List<Orders> ordersList = (List<Orders>)ordersDao.getAllCustomerOrders(customer);
            session.setAttribute("countCart", (Object)cart.getItemsCart().size());
            session.setAttribute("cart", (Object)cart);
            session.setAttribute("customer", (Object)customer);
            session.setAttribute("items", (Object)items);
            session.setAttribute("orders", (Object)customer.getCustomerOrders());
            session.setAttribute("placedOrder", (Object)true);
            session.setAttribute("fromCustomerCart", (Object)false);
            session.setAttribute("customerEmail", customerEmail);
        }
        
           
        mav.setViewName("success_order");
        return mav;
    }
    
    boolean sendEmail(final String customerEmail) {
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
            message.setSubject("Order Successful!");
            final String msg = "Your Order has been placed! Please Login to check status of your order." + "<p> http://localhost:8080/FinalProject/login.htm </p>";
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