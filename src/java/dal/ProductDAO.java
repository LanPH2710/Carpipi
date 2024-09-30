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
            String sql = "SELECT * FROM products"; // Thay đổi tên bảng cho đúng
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet resultSet = st.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setProductId(resultSet.getString("productId"));
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

    public Product getProductById(String productId) { // Thay đổi kiểu tham số về String
        Product product = null;
        try {
            // Câu truy vấn lấy thông tin sản phẩm dựa trên productId
            String sql = "SELECT * FROM products WHERE productId = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, productId); // Sửa đổi để phù hợp với kiểu dữ liệu
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                // Tạo đối tượng Product với các thông tin lấy từ ResultSet
                product = new Product();
                product.setProductId(rs.getString("productId"));
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
    public List<ProductImage> getImagesByProductId(String productId) throws SQLException {
        List<ProductImage> images = new ArrayList<>();
        String query = "SELECT * FROM productimages WHERE productId = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, productId);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            ProductImage image = new ProductImage();
            image.setImageId(resultSet.getInt("imageId"));
            image.setProductId(resultSet.getString("productId"));
            image.setImageUrl(resultSet.getString("imageUrl"));
            images.add(image);
        }
        return images;
    }
    
    public List<Product> getProductsByProductIdPrefix(String prefix) {
    List<Product> products = new ArrayList<>();
    String sql = "SELECT * FROM products WHERE productId LIKE ? LIMIT 4"; // Giới hạn lấy 5 sản phẩm
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, prefix + "%"); // Thêm ký tự % để tìm kiếm
        ResultSet resultSet = st.executeQuery();
        while (resultSet.next()) {
            Product product = new Product();
            product.setProductId(resultSet.getString("productId"));
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
            product.setImages(getImagesByProductId(product.getProductId())); // Thêm hình ảnh vào sản phẩm
            products.add(product);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return products;
}


    // Son: lấy sản phẩm có id to nhất với nameId là mã số đầu vd: VO, AU, ME, BM, PO
    public String getProductToScanId(String nameId) {
        String sql = "SELECT productId \n"
                + "FROM carpipi.products \n"
                + "WHERE productId LIKE ? \n"
                + "ORDER BY productId DESC \n"
                + "LIMIT 1;";

        String productId = null; // Biến để lưu kết quả trả về

        try {
            // Giả định bạn đã tạo connection
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, nameId + "%");

            ResultSet resultSet = st.executeQuery();

            // Lấy productId của bản ghi đầu tiên trong kết quả
            if (resultSet.next()) {
                productId = resultSet.getString("productId");
            }
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra console nếu có lỗi xảy ra
        }

        String newId = toIncreaseId(productId);

        return newId; // Trả về productId (hoặc null nếu không có kết quả)

    }

    //Son: Tăng id sản phẩm lên 1 (VO26)
    public String toIncreaseId(String id) {

        String rootId = id.substring(0, 2);
        String idd = id.substring(2, id.length());

        int idNumber = Integer.parseInt(idd);
        idNumber++;
        String idafter = String.valueOf(idNumber);

        return rootId + idafter;
    }

//     private int productId;
//    private String name;
//    private int seatNumber;
//    private double price;
//    private String fuel;
//    private int stock;
//    private String description;
//    private double VAT;
//    private int supplierId;
//    private int brandId;
//    private int segmentId;
//    private int styleId;
//    private List<ProductImage> images; 
    //Son: Thêm sản phẩm 
    public void insertProduct(String id, String name, int seatNumber, double price, String fuel,
            int stock, String des, double vat, int suppliesId, int brandId, int segmentId, int styleId) {
        String sql = "INSERT INTO `carpipi`.`products`\n"
                + "(`productId`,\n"
                + "`name`,\n"
                + "`seatNumber`,\n"
                + "`price`,\n"
                + "`fuel`,\n"
                + "`stock`,\n"
                + "`description`,\n"
                + "`VAT`,\n"
                + "`supplierId`,\n"
                + "`brandId`,\n"
                + "`segmentId`,\n"
                + "`styleId`)\n"
                + "VALUES\n"
                + "(?,?,?,?,?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.setString(2, name);
            st.setInt(3, seatNumber);
            st.setDouble(4, price);
            st.setString(5, fuel);
            st.setInt(6, stock);
            st.setString(7, des);
            st.setDouble(8, vat);
            st.setInt(9, suppliesId);
            st.setInt(10, brandId);
            st.setInt(11, segmentId);
            st.setInt(12, styleId);

            st.executeUpdate();

        } catch (Exception e) {
        }

    }

    
    /*
    public static void main(String[] args) throws SQLException {
        // Tạo đối tượng ProductDAO
        ProductDAO productDAO = new ProductDAO();

        // Kiểm tra phương thức getProductById
        String testProductId = ME; // Thay đổi giá trị productId cho phù hợp với dữ liệu của bạn
        System.out.println("----- Kiểm tra phương thức getProductById -----");
        Product product = productDAO.getProductById(testProductId);

        if (product != null) {
            System.out.println("Product ID: " + product.getProductId());
            System.out.println("Name: " + product.getName());
            System.out.println("Seat Number: " + product.getSeatNumber());
            System.out.println("Price: " + product.getPrice());
            System.out.println("Fuel: " + product.getFuel());
            System.out.println("Stock: " + product.getStock());
            System.out.println("Description: " + product.getDescription());
            System.out.println("VAT: " + product.getVAT());
            System.out.println("Supplier ID: " + product.getSupplierId());
            System.out.println("Brand ID: " + product.getBrandId());
            System.out.println("Segment ID: " + product.getSegmentId());
            System.out.println("Style ID: " + product.getStyleId());
        } else {
            System.out.println("Không tìm thấy sản phẩm với ID: " + testProductId);
        }

        // Kiểm tra phương thức getImagesByProductId
        System.out.println("----- Kiểm tra phương thức getImagesByProductId -----");
        List<ProductImage> images = productDAO.getImagesByProductId(testProductId);
        if (images != null && !images.isEmpty()) {
            System.out.println("Danh sách hình ảnh của sản phẩm:");
            for (ProductImage image : images) {
                System.out.println("Image ID: " + image.getImageId() + ", URL: " + image.getImageUrl());
            }
        } else {
            System.out.println("Không tìm thấy hình ảnh cho sản phẩm với ID: " + testProductId);
        }

        // Đóng kết nối sau khi kiểm tra xong (nếu cần)
        try {
            productDAO.connection.close(); // Đóng kết nối với cơ sở dữ liệu
        } catch (SQLException e) {
            System.out.println("Lỗi khi đóng kết nối: " + e.getMessage());
        }
    }

}  */
   public static void main(String[] args) {
        ProductDAO p = new ProductDAO();
        String idRoot = p.getProductToScanId("AU");

        p.insertProduct(idRoot, "1", 1, 1, "", 1, "", 1, 1, 1, 1, 1);

    }
}
