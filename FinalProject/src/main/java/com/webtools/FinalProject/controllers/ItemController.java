package com.webtools.FinalProject.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.webtools.FinalProject.daos.ItemDao;
import com.webtools.FinalProject.pojos.Item;

@Controller
public class ItemController {
	
	//Add Item
	@GetMapping({"addItemAdmin.htm"})
    public ModelAndView handleAddMenuItem(final HttpServletRequest request, final HttpSession session, final ItemDao itemDao) {
        final ModelAndView mav = new ModelAndView();
        final String itemMenuName = request.getParameter("itemName");
        final String itemMenuDescription = request.getParameter("itemDescription");
        final String itemMenuCategory = request.getParameter("itemCategory");
        final double itemMenuPrice = Double.parseDouble(request.getParameter("itemPrice"));
        final String fromAddItemForm = (String)session.getAttribute("fromAddItemForm");
        if (fromAddItemForm.equals("true")) {
            itemDao.addMenuItem(itemMenuName, itemMenuDescription, itemMenuCategory, itemMenuPrice);
            session.setAttribute("addingError", (Object)false);
            session.setAttribute("fromAddItemForm", (Object)"false");
        }
        else {
            session.setAttribute("addingError", (Object)true);
        }
        final Map<Long, Item> itemsList = (Map<Long, Item>)itemDao.getAllMenuItems();
        session.setAttribute("itemsList", (Object)itemsList);
        mav.setViewName("viewMenuItems");
        return mav;
    }
	
	//View Items
	@GetMapping({"/viewItemsAdmin.htm"})
    public ModelAndView handleViewMenuItem() {
        final ModelAndView mav = new ModelAndView();
        mav.setViewName("viewMenuItems");
        return mav;
    }
	
	//Delete Items
	@GetMapping({"/deleteItemByAdmin.htm"})
	 public ModelAndView handleDeleteMenuItem(@RequestParam final long itemId, final HttpSession session, final ItemDao itemDao) {
		
		final ModelAndView mav = new ModelAndView();
      final Item item = itemDao.getItemFromId(itemId);
      if (item == null) {
          session.setAttribute("errorRemoving", (Object)true);
      }
      else {
          itemDao.deleteMenuItem(itemId);
          session.setAttribute("errorRemoving", (Object)false);
      }
      final Map<Long, Item> itemsList = (Map<Long, Item>)itemDao.getAllMenuItems();
      session.setAttribute("itemsList", (Object)itemsList);
      mav.setViewName("viewMenuItems");
      return mav;
		
	}

}
