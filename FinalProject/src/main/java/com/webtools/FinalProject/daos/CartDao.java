package com.webtools.FinalProject.daos;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;
import com.webtools.FinalProject.pojos.Cart;
import com.webtools.FinalProject.pojos.Item;

@Component
public class CartDao extends Dao {
	
	public Cart getCartFromId(final long cartId) {
        final Criteria criteria = getSession().createCriteria(Cart.class);
        criteria.add((Criterion)Restrictions.eq("cartId", cartId));
        return (Cart)criteria.uniqueResult();
    }
    
    public boolean addItemToCart(final long cartId, final Item item) {
        try {
            final Cart cart = this.getCartFromId(cartId);
            cart.getItemsCart().add(item);
            final Session session = getSession();
            final Transaction t = session.beginTransaction();
            session.save(cart);
            t.commit();
            return true;
        }
        catch (HibernateException e) {
            e.printStackTrace();
            rollback();
            return false;
        }
        finally {
            close();
        }
    }
    
    public boolean clearCart(final long cartId) {
        try {
            final Cart cart = this.getCartFromId(cartId);
            cart.getItemsCart().clear();
            System.out.println(cart.getItemsCart().size());
            final Session session = getSession();
            final Transaction t = session.beginTransaction();
            session.update(cart);
            t.commit();
            return true;
        }
        catch (HibernateException e) {
            e.printStackTrace();
            rollback();
            return false;
        }
        finally {
            close();
        }
    }
    
    public boolean removeItemFromCart(final long cartId, final long itemId) {
        try {
            final Cart cart = this.getCartFromId(cartId);
            cart.getItemsCart().removeIf(i -> i.getItemId() == itemId);
            final Session session = getSession();
            final Transaction t = session.beginTransaction();
            session.update(cart);
            t.commit();
            return true;
        }
        catch (HibernateException e) {
            e.printStackTrace();
            System.out.println(e);
            rollback();
            return false;
        }
        finally {
            close();
        }
    }

}
