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

        String sql = "SELECT * FROM carpipi.style";

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

    public static void main(String[] args) {
        StyleDAO s = new StyleDAO();

        System.out.println(s.getAllStyleCar());
    }

}
