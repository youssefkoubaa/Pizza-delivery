package dao;

import model.Pizza;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import util.HibernateUtil;
import java.util.List;

public class PizzaDao {
    private final SessionFactory sessionFactory;

    public PizzaDao() {
        this.sessionFactory = HibernateUtil.getSessionFactory();
    }

    private void executeInsideTransaction(SessionConsumer action) {
        Transaction tx = null;
        try (Session session = sessionFactory.openSession()) {
            tx = session.beginTransaction();
            action.accept(session);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw e;
        }
    }

    public void create(Pizza pizza) {
        executeInsideTransaction(session -> session.persist(pizza));
    }

    public Pizza getPizza(int id) {
        try (Session session = sessionFactory.openSession()) {
            Query<Pizza> query = session.createQuery("FROM Pizza WHERE id = :id", Pizza.class);
            query.setParameter("id", id);
            return query.uniqueResult();
        }
    }

    public List<Pizza> getAllPizzas() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM Pizza", Pizza.class).getResultList();
        }
    }

    public Pizza getPizzaById(int id) {
        try (Session session = sessionFactory.openSession()) {
            Query<Pizza> query = session.createQuery("FROM Pizza WHERE id = :id", Pizza.class);
            query.setParameter("id", id);
            return query.uniqueResult();
        }
    }

    @FunctionalInterface
    private interface SessionConsumer {
        void accept(Session session);
    }
}
