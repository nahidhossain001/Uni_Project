/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Item;
import model.Order;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Kaif Ul Majed
 */
public class ManageOrder {
    private static SessionFactory factory;
    public ManageOrder() {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Failed to create sessionFactory object." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }   
    public Integer addOrder(Order o){
        Integer i = null;
        Session session = factory.openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            i = (Integer)session.save(o);
            List <Item> items = o.getItems();
            for (Item it : items){
                session.save(it);
            }
            
            tx.commit();
        }catch(HibernateException he){
            if (tx!=null)tx.rollback();
            he.printStackTrace();
        }
        finally{
            session.close();
        }
        return i;
    }
    public List<Order> getOrders(int customer_id){
        List<Order> orders = null;
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            orders = session.createQuery("FROM Order O WHERE O.customer_id = :customer").setParameter("customer", customer_id).list();
            tx.commit();
        } catch (HibernateException he) {
            if (tx != null) {
                tx.rollback();
            }
            he.printStackTrace();
        } finally {
            session.close();
        }
        return orders;
    }
}
