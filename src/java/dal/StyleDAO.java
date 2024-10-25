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
import model.Style;

/**
 *
 * @author Sonvu
 */
public class StyleDAO extends DBContext {

    public int getStyleIdByName(String name) {
        String sql = "SELECT styleId FROM carpipi.style where styleName = ?";

        String styleId = null; // Biến để lưu kết quả trả về

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, name);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                styleId = rs.getString("styleId");
            }

        } catch (SQLException e) {
        }
        
        int sId = Integer.parseInt(styleId);

        return sId;
    }

    public List<Style> getAllStyleCar() {

        List<Style> listStyle = new ArrayList<>();

        String sql = "SELECT * FROM carpipi.style where status = 1";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Style style = new Style();

                style.setStyleId(rs.getString("styleId"));
                style.setStyleName(rs.getString("styleName"));
                listStyle.add(style);

            }

        } catch (SQLException e) {
        }

        return listStyle;
    }
    
    public String getStyleNameByStyleId(int styleId){
        String styleName = null;
        String sql = "SELECT styleName FROM style WHERE styleId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, styleId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                styleName = rs.getString("styleName");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return styleName;
    }
    // Lấy danh sách các Style với số lượng sản phẩm và trạng thái
    public List<Style> getStyleListWithProductCount() {
    List<Style> styleList = new ArrayList<>();
    String sql = "SELECT s.styleId, s.styleName, s.status, COUNT(p.productId) AS styleProductCount " +
                 "FROM style s LEFT JOIN product p ON s.styleId = p.styleId " +
                 "GROUP BY s.styleId, s.styleName, s.status";

    try (PreparedStatement ps = connection.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        
        
        while (rs.next()) {
            Style segment = new Style();
            segment.setStyleId(rs.getString("styleId"));
            segment.setStyleName(rs.getString("styleName"));
            segment.setStatus(rs.getInt("status"));
            segment.setStyleProductCount(rs.getInt("styleProductCount"));
            styleList.add(segment);
            
            // Print each brand's details
            System.out.println("style ID: " + segment.getStyleId() + 
                               ",style Name: " + segment.getStyleName() + 
                               ", Status: " + segment.getStatus() + 
                               ",style Product Count: " + segment.getStyleProductCount());
        }
        
        System.out.println("Total Segments fetched: " + styleList.size()); // Debugging
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return styleList;
}
    public List<Style> getStyleListWithPagination(String search, int status, int offset, int limit) {
    List<Style> styleList = new ArrayList<>();
    StringBuilder sql = new StringBuilder("SELECT s.styleId, s.styleName, s.status, COUNT(p.productId) AS styleProductCount " +
                 "FROM style s LEFT JOIN product p ON s.styleId = p.styleId");

    boolean hasCondition = false;

    // Thêm điều kiện lọc theo status
    if (status != -1) {
        sql.append(" WHERE s.status = ?");
        hasCondition = true;
    }

    // Thêm điều kiện tìm kiếm theo tên style nếu có
    if (search != null && !search.isEmpty()) {
        if (hasCondition) {
            sql.append(" AND s.styleName LIKE ?");
        } else {
            sql.append(" WHERE s.styleName LIKE ?");
            hasCondition = true;
        }
    }

    // Nhóm theo styleId và styleName
    sql.append(" GROUP BY s.styleId, s.styleName, s.status");

    // Thêm điều kiện LIMIT và OFFSET để phân trang
    sql.append(" LIMIT ? OFFSET ?");

    try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
        int index = 1;

        // Thiết lập giá trị cho status
        if (status != -1) {
            ps.setInt(index++, status);
        }

        // Thiết lập giá trị cho điều kiện tìm kiếm
        if (search != null && !search.isEmpty()) {
            ps.setString(index++, "%" + search + "%");
        }

        // Thiết lập giá trị cho LIMIT và OFFSET
        ps.setInt(index++, limit);
        ps.setInt(index, offset);

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Style style = new Style();
                style.setStyleId(rs.getString("styleId"));
                style.setStyleName(rs.getString("styleName"));
                style.setStatus(rs.getInt("status"));
                style.setStyleProductCount(rs.getInt("styleProductCount"));
                styleList.add(style);

                // Debugging: Print each style's details
                System.out.println("Style ID: " + style.getStyleId() +
                                   ", Style Name: " + style.getStyleName() +
                                   ", Status: " + style.getStatus() +
                                   ", Style Product Count: " + style.getStyleProductCount());
            }
        }
        
        // Debugging: Print total number of styles fetched
        System.out.println("Total Styles fetched: " + styleList.size());
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return styleList;
}


    // Cập nhật trạng thái của brand
    public boolean updateStyleStatus(int styleId, int status) {
        String sql = "UPDATE style SET status = ? WHERE styleId = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, status);
            ps.setInt(2, styleId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    
    public static void main(String[] args) {
        StyleDAO s = new StyleDAO();
        List<Style> styletList = s.getStyleListWithProductCount();
        System.out.println(s.getAllStyleCar());
    }

}
