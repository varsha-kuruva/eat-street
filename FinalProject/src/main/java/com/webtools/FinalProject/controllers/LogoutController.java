package com.webtools.FinalProject.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class LogoutController
{
    @GetMapping({"/logout.htm"})
    public ModelAndView handleUserLogout(final HttpSession session) {
        final ModelAndView mav = new ModelAndView();
        session.invalidate();
        mav.addObject("logoutMessage", (Object)"Log Out Successful");
        mav.setViewName("login");
        return mav;
    }
}
