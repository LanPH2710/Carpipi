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
import model.Account;
import model.Feedback;

/**
 *
 * @author tuana
 */
public class FeedbackDAO extends DBContext {

    public List<Feedback> getAllFeedback() {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT * FROM feedback";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int feedbackId = rs.getInt("feedbackId");
                int userId = rs.getInt("userId");
                String productId = rs.getString("productId");
                String feedbackInfo = rs.getString("feedbackInfo");
                String feedbackImg = rs.getString("feedbackImg");
                String feedbackTime = rs.getString("feedbackTime");
                int feedbackRate = rs.getInt("feedbackRate");
                int status = rs.getInt("status");

                if (feedbackImg == null) {
                    feedbackImg = "";
                }

                Feedback feedback = new Feedback(feedbackId, userId, productId, feedbackInfo, feedbackTime, feedbackImg, feedbackRate, status);
                list.add(feedback);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback> getFeedbackByProductId(String productID) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT * FROM feedback WHERE status =1 and productId LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            // Gán giá trị cho tham số productID
            st.setString(1, "%" + productID + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int feedbackId = rs.getInt("feedbackId");
                int userId = rs.getInt("userId");
                String productId = rs.getString("productId");
                String feedbackInfo = rs.getString("feedbackInfo");
                String feedbackTime = rs.getString("feedbackTime");
                String feedbackImg = rs.getString("feedbackImg");
                int feedbackRate = rs.getInt("feedbackRate");
                int status = rs.getInt("status");

                if (feedbackImg == null) {
                    feedbackImg = "";
                }
                Feedback feedback = new Feedback(feedbackId, userId, productId, feedbackInfo, feedbackTime, feedbackImg, feedbackRate, status);
                list.add(feedback);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Account> getUserNameByProductId(String productId) {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT a.* FROM feedback f JOIN account a ON f.userId = a.userId WHERE f.productId like ?;";  // Sử dụng tham số

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, productId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Account p = new Account(
                            rs.getInt("userId"),
                            rs.getString("userName"),
                            rs.getString("password"),
                            rs.getString("firstName"),
                            rs.getString("lastName"),
                            rs.getInt("gender"),
                            rs.getString("email"),
                            rs.getString("mobile"),
                            rs.getString("address"),
                            rs.getInt("roleId"),
                            rs.getString("avatar")
                    );
                    list.add(p);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback> getFeedbackByRate(String productID, int rate) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT * FROM feedback WHERE status =1 and productId LIKE ? AND feedbackRate = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, productID);
            st.setInt(2, rate);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int feedbackId = rs.getInt("feedbackId");
                int userId = rs.getInt("userId");
                String productId = rs.getString("productId");
                String feedbackInfo = rs.getString("feedbackInfo");
                String feedbackTime = rs.getString("feedbackTime");
                String feedbackImg = rs.getString("feedbackImg");
                int feedbackRate = rs.getInt("feedbackRate");
                int status = rs.getInt("status");
                
                 if(feedbackImg == null){
                    feedbackImg = "";
                }

                Feedback feedback = new Feedback(feedbackId, userId, productId, feedbackInfo, feedbackTime, feedbackImg, feedbackRate, status);
                list.add(feedback);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getRateProduct(String productId) {
        int rate = 0;
        String sql = "SELECT CEIL(AVG(feedbackRate)) AS avgRate "
                + "FROM feedback "
                + "WHERE productId = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next() && rs.getObject("avgRate") != null) {  // Kiểm tra nếu có giá trị trả về
                    rate = rs.getInt("avgRate");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rate;
    }

    public List<Feedback> getFeedbackListByPage(List<Feedback> feedbacks, int start, int end) {
        ArrayList<Feedback> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(feedbacks.get(i));
        }
        return arr;
    }

    public static void main(String[] args) {
        FeedbackDAO f = new FeedbackDAO();

        System.out.println(f.getAllFeedback());
    }
}
