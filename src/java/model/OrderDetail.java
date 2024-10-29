/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Sonvu
 */
public class OrderDetail extends Order {
//orderId int 
//productId varchar(6) 
//shippingAddress varchar(200) 
//quantity int 
//discountId int

    private int orderId;
    private String shippingAddress;
    private int quantity;
    private int discountId;
    
    private String productId;

    public OrderDetail(int orderId, int userId, double totalPrice, String note, int saleId, int shipperId, String createDate, int orderStatus, String firstName, String lastName, int gender, String email, String mobile, String address) {
        super(orderId, userId, totalPrice, note, saleId, shipperId, createDate, orderStatus, firstName, lastName, gender, email, mobile, address);
    }

    public OrderDetail() {
    }

    public OrderDetail(int orderId, String shippingAddress, int quantity, int discountId, String productId) {
        this.orderId = orderId;
        this.shippingAddress = shippingAddress;
        this.quantity = quantity;
        this.discountId = discountId;
        this.productId = productId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getDiscountId() {
        return discountId;
    }

    public void setDiscountId(int discountId) {
        this.discountId = discountId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

}
