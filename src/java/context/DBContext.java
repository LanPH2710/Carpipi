/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

/**
 *
 * @author nguye
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DBContext {
    protected Connection connection;

    public DBContext() {
        //@Students: You are allowed to edit user, pass, url variables to fit 
        //your system configuration
        //You can also add more methods for Database Interaction tasks. 
        //But we recommend you to do it in another class
        // For example : StudentDBContext extends DBContext , 
        //where StudentDBContext is located in dal package, 
        try {
            String user = "root"; // Your MySQL username
            String pass = "1234"; // Your MySQL password
            String url = "jdbc:mysql://localhost:3306/carpipi"; // MySQL URL format - your schema name
            Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL driver class
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, "Driver class not found", e);
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, "SQL exception occurred", e);
        }
    }

    public Connection getConnection() {
        return connection;
    }

    // Method to close the connection if needed
    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, "Failed to close the connection", e);
            }
        }
    }
//    
    public static void main(String[] args) {
        DBContext db = new DBContext();
        System.out.println(db.getConnection());
    }
}
