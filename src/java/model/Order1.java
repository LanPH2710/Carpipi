/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tuana
 */
public class Order1 {
    private int orderId;
    private String orderDeliverCode;
    private int userId;
    private String orderName;
    private String orderEmai;
    private String orderPhone;
    private double totalPrice;
    private String note;
    private int saleId;
    private int shipperId;
    private String createDate;
    private int orderStatus;

    public Order1() {
    }

    public Order1(int orderId, String orderDeliverCode, int userId, String orderName, String orderEmai, String orderPhone, double totalPrice, String note, int saleId, int shipperId, String createDate, int orderStatus) {
        this.orderId = orderId;
        this.orderDeliverCode = orderDeliverCode;
        this.userId = userId;
        this.orderName = orderName;
        this.orderEmai = orderEmai;
        this.orderPhone = orderPhone;
        this.totalPrice = totalPrice;
        this.note = note;
        this.saleId = saleId;
        this.shipperId = shipperId;
        this.createDate = createDate;
        this.orderStatus = orderStatus;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getOrderDeliverCode() {
        return orderDeliverCode;
    }

    public void setOrderDeliverCode(String orderDeliverCode) {
        this.orderDeliverCode = orderDeliverCode;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getOrderName() {
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }

    public String getOrderEmai() {
        return orderEmai;
    }

    public void setOrderEmai(String orderEmai) {
        this.orderEmai = orderEmai;
    }

    public String getOrderPhone() {
        return orderPhone;
    }

    public void setOrderPhone(String orderPhone) {
        this.orderPhone = orderPhone;
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

    public int getSaleId() {
        return saleId;
    }

    public void setSaleId(int saleId) {
        this.saleId = saleId;
    }

    public int getShipperId() {
        return shipperId;
    }

    public void setShipperId(int shipperId) {
        this.shipperId = shipperId;
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
