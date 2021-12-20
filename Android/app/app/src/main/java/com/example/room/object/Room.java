package com.example.room.object;

import java.util.Arrays;
import java.util.List;

public class Room {

    /*private int id;
    private String name;
    //private String description;
    //private double price;

    public Room(int id, String name) {//, String description, double price) {
        this.id = id;
        this.name = name;
        //this.description = description;
        //this.price = price;
    }

    public Room() {

    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    /*public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }*/

    /*public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }*/

    /*public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(double price) {
        this.price = price;
    }*/

    public int id;
    public String name;

    @Override
    public String toString() {
        return this.name;
    }

    /*public List<Room> all() {
        List<Room> rooms = Arrays.asList();
        rooms.set(0, new Room())

        rooms.set(0, new Room());
        rooms[0].setId(1);
        rooms[0].setName("TEST1");

        return rooms
    }*/
}
