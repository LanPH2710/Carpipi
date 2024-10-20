package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.ProductImage;

public class ProductDAO extends DBContext {
     public static void main(String[] args) {
        // Initialize ProductDAO to use the connection from DBContext
        ProductDAO dao = new ProductDAO();
        
        // Example search keyword
        String searchKeyword = "audi";

        // Call the getProductBySearch method
        List<Product> products = dao.getProductBySearch(searchKeyword);

        // Display the results
        if (products.isEmpty()) {
            System.out.println("No products found for the search: " + searchKeyword);
        } else {
            for (Product product : products) {
                System.out.println("Product ID: " + product.getProductId());
                System.out.println("Name: " + product.getName());
                System.out.println("Price: " + product.getPrice());
                System.out.println("Fuel: " + product.getFuel());
                System.out.println("----------------------------");
            }
        }
    }
    // Method to search products by name using DBContext
   public List<Product> searchProductsByName(String searchName) {
    List<Product> products = new ArrayList<>();
    try {
        String sql = "SELECT * FROM products WHERE name LIKE ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, "%" + searchName + "%");
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
            product.setSupplyId(resultSet.getInt("supplierId"));
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

    // Manh Huy ------------------------------------------------------------------------- //
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM product"; // Thay đổi tên bảng cho đúng
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
                product.setSupplyId(resultSet.getInt("supplyId"));
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

    public List<Product> getAllProductsById(String id) {
        List<Product> products = new ArrayList<>();
        try {
            String sql = "select * from carpipi.product where productid like ?"; // Thay đổi tên bảng cho đúng
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id + "%");

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
                product.setSupplyId(resultSet.getInt("supplyId"));
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
            String sql = "SELECT * FROM product WHERE productId = ?";
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
                product.setSupplyId(rs.getInt("supplyId"));
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

    public List<Product> getProductByName(String name) {
        List<Product> products = new ArrayList<>();
        try {
            String sql = "select * from carpipi.product where name like ?"; // Thay đổi tên bảng cho đúng
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");

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
                product.setSupplyId(resultSet.getInt("supplyId"));
                product.setBrandId(resultSet.getInt("brandId"));
                product.setSegmentId(resultSet.getInt("segmentId"));
                product.setStyleId(resultSet.getInt("styleId"));

                products.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return products;
    }

    public String getSupplyNameById(int supplyId) {
        String supplyName = null;
        String sql = "SELECT segmentName FROM Segment WHERE segmentId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, supplyId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                supplyName = rs.getString("supplyName");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return supplyName;
    }

    // Phương thức lấy danh sách hình ảnh theo productId
    public List<ProductImage> getImagesByProductId(String productId) {
        List<ProductImage> images = new ArrayList<>();
        String query = "SELECT * FROM productimage WHERE productId = ?";
        try {
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
        } catch (Exception e) {
        }
        return images;
    }

    public void insertImage(String id, String url) {
        String sql = "INSERT INTO `carpipi`.`productimage`\n"
                + "(`productId`,\n"
                + "`imageUrl`)\n"
                + "VALUES\n"
                + "(?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.setString(2, url);

            st.executeUpdate();
        } catch (Exception e) {
        }

    }

    public List<Product> getProductsByProductIdPrefix(String prefix, int limit) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE productId LIKE ? LIMIT ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, prefix + "%"); // Thêm ký tự % để tìm kiếm
            st.setInt(2, limit); // Thêm ký tự % để tìm kiếm
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
                product.setSupplyId(resultSet.getInt("supplyId"));
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

    public List<Product> getLastestProductsByProductIdPrefix(String prefix, int limit) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE productId LIKE ? ORDER BY productId DESC LIMIT ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, prefix + "%"); // Thêm ký tự % để tìm kiếm
            st.setInt(2, limit); // Thêm ký tự % để tìm kiếm
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
                product.setSupplyId(resultSet.getInt("supplyId"));
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

    public List<Product> getAllProductByBrandId(String braId) {
        List<Product> products = new ArrayList<>();
        try {
            String sql = "select * from carpipi.product where brandId = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, braId);

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
                product.setSupplyId(resultSet.getInt("supplyId"));
                product.setBrandId(resultSet.getInt("brandId"));
                product.setSegmentId(resultSet.getInt("segmentId"));
                product.setStyleId(resultSet.getInt("styleId"));
                product.setImages(getImagesByProductId(product.getProductId())); // Thêm hình ảnh vào sản phẩm
                products.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return products;
    }

    // Son: lấy sản phẩm có id to nhất với nameId là mã số đầu vd: VO, AU, ME, BM, PO
    public String getProductToScanId(String nameId) {
        String sql = "SELECT productId \n"
                + "FROM carpipi.product \n"
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

    //son: ham check thuong hieu
    public String checkBrand(int number) {

        String brand = null;

        switch (number) {
            case 1:
                brand = "ME";
                break;
            case 2:
                brand = "AU";
                break;
            case 3:
                brand = "VO";
                break;
            case 4:
                brand = "BM";
                break;
            case 5:
                brand = "PO";
                break;

            default:
                brand = null;
        }

        return brand;
    }

    public List<Product> getProductByBrandId(int brandId) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE brandId = ? LIMIT 8;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, brandId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getString("productId"));
                product.setName(rs.getString("name"));
                product.setSeatNumber(rs.getInt("seatNumber"));
                product.setPrice(rs.getFloat("price"));
                product.setFuel(rs.getString("fuel"));
                product.setStock(rs.getInt("stock"));
                product.setDescription(rs.getString("description"));
                product.setVAT(rs.getFloat("VAT"));
                product.setSupplyId(rs.getInt("supplyId"));
                product.setBrandId(rs.getInt("brandId"));
                product.setSegmentId(rs.getInt("segmentId"));
                product.setStyleId(rs.getInt("styleId"));
                product.setImages(getImagesByProductId(product.getProductId()));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductByPrice(double price) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE price BETWEEN ? AND ? LIMIT 8;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, price - 200000000);
            st.setDouble(2, price + 200000000);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getString("productId"));
                product.setName(rs.getString("name"));
                product.setSeatNumber(rs.getInt("seatNumber"));
                product.setPrice(rs.getFloat("price"));
                product.setFuel(rs.getString("fuel"));
                product.setStock(rs.getInt("stock"));
                product.setDescription(rs.getString("description"));
                product.setVAT(rs.getFloat("VAT"));
                product.setSupplyId(rs.getInt("supplyId"));
                product.setBrandId(rs.getInt("brandId"));
                product.setSegmentId(rs.getInt("segmentId"));
                product.setStyleId(rs.getInt("styleId"));
                product.setImages(getImagesByProductId(product.getProductId()));
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
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
            int stock, String des, double vat, int supplyId, int brandId, int segmentId, int styleId) {
        String sql = "INSERT INTO `carpipi`.`product`\n"
                + "(`productId`,\n"
                + "`name`,\n"
                + "`seatNumber`,\n"
                + "`price`,\n"
                + "`fuel`,\n"
                + "`stock`,\n"
                + "`description`,\n"
                + "`VAT`,\n"
                + "`supplyId`,\n"
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
            st.setInt(9, supplyId);
            st.setInt(10, brandId);
            st.setInt(11, segmentId);
            st.setInt(12, styleId);

            st.executeUpdate();

        } catch (Exception e) {
        }

    }

    public void deleteProductById(String id) {
        String sql = "delete  from carpipi.product where productId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ProductImage getOneImagesByProductId(String productId) {
        ProductImage images = new ProductImage();
        String query = "SELECT * \n"
                + "FROM productimage \n"
                + "WHERE productId = ? \n"
                + "LIMIT 1;";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, productId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                images.setImageId(resultSet.getInt("imageId"));
                images.setProductId(resultSet.getString("productId"));
                images.setImageUrl(resultSet.getString("imageUrl"));
                return images;

            }
        } catch (Exception e) {
        }

        return null;
    }

    public int getTotalAccount() {
        String sql = "SELECT Count(*) FROM carpipi.product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                return rs.getInt(1);
            }

        } catch (SQLException e) {
        }
        return 0;
    }

    public List<Product> getProductBySearch(String search) {
        List<Product> products = new ArrayList<>();

        String sql = "SELECT p.* FROM carpipi.product p  \n"
                + "JOIN carpipi.brand b ON p.brandId = b.brandId\n"
                + "Join carpipi.style st on p.styleId = st.styleId\n"
                + "where p.name like ? or st.styleName like ? \n"
                + "or p.brandId like ? or p.fuel like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + search + "%");
            st.setString(2, "%" + search + "%");
            st.setString(3, "%" + search + "%");
            st.setString(4, "%" + search + "%");

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
                product.setSupplyId(resultSet.getInt("supplyId"));
                product.setBrandId(resultSet.getInt("brandId"));
                product.setSegmentId(resultSet.getInt("segmentId"));
                product.setStyleId(resultSet.getInt("styleId"));

                products.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return products;
    }

    public int getToTalPagingProductBySearch(String search) {
        String sql = "SELECT count(*) FROM carpipi.product p  \n"
                + "JOIN carpipi.brand b ON p.brandId = b.brandId\n"
                + "Join carpipi.style st on p.styleId = st.styleId\n"
                + "where p.name like ? or st.styleName like ? \n"
                + "or p.brandId like ? or p.fuel like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + search + "%");
            st.setString(2, "%" + search + "%");
            st.setString(3, "%" + search + "%");
            st.setString(4, "%" + search + "%");

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                return rs.getInt(1);
            }

        } catch (SQLException e) {
        }
        return 0;
    }

    public int getTotalProductWithBrandId(String id) {
        String sql = "SELECT Count(*) FROM carpipi.product where productId Like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id + "%");
            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public List<Product> pagingProduct(int index) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "SELECT * \n"
                + "FROM Carpipi.product\n"
                + "ORDER BY productId \n"
                + "LIMIT 5 OFFSET ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, ((index - 1) * 5));
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
                product.setSupplyId(resultSet.getInt("supplyId"));
                product.setBrandId(resultSet.getInt("brandId"));
                product.setSegmentId(resultSet.getInt("segmentId"));
                product.setStyleId(resultSet.getInt("styleId"));

                // Lấy danh sách hình ảnh của sản phẩm
                product.setImages(getImagesByProductId(product.getProductId()));

                listProduct.add(product);

                getOneImagesByProductId(product.getProductId());
            }

        } catch (Exception e) {
        }
        return listProduct;
    }

    public List<Product> getPagingAllProductsById(String id, int index) {
        List<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM carpipi.product where productId Like ? order by productId limit 5 offset ? "; // Thay đổi tên bảng cho đúng
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id + "%");
            st.setInt(2, ((index - 1) * 5));
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
                product.setSupplyId(resultSet.getInt("supplyId"));
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

    public List<Product> getPagingProductBySearch(String search, int index) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "SELECT p.* FROM carpipi.product p  \n"
                + "JOIN carpipi.brand b ON p.brandId = b.brandId\n"
                + "Join carpipi.style st on p.styleId = st.styleId\n"
                + "where ( p.name like ? or st.styleName like ? \n"
                + "or p.brandId like ? or p.fuel like ?)\n"
                + "ORDER BY productId LIMIT 5 OFFSET ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + search + "%");
            st.setString(2, "%" + search + "%");
            st.setString(3, "%" + search + "%");
            st.setString(4, "%" + search + "%");
            st.setInt(5, ((index - 1) * 5));
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
                product.setSupplyId(resultSet.getInt("supplyId"));
                product.setBrandId(resultSet.getInt("brandId"));
                product.setSegmentId(resultSet.getInt("segmentId"));
                product.setStyleId(resultSet.getInt("styleId"));

                // Lấy danh sách hình ảnh của sản phẩm
                product.setImages(getImagesByProductId(product.getProductId()));

                listProduct.add(product);

                getOneImagesByProductId(product.getProductId());
            }

        } catch (Exception e) {
        }
        return listProduct;
    }

    public int getTotalProductWithProductName(String name) {
        String sql = "select Count(*) from Carpipi.product  where name like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public int getNumberPage() {
        String sql = "SELECT Count(*) FROM carpipi.product";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 5;
                if (total % 5 != 0) {
                    countPage++;
                }
                return countPage;
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public void updateProduct(String id, String name, int seatNumber, double price, String fuel,
            int stock, String des, double vat, int supplyId,
            int brandId, int segmentId, int styleId) {
        String sql = "UPDATE `carpipi`.`product`\n"
                + "SET\n"
                + "`name` = ?,\n"
                + "`seatNumber` = ?,\n"
                + "`price` = ?,\n"
                + "`fuel` = ?,\n"
                + "`stock` = ?,\n"
                + "`description` = ?,\n"
                + "`VAT` = ?,\n"
                + "`supplyId` = ?,\n"
                + "`brandId` = ?,\n"
                + "`segmentId` = ?,\n"
                + "`styleId` = ?\n"
                + "WHERE `productId` = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, name);
            st.setInt(2, seatNumber);
            st.setDouble(3, price);
            st.setString(4, fuel);
            st.setInt(5, stock);
            st.setString(6, des);
            st.setDouble(7, vat);
            st.setInt(8, supplyId);
            st.setInt(9, brandId);
            st.setInt(10, segmentId);
            st.setInt(11, styleId);
            st.setString(12, id);

            st.executeUpdate();
        } catch (Exception e) {
        }

    }
    
    public List<Product> getTop5ProductsByPrice() throws SQLException {
    List<Product> products = new ArrayList<>();
    String sql = "SELECT name, description, price FROM product WHERE status = 1 ORDER BY price DESC LIMIT 5";

    try (
         PreparedStatement pstmt = connection.prepareStatement(sql); 
         ResultSet rs = pstmt.executeQuery()) {
        while (rs.next()) {
            Product product = new Product();
            product.setName(rs.getString("name"));
            product.setDescription(rs.getString("description"));
            product.setPrice(rs.getDouble("price"));
            products.add(product);
        }
    }

    return products;
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
    

}
