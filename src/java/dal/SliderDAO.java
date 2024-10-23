/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import model.Slider;
import java.sql.SQLException;
import java.sql.ResultSet;

/**
 *
 * @author ADMIN
 */
public class SliderDAO extends DBContext{


    public List<Slider> getFilteredSliders(String search, int status, int offset, int limit) {
    List<Slider> sliders = new ArrayList<>();
    StringBuilder sql = new StringBuilder("SELECT * FROM slider");
    
    boolean hasCondition = false;

    if (status != -1) {
        sql.append(" WHERE status = ?");
        hasCondition = true; // Đánh dấu có điều kiện
    }

    // Thêm điều kiện tìm kiếm nếu có
    if (search != null && !search.isEmpty()) {
        if (hasCondition) {
            sql.append(" AND (title LIKE ? OR backlink LIKE ?)");
        } else {
            sql.append(" WHERE (title LIKE ? OR backlink LIKE ?)");
        }
    }

    sql.append(" LIMIT ? OFFSET ?"); // Thêm LIMIT và OFFSET

    try (PreparedStatement stm = connection.prepareStatement(sql.toString())) {
        int index = 1;

        // Nếu có điều kiện status, thiết lập tham số
        if (hasCondition) {
            stm.setInt(index++, status);
        }

        // Thiết lập tham số tìm kiếm
        if (search != null && !search.isEmpty()) {
            String searchParam = "%" + search + "%";
            stm.setString(index++, searchParam);
            stm.setString(index++, searchParam);
        }

        // Thiết lập LIMIT và OFFSET
        stm.setInt(index++, limit);
        stm.setInt(index, offset);

        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            Slider slider = new Slider();
            slider.setSliderId(rs.getInt("sliderId"));
            slider.setProductId(rs.getString("productId"));
            slider.setTitle(rs.getString("title"));
            slider.setDescription(rs.getString("description"));
            slider.setImageUrl(rs.getString("imageUrl"));
            slider.setBacklink(rs.getString("backlink"));
            slider.setStatus(rs.getInt("status"));
            sliders.add(slider);
        }
    } catch (SQLException e) {
        e.printStackTrace(); // In ra lỗi để kiểm tra
    }

    return sliders;
}




    // Phương thức cập nhật trạng thái slider
    public void updateSliderStatus(int sliderId, int status) {
        String sql = "UPDATE slider SET status = ? WHERE sliderId = ?";
        try (
             PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, status);
            stm.setInt(2, sliderId);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
