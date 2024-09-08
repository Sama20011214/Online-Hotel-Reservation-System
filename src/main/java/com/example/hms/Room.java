package com.example.hms;


public class Room {

    private int room_id;
    private String type;
    private String description;
    private double price;
    private boolean isAvailable;

    // Constructors
    public Room() {
    }

    public Room(int id, String type, String description, double price, boolean isAvailable) {
        this.room_id = id;
        this.type = type;
        this.description = description;
        this.price = price;
        this.isAvailable = isAvailable;
    }

    // Getters and setters
    public int getId() {
        return room_id;
    }

    public void setId(int id) {
        this.room_id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean isAvailable) {
        this.isAvailable = isAvailable;
    }

    @Override
    public String toString() {
        return "Room [id=" + room_id + ", type=" + type + ", description=" + description + ", price=" + price + ", isAvailable=" + isAvailable + "]";
    }
}