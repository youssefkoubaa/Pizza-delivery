package dao;

import model.Order;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import util.HibernateUtil;

import java.util.List;

public class OrderDao {
    private SessionFactory sessionFactory;

    public OrderDao() {
        this.sessionFactory = HibernateUtil.getSessionFactory();
    }

    public void createOrder(Order order) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.persist(order);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public List<Order> getAllOrdersByUserId(int userId) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Order WHERE user.id = :userId ORDER BY id";
            Query<Order> query = session.createQuery(hql, Order.class);
            query.setParameter("userId", userId);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Order> getAllOrders() {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Order ORDER BY id";
            Query<Order> query = session.createQuery(hql, Order.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Order getOrderById(int orderId) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Order.class, orderId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void updateOrder(Order order) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.update(order);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public List<Order> getOrdersByStatus(String status) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Order WHERE status = :status ORDER BY id";
            Query<Order> query = session.createQuery(hql, Order.class);
            query.setParameter("status", status);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Order> getOrdersWithStatusPreparing() {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Order WHERE status = 'Preparing your Order' ORDER BY id";
            Query<Order> query = session.createQuery(hql, Order.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
