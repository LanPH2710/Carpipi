/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Sonvu
 */
public class Supply {
    private String supplyId;
    private String supplyName;
    private String supplyLocation;

    public Supply(String supplyId, String supplyName, String supplyLocation) {
        this.supplyId = supplyId;
        this.supplyName = supplyName;
        this.supplyLocation = supplyLocation;
    }

    public Supply() {
    }

    public String getSupplyId() {
        return supplyId;
    }

    public void setSupplyId(String supplyId) {
        this.supplyId = supplyId;
    }

    public String getSupplyName() {
        return supplyName;
    }

    public void setSupplyName(String supplyName) {
        this.supplyName = supplyName;
    }

    public String getSupplyLocation() {
        return supplyLocation;
    }

    public void setSupplyLocation(String supplyLocation) {
        this.supplyLocation = supplyLocation;
    }
    
    
}
