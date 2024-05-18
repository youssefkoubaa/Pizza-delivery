package dao;

import java.util.List;




import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import model.User;

import model.Cart;
import util.HibernateUtil;


public class CartDAO {
	private SessionFactory sessionFactory;

	public CartDAO() {
		sessionFactory = HibernateUtil.getSessionFactory();
	}

	public void create(Cart u) {
		
    	Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.persist(u);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw e;
        } finally {
            session.close();
        }
    
    }

	public Cart findById(int id) {
		Session session = sessionFactory.openSession();
		try {
			Query<Cart> query = session.createQuery("FROM cart WHERE id = :id", Cart.class);
			query.setParameter("id", id);
			return query.uniqueResult();
		} finally {
			session.close();
		}
	}

	public List<Cart> findAll() {
		Session session = sessionFactory.openSession();
		try {
			return session.createQuery("from cart", Cart.class).getResultList();
		} finally {
			session.close();
		}
	}
	  public List<Cart> findCartsByUsername(User user) {
	        try (Session session = sessionFactory.openSession()) {
	            Query<Cart> query = session.createQuery("SELECT c FROM Cart c WHERE c.user = :user", Cart.class);
	            query.setParameter("user", user);
	            return query.getResultList();
	        }
	    }
}