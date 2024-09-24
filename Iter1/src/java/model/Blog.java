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
    private int postId;
    private int brandId;
    private String blogInfo1;
    private String blogTitle;
    private String blogImage;
    private String blogInfo2;

    public Blog() {
    }

    public Blog(int blogId, int postId, int brandId, String blogInfo1, String blogTitle, String blogImage, String blogInfo2) {
        this.blogId = blogId;
        this.postId = postId;
        this.brandId = brandId;
        this.blogInfo1 = blogInfo1;
        this.blogTitle = blogTitle;
        this.blogImage = blogImage;
        this.blogInfo2 = blogInfo2;
    }

    public int getBlogId() {
        return blogId;
    }

    public void setBlogId(int blogId) {
        this.blogId = blogId;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public String getBlogInfo1() {
        return blogInfo1;
    }

    public void setBlogInfo1(String blogInfo1) {
        this.blogInfo1 = blogInfo1;
    }

    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle;
    }

    public String getBlogImage() {
        return blogImage;
    }

    public void setBlogImage(String blogImage) {
        this.blogImage = blogImage;
    }

    public String getBlogInfo2() {
        return blogInfo2;
    }

    public void setBlogInfo2(String blogInfo2) {
        this.blogInfo2 = blogInfo2;
    }
    
    
    
}
