package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetail1;

public class OrderDetail1DAO extends DBContext {

    public List<OrderDetail1> getAllOrderDetail(int userId) {
        List<OrderDetail1> orderDetails = new ArrayList<>();
        String sql = "SELECT \n"
                + "    od.orderDetailId,\n"
                + "    od.orderId,\n"
                + "    od.productId,\n"
                + "    od.quantity,\n"
                + "    od.discountId,\n"
                + "    od.colorId,\n"
                + "    od.isfeedback,\n"
                + "    p.name AS productName,\n"
                + "    os.description,\n"
                + "    o.createDate,\n"
                + "    b.name AS brandName,\n"
                + "    c.colorName,\n"
                + "    p.price,\n"
                + "    IFNULL(d.discount, 0) AS discount,\n"
                + "    pi.imageUrl\n"
                + "FROM \n"
                + "    orderdetail od\n"
                + "JOIN \n"
                + "    `order` o ON od.orderId = o.orderId\n"
                + "JOIN \n"
                + "    OrderStatus os ON o.orderStatus = os.statusId\n"
                + "JOIN \n"
                + "    product p ON od.productId = p.productId\n"
                + "JOIN \n"
                + "    brand b ON p.brandId = b.brandId\n"
                + "JOIN \n"
                + "    colorofcar coc ON od.productId = coc.productId AND od.colorId = coc.colorId\n"
                + "JOIN \n"
                + "    color c ON coc.colorId = c.colorId\n"
                + "LEFT JOIN \n"
                + "    discount d ON od.discountId = d.discountId AND od.productId = d.productId\n"
                + "LEFT JOIN \n"
                + "    (\n"
                + "        SELECT productId, imageUrl\n"
                + "        FROM productimage\n"
                + "        WHERE (productId, imageId) IN (\n"
                + "            SELECT productId, MIN(imageId)\n"
                + "            FROM productimage\n"
                + "            GROUP BY productId\n"
                + "        )\n"
                + "    ) pi ON p.productId = pi.productId\n"
                + "WHERE \n"
                + "    o.userId = ?\n"
                + "ORDER BY o.createDate desc\n"
                + "LIMIT 0, 1000;";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId); // Thiết lập userId
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    OrderDetail1 orderDetail = new OrderDetail1(
                            rs.getInt("orderDetailId"),
                            rs.getInt("orderId"),
                            rs.getString("productId"),
                            rs.getInt("quantity"),
                            rs.getInt("discountId"),
                            rs.getInt("colorId"),
                            rs.getInt("isfeedback"),
                            rs.getString("productName"),
                            rs.getString("description"),
                            rs.getString("createDate"),
                            rs.getString("brandName"),
                            rs.getString("colorName"),
                            rs.getDouble("price"),
                            rs.getDouble("discount"),
                            rs.getString("imageUrl")
                    );
                    orderDetails.add(orderDetail);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

    public List<OrderDetail1> getOrderDetailByStatus(int userId, int statusId) {
        List<OrderDetail1> orderDetails = new ArrayList<>();
        String sql = "SELECT \n"
                + "    od.orderDetailId,\n"
                + "    od.orderId,\n"
                + "    od.productId,\n"
                + "    od.quantity,\n"
                + "    od.discountId,\n"
                + "    od.colorId,\n"
                + "    od.isfeedback,\n"
                + "    p.name AS productName,\n"
                + "    os.description,\n"
                + "    o.createDate,\n"
                + "    b.name AS brandName,\n"
                + "    c.colorName,\n"
                + "    p.price,\n"
                + "    IFNULL(d.discount, 0) AS discount,\n"
                + "    pi.imageUrl\n"
                + "FROM \n"
                + "    orderdetail od\n"
                + "JOIN \n"
                + "    `order` o ON od.orderId = o.orderId\n"
                + "JOIN \n"
                + "    OrderStatus os ON o.orderStatus = os.statusId\n"
                + "JOIN \n"
                + "    product p ON od.productId = p.productId\n"
                + "JOIN \n"
                + "    brand b ON p.brandId = b.brandId\n"
                + "JOIN \n"
                + "    colorofcar coc ON od.productId = coc.productId AND od.colorId = coc.colorId\n"
                + "JOIN \n"
                + "    color c ON coc.colorId = c.colorId\n"
                + "LEFT JOIN \n"
                + "    discount d ON od.discountId = d.discountId AND od.productId = d.productId\n"
                + "LEFT JOIN \n"
                + "    (\n"
                + "        SELECT productId, imageUrl\n"
                + "        FROM productimage\n"
                + "        WHERE (productId, imageId) IN (\n"
                + "            SELECT productId, MIN(imageId)\n"
                + "            FROM productimage\n"
                + "            GROUP BY productId\n"
                + "        )\n"
                + "    ) pi ON p.productId = pi.productId\n"
                + "WHERE \n"
                + "    o.userId = ? and o.orderStatus = ?\n"
                + "ORDER BY o.createDate desc\n"
                + "LIMIT 0, 1000;";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            st.setInt(2, statusId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    OrderDetail1 orderDetail = new OrderDetail1(
                            rs.getInt("orderDetailId"),
                            rs.getInt("orderId"),
                            rs.getString("productId"),
                            rs.getInt("quantity"),
                            rs.getInt("discountId"),
                            rs.getInt("colorId"),
                            rs.getInt("isfeedback"),
                            rs.getString("productName"),
                            rs.getString("description"),
                            rs.getString("createDate"),
                            rs.getString("brandName"),
                            rs.getString("colorName"),
                            rs.getDouble("price"),
                            rs.getDouble("discount"),
                            rs.getString("imageUrl")
                    );
                    orderDetails.add(orderDetail);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

    public List<OrderDetail1> getOrderDetailName(int userId, String keyword) {
        List<OrderDetail1> orderDetails = new ArrayList<>();
        String sql = "SELECT \n"
                + "    od.orderDetailId,\n"
                + "    od.orderId,\n"
                + "    od.productId,\n"
                + "    od.quantity,\n"
                + "    od.discountId,\n"
                + "    od.colorId,\n"
                + "    od.isfeedback,\n"
                + "    p.name AS productName,\n"
                + "    os.description,\n"
                + "    o.createDate,\n"
                + "    b.name AS brandName,\n"
                + "    c.colorName,\n"
                + "    p.price,\n"
                + "    IFNULL(d.discount, 0) AS discount,\n"
                + "    pi.imageUrl\n"
                + "FROM \n"
                + "    orderdetail od\n"
                + "JOIN \n"
                + "    `order` o ON od.orderId = o.orderId\n"
                + "JOIN \n"
                + "    OrderStatus os ON o.orderStatus = os.statusId\n"
                + "JOIN \n"
                + "    product p ON od.productId = p.productId\n"
                + "JOIN \n"
                + "    brand b ON p.brandId = b.brandId\n"
                + "JOIN \n"
                + "    colorofcar coc ON od.productId = coc.productId AND od.colorId = coc.colorId\n"
                + "JOIN \n"
                + "    color c ON coc.colorId = c.colorId\n"
                + "LEFT JOIN \n"
                + "    discount d ON od.discountId = d.discountId AND od.productId = d.productId\n"
                + "LEFT JOIN \n"
                + "    (\n"
                + "        SELECT productId, imageUrl\n"
                + "        FROM productimage\n"
                + "        WHERE (productId, imageId) IN (\n"
                + "            SELECT productId, MIN(imageId)\n"
                + "            FROM productimage\n"
                + "            GROUP BY productId\n"
                + "        )\n"
                + "    ) pi ON p.productId = pi.productId\n"
                + "WHERE \n"
                + "    o.userId = ? and p.name like ?\n"
                + "ORDER BY o.createDate desc\n"
                + "LIMIT 0, 1000;";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            st.setString(2, "%" + keyword + "%");
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    OrderDetail1 orderDetail = new OrderDetail1(
                            rs.getInt("orderDetailId"),
                            rs.getInt("orderId"),
                            rs.getString("productId"),
                            rs.getInt("quantity"),
                            rs.getInt("discountId"),
                            rs.getInt("colorId"),
                            rs.getInt("isfeedback"),
                            rs.getString("productName"),
                            rs.getString("description"),
                            rs.getString("createDate"),
                            rs.getString("brandName"),
                            rs.getString("colorName"),
                            rs.getDouble("price"),
                            rs.getDouble("discount"),
                            rs.getString("imageUrl")
                    );
                    orderDetails.add(orderDetail);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

    public List<OrderDetail1> getShipOrder() {
        List<OrderDetail1> orderDetails = new ArrayList<>();
        String sql = "SELECT \n"
                + "    od.orderDetailId,\n"
                + "    od.orderId,\n"
                + "    od.productId,\n"
                + "    od.quantity,\n"
                + "    od.discountId,\n"
                + "    od.colorId,\n"
                + "    od.isfeedback,\n"
                + "    p.name AS productName,\n"
                + "    os.description,\n"
                + "    o.createDate,\n"
                + "    b.name AS brandName,\n"
                + "    c.colorName,\n"
                + "    p.price,\n"
                + "    IFNULL(d.discount, 0) AS discount,\n"
                + "    pi.imageUrl\n"
                + "FROM \n"
                + "    orderdetail od\n"
                + "JOIN \n"
                + "    `order` o ON od.orderId = o.orderId\n"
                + "JOIN \n"
                + "    OrderStatus os ON o.orderStatus = os.statusId\n"
                + "JOIN \n"
                + "    product p ON od.productId = p.productId\n"
                + "JOIN \n"
                + "    brand b ON p.brandId = b.brandId\n"
                + "JOIN \n"
                + "    colorofcar coc ON od.productId = coc.productId AND od.colorId = coc.colorId\n"
                + "JOIN \n"
                + "    color c ON coc.colorId = c.colorId\n"
                + "LEFT JOIN \n"
                + "    discount d ON od.discountId = d.discountId AND od.productId = d.productId\n"
                + "LEFT JOIN \n"
                + "    (\n"
                + "        SELECT productId, imageUrl\n"
                + "        FROM productimage\n"
                + "        WHERE (productId, imageId) IN (\n"
                + "            SELECT productId, MIN(imageId)\n"
                + "            FROM productimage\n"
                + "            GROUP BY productId\n"
                + "        )\n"
                + "    ) pi ON p.productId = pi.productId\n"
                + "WHERE \n"
                + "   o.orderStatus IN (2, 3, 4)\n"
                + "ORDER BY o.createDate DESC\n"
                + "LIMIT 0, 1000;";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                OrderDetail1 orderDetail = new OrderDetail1(
                        rs.getInt("orderDetailId"),
                        rs.getInt("orderId"),
                        rs.getString("productId"),
                        rs.getInt("quantity"),
                        rs.getInt("discountId"),
                        rs.getInt("colorId"),
                        rs.getInt("isfeedback"),
                        rs.getString("productName"),
                        rs.getString("description"),
                        rs.getString("createDate"),
                        rs.getString("brandName"),
                        rs.getString("colorName"),
                        rs.getDouble("price"),
                        rs.getDouble("discount"),
                        rs.getString("imageUrl")
                );
                orderDetails.add(orderDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

    public List<OrderDetail1> getShipOrderByStatus(int statusId) {
        List<OrderDetail1> orderDetails = new ArrayList<>();
        String sql = "SELECT \n"
                + "    od.orderDetailId,\n"
                + "    od.orderId,\n"
                + "    od.productId,\n"
                + "    od.quantity,\n"
                + "    od.discountId,\n"
                + "    od.colorId,\n"
                + "    od.isfeedback,\n"
                + "    p.name AS productName,\n"
                + "    os.description,\n"
                + "    o.createDate,\n"
                + "    b.name AS brandName,\n"
                + "    c.colorName,\n"
                + "    p.price,\n"
                + "    IFNULL(d.discount, 0) AS discount,\n"
                + "    pi.imageUrl\n"
                + "FROM \n"
                + "    orderdetail od\n"
                + "JOIN \n"
                + "    `order` o ON od.orderId = o.orderId\n"
                + "JOIN \n"
                + "    OrderStatus os ON o.orderStatus = os.statusId\n"
                + "JOIN \n"
                + "    product p ON od.productId = p.productId\n"
                + "JOIN \n"
                + "    brand b ON p.brandId = b.brandId\n"
                + "JOIN \n"
                + "    colorofcar coc ON od.productId = coc.productId AND od.colorId = coc.colorId\n"
                + "JOIN \n"
                + "    color c ON coc.colorId = c.colorId\n"
                + "LEFT JOIN \n"
                + "    discount d ON od.discountId = d.discountId AND od.productId = d.productId\n"
                + "LEFT JOIN \n"
                + "    (\n"
                + "        SELECT productId, imageUrl\n"
                + "        FROM productimage\n"
                + "        WHERE (productId, imageId) IN (\n"
                + "            SELECT productId, MIN(imageId)\n"
                + "            FROM productimage\n"
                + "            GROUP BY productId\n"
                + "        )\n"
                + "    ) pi ON p.productId = pi.productId\n"
                + "WHERE \n"
                + "   o.orderStatus = ?\n"
                + "ORDER BY o.createDate DESC\n"
                + "LIMIT 0, 1000;";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            // Thiết lập tham số cho PreparedStatement
            st.setInt(1, statusId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    OrderDetail1 orderDetail = new OrderDetail1(
                            rs.getInt("orderDetailId"),
                            rs.getInt("orderId"),
                            rs.getString("productId"),
                            rs.getInt("quantity"),
                            rs.getInt("discountId"),
                            rs.getInt("colorId"),
                            rs.getInt("isfeedback"),
                            rs.getString("productName"),
                            rs.getString("description"),
                            rs.getString("createDate"),
                            rs.getString("brandName"),
                            rs.getString("colorName"),
                            rs.getDouble("price"),
                            rs.getDouble("discount"),
                            rs.getString("imageUrl")
                    );
                    orderDetails.add(orderDetail);
                }
            }
        } catch (SQLException e) {
            // Ghi log lỗi hoặc xử lý lỗi ở cấp cao hơn
            // Logger.getLogger(YourClass.class.getName()).log(Level.SEVERE, null, e);
            e.printStackTrace();
        }
        return orderDetails;
    }

    public List<OrderDetail1> getShipOrderBySearch(String keyword) {
    List<OrderDetail1> orderDetails = new ArrayList<>();
    String sql = "SELECT \n"
            + "    od.orderDetailId,\n"
            + "    od.orderId,\n"
            + "    od.productId,\n"
            + "    od.quantity,\n"
            + "    od.discountId,\n"
            + "    od.colorId,\n"
            + "    od.isfeedback,\n"
            + "    p.name AS productName,\n"
            + "    os.description,\n"
            + "    o.createDate,\n"
            + "    b.name AS brandName,\n"
            + "    c.colorName,\n"
            + "    p.price,\n"
            + "    IFNULL(d.discount, 0) AS discount,\n"
            + "    pi.imageUrl\n"
            + "FROM \n"
            + "    orderdetail od\n"
            + "JOIN \n"
            + "    `order` o ON od.orderId = o.orderId\n"
            + "JOIN \n"
            + "    OrderStatus os ON o.orderStatus = os.statusId\n"
            + "JOIN \n"
            + "    product p ON od.productId = p.productId\n"
            + "JOIN \n"
            + "    brand b ON p.brandId = b.brandId\n"
            + "JOIN \n"
            + "    colorofcar coc ON od.productId = coc.productId AND od.colorId = coc.colorId\n"
            + "JOIN \n"
            + "    color c ON coc.colorId = c.colorId\n"
            + "LEFT JOIN \n"
            + "    discount d ON od.discountId = d.discountId AND od.productId = d.discountId\n"
            + "LEFT JOIN \n"
            + "    (\n"
            + "        SELECT productId, imageUrl\n"
            + "        FROM productimage\n"
            + "        WHERE (productId, imageId) IN (\n"
            + "            SELECT productId, MIN(imageId)\n"
            + "            FROM productimage\n"
            + "            GROUP BY productId\n"
            + "        )\n"
            + "    ) pi ON p.productId = pi.productId\n"
            + "WHERE \n"
            + "   p.name LIKE ?\n"
            + "ORDER BY o.createDate DESC\n"
            + "LIMIT 0, 1000;";

    try (PreparedStatement st = connection.prepareStatement(sql)) {
        // Thiết lập tham số cho PreparedStatement với ký tự đại diện
        st.setString(1, "%" + keyword + "%"); // Thêm ký tự đại diện
        try (ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                OrderDetail1 orderDetail = new OrderDetail1(
                        rs.getInt("orderDetailId"),
                        rs.getInt("orderId"),
                        rs.getString("productId"),
                        rs.getInt("quantity"),
                        rs.getInt("discountId"),
                        rs.getInt("colorId"),
                        rs.getInt("isfeedback"),
                        rs.getString("productName"),
                        rs.getString("description"),
                        rs.getString("createDate"),
                        rs.getString("brandName"),
                        rs.getString("colorName"),
                        rs.getDouble("price"),
                        rs.getDouble("discount"),
                        rs.getString("imageUrl")
                );
                orderDetails.add(orderDetail);
            }
        }
    } catch (SQLException e) {
        // Ghi log lỗi hoặc xử lý lỗi ở cấp cao hơn
        // Logger.getLogger(YourClass.class.getName()).log(Level.SEVERE, null, e);
        e.printStackTrace();
    }
    return orderDetails;
}


    public void updateFeedbackOrder(int id) {
        String sql = "UPDATE orderdetail SET isfeedback = 1 WHERE orderDetailId = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);  // Thiết lập giá trị orderDetailId
            st.executeUpdate();  // Thực thi truy vấn
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateOrderStatus(int orderId, int orderStatus) {
        String query = "UPDATE `order` SET orderStatus = ? WHERE orderId = ?;";
        try (PreparedStatement st = connection.prepareStatement(query)) {
            st.setInt(1, orderStatus);
            st.setInt(2, orderId);
            st.executeUpdate(); // Gọi phương thức này để thực hiện cập nhật
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<OrderDetail1> getMyOrderListByPage(List<OrderDetail1> order, int start, int end) {
        ArrayList<OrderDetail1> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(order.get(i));
        }
        return arr;
    }

}
