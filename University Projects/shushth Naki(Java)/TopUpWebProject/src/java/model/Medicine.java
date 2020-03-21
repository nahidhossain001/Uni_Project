/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Kaif Ul Majed
 */
import javax.persistence.*;

@Entity
@Table(name = "MEDICINE")
public class Medicine {
    @Id @GeneratedValue
    private int id;
    private String name;
    private String generic_name;
    private String type;
    private String manufacturer;
    private double price;
    private byte[] image;
    private int quantity;

    public Medicine() {
    }

    public Medicine(String name, String generic_name, String type, String manufacturer, double price, byte[] image, int quantity) {
        this.name = name;
        this.generic_name = generic_name;
        this.type = type;
        this.manufacturer = manufacturer;
        this.price = price;
        this.image = image;
        this.quantity = quantity;
    }

    public Medicine(String name, String generic_name, String type, String manufacturer, double price, int quantity) {
        this.name = name;
        this.generic_name = generic_name;
        this.type = type;
        this.manufacturer = manufacturer;
        this.price = price;
        this.quantity = quantity;
    }


    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGeneric_name() {
        return generic_name;
    }

    public void setGeneric_name(String generic_name) {
        this.generic_name = generic_name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
