package model;

public class OrderDetail1 {

    private int orderDetailId;
    private int orderId;
    private String productId;
    private int quantity;
    private int discountId;
    private int colorId;
    private int isfeedback;

    private String productName;
    private String description;
    private String createDate;
    private String brandName;
    private String colorName;
    private double price;
    private double discount;
    private String imageUrl;

    public OrderDetail1() {
    }

    public OrderDetail1(int orderDetailId, int orderId, String productId, int quantity, int discountId, int colorId, int isfeedback) {
        this.orderDetailId = orderDetailId;
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.discountId = discountId;
        this.colorId = colorId;
        this.isfeedback = isfeedback;
    }

    public OrderDetail1(int orderDetailId, int orderId, String productId, int quantity, int discountId, int colorId, int isfeedback, String productName, String description, String createDate, String brandName, String colorName, double price, double discount, String imageUrl) {
        this.orderDetailId = orderDetailId;
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.discountId = discountId;
        this.colorId = colorId;
        this.isfeedback = isfeedback;
        this.productName = productName;
        this.description = description;
        this.createDate = createDate;
        this.brandName = brandName;
        this.colorName = colorName;
        this.price = price;
        this.discount = discount;
        this.imageUrl = imageUrl;
    }

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }
    
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
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

    public int getIsfeedback() {
        return isfeedback;
    }

    public void setIsfeedback(int isfeedback) {
        this.isfeedback = isfeedback;
    }

}
