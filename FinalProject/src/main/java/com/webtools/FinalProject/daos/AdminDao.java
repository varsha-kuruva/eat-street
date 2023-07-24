package com.webtools.FinalProject.daos;

import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import com.webtools.FinalProject.pojos.Admin;

@Component
public class AdminDao extends Dao {
	
	public Admin getAdminFromEmail(final String adminEmail) {
        final Session session = getSession();
        final Criteria criteria = session.createCriteria(Admin.class);
        criteria.add((Criterion)Restrictions.eq("adminEmail", adminEmail));
        return (Admin)criteria.uniqueResult();
    }
    
    public boolean updateAdminPassword(final String adminEmail, final String updatedPassword) {
        try {
            final Admin admin = this.getAdminFromEmail(adminEmail);
            admin.setAdminPassword(updatedPassword);
            final Session session = getSession();
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

}
