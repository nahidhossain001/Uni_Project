/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author Kaif Ul Majed
 */
import model.User;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class ManageUsers {

    private static SessionFactory factory;

    public ManageUsers() {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Failed to create sessionFactory object." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
    public String addUser(User u){
        User tmp=getByUserName(u.getUsername());
        if(tmp!=null){
            return "Username already exists!";
        }
        String id = null;
        Session session = factory.openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            id = (String)u.getUsername();
            session.save(u);
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
    public User getUser(String id, String pass){
        User u = null;
        Session session = factory.openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            List users = session.createQuery("FROM User").list();
            for (Iterator it = users.iterator(); it.hasNext();){
                User user = (User) it.next();
                if (user.getUsername().equals(id) && user.getPassword().equals(pass)){
                    u = user;
                    break;
                }
            }
            tx.commit();
            
            
        }catch(HibernateException he){
            if (tx!=null) tx.rollback();
            he.printStackTrace();
        }
        finally{
            session.close();
        }
        return u;
             
    }
    public User getByUserName(String name){
        User u = null;
        Session session = factory.openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            List users = session.createQuery("FROM User").list();
            for (Iterator it = users.iterator(); it.hasNext();){
                User user = (User) it.next();
                if (user.getUsername().equals(name) ){
                    u = user;
                    break;
                }
            }
            tx.commit();
            
            
        }catch(HibernateException he){
            if (tx!=null) tx.rollback();
            he.printStackTrace();
        }
        finally{
            session.close();
        }
        return u;
             
    }
}
