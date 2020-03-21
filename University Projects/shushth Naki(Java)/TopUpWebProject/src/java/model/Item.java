/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.persistence.*;

/**
 *
 * @author Kaif Ul Majed
 */
@Entity
@Table(name="ITEMS")
public class Item {
    @Id @GeneratedValue
    private int item_id;
    @ManyToOne
    @JoinColumn(name="order_id", nullable=false)
    private Order order;
    private int med_id;
    private int quantity;

    public Item() {
    }

    public Item(Order order, int med_id, int quantity) {
        this.order = order;
        this.med_id = med_id;
        this.quantity = quantity;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
    


    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public int getMed_id() {
        return med_id;
    }

    public void setMed_id(int med_id) {
        this.med_id = med_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public boolean equals(Item obj) {
      if (obj == null) return false;
      if (!this.getClass().equals(obj.getClass())) return false;

      Item obj2 = (Item)obj;
      if((this.item_id == obj2.getItem_id()) && (this.getOrder() == obj2.getOrder())) {
         return true;
      }
      return false;
   }
   
   public int hashCode() {
      int tmp = 0;
      tmp = ( item_id + order.getOrder_id() + med_id * quantity + "medicine").hashCode();
      return tmp;
   }
    
}
