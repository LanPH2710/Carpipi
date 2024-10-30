/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Sonvu
 */
public class OrderStatus {
//statusId int PK 
//statusName varchar(50) 
//description varchar(255)
    
    private int statusId;
    private String statusName;
    private String description;

    public OrderStatus(int statusId, String statusName, String description) {
        this.statusId = statusId;
        this.statusName = statusName;
        this.description = description;
    }

    public OrderStatus() {
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    
    
    
}