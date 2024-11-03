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

    public Order getOrderById(String orderId) {
        Order o = new Order();

        String sql = "SELECT * FROM carpipi.order WHERE orderId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, orderId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                o.setUserId(rs.getInt("userId"));
                o.setFirstName(rs.getString("firstName"));
                o.setLastName(rs.getString("lastName"));
                o.setMobile(rs.getString("mobile"));
                o.setEmail(rs.getString("email"));
                o.setGender(rs.getInt("gender"));
                o.setOrderId(rs.getInt("orderId"));
                o.setCreateDate(rs.getString("createDate"));
                o.setNote(rs.getString("note"));
                o.setOrderStatus(rs.getInt("orderStatus"));
                o.setSaleId(rs.getInt("saleId"));
                o.setShipperId(rs.getInt("shipperId"));

            }
        } catch (Exception e) {
        }

        return o;
    }

    public List<OrderDetail> getListOrderdetailById(String orderId) {
        List<OrderDetail> list = new ArrayList<>();

        String sql = "SELECT acc.firstName, acc.lastName, acc.mobile, acc.email, acc.gender,\n"
                + "       orr.*, od.productId, od.quantity, od.shippingAddress, od.discountId, od.colorId,\n"
                + "       p.name, p.price, MIN(pri.imageUrl) AS imageUrl\n"
                + "FROM carpipi.order orr\n"
                + "JOIN carpipi.account acc\n"
                + "ON orr.userId = acc.userId\n"
                + "JOIN carpipi.orderdetail od\n"
                + "ON orr.orderId = od.orderId\n"
                + "JOIN carpipi.product p\n"
                + "ON od.productId = p.productId\n"
                + "JOIN carpipi.productImage pri\n"
                + "ON pri.productId = p.productId\n"
                + "WHERE od.orderId = ?\n"
                + "GROUP BY acc.firstName, acc.lastName, acc.mobile, acc.email, acc.gender,\n"
                + "         orr.orderId, od.productId, od.quantity, od.shippingAddress, od.discountId, od.colorId,\n"
                + "         p.name, p.price;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
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
                o.setProductId(rs.getString("productId"));
                o.setProductName(rs.getString("name"));
                o.setPrice(rs.getDouble("p.price"));
                o.setCreateDate(rs.getString("createDate"));
                o.setNote(rs.getString("note"));
                o.setOrderStatus(rs.getInt("orderStatus"));
                o.setSaleId(rs.getInt("saleId"));
                o.setShipperId(rs.getInt("shipperId"));
                o.setShippingAddress(rs.getString("shippingAddress"));
                o.setQuantity(rs.getInt("quantity"));
                o.setDiscountId(rs.getInt("discountId"));
                o.setImageUrl(rs.getString("imageUrl"));
                o.setColorId(rs.getInt("colorId"));

                list.add(o);

            }

        } catch (SQLException e) {
        }

        return list;
    }

    public List<OrderDetail> getAllOrderList() {
        List<OrderDetail> list = new ArrayList<>();

        String sql = "SELECT acc.userId, acc.firstName, acc.lastName, orr.orderId, orr.createDate, orr.totalPrice, "
                + "orr.orderStatus, SUBSTRING_INDEX(GROUP_CONCAT(p.name ORDER BY od.orderId SEPARATOR ', '), ', ', 1) AS firstProductName, "
                + "COUNT(od.productId) - 1 AS additionalProductCount "
                + "FROM carpipi.order orr "
                + "JOIN carpipi.account acc ON orr.userId = acc.userId "
                + "JOIN carpipi.orderdetail od ON orr.orderId = od.orderId "
                + "JOIN carpipi.product p ON od.productId = p.productId "
                + "GROUP BY orr.orderId";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                System.out.println("Record found: " + rs.getInt("orderId")); // Kiểm tra xem có bản ghi nào trả về

                OrderDetail o = new OrderDetail();
                o.setOrderId(rs.getInt("orderId"));
                o.setUserId(rs.getInt("userId")); // Đảm bảo userId có trong truy vấn SQL nếu cần
                o.setCreateDate(rs.getString("createDate"));
                o.setFirstName(rs.getString("firstName"));
                o.setLastName(rs.getString("lastName"));
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

    try (PreparedStatement statement = connection.prepareStatement(query);
         ResultSet resultSet = statement.executeQuery()) {

        if (resultSet.next()) {
            orderCount = resultSet.getInt("order_count");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return orderCount;
}

        
    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();
        int orderCount = o.getOrderCount();
        System.out.println("Số lượng order: " + orderCount);
        List<OrderDetail> l = o.getAllOrderList();
        for (OrderDetail orderDetail : l) {
            System.out.println(orderDetail.getFirstName());
        }

    }
}
