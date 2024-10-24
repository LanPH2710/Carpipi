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
//    orderDetailId int AI PK 
//orderId int 
//productId varchar(6) 
//shippingaddress 
//shipperId int

    private int userId;
    private String firstName;
    private String lastName;
    private int gender;
    private String email;
    private String mobile;
    private String address;
    private int orderDetailId;
    private String productId;
    private String shippingAddress;
    private int shipperId;

    public OrderDetail(int orderId, int userId, double totalPrice, String note, String dateTime, int orderStatus) {
        super(orderId, userId, totalPrice, note, dateTime, orderStatus);
    }

    public OrderDetail() {
    }

    public OrderDetail(int userId, String firstName, String lastName, int gender, String email, String mobile, String address, int orderDetailId, String productId, String shippingAddress, int shipperId) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.email = email;
        this.mobile = mobile;
        this.address = address;
        this.orderDetailId = orderDetailId;
        this.productId = productId;
        this.shippingAddress = shippingAddress;
        this.shipperId = shipperId;
    }

    
    public OrderDetail(int userId, String firstName, String lastName, int gender, String email, String mobile, String address) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.email = email;
        this.mobile = mobile;
        this.address = address;
    }
    
    
    
    public OrderDetail(int orderDetailId, String productId, String shippingAddress, int shipperId) {
        this.orderDetailId = orderDetailId;
        this.productId = productId;
        this.shippingAddress = shippingAddress;
        this.shipperId = shipperId;
    }

    @Override
    public int getUserId() {
        return userId;
    }

    @Override
    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public int getShipperId() {
        return shipperId;
    }

    public void setShipperId(int shipperId) {
        this.shipperId = shipperId;
    }

}
