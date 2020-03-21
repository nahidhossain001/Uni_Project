/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.Iterator;
import java.util.List;
import model.Cart;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Kaif Ul Majed
 */
public class ManageCart {
 private static SessionFactory factory;

    public ManageCart() {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Failed to create sessionFactory object." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
    public Integer addtoCart(Cart c){
        Integer id = null;
        Session session = factory.openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            id = (Integer)session.save(c);
            tx.commit();
        }catch(HibernateException he){
            if (tx!=null) tx.rollback();
            he.printStackTrace();
        }
        finally{
            session.close();
        }
        return id;        
    }
    public List<Cart> viewCart(int customer_id){
        List <Cart> cart = null;
        Session session = factory.openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            cart = session.createQuery("FROM Cart C where C.customer_id = :customer_id").setParameter("customer_id", customer_id).list();
            tx.commit();
        }catch(HibernateException he){
            if (tx!=null) tx.rollback();
            he.printStackTrace();
        }
        finally{
            session.close();
        }        
        return cart;
    }
    public void deleteCart(int customer_id){
        Session session = factory.openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            List<Cart> cart = session.createQuery("FROM Cart C where C.customer_id=:cid").setParameter("cid",customer_id).list();
            Iterator it = cart.iterator();
            while (it.hasNext()){
                Cart c = (Cart) it.next();
                //c = (Cart)session.get(Cart.class, c.getCart_id());
                session.delete(c);
            }
            tx.commit();
        }catch(HibernateException he){
            if (tx!=null) tx.rollback();
            he.printStackTrace();
        }
        finally{
            session.close();
        }        
    }
}
