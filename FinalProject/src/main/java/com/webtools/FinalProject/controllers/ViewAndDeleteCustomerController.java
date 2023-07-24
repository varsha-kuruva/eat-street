package com.webtools.FinalProject.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.webtools.FinalProject.daos.CustomerDao;
import com.webtools.FinalProject.pojos.Customer;

@Controller
public class ViewAndDeleteCustomerController {
	
	@GetMapping({"/viewCustomerAdmin.htm"})
    public ModelAndView handleViewCustomer() {
        final ModelAndView mav = new ModelAndView();
        mav.setViewName("viewCustomers");
        return mav;
    }
	
	@GetMapping({"/removeCustomerAdmin.htm"})
    public ModelAndView handleDeleteCustomer(@RequestParam final long customerId, final HttpSession session, final CustomerDao customerDao) {
        final ModelAndView mav = new ModelAndView();
        final Customer customer = customerDao.getCustomerFromId(customerId);
        if (customer == null) {
            session.setAttribute("error", (Object)true);
        }
        else {
        	customerDao.deleteCustomer(customerId);
            session.setAttribute("error", (Object)false);
        }
        final List<Customer> customerList = (List<Customer>)customerDao.getAllCustomers();
        session.setAttribute("customerList", (Object)customerList);
        mav.setViewName("viewCustomers");
        return mav;
    }

}
