/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tuana
 */
public class Feedback {
    private int feedbackId;
    private int userId;
    private String productId;
    private String feedbackInfo;
    private String feedbackTime;
    private int feedbackRate;
    private int status;

    public Feedback() {
    }

    public Feedback(int feedbackId, int userId, String productId, String feedbackInfo, String feedbackTime, int feedbackRate, int status) {
        this.feedbackId = feedbackId;
        this.userId = userId;
        this.productId = productId;
        this.feedbackInfo = feedbackInfo;
        this.feedbackTime = feedbackTime;
        this.feedbackRate = feedbackRate;
        this.status = status;
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getFeedbackInfo() {
        return feedbackInfo;
    }

    public void setFeedbackInfo(String feedbackInfo) {
        this.feedbackInfo = feedbackInfo;
    }

    public String getFeedbackTime() {
        return feedbackTime;
    }

    public void setFeedbackTime(String feedbackTime) {
        this.feedbackTime = feedbackTime;
    }

    public int getFeedbackRate() {
        return feedbackRate;
    }

    public void setFeedbackRate(int feedbackRate) {
        this.feedbackRate = feedbackRate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}
