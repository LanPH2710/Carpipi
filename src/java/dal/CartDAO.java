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
import model.Cart;
import model.Product;
import dal.*;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author hiule
 */
public class CartDAO extends DBContext {
//
//    public static void main(String[] args) {
//        CartDAO cartDAO = new CartDAO();
//
//        try {
//            // Test data
//            int userId = 1; // Example user ID
//            String productId = "AU01"; // Example product ID (make sure this exists in your product table)
//            int quantity = 2; // Number of items to add
//
//            // Attempt to add the product to the cart
//            boolean success = cartDAO.addToCart(userId, productId, quantity);
//            if (success) {
//                System.out.println("Product added to cart successfully.");
//            } else {
//                System.out.println("Failed to add product to cart.");
//            }
//
//        } catch (SQLException e) {
//            e.printStackTrace(); // Print any SQL exceptions that occur
//        } finally {
//            // Close your database connection if necessary
//            // connection.close(); // Uncomment if you're managing the connection in DBContext
//        }
//    }

    public int getCartIdByUserIdAndProductId(int userId, String productId) throws SQLException {
        String sql = "SELECT cartId FROM cart WHERE userId = ? AND productId = ? AND isDeleted = 0";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setString(2, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("cartId");
            }
            return -1; // Không tìm thấy cart
        }
    }

    public boolean updateQuantityByCartId(int cartId, int quantity) throws SQLException {
        String sql = "UPDATE cart SET quantity = quantity + ? WHERE cartId = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, quantity); // Cộng thêm số lượng vào cart
            ps.setInt(2, cartId);
            return ps.executeUpdate() > 0; // Trả về true nếu cập nhật thành công
        }
    }

    public boolean addToCart(int userId, String productId, int quantity) throws SQLException {

        // Nếu cart không tồn tại, thực hiện insert mới
        String sql = "INSERT INTO cart (userId, productId, quantity) VALUES (?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setString(2, productId);
            ps.setInt(3, quantity);
            return ps.executeUpdate() > 0; // Trả về true nếu insert thành công

        }
    }

    public Integer getCartIdByUserId(int userId) {
        String sql = "SELECT cartId FROM cart WHERE userId = ? LIMIT 1"; // Adjust based on your SQL dialect

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("cartId");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null; // or throw an exception if no cart is found
    }

    public boolean deleteCartItem(int userId, String productId) throws SQLException {
        String sql = "UPDATE cart SET isDeleted = 1 WHERE userId = ? AND productId = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setString(2, productId);
            return ps.executeUpdate() > 0; // Trả về true nếu cập nhật thành công
        }
    }

    // Lấy danh sách sản phẩm từ giỏ hàng của người dùng
    public List<Cart> getCartsByUserId(int userId) {
        List<Cart> cartList = new ArrayList<>();
        String sql = "SELECT * FROM cart WHERE userId = ? AND isDeleted = 0";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                // Assuming your Cart class has a constructor that takes these parameters
                int cartId = rs.getInt("cartId");
                String productId = rs.getString("productId");
                int quantity = rs.getInt("quantity");

                // You may need to fetch product details based on productId
                Product product = new ProductDAO().getProductById(productId);  // Implement this method as needed

                Cart cart = new Cart(cartId, userId, product, quantity);
                cartList.add(cart);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }

        return cartList;
    }

    public void updateCart1(int cartId, int userId, String productId, int quantity) throws SQLException {
        String sql = "UPDATE cart SET quantity = quantity + ? WHERE cartId = ? AND userId = ? AND productId = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, quantity); // Increment the existing quantity
            ps.setInt(2, cartId);   // Include cartId in the update condition
            ps.setInt(3, userId);
            ps.setString(4, productId);
            ps.executeUpdate();
        }
    }

    public void updateCart2(int cartId, int userId, String productId, int quantity) throws SQLException {
        String sql = "UPDATE cart SET quantity = ? WHERE cartId = ? AND userId = ? AND productId = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, quantity); // Set the quantity directly
            ps.setInt(2, cartId);   // Include cartId in the update condition
            ps.setInt(3, userId);
            ps.setString(4, productId);
            ps.executeUpdate();
        }
    }

    // Xóa sản phẩm khỏi giỏ hàng
    public void removeFromCart(int userId, String productId) throws SQLException {
        String sql = "DELETE FROM cart WHERE userId = ? AND productId = ?";
        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setString(2, productId);
            ps.executeUpdate();
        }
    }

    public List<Cart> searchCartItems(int userId, String keyword) throws SQLException {
        List<Cart> cartItems = new ArrayList<>();
        String sql = "SELECT * FROM cart WHERE userId = ? and isDeleted = 0 AND productId   IN (SELECT productId FROM product WHERE name LIKE ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setString(2, "%" + keyword + "%"); // Tìm kiếm với từ khóa
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int cartId = rs.getInt("cartId");
                String productId = rs.getString("productId");
                int quantity = rs.getInt("quantity");
                // Tạo Cart object và thêm vào danh sách
                Cart cartItem = new Cart(cartId, userId, new ProductDAO().getProductById(productId), quantity);
                cartItems.add(cartItem);
            }
        }
        return cartItems;
    }

    public List<Cart> getCartsBySupplyId(int supplyId) throws SQLException {
        List<Cart> cartList = new ArrayList<>();
        String sql = "SELECT c.cartId, c.userId, c.productId, c.quantity, p.name AS productName, s.supplyName "
                + "FROM carpipi.cart c "
                + "JOIN product p ON c.productId = p.productId "
                + "JOIN supply s ON p.supplyId = s.supplyId "
                + "WHERE  s.supplyId = ? and c.isDeleted = 0 ";  // Dùng '?' để truyền tham số

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, supplyId); // Gán giá trị cho supplyId
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int cartId = rs.getInt("cartId");
                int userId = rs.getInt("userId");
                String productId = rs.getString("productId");
                int quantity = rs.getInt("quantity");

                // You may need to fetch product details based on productId
                Product product = new ProductDAO().getProductById(productId);  // Implement this method as needed

                Cart cart = new Cart(cartId, userId, product, quantity);
                cartList.add(cart);

            }
        }
        return cartList;
    }
    public int countCartsByUserId(int userId) throws SQLException {
    int totalCarts = 0;  // Variable to hold the count
    String sql = "SELECT COUNT(*) AS totalCarts " +
                 "FROM carpipi.cart " +
                 "WHERE userId = ? AND isDeleted = 0";  // Ensure only active carts are counted

    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setInt(1, userId);  // Set the userId parameter
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            totalCarts = rs.getInt("totalCarts");  // Retrieve the count
        }
    }
    
    return totalCarts;  // Return the total count
}

    public static void main(String[] args) {
    // Thay đổi thông tin kết nối database và supplyId nếu cần
    int supplyId = 1; // Giả sử đây là supplyId mà bạn muốn tìm kiếm

    CartDAO cartDAO = new CartDAO();

    try {
        // Gọi phương thức để lấy các giỏ hàng theo supplyId
        List<Cart> cartList = cartDAO.getCartsBySupplyId(supplyId);

        // In kết quả ra console
        if (cartList.isEmpty()) {
            System.out.println("Không tìm thấy sản phẩm nào cho supplyId: " + supplyId);
        } else {
            System.out.println("Kết quả tìm kiếm:");
            for (Cart cart : cartList) {
                Product product = cart.getProduct();
                System.out.println("Giỏ hàng ID: " + cart.getCartId() +
                                   ", Sản phẩm ID: " + product.getProductId() +
                                   ", Tên: " + product.getName() +
                                   ", Số lượng: " + cart.getQuantity());
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
        System.out.println("Lỗi khi tìm kiếm sản phẩm: " + e.getMessage());
    }
}

}
