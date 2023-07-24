package com.webtools.FinalProject.daos;

import java.util.List;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import org.springframework.transaction.annotation.Transactional;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;
import com.webtools.FinalProject.pojos.Orders;
import com.webtools.FinalProject.pojos.Customer;
import com.webtools.FinalProject.pojos.Item;

@Component
public class OrdersDao extends Dao{
	@Transactional
	
	public List<Orders> getAllCustomerOrders(final Customer customer) {
        final List<Orders> customerOrders = new ArrayList<Orders>();
        try {
            final Session session = Dao.getSession();
            final Transaction t = session.beginTransaction();
            final Criteria criteria = session.createCriteria((Class)Orders.class);
            final List<Orders> orderList = (List<Orders>)criteria.list();
            for (final Orders o : orderList) {
                if (o.getCustomer().getCustomerId() == customer.getCustomerId()) {
                	customerOrders.add(o);
                }
            }
            t.commit();
            return customerOrders;
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
    
    public Orders getOrderFromId(final long orderId) {
        final Criteria criteria = Dao.getSession().createCriteria(Orders.class);
        criteria.add((Criterion)Restrictions.eq("orderId", orderId));
        return (Orders)criteria.uniqueResult();
    }
    
    public boolean createNewOrder(final List<Item> itemsList, final Customer customer) {
        try {
            if (itemsList.size() > 0) {
                final Orders newCustomerOrder = new Orders();
                newCustomerOrder.setItemsOrder((List)itemsList);
                newCustomerOrder.setCustomer(customer);
                newCustomerOrder.setOrderStatus("Confirmed");
                final LocalDateTime myDateObject = LocalDateTime.now();
                final DateTimeFormatter myFormatObject = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
                final String dateFormatted = myDateObject.format(myFormatObject);
                newCustomerOrder.setOrderDate(dateFormatted);
                double orderTotal = 0.00;
                for (final Item i : itemsList) {
                    orderTotal += i.getItemPrice();
                }
                newCustomerOrder.setOrderTotal(orderTotal);
                final Session session = Dao.getSession();
                final Transaction t = session.beginTransaction();
                session.save(newCustomerOrder);
                t.commit();
                return true;
            }
            return false;
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
