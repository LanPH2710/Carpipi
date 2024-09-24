/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tuana
 */
public class Product {
    private int productId;
    private String name;
    private float seatNumber;
    private int stock;
    private String description;
    private float vat;
    private int supplierId;
    private int brandId;
    private int segmentId;
    private int styleId;

    public Product() {
    }

    public Product(int productId, String name, float seatNumber, int stock, String description, float vat, int supplierId, int brandId, int segmentId, int styleId) {
        this.productId = productId;
        this.name = name;
        this.seatNumber = seatNumber;
        this.stock = stock;
        this.description = description;
        this.vat = vat;
        this.supplierId = supplierId;
        this.brandId = brandId;
        this.segmentId = segmentId;
        this.styleId = styleId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(float seatNumber) {
        this.seatNumber = seatNumber;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getVat() {
        return vat;
    }

    public void setVat(float vat) {
        this.vat = vat;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public int getSegmentId() {
        return segmentId;
    }

    public void setSegmentId(int segmentId) {
        this.segmentId = segmentId;
    }

    public int getStyleId() {
        return styleId;
    }

    public void setStyleId(int styleId) {
        this.styleId = styleId;
    }
    
    
}
