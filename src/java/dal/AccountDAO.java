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

/**
 *
 * @author tuana
 */
public class AccountDAO extends DBContext {

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM Account";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account p = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Account> getAllCustommer() {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account where roleId=4";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account p = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Account> sortCustomerByName() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM Account WHERE roleId = 4 ORDER BY firstName ASC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account p = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Account> sortCustommerByEmail() {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account where roleId=4 order by email asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account p = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Account> sortCustommerByPhone() {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account where roleId=4 order by mobile asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account p = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Account getAccountById(int userId) {
        String sql = "select * from Account where userId=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account checkAccountExits(String email) {
        String sql = "SELECT * FROM Account WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int id = rs.getInt(1);
                String username = rs.getString(2);
                String password = rs.getString(3);
                String firstName = rs.getString(4);
                String lastName = rs.getString(5);
                String gender = rs.getString(6);
                String mobile = rs.getString(7);
                String address = rs.getString(8);
                int roleId = rs.getInt(9);
                return new Account(roleId, username, password, firstName, lastName, gender, email, mobile, address, roleId);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void addCustomer(String userName, String password, String firstName, String lastName, String gender, String email, String phone, String address) {
        String sql = "INSERT INTO Account (userName, password, firstName, lastName, gender, email, phone, address, roleId)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, 4)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, userName);
            st.setString(2, password); // Sử dụng hashedPassword nếu bạn đã mã hóa
            st.setString(3, firstName);
            st.setString(4, lastName);
            st.setString(5, gender);
            st.setString(6, email);
            st.setString(7, phone);
            st.setString(8, address);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editAccount(String userName, String password, String firstName, String lastName, String gender, String email, String mobile, String address, int roleId, int userId) {
        String sql = "UPDATE Account SET "
                + "userName = ?, "
                + "password = ?, "
                + "firstName = ?, "
                + "lastName = ?, "
                + "gender = ?, "
                + "email = ?, "
                + "mobile = ?, "
                + "address = ?, "
                + "roleId = ? "
                + "WHERE userId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userName);
            st.setString(2, password);
            st.setString(3, firstName);
            st.setString(4, lastName);
            st.setString(5, gender);
            st.setString(6, email);
            st.setString(7, mobile);
            st.setString(8, address);
            st.setInt(9, roleId);
            st.setInt(10, userId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Account> searchByLastName(String txtSearch) {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM Account WHERE lastName LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account p = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Account> searchByPhone(String txtSearch) {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM Account WHERE mobile LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account p = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Account> searchByEmail(String txtSearch) {
    List<Account> list = new ArrayList<>();
    String sql = "SELECT * FROM Account WHERE email LIKE ?";
    try (PreparedStatement st = connection.prepareStatement(sql)) {
        st.setString(1, "%" + txtSearch + "%");
        try (ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Account account = new Account(
                    rs.getInt("userId"),     
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("firstName"),
                    rs.getString("lastName"),
                    rs.getString("gender"),
                    rs.getString("email"),
                    rs.getString("mobile"),
                    rs.getString("address"),
                    rs.getInt("roleId")
                );
                list.add(account);
            }
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return list;
}


    public List<Account> getCustomerListByPage(List<Account> accounts, int start, int end) {
        ArrayList<Account> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(accounts.get(i));
        }
        return arr;
    }

    public static void main(String[] args) {
        AccountDAO adao = new AccountDAO();
        List<Account> a1 = adao.searchByEmail("alice.davis@example.com");
        System.out.println(a1.get(0).getFirstName());
    }
}
