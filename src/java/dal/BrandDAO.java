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
import model.Brand;

/**
 *
 * @author tuana
 */
public class BrandDAO extends DBContext {

    public int getBrandIdByName(String name) {
        String sql = "SELECT brandId FROM carpipi.brand where name = ?";

        String brandId = ""; // Biến để lưu kết quả trả về

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, name);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                brandId = rs.getString("brandId");
            }

        } catch (SQLException e) {
        }

        int bId = Integer.parseInt(brandId);

        return bId;
    }

    public List<Brand> getAllBrand() {
    List<Brand> list = new ArrayList<>();
    String sql = "SELECT * FROM brand";
    
    try (PreparedStatement st = connection.prepareStatement(sql);
         ResultSet rs = st.executeQuery()) {
        
        while (rs.next()) {
            Brand brand = new Brand(rs.getInt("brandId"),
                                    rs.getString("name"),
                                    rs.getString("image"));
            list.add(brand);
        }
        
    } catch (SQLException e) {
        System.out.println("Error in getAllBrand: " + e.getMessage());
    }
    
    return list;
}

    public String getBrandById(int brandId) {
        String sql = "select * from Brand where brandId=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, brandId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getString(2);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public static void main(String[] args) {
        BrandDAO b = new BrandDAO();
        System.out.println(b.getBrandIdByName("Audi"));
    }
}
