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
import model.AddressUser;

/**
 *
 * @author hiule
 */
public class CheckOutDAO extends DBContext{
     public List<AddressUser> getAddressByUserId(int userId) {
        List<AddressUser> addressList = new ArrayList<>();
        String sql = "SELECT * FROM addressUser WHERE userId = ?";

        try (
            PreparedStatement st = connection.prepareStatement(sql)) {
            
            st.setInt(1, userId);
              ResultSet rs = st.executeQuery();

            while (rs.next()) {
                AddressUser addressUser = new AddressUser();
                addressUser.setAddressId(rs.getInt("addressId"));
                addressUser.setUserId(rs.getInt("userId"));
                addressUser.setAddress(rs.getString("address"));
                addressUser.setName(rs.getString("name"));
                addressUser.setEmail(rs.getString("email"));
                addressUser.setPhone(rs.getString("phone"));
                
                addressList.add(addressUser);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return addressList;
    }
       public AddressUser getAddressById(int addressId) {
        AddressUser addressUser = null;
        String sql = "SELECT * FROM addressUser WHERE addressId = ?";

        try (
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, addressId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    addressUser = new AddressUser();
                    addressUser.setUserId(rs.getInt("userId"));
                    addressUser.setAddressId(rs.getInt("addressId"));
                    addressUser.setAddress(rs.getString("address"));
                    addressUser.setName(rs.getString("name"));
                    addressUser.setEmail(rs.getString("email"));
                    addressUser.setPhone(rs.getString("phone"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // You can log the exception or rethrow it based on your application's needs
        }

        return addressUser;
    }
       
       public boolean insertAddress(int userId, String address, String name, String email, String phone) {
    String sql = "INSERT INTO addressUser (userId, address, name, email, phone) VALUES (?, ?, ?, ?, ?)";

    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setInt(1, userId);
        ps.setString(2, address);
        ps.setString(3, name);
        ps.setString(4, email);
        ps.setString(5, phone);

        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0; // Return true if at least one row was inserted
    } catch (SQLException e) {
        e.printStackTrace(); // Consider logging the exception instead
        return false;
    }
}
 public boolean updateAddress(int addressId, String name, String email, String phone, String address) {
        String sql = "UPDATE addressUser SET name = ?, email = ?, phone = ?, address = ? WHERE addressId = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, address);
            ps.setInt(5, addressId);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Returns true if at least one row was updated
        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging the exception instead
            return false;
        }
    }
       public static void main(String[] args) {
    CheckOutDAO dao = new CheckOutDAO();

    // Sample data for testing the update
    int addressId = 1; // Replace with a valid addressId for testing
    String updatedAddress = "456 Updated Avenue, New City";
    String updatedName = "Jane Smith";
    String updatedEmail = "janesmith@example.com";
    String updatedPhone = "0987654321";

    // Call the updateAddress method and print the result
    boolean isUpdated = dao.updateAddress(addressId, updatedName, updatedEmail, updatedPhone, updatedAddress);

    if (isUpdated) {
        System.out.println("Address updated successfully.");
    } else {
        System.out.println("Failed to update address.");
    }

    // Close the connection if necessary
    try {
        dao.connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}



}
