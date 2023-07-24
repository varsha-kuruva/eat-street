package com.webtools.FinalProject.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.webtools.FinalProject.daos.ItemDao;
import com.webtools.FinalProject.pojos.Item;

@Controller
public class MenuController {
	
	public Map<Long, Item> paginationItems(final int menuPage, final ItemDao itemDao) {
        final Map<Long, Item> itemsList = (Map<Long, Item>)itemDao.getAllMenuItems();
        final Map<Long, Item> paginationItemsList1 = new HashMap<Long, Item>();
        final Map<Long, Item> paginationItemsList2 = new HashMap<Long, Item>();
        final Map<Long, Item> paginationItemsList3 = new HashMap<Long, Item>();
        int counter = 1;
        for (final Long i : itemsList.keySet()) {
            if (counter > 0 && counter <= 49) {
            	paginationItemsList1.put(i, itemsList.get(i));
            }
            if (counter > 49 && counter <= 99) {
            	paginationItemsList2.put(i, itemsList.get(i));
            }
            if (counter > 99) {
            	paginationItemsList3.put(i, itemsList.get(i));
            }
            ++counter;
        }
        if (menuPage == 1) {
            return paginationItemsList1;
        }
        if (menuPage == 2) {
            return paginationItemsList2;
        }
        return paginationItemsList3;
    }
    
    @GetMapping({"/menu1.htm"})
    public ModelAndView viewMenuPage1(final HttpServletRequest request, final HttpSession session, final ItemDao itemDao) {
        final ModelAndView mav = new ModelAndView();
        mav.addObject("itemsList", (Object)this.paginationItems(1, itemDao));
        mav.addObject("p", (Object)1);
        mav.setViewName("menuPage");
        session.setAttribute("fromItemsMenu", (Object)true);
        return mav;
    }
    
    @GetMapping({"/menu2.htm"})
    public ModelAndView viewMenuPage2(final HttpServletRequest request, final HttpSession session, final ItemDao itemDao) {
        final ModelAndView mav = new ModelAndView();
        mav.addObject("itemsList", (Object)this.paginationItems(2, itemDao));
        mav.addObject("p", (Object)2);
        mav.setViewName("menuPage");
        session.setAttribute("fromItemsMenu", (Object)true);
        return mav;
    }
    
    @GetMapping({"/menu3.htm"})
    public ModelAndView viewMenuPage3(final HttpServletRequest request, final HttpSession session, final ItemDao itemDao) {
        final ModelAndView mav = new ModelAndView();
        mav.addObject("itemsList", (Object)this.paginationItems(3, itemDao));
        mav.addObject("p", (Object)3);
        mav.setViewName("menuPage");
        session.setAttribute("fromItemsMenu", (Object)true);
        return mav;
    }
}
