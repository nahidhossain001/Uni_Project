/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author Kaif Ul Majed
 */
@Entity
@Table(name="ORDERS")
public class Order {
    @Id @GeneratedValue
    private int order_id;
    private int customer_id;
    private String name;
    private String address;
    private String phone;
    @OneToMany(mappedBy = "order", fetch = FetchType.EAGER)
    private List<Item> items;
    private double price;
    private java.sql.Date date;

    public Order() {
    }

    public Order(int customer_id, String name, String address, String phone, List<Item> items, double price, Date date) {
        this.customer_id = customer_id;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.items = items;
        this.price = price;
        this.date = date;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }



    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
}
