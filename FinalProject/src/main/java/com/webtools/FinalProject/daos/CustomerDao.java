package com.webtools.FinalProject.daos;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;
import java.util.ArrayList;
import java.util.List;

import com.webtools.FinalProject.pojos.Customer;
import com.webtools.FinalProject.pojos.Cart;

@Component
public class CustomerDao extends Dao{
	
	 public Customer getCustomerFromEmail(final String customerEmail) {
	        final Session session = Dao.getSession();
	        final Criteria criteria = session.createCriteria(Customer.class);
	        criteria.add((Criterion)Restrictions.eq("customerEmail", customerEmail));
	        return (Customer)criteria.uniqueResult();
	    }
	    
	    public Customer getCustomerFromId(final long CustomerId) {
	        final Criteria criteria = Dao.getSession().createCriteria(Customer.class);
	        criteria.add((Criterion)Restrictions.eq("customerId", CustomerId));
	        return (Customer)criteria.uniqueResult();
	    }
	    
	    public List<Customer> getAllCustomers() {
	        List Customers = new ArrayList();
	        try {
	            final Session session = Dao.getSession();
	            final Transaction t = session.beginTransaction();
	            final Criteria criteria = session.createCriteria(Customer.class);
	            Customers = criteria.list();
	            t.commit();
	            return (List<Customer>)Customers;
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
	    
	    public boolean addNewCustomer(final String CustomerName, final String CustomerEmail, final String CustomerPassword, final long CustomerPhone, final String CustomerRegDate) {
	        try {
	            final Customer customer = new Customer();
	            customer.setCustomerName(CustomerName);
	            customer.setCustomerEmail(CustomerEmail);
	            customer.setCustomerPassword(CustomerPassword);
	            customer.setCustomerPhone(CustomerPhone);
	            customer.setCustomerRegDate(CustomerRegDate);
	            Cart cart = new Cart();
	            customer.setCart(cart);
	            
	            final Session session = Dao.getSession();
	            final Transaction t = session.beginTransaction();
	            session.save(customer);
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
	    
	    public boolean updateCustomerPassword(final String CustomerEmail, final String newPassword) {
	        try {
	            final Customer Customer = this.getCustomerFromEmail(CustomerEmail);
	            Customer.setCustomerPassword(newPassword);
	            final Session session = Dao.getSession();
	            final Transaction t = session.beginTransaction();
	            t.commit();
	            return true;
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            System.out.println(e);
	            rollback();
	            return false;
	        }
	    }
	    
	    public boolean deleteCustomer(final long CustomerId) {
	        try {
	            final Session session = Dao.getSession();
	            final Transaction t = session.beginTransaction();
	            final Criteria criteria = session.createCriteria(Customer.class);
	            criteria.add((Criterion)Restrictions.eq("customerId", CustomerId));
	            final Customer customer = (Customer)criteria.uniqueResult();
	            session.delete(customer);
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
