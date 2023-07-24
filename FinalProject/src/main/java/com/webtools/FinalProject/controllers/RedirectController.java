package com.webtools.FinalProject.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RedirectController {
	
	@RequestMapping(path = { "/dashboard.htm" })
    public String handleDashboardCustomer(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse) {
        System.out.println("Redirecting to customer dashboard page");
        return "customerDashboard";
    }
    
    @RequestMapping(path = { "/admindashboard.htm" })
    public String handleDashboardAdmin(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse) {
        System.out.println("Redirecting to admin dashboard page");
        return "adminDashboard";
    }
    
    @RequestMapping(path = { "/login.htm" })
    public String handleLoginCustomer(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse) {
        System.out.println("Redirecting to customer login page");
        return "login";
    }
    
    @RequestMapping(path = { "/index.htm" })
    public String handleHomePage(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse) {
        System.out.println("Redirecting to application home page");
        return "index";
    }
    
    @RequestMapping(path = { "/signup.htm" })
    public String handleSignUpCustomer(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse) {
        System.out.println("Redirecting to customer signup page");
        return "signup";
    }
    
    @RequestMapping(path = { "/menu.htm" })
    public String handleMenuPage(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse, final HttpSession session) {
        System.out.println("Redirecting to customer menu page");
        return "menu";
    }
    
    @RequestMapping(path = { "/menu_error.htm" })
    public String handleMenuPageError(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse) {
        System.out.println("Redirecting to error menu page");
        return "error_menu";
    }
    
    @RequestMapping(path = { "/viewCart.htm" })
    public String handleCustomerCart(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse, final HttpSession session) {
        System.out.println("Redirecting to customer cart page");
        session.setAttribute("fromCustomerCart", (Object)true);
        return "cart";
    }
    
    @RequestMapping(path = { "/admin.htm" })
    public String handleAdminPage(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse) {
        System.out.println("Redirecting to admin login page");
        return "adminLogin";
    }
    
    @RequestMapping(path = { "/addItemForm.htm" })
    public String handleAddMenuItem(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse, final HttpSession session) {
        System.out.println("Redirecting to admin add menu item page");
        session.setAttribute("fromAddMenuItemPage", (Object)true);
        return "addMenuItem";
    }
    
    @RequestMapping(path = { "/forgotPasswordForm.htm" })
    public String handleForgotPasswordCustomer(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse, final HttpSession session) {
        System.out.println("Redirecting to customer forgot password page.");
        session.setAttribute("fromForgotPassword", (Object)true);
        return "forgotPassword";
    }
    
    @RequestMapping(path = { "/adminforgotPasswordForm.htm" })
    public String handleForgotPasswordAdmin(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse, final HttpSession session) {
        System.out.println("Redirecting to forgot password page of admin.");
        session.setAttribute("fromForgotPassword", (Object)true);
        return "adminForgotPassword";
    }
    
    @RequestMapping(path = { "/changePasswordForm.htm" })
    public String handleChangePasswordCustomer(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse, final HttpSession session) {
        System.out.println("Redirecting to customer change password page.");
        session.setAttribute("fromChangePassword", (Object)true);
        return "changePassword";
    }
    
    @RequestMapping(path = { "/adminchangePasswordForm.htm" })
    public String handleChangePasswordAdmin(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse, final HttpSession session) {
        System.out.println("Redirecting to change password page of admin.");
        session.setAttribute("fromChangePassword", (Object)true);
        return "adminChangePassword";
    }

}
