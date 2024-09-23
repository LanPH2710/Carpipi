/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class DBContext {

    protected Connection connection;

    public DBContext() {
        String url = "jdbc:mysql://localhost:3306/ShopAuto";
        String user = "root";
        String password = "123456";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            connection = DriverManager.getConnection(url, user, password);
            System.out.println("Connection successful!");
            //return DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Driver class not found!");
        }

//    public static void main(String[] args) {
//        
//    }
//    
    }
    public static void main(String[] args) {
           DBContext dbContext = new DBContext();
    }
}
