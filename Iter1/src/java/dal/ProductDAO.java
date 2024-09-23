/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Product;
import model.ProductImages;

/**
 *
 * @author tuana
 */
public class ProductDAO extends DBContext{
    public List<Product> getAllAccount(){
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10));

                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public ProductImages getProductImageById(int porductId){
        String sql = "select * from ProductImages where porductId=26";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, porductId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new ProductImages(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
