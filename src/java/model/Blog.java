/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tuana
 */
public class Blog {
    private int blogId;
    private int brandId;
    private int postId;
    private String blogTitle;
    private String blogTime;
    private String blogImage;
    private String blogImageText;
    private String blogInfo1;
    private String blogInfo2;

    public Blog() {
    }

    public Blog(int blogId, int brandId, int postId, String blogTitle, String blogTime, String blogImage, String blogImageText, String blogInfo1, String blogInfo2) {
        this.blogId = blogId;
        this.brandId = brandId;
        this.postId = postId;
        this.blogTitle = blogTitle;
        this.blogTime = blogTime;
        this.blogImage = blogImage;
        this.blogImageText = blogImageText;
        this.blogInfo1 = blogInfo1;
        this.blogInfo2 = blogInfo2;
    }

    public int getBlogId() {
        return blogId;
    }

    public void setBlogId(int blogId) {
        this.blogId = blogId;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle;
    }

    public String getBlogTime() {
        return blogTime;
    }

    public void setBlogTime(String blogTime) {
        this.blogTime = blogTime;
    }

    public String getBlogImage() {
        return blogImage;
    }

    public void setBlogImage(String blogImage) {
        this.blogImage = blogImage;
    }

    public String getBlogImageText() {
        return blogImageText;
    }

    public void setBlogImageText(String blogImageText) {
        this.blogImageText = blogImageText;
    }

    public String getBlogInfo1() {
        return blogInfo1;
    }

    public void setBlogInfo1(String blogInfo1) {
        this.blogInfo1 = blogInfo1;
    }

    public String getBlogInfo2() {
        return blogInfo2;
    }

    public void setBlogInfo2(String blogInfo2) {
        this.blogInfo2 = blogInfo2;
    }
    
}
