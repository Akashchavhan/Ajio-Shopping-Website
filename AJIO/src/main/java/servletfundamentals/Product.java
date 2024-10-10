package servletfundamentals;

import java.io.Serializable;

public class Product implements Serializable {
    private String id;
    private String name;
    private String category;
    private double price;
    private int quantity;

    public Product(String id, String name, String category, double price) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
        this.quantity = 1; 
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getCategory() {
        return category;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void increaseQuantity() {
        this.quantity++;
    }
}
