package com.webtools.FinalProject.controllers;

import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;

import com.webtools.FinalProject.pojos.Item;
import com.webtools.FinalProject.pojos.Cart;
import com.webtools.FinalProject.pojos.Customer;
import com.webtools.FinalProject.daos.CartDao;
import com.webtools.FinalProject.daos.ItemDao;


@Controller
public class AddToCartController
{
	@RequestMapping(value = { "addItemToCart.htm" }, method = { RequestMethod.GET })
    public ModelAndView handleAddItemToCart(@RequestParam final Long itemId, final HttpSession session, final CartDao cartDao, final ItemDao itemDao) {
        final ModelAndView mav = new ModelAndView();
        final Customer customer = (Customer)session.getAttribute("customer");
        Cart cart = (Cart)session.getAttribute("cart");
        final boolean fromItemsMenu = (boolean)session.getAttribute("fromItemsMenu");
        final Item newMenuItem = itemDao.getItemFromId((long)itemId);
        if (fromItemsMenu) {
            cartDao.addItemToCart(cart.getCartId(), newMenuItem);
            cart = cartDao.getCartFromId(cart.getCartId());
        }
        final HashMap<Item, Integer> itemMap = new HashMap<Item, Integer>();
        for (final Item i : cart.getItemsCart()) {
            if (itemMap.containsKey(i)) {
            	itemMap.put(i, itemMap.get(i) + 1);
            }
            else {
            	itemMap.put(i, 1);
            }
        }
        session.setAttribute("countCart", (Object)cart.getItemsCart().size());
        session.setAttribute("items", (Object)itemMap);
        session.setAttribute("cart", (Object)cart);
        session.setAttribute("customer", (Object)customer);
        session.setAttribute("placedOrder", (Object)false);
        session.setAttribute("fromCustomerCart", (Object)true);
        session.setAttribute("fromItemsMenu", (Object)false);
        mav.setViewName("cart");
        return mav;
    }
}