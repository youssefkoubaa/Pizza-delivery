package dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import model.User;
import util.HibernateUtil;

public class UserDao {

    private SessionFactory sessionFactory;

    public UserDao() {
        sessionFactory = HibernateUtil.getSessionFactory();
    }

    public void createUser(User user) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.persist(user);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw e;
        } finally {
            session.close();
        }
    }

    public User findByEmail(String email) {
        Session session = sessionFactory.openSession();
        try {
            Query<User> query = session.createQuery("FROM User WHERE email = :email", User.class);
            query.setParameter("email", email);
            return query.uniqueResult();
        } finally {
            session.close();
        }
    }

    public List<User> findAllUsers() {
        Session session = sessionFactory.openSession();
        try {
            return session.createQuery("FROM User", User.class).getResultList();
        } finally {
            session.close();
        }
    }

    public void updateUser(User user) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.merge(user);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw e;
        } finally {
            session.close();
        }
    }
}
