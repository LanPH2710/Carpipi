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

    public static void main(String[] args) {
        SupplyDAO s = new SupplyDAO();

        System.out.println(s.getAllSupplyCar());
    }
}
