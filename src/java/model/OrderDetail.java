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
//quantity int 
//shippingAddress varchar(200) 
//discountId int 
//colorId int
    
    
    private String productId;
    private int quantity;
    private String shippingAddress;
    private int discountId;
    private int colorId;
    
    private String productName;
    private String description;
    private String createDate;
    private String brandName;
    private String colorName;
    private double price;
    private double discount;
    private String imageUrl;

    public OrderDetail(int orderId, int userId, double totalPrice, String note, int saleId, int shipperId, String createDate, int orderStatus, String firstName, String lastName, int gender, String email, String mobile, String address) {
        super(orderId, userId, totalPrice, note, saleId, shipperId, createDate, orderStatus, firstName, lastName, gender, email, mobile, address);
    }

    public OrderDetail() {
    }

    public OrderDetail(String productId, int quantity, String shippingAddress, int discountId, int colorId) {
        this.productId = productId;
        this.quantity = quantity;
        this.shippingAddress = shippingAddress;
        this.discountId = discountId;
        this.colorId = colorId;
    }

    public OrderDetail(int quantity, String shippingAddress, String productName, String description, String createDate, String brandName, String colorName, double price, double discount, String imageUrl) {
        this.quantity = quantity;
        this.shippingAddress = shippingAddress;
        this.productName = productName;
        this.description = description;
        this.createDate = createDate;
        this.brandName = brandName;
        this.colorName = colorName;
        this.price = price;
        this.discount = discount;
        this.imageUrl = imageUrl;
    }
    
    

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public int getDiscountId() {
        return discountId;
    }

    public void setDiscountId(int discountId) {
        this.discountId = discountId;
    }

    public int getColorId() {
        return colorId;
    }

    public void setColorId(int colorId) {
        this.colorId = colorId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getColorName() {
        return colorName;
    }

    public void setColorName(String colorName) {
        this.colorName = colorName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    
    
    
}
