package com.webtools.FinalProject.controllers;

import javax.servlet.http.HttpSession;

import java.util.Iterator;
import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.webtools.FinalProject.daos.CartDao;
import com.webtools.FinalProject.daos.ItemDao;
import com.webtools.FinalProject.pojos.Customer;
import com.webtools.FinalProject.pojos.Cart;
import com.webtools.FinalProject.pojos.Item;

@Controller
public class RemoveFromCartController {
	
	@GetMapping({"removeItem.htm"})
    public ModelAndView handleRemoveMenuItem(@RequestParam final long itemId, final HttpSession session, final ItemDao itemDao, final CartDao cartDao) {
        final ModelAndView mav = new ModelAndView();
        final Customer customer = (Customer)session.getAttribute("customer");
        System.out.println(customer.getCustomerName());
        final Cart cart = (Cart)session.getAttribute("cart");
        @SuppressWarnings("unchecked")
		final HashMap<Item, Integer> itemsMap = (HashMap<Item, Integer>)session.getAttribute("items");
        Iterator<Item> i = cart.getItemsCart().iterator();
        while (i.hasNext()) {
            final Item menuItem = i.next();
            if (menuItem.getItemId() == itemId) {
                i.remove();
            }
        }
        i = itemsMap.keySet().iterator();
        while (i.hasNext()) {
            final Item menuItem = i.next();
            if (menuItem.getItemId() == itemId) {
                i.remove();
            }
        }
        cartDao.removeItemFromCart(cart.getCartId(), itemId);
        session.setAttribute("countCart", (Object)cart.getItemsCart().size());
        session.setAttribute("items", (Object)itemsMap);
        session.setAttribute("cart", (Object)cart);
        mav.setViewName("cart");
        return mav;
    }
}
