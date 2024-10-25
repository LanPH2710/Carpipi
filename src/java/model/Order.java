/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Sonvu
 */
public class Order {
//orderId int AI PK 
//userId int 
//totalPrice decimal(15,2) 
//note varchar(255) 
//saleId int 
//createDate datetime 
//orderStatus int
//        
    
    private int orderId;
    private int userId;
    private double totalPrice;
    private String note;
    private String createDate;
    private int orderStatus;

    public Order(int orderId, int userId, double totalPrice, String note, String createDate, int orderStatus) {
        this.orderId = orderId;
        this.userId = userId;
        this.totalPrice = totalPrice;
        this.note = note;
        this.createDate = createDate;
        this.orderStatus = orderStatus;
    }

    public Order() {
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    
    
    
        
}
