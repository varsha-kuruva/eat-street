package com.webtools.FinalProject.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.webtools.FinalProject.daos.OrdersDao;
import com.webtools.FinalProject.pojos.Customer;
import com.webtools.FinalProject.pojos.Orders;

@Controller
public class OrdersController {
	
	@GetMapping({"/orders.htm"})
    public ModelAndView handleViewCustomerOrders(final HttpServletRequest request, final HttpSession session, final OrdersDao ordersDao) {
        final ModelAndView mav = new ModelAndView();
        final Customer customer = (Customer)session.getAttribute("customer");
        System.out.println(customer.getCustomerName());
        final List<Orders> ordersList = (List<Orders>)ordersDao.getAllCustomerOrders(customer);
        mav.addObject("orders", (Object)ordersList);
        mav.setViewName("orders");
        return mav;
    }
	
}
