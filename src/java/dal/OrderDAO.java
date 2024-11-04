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
import model.Account;
import model.Order;
import model.OrderDetail;
import model.OrderStatus;
import model.Role;

/**
 *
 * @author tuana
 */
public class OrderDAO extends DBContext {

    public List<OrderStatus> getListOrderStatus() {

        List<OrderStatus> listStatus = new ArrayList<>();

        String sql = "SELECT * FROM carpipi.orderstatus";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderStatus os = new OrderStatus();

                os.setStatusId(rs.getInt("statusId"));
                os.setStatusName(rs.getString("statusName"));
                os.setDescription(rs.getString("description"));

                listStatus.add(os);

            }
        } catch (Exception e) {
        }

        return listStatus;
    }

    public Order getOrderById(int orderId) {
        Order o = new Order();

        String sql = "SELECT * FROM carpipi.order WHERE orderId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId); // Thay đổi từ setString sang setInt cho orderId
            ResultSet rs = st.executeQuery();

            if (rs.next()) { // Sử dụng if thay vì while vì chỉ có một kết quả
                o.setOrderId(rs.getInt("orderId"));
                o.setOrderDeliverCode(rs.getString("orderDeliverCode"));
                o.setUserId(rs.getObject("userId") != null ? rs.getInt("userId") : null); // Sử dụng rs.getObject() để kiểm tra null
                o.setOrderName(rs.getString("orderName"));
                o.setOrderEmail(rs.getString("orderEmail"));
                o.setOrderPhone(rs.getString("orderPhone"));
                o.setTotalPrice(rs.getBigDecimal("totalPrice")); // Sử dụng BigDecimal cho totalPrice
                o.setNote(rs.getString("note"));
                o.setSaleId(rs.getInt("saleId"));
                o.setShipperId(rs.getObject("shipperId") != null ? rs.getInt("shipperId") : null); // Tương tự cho shipperId
                o.setCreateDate(rs.getDate("createDate")); // Sử dụng rs.getDate() cho createDate
                o.setShippingAddress(rs.getString("shippingAddress"));
                o.setOrderStatus(rs.getInt("orderStatus"));
            }
        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi để kiểm tra dễ hơn
        }

        return o;
    }

    public List<OrderDetail> getListOrderdetailById(String orderId) {
        List<OrderDetail> list = new ArrayList<>();

        String sql = "SELECT acc.firstName, acc.lastName, acc.mobile, acc.email, acc.gender,\n"
                + "       orr.orderId, orr.orderDeliverCode, orr.userId, orr.createDate, orr.totalPrice, orr.orderStatus,\n"
                + "       od.productId, od.quantity, od.shippingAddress, od.discountId, od.colorId,\n"
                + "       p.name AS productName, p.price AS productPrice, MIN(pri.imageUrl) AS imageUrl\n"
                + "FROM carpipi.order orr\n"
                + "JOIN carpipi.account acc ON orr.userId = acc.userId\n"
                + "JOIN carpipi.orderdetail od ON orr.orderId = od.orderId\n"
                + "JOIN carpipi.product p ON od.productId = p.productId\n"
                + "JOIN carpipi.productImage pri ON pri.productId = p.productId\n"
                + "WHERE od.orderId = ?\n"
                + "GROUP BY acc.firstName, acc.lastName, acc.mobile, acc.email, acc.gender,\n"
                + "         orr.orderId, od.productId, od.quantity, od.shippingAddress, od.discountId, od.colorId,\n"
                + "         p.name, p.price;";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, orderId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                OrderDetail o = new OrderDetail();
                o.setUserId(rs.getInt("userId"));
                o.setFirstName(rs.getString("firstName"));
                o.setLastName(rs.getString("lastName"));
                o.setOrderId(rs.getInt("orderId"));
                o.setProductId(rs.getString("productId"));
                o.setProductName(rs.getString("productName"));
                o.setQuantity(rs.getInt("quantity"));
                o.setShippingAddress(rs.getString("shippingAddress"));
                o.setDiscount(rs.getDouble("discountId")); // Nếu discountId là kiểu double
                o.setColorId(rs.getInt("colorId"));
                o.setImageUrl(rs.getString("imageUrl"));
                o.setCreateDate(rs.getDate("createDate")); // Thay đổi kiểu Date

                list.add(o);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Ghi lại lỗi
        }

        return list;
    }

    public List<OrderDetail> getAllOrderList() {
        List<OrderDetail> list = new ArrayList<>();

        String sql = "SELECT acc.userId, acc.firstName, acc.lastName, orr.orderId, orr.createDate, orr.totalPrice, orr.saleId, orr.orderName,"
                + "orr.orderStatus, "
                + "SUBSTRING_INDEX(GROUP_CONCAT(p.name ORDER BY od.orderId SEPARATOR ', '), ', ', 1) AS firstProductName, "
                + "COUNT(od.productId) - 1 AS additionalProductCount "
                + "FROM carpipi.order orr "
                + "JOIN carpipi.account acc ON orr.userId = acc.userId "
                + "JOIN carpipi.orderdetail od ON orr.orderId = od.orderId "
                + "JOIN carpipi.product p ON od.productId = p.productId "
                + "GROUP BY orr.orderId";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                System.out.println("Record found: " + rs.getInt("orderId")); // Kiểm tra xem có bản ghi nào trả về

                OrderDetail o = new OrderDetail();
                o.setOrderId(rs.getInt("orderId"));
                o.setUserId(rs.getInt("userId")); // Đảm bảo userId có trong truy vấn SQL nếu cần
                o.setCreateDate(rs.getDate("createDate")); // Thay đổi kiểu Date
                o.setOrderName(rs.getString("orderName"));
                o.setTotalPrice(rs.getDouble("totalPrice"));
                o.setOrderStatus(rs.getInt("orderStatus"));
                o.setProductName(rs.getString("firstProductName"));
                o.setQuantity(rs.getInt("additionalProductCount"));

                list.add(o);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Ghi lại lỗi để dễ dàng gỡ lỗi
        }

        if (list.isEmpty()) {
            System.out.println("No records found.");
        }

        return list;
    }

    public int getOrderCount() {
        int orderCount = 0;
        String query = "SELECT COUNT(*) AS order_count FROM `order`"; // Enclose 'order' in backticks

        try (PreparedStatement statement = connection.prepareStatement(query); ResultSet resultSet = statement.executeQuery()) {

            if (resultSet.next()) {
                orderCount = resultSet.getInt("order_count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderCount;
    }
    /// Manhhuy-----------------------------------------------------------------------------------------------------//

    public List<OrderDetail> getOrderInforById(String orderId) {
        List<OrderDetail> list = new ArrayList<>();

        String sql = "SELECT acc.firstName, acc.lastName, acc.mobile, acc.email, acc.gender, "
                + "orr.orderId, orr.orderDeliverCode, orr.userId, orr.orderName, orr.orderEmail, "
                + "orr.orderPhone, orr.totalPrice, orr.note, orr.saleId, orr.shipperId, "
                + "orr.createDate, orr.shippingAddress, orr.orderStatus, "
                + "os.description AS orderStatusDescription, "
                + "od.orderDetailId, od.productId, od.quantity, od.discountId, od.colorId, od.isfeedback, "
                + "p.name AS productName, p.price AS productPrice, MIN(pri.imageUrl) AS imageUrl "
                + "FROM carpipi.order orr "
                + "JOIN carpipi.account acc ON orr.userId = acc.userId "
                + "JOIN carpipi.orderdetail od ON orr.orderId = od.orderId "
                + "JOIN carpipi.product p ON od.productId = p.productId "
                + "JOIN carpipi.productImage pri ON pri.productId = p.productId "
                + "JOIN carpipi.orderStatus os ON orr.orderStatus = os.statusId "
                + "WHERE od.orderId = ? "
                + "GROUP BY acc.firstName, acc.lastName, acc.mobile, acc.email, acc.gender, "
                + "orr.orderId, orr.orderDeliverCode, orr.userId, orr.orderName, orr.orderEmail, "
                + "orr.orderPhone, orr.totalPrice, orr.note, orr.saleId, orr.shipperId, "
                + "orr.createDate, orr.shippingAddress, orr.orderStatus, os.description, "
                + "od.orderDetailId, od.productId, od.quantity, od.discountId, od.colorId, od.isfeedback, "
                + "p.name, p.price";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, orderId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                OrderDetail o = new OrderDetail();
                o.setUserId(rs.getInt("userId"));
                o.setFirstName(rs.getString("firstName"));
                o.setLastName(rs.getString("lastName"));
                o.setMobile(rs.getString("mobile"));
                o.setEmail(rs.getString("email"));
                o.setGender(rs.getInt("gender"));
                o.setOrderId(rs.getInt("orderId"));
                o.setOrderDeliverCode(rs.getString("orderDeliverCode"));
                o.setOrderName(rs.getString("orderName"));
                o.setOrderEmail(rs.getString("orderEmail"));
                o.setOrderPhone(rs.getString("orderPhone"));
                o.setTotalPrice(rs.getDouble("totalPrice"));
                o.setNote(rs.getString("note"));
                o.setSaleId(rs.getInt("saleId"));
                o.setShipperId(rs.getInt("shipperId"));
                o.setCreateDate(rs.getDate("createDate"));
                o.setShippingAddress(rs.getString("shippingAddress"));
                o.setOrderStatus(rs.getInt("orderStatus"));
                o.setOrderStatusDescription(rs.getString("orderStatusDescription")); // Set thêm trường mới
                o.setOrderDetailId(rs.getInt("orderDetailId"));
                o.setProductId(rs.getString("productId"));
                o.setQuantity(rs.getInt("quantity"));
                o.setDiscount(rs.getDouble("discountId"));
                o.setColorId(rs.getInt("colorId"));
                o.setIsFeedback(rs.getInt("isfeedback"));
                o.setProductName(rs.getString("productName"));
                o.setProductPrice(rs.getDouble("productPrice"));
                o.setImageUrl(rs.getString("imageUrl"));

                list.add(o);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Ghi lại lỗi
        }

        return list;
    }

    public List<OrderDetail> getOrderInforByIdDetail(String orderId, String orderDetailId) {
        List<OrderDetail> list = new ArrayList<>();

        String sql = "SELECT acc.firstName, acc.lastName, acc.mobile, acc.email, acc.gender, "
                + "orr.orderId, orr.orderDeliverCode, orr.userId, orr.orderName, orr.orderEmail, "
                + "orr.orderPhone, orr.totalPrice, orr.note, orr.saleId, orr.shipperId, "
                + "orr.createDate, orr.shippingAddress, orr.orderStatus, "
                + "os.description AS orderStatusDescription, "
                + "od.orderDetailId, od.productId, od.quantity, od.discountId, od.colorId, od.isfeedback, "
                + "p.name AS productName, p.price AS productPrice, MIN(pri.imageUrl) AS imageUrl "
                + "FROM carpipi.order orr "
                + "JOIN carpipi.account acc ON orr.userId = acc.userId "
                + "JOIN carpipi.orderdetail od ON orr.orderId = od.orderId "
                + "JOIN carpipi.product p ON od.productId = p.productId "
                + "JOIN carpipi.productImage pri ON pri.productId = p.productId "
                + "JOIN carpipi.orderStatus os ON orr.orderStatus = os.statusId "
                + "WHERE od.orderId = ? AND od.orderDetailId = ? " // Thêm điều kiện lọc orderDetailId
                + "GROUP BY acc.firstName, acc.lastName, acc.mobile, acc.email, acc.gender, "
                + "orr.orderId, orr.orderDeliverCode, orr.userId, orr.orderName, orr.orderEmail, "
                + "orr.orderPhone, orr.totalPrice, orr.note, orr.saleId, orr.shipperId, "
                + "orr.createDate, orr.shippingAddress, orr.orderStatus, os.description, "
                + "od.orderDetailId, od.productId, od.quantity, od.discountId, od.colorId, od.isfeedback, "
                + "p.name, p.price";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, orderId);
            st.setString(2, orderDetailId); // Set orderDetailId

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                OrderDetail o = new OrderDetail();
                o.setUserId(rs.getInt("userId"));
                o.setFirstName(rs.getString("firstName"));
                o.setLastName(rs.getString("lastName"));
                o.setMobile(rs.getString("mobile"));
                o.setEmail(rs.getString("email"));
                o.setGender(rs.getInt("gender"));
                o.setOrderId(rs.getInt("orderId"));
                o.setOrderDeliverCode(rs.getString("orderDeliverCode"));
                o.setOrderName(rs.getString("orderName"));
                o.setOrderEmail(rs.getString("orderEmail"));
                o.setOrderPhone(rs.getString("orderPhone"));
                o.setTotalPrice(rs.getDouble("totalPrice"));
                o.setNote(rs.getString("note"));
                o.setSaleId(rs.getInt("saleId"));
                o.setShipperId(rs.getInt("shipperId"));
                o.setCreateDate(rs.getDate("createDate"));
                o.setShippingAddress(rs.getString("shippingAddress"));
                o.setOrderStatus(rs.getInt("orderStatus"));
                o.setOrderStatusDescription(rs.getString("orderStatusDescription"));
                o.setOrderDetailId(rs.getInt("orderDetailId"));
                o.setProductId(rs.getString("productId"));
                o.setQuantity(rs.getInt("quantity"));
                o.setDiscount(rs.getDouble("discountId"));
                o.setColorId(rs.getInt("colorId"));
                o.setIsFeedback(rs.getInt("isfeedback"));
                o.setProductName(rs.getString("productName"));
                o.setProductPrice(rs.getDouble("productPrice"));
                o.setImageUrl(rs.getString("imageUrl"));

                list.add(o);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Ghi lại lỗi
        }

        return list;
    }

    /// Manhhuy-----------------------------------------------------------------------------------------------------//
//son--------------//
    

    public List<OrderDetail> getListOrderWithStatus(String status) {
        List<OrderDetail> list = new ArrayList();

        String sql = "SELECT acc.userId, acc.firstName, acc.lastName, orr.orderId, orr.createDate, orr.totalPrice, orr.saleId,\n"
                + "orr.orderStatus, SUBSTRING_INDEX(GROUP_CONCAT(p.name ORDER BY od.orderId SEPARATOR ', '), ', ', 1) AS firstProductName, \n"
                + "COUNT(od.productId) - 1 AS additionalProductCount \n"
                + "FROM carpipi.order orr \n"
                + "JOIN carpipi.account acc ON orr.userId = acc.userId \n"
                + "JOIN carpipi.orderdetail od ON orr.orderId = od.orderId \n"
                + "JOIN carpipi.product p ON od.productId = p.productId \n"
                + "Where orr.orderStatus = ?\n"
                + "GROUP BY orr.orderId";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                System.out.println("Record found: " + rs.getInt("orderStatus")); // Kiểm tra xem có bản ghi nào trả về

                OrderDetail o = new OrderDetail();
                o.setOrderId(rs.getInt("orderId"));
                o.setUserId(rs.getInt("userId")); // Đảm bảo userId có trong truy vấn SQL nếu cần
                o.setSaleId(rs.getInt("saleId"));
                o.setCreateDate(rs.getDate("createDate"));
                o.setFirstName(rs.getString("firstName"));
                o.setLastName(rs.getString("lastName"));
                o.setTotalPrice(rs.getDouble("totalPrice"));
                o.setOrderStatus(rs.getInt("orderStatus"));
                o.setProductName(rs.getString("firstProductName"));
                o.setQuantity(rs.getInt("additionalProductCount"));

                list.add(o);
            }

        } catch (Exception e) {
        }

        return list;
    }

    public List<OrderDetail> getListOrderWithSearch(String search) {
        List<OrderDetail> list = new ArrayList();
        String sql = "SELECT acc.userId, acc.firstName, acc.lastName, orr.orderId, orr.createDate, orr.totalPrice, orr.saleId,\n"
                + "orr.orderStatus, SUBSTRING_INDEX(GROUP_CONCAT(p.name ORDER BY od.orderId SEPARATOR ', '), ', ', 1) AS firstProductName, \n"
                + "COUNT(od.productId) - 1 AS additionalProductCount \n"
                + "FROM carpipi.order orr \n"
                + "JOIN carpipi.account acc ON orr.userId = acc.userId \n"
                + "JOIN carpipi.orderdetail od ON orr.orderId = od.orderId \n"
                + "JOIN carpipi.product p ON od.productId = p.productId \n"
                + "Where orr.orderStatus = ? or acc.firstName Like ? or acc.lastName Like ?\n"
                + "GROUP BY orr.orderId";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, search);  // Order status
            st.setString(2, "%" + search + "%");  // First name
            st.setString(3, "%" + search + "%");  // Last name

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                System.out.println("Record found: " + rs.getInt("firstName")); // Kiểm tra xem có bản ghi nào trả về

                OrderDetail o = new OrderDetail();
                o.setOrderId(rs.getInt("orderId"));
                o.setUserId(rs.getInt("userId")); // Đảm bảo userId có trong truy vấn SQL nếu cần
                o.setSaleId(rs.getInt("saleId"));
                o.setCreateDate(rs.getDate("createDate"));
                o.setFirstName(rs.getString("firstName"));
                o.setLastName(rs.getString("lastName"));
                o.setTotalPrice(rs.getDouble("totalPrice"));
                o.setOrderStatus(rs.getInt("orderStatus"));
                o.setProductName(rs.getString("firstProductName"));
                o.setQuantity(rs.getInt("additionalProductCount"));

                list.add(o);
            }

        } catch (SQLException e) {
            e.printStackTrace();  // In ra lỗi khi có vấn đề xảy ra

        }

        return list;
    }

    public double getTotalPrice() {
        double total = 0;
        String query = "SELECT SUM(totalPrice) AS total_order_price \n"
                + "FROM `order` where orderStatus= 4";
        try (PreparedStatement statement = connection.prepareStatement(query); ResultSet resultSet = statement.executeQuery()) {

            if (resultSet.next()) {
                total = resultSet.getDouble("total_order_price");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

//son--------------//   
    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();
        int orderCount = o.getOrderCount();
        System.out.println("Số lượng order: " + orderCount);
        List<OrderDetail> l = o.getOrderInforById("1");
        for (OrderDetail orderDetail : l) {
            System.out.println(orderDetail.getProductName());
        }

    }
}
