package dal;

import context.DBContext;
import model.Product;
import model.ProductImage;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.ProductImage;

public class ProductDAO extends DBContext {

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Products";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet resultSet = st.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setProductId(resultSet.getInt("productId"));
                product.setName(resultSet.getString("name"));
                product.setSeatNumber(resultSet.getInt("seatNumber"));
                product.setPrice(resultSet.getDouble("price"));
                product.setFuel(resultSet.getString("fuel"));
                product.setStock(resultSet.getInt("stock"));
                product.setDescription(resultSet.getString("description"));
                product.setVAT(resultSet.getDouble("VAT"));
                product.setSupplierId(resultSet.getInt("supplierId"));
                product.setBrandId(resultSet.getInt("brandId"));
                product.setSegmentId(resultSet.getInt("segmentId"));
                product.setStyleId(resultSet.getInt("styleId"));

                // Lấy danh sách hình ảnh của sản phẩm
                product.setImages(getImagesByProductId(product.getProductId()));

                products.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return products;
    }

    public Product getProductById(int productId) {
    Product product = null;
    try {
        // Câu truy vấn lấy thông tin sản phẩm dựa trên productId
        String sql = "SELECT * FROM products WHERE productId = ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, productId);
        ResultSet rs = st.executeQuery();
        
        if (rs.next()) {
            // Tạo đối tượng Product với các thông tin lấy từ ResultSet
            product = new Product();
            product.setProductId(rs.getInt("productId"));
            product.setName(rs.getString("name"));
            product.setSeatNumber(rs.getInt("seatNumber"));
            product.setPrice(rs.getDouble("price"));
            product.setFuel(rs.getString("fuel"));
            product.setStock(rs.getInt("stock"));
            product.setDescription(rs.getString("description"));
            product.setVAT(rs.getDouble("VAT"));
            product.setSupplierId(rs.getInt("supplierId"));
            product.setBrandId(rs.getInt("brandId"));
            product.setSegmentId(rs.getInt("segmentId"));
            product.setStyleId(rs.getInt("styleId"));
            
            // Lấy danh sách hình ảnh của sản phẩm từ bảng productimages
            product.setImages(getImagesByProductId(product.getProductId()));
        }
    } catch (SQLException e) {
        System.out.println("Lỗi khi lấy sản phẩm theo ID: " + e.getMessage());
    }
    return product;
}
  

    // Phương thức lấy danh sách hình ảnh theo productId
    public List<ProductImage> getImagesByProductId(int productId) throws SQLException {
        List<ProductImage> images = new ArrayList<>();
        String query = "SELECT * FROM productimages WHERE productId = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, productId);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            ProductImage image = new ProductImage();
            image.setImageId(resultSet.getInt("imageId"));
            image.setProductId(resultSet.getInt("productId"));
            image.setImageUrl(resultSet.getString("imageUrl"));
            images.add(image);
        }
        return images;
    }

    
//    public static void main(String[] args) throws SQLException {
//        // Tạo đối tượng ProductDAO
//        ProductDAO productDAO = new ProductDAO();
//
//        // Kiểm tra phương thức getProductById
//        int testProductId = 1; // Thay đổi giá trị productId cho phù hợp với dữ liệu của bạn
//        System.out.println("----- Kiểm tra phương thức getProductById -----");
//        Product product = productDAO.getProductById(testProductId);
//        
//        if (product != null) {
//            System.out.println("Product ID: " + product.getProductId());
//            System.out.println("Name: " + product.getName());
//            System.out.println("Seat Number: " + product.getSeatNumber());
//            System.out.println("Price: " + product.getPrice());
//            System.out.println("Fuel: " + product.getFuel());
//            System.out.println("Stock: " + product.getStock());
//            System.out.println("Description: " + product.getDescription());
//            System.out.println("VAT: " + product.getVAT());
//            System.out.println("Supplier ID: " + product.getSupplierId());
//            System.out.println("Brand ID: " + product.getBrandId());
//            System.out.println("Segment ID: " + product.getSegmentId());
//            System.out.println("Style ID: " + product.getStyleId());
//        } else {
//            System.out.println("Không tìm thấy sản phẩm với ID: " + testProductId);
//        }
//
//        // Kiểm tra phương thức getImagesByProductId
//        System.out.println("----- Kiểm tra phương thức getImagesByProductId -----");
//        List<ProductImage> images = productDAO.getImagesByProductId(testProductId);
//        if (images != null && !images.isEmpty()) {
//            System.out.println("Danh sách hình ảnh của sản phẩm:");
//            for (ProductImage image : images) {
//                System.out.println("Image ID: " + image.getImageId() + ", URL: " + image.getImageUrl());
//            }
//        } else {
//            System.out.println("Không tìm thấy hình ảnh cho sản phẩm với ID: " + testProductId);
//        }
//
//        // Đóng kết nối sau khi kiểm tra xong (nếu cần)
//        try {
//            productDAO.connection.close(); // Đóng kết nối với cơ sở dữ liệu
//        } catch (SQLException e) {
//            System.out.println("Lỗi khi đóng kết nối: " + e.getMessage());
//        }
//    }
//    

    
}
