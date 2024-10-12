/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Blog;
import model.ImageBlog;

/**
 *
 * @author tuana
 */
public class BlogDAO extends DBContext {

    public List<Blog> getAllBlog() {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * FROM Blog";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int blogId = rs.getInt("blogId");
                int userId = rs.getInt("userId");
                String blogTitle = rs.getString("blogTitle");
                String blogTime = rs.getString("blogTime");
                String openBlog = rs.getString("openBlog");
                String bodyMain1 = rs.getString("bodyMain1");
                String bodySp1 = rs.getString("bodySp1");
                String bodyMain2 = rs.getString("bodyMain2");
                String bodySp2 = rs.getString("bodySp2");
                String bodyMain3 = rs.getString("bodyMain3");
                String bodySp3 = rs.getString("bodySp3");
                String endBlog = rs.getString("endBlog");
                int status = rs.getInt("status");
                List<ImageBlog> images = getImagesByProductId(blogId);

                Blog blog = new Blog(blogId, userId, blogTitle, blogTime, openBlog, bodyMain1, bodySp1, bodyMain2, bodySp2, bodyMain3, bodySp3, endBlog, status, images);
                list.add(blog);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Blog getBlogById(int blogId) {
        String sql = "SELECT * FROM Blog WHERE blogId=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, blogId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("userId");
                String blogTitle = rs.getString("blogTitle");
                String blogTime = rs.getString("blogTime");
                String openBlog = rs.getString("openBlog");
                String bodyMain1 = rs.getString("bodyMain1");
                String bodySp1 = rs.getString("bodySp1");
                String bodyMain2 = rs.getString("bodyMain2");
                String bodySp2 = rs.getString("bodySp2");
                String bodyMain3 = rs.getString("bodyMain3");
                String bodySp3 = rs.getString("bodySp3");
                String endBlog = rs.getString("endBlog");
                int status = rs.getInt("status");
                List<ImageBlog> images = getImagesByProductId(blogId);
                return new Blog(blogId, userId, blogTitle, blogTime, openBlog, bodyMain1, bodySp1, bodyMain2, bodySp2, bodyMain3, bodySp3, endBlog, status, images);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<ImageBlog> getImagesByProductId(int blogId) {
        List<ImageBlog> images = new ArrayList<>();
        String query = "SELECT * FROM imageblog WHERE blogId = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, blogId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                ImageBlog image = new ImageBlog();
                image.setImageBlogId(resultSet.getInt("imageBlogId"));
                image.setImageUrl(resultSet.getString("imageUrl"));
                image.setImageText(resultSet.getString("imageText"));
                images.add(image);
            }
        } catch (Exception e) {
        }
        return images;
    }

    public String getUserFullNameById(int userId) {
        String sql = "SELECT a.firstName, a.lastName FROM account a "
                + "JOIN blog b ON a.userId = b.userId "
                + "WHERE b.userId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                return firstName + " " + lastName; // Trả về full name
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Blog> getTop5NewBlog() {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * FROM Blog ORDER BY blogTime DESC LIMIT 5;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int blogId = rs.getInt("blogId");
                int userId = rs.getInt("userId");
                String blogTitle = rs.getString("blogTitle");
                String blogTime = rs.getString("blogTime");
                String openBlog = rs.getString("openBlog");
                String bodyMain1 = rs.getString("bodyMain1");
                String bodySp1 = rs.getString("bodySp1");
                String bodyMain2 = rs.getString("bodyMain2");
                String bodySp2 = rs.getString("bodySp2");
                String bodyMain3 = rs.getString("bodyMain3");
                String bodySp3 = rs.getString("bodySp3");
                String endBlog = rs.getString("endBlog");
                int status = rs.getInt("status");
                List<ImageBlog> images = getImagesByProductId(blogId);

                Blog blog = new Blog(blogId, userId, blogTitle, blogTime, openBlog, bodyMain1, bodySp1, bodyMain2, bodySp2, bodyMain3, bodySp3, endBlog, status, images);
                list.add(blog);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
