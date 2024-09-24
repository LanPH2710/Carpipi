/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.GoogleAccount;
import context.DBContext;

/**
 *
 * @author Sonvu
 */
public class LoginDAO extends DBContext {

    public Account getUsernameAndPassword(String username, String password) {

        String sql = "select * from account where username = ? and password = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Account account = new Account();
                account.setUserId(rs.getInt(1));
                account.setUserName(rs.getString(2));
                account.setPassword(rs.getString(3));
                account.setFirstName(rs.getString(4));
                account.setLastName(rs.getString(5));
                account.setGender(rs.getString(6));
                account.setEmail(rs.getString(7));
                account.setMobile(rs.getString(8));
                account.setAddress(rs.getString(6));
                account.setRoleId(rs.getInt(8));

                return account;

            }

        } catch (SQLException e) {
        }

        return null;

    }

    public Account getByEmail(String email) {

        String sql = "select * from account where email = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Account account = new Account();
                account.setUserId(rs.getInt(1));
                account.setUserName(rs.getString(2));
                account.setPassword(rs.getString(3));
                account.setFirstName(rs.getString(4));
                account.setLastName(rs.getString(5));
                account.setGender(rs.getString(6));
                account.setEmail(rs.getString(7));
                account.setMobile(rs.getString(8));
                account.setAddress(rs.getString(6));
                account.setRoleId(rs.getInt(8));

                return account;

            }

        } catch (SQLException e) {
        }

        return null;

    }

    public void inserUser(String username, String fullname, String password, String phone, String address) {
        String sql = "INSERT INTO [dbo].[Customers]\n"
                + "           ([Username]\n"
                + "           ,[Fullname]\n"
                + "           ,[Password]\n"
                + "           ,[Phone]\n"
                + "           ,[Address]\n"
                + "           ,[RoleId])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,'US')";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, fullname);
            ps.setString(3, password);
            ps.setString(4, password);
            ps.setString(5, address);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

//     userId INT PRIMARY KEY,
//    userName VARCHAR(255),
//    password VARCHAR(255),
//    firstName VARCHAR(255),
//    lastName VARCHAR(255),
//    gender VARCHAR(10),
//    email VARCHAR(255),
//    mobile VARCHAR(20),
//    address VARCHAR(255),
//    roleId INT not null,
//    FOREIGN KEY (roleId) REFERENCES Roles(roleId)
    public void inserUserByEmail(String id,String username, String password, String firstName, String lastName, String gender, String email, String phone, String address) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([userId]\n"
                + "           ,[userName]\n"
                + "           ,[password]\n"
                + "           ,[firstName]\n"
                + "           ,[lastName]\n"
                + "           ,[gender]\n"
                + "           ,[email]\n"
                + "           ,[mobile]\n"
                + "           ,[address]\n"
                + "           ,[roleId])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,'2')";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, username);
            ps.setString(3, password);
            ps.setString(4, firstName);
            ps.setString(5, lastName);
            ps.setString(6, gender);
            ps.setString(7, email);
            ps.setString(8, "");
            ps.setString(9, "");

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

}
