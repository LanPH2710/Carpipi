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
import model.Role;

/**
 *
 * @author tuana
 */
public class RoleDAO extends DBContext {

    public List<Role> getAllRole() {
        List<Role> list = new ArrayList<>();
        String sql = "SELECT * FROM Role;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role p = new Role(rs.getInt(1),
                        rs.getString(2));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public String getRoleNameById(int roleId) {
        String sql = "SELECT roleName FROM Role WHERE roleId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString("roleName");
            }
        } catch (SQLException e) {
        }
        return "Unknown";
    }
}
