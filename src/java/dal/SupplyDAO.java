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
import model.Supply;

/**
 *
 * @author Sonvu
 */
public class SupplyDAO extends DBContext {

    public int getSupplyIdByName(String name) {
        String sql = "SELECT supplyId FROM carpipi.supply where supplyName = ?";

        String supplyId = null; // Biến để lưu kết quả trả về

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {                
                supplyId = rs.getString("supplyId");
            }

        } catch (SQLException e) {
        }
        
        int sId = Integer.parseInt(supplyId);
        
        return sId;
    }

    public List<Supply> getAllSupplyCar() {

        List<Supply> listSupply = new ArrayList<>();

        String sql = "SELECT * FROM carpipi.supply";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Supply supply = new Supply();

                supply.setSupplyId(rs.getString("supplyId"));
                supply.setSupplyName(rs.getString("supplyName"));
                supply.setSupplyLocation(rs.getString("supplyLocation"));
                listSupply.add(supply);

            }

        } catch (SQLException e) {
        }

        return listSupply;
    }
    
    // Lấy danh sách các brand với số lượng sản phẩm và trạng thái
    public List<Supply> getSupplyListWithProductCount() {
    List<Supply> supplyList = new ArrayList<>();
    String sql = "SELECT su.supplyId, su.supplyName, su.status, COUNT(p.productId) AS productCount " +
                 "FROM supply su LEFT JOIN product p ON su.supplyId = p.supplyId " +
                 "GROUP BY su.supplyId, su.supplyName, su.status";

    try (PreparedStatement ps = connection.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        
        
        while (rs.next()) {
            Supply supply = new Supply();
            supply.setSupplyId(rs.getString("supplyId"));
            supply.setSupplyName(rs.getString("supplyName"));
            supply.setStatus(rs.getInt("status"));
            supply.setSupplyProductCount(rs.getInt("productCount"));
            supplyList.add(supply);
            
            // Print each brand's details
            System.out.println("Supply ID: " + supply.getSupplyId() + 
                               ",Supply Name: " + supply.getSupplyName() + 
                               ", Status: " + supply.getStatus() + 
                               ",Supply Product Count: " + supply.getSupplyProductCount());
        }
        
        System.out.println("Total supplies fetched: " + supplyList.size()); // Debugging
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return supplyList;
}

    // Cập nhật trạng thái của brand
    public boolean updateSupplyStatus(int supplyId, int status) {
        String sql = "UPDATE supply SET status = ? WHERE supplyId = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, status);
            ps.setInt(2, supplyId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static void main(String[] args) {
        SupplyDAO s = new SupplyDAO();
        List<Supply> supplyList = s.getSupplyListWithProductCount();
        //System.out.println(s.getAllSupplyCar());
    }
}
