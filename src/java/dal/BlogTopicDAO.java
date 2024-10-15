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
import model.BlogTopic;

/**
 *
 * @author tuana
 */
public class BlogTopicDAO extends DBContext{
    public List<BlogTopic> getAllTopic() {
        List<BlogTopic> list = new ArrayList<>();
        String sql = "SELECT * FROM blogtopic";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int blogTopicId = rs.getInt("blogTopicId");
                String toppicName = rs.getString("toppicName");
                BlogTopic btlist = new BlogTopic(blogTopicId, toppicName);
                list.add(btlist);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public String getTopicById(int blogTopicId) {
    String topicName = null;
    String sql = "SELECT toppicName FROM blogtopic WHERE blogTopicId = ?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, blogTopicId);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            topicName = rs.getString("toppicName");
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return topicName;
}
}
