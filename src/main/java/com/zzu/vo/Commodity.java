package com.zzu.vo;

public class Commodity {

    private String id;
    private String name;
    private double price;
    private String number;
    private String description;

    public Commodity() {
    }

    public Commodity(String id, String name, double price, String number, String description) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.number = number;
        this.description = description;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
