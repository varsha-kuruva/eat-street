package com.webtools.FinalProject.daos;

import java.util.Map;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;
import com.webtools.FinalProject.pojos.Item;

@Component
public class ItemDao extends Dao
{
    public Map<Long, Item> getAllMenuItems() {
        final Map<Long, Item> itemsList = new HashMap<Long, Item>();
        try {
            final Session session = Dao.getSession();
            final Transaction t = session.beginTransaction();
            final Criteria criteria = session.createCriteria(Item.class);
            final List<Item> items = criteria.list();
            for (int j = 0; j < items.size(); j++) {
                Item item = items.get(j);
                itemsList.put(item.getItemId(), item);
            }
            t.commit();
            return itemsList;
        }
        catch (HibernateException e) {
            e.printStackTrace();
            System.out.println(e);
            rollback();
            return null;
        }
        finally {
            close();
        }
    }
    
    public Item getItemFromId(final long itemId) {
        final Criteria criteria = Dao.getSession().createCriteria((Class)Item.class);
        criteria.add((Criterion)Restrictions.eq("itemId", (Object)itemId));
        return (Item)criteria.uniqueResult();
    }
    
    public boolean updateMenuItem(final long itemId, final String itemMenuName, final String itemMenuDescription, final String itemMenuCategory, final double itemMenuPrice) {
        try {
            final Item item = this.getItemFromId(itemId);
            item.setItemName(itemMenuName);
            item.setItemDescription(itemMenuDescription);
            item.setItemPrice(itemMenuPrice);
            item.setItemCategory(itemMenuCategory);
            final Session session = Dao.getSession();
            final Transaction t = session.beginTransaction();
            session.update((Object)item);
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
    
    public boolean addMenuItem(final String itemMenuName, final String itemMenuDescription, final String itemMenuCategory, final double itemMenuPrice) {
        try {
            final Item newMenuItem = new Item();
            newMenuItem.setItemName(itemMenuName);
            newMenuItem.setItemDescription(itemMenuDescription);
            newMenuItem.setItemPrice(itemMenuPrice);
            newMenuItem.setItemCategory(itemMenuCategory);
            final Session session = Dao.getSession();
            final Transaction t = session.beginTransaction();
            session.save((Object)newMenuItem);
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
    
    public boolean deleteMenuItem(final long itemMenuId) {
        try {
            final Session session = Dao.getSession();
            final Transaction t = session.beginTransaction();
            final Criteria criteria = session.createCriteria((Class)Item.class);
            criteria.add((Criterion)Restrictions.eq("itemId", (Object)itemMenuId));
            final Item itemDelete = (Item)criteria.uniqueResult();
            session.delete((Object)itemDelete);
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