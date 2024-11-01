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

    public OrderDetail getOrderDetail(int orderId) {
        OrderDetail o = new OrderDetail();
        String sql = "SELECT acc.firstName, acc.lastName, acc.mobile, acc.email, acc.gender,\n"
                + "orr.*, od.productId, od.shippingAddress, od.discountId, od.colorId,\n"
                + "p.name\n"
                + "FROM carpipi.order orr\n"
                + "Join carpipi.account acc\n"
                + "ON orr.userId = acc.userId\n"
                + "JOIN carpipi.orderdetail od\n"
                + "ON orr.orderId = od.orderId\n"
                + "Join carpipi.product p\n"
                + "ON od.productId = p.productId\n"
                + "Where od.orderId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                o.setUserId(rs.getInt("userId"));
                o.setFirstName(rs.getString("firstName"));
                o.setLastName(rs.getString("lastName"));
                o.setMobile(rs.getString("mobile"));
                o.setEmail(rs.getString("email"));
                o.setGender(rs.getInt("gender"));
                o.setOrderId(rs.getInt("orderId"));
                o.setProductId(rs.getString("productId"));
                o.setCreateDate(rs.getString("createDate"));
                o.setNote(rs.getString("note"));
                o.setOrderStatus(rs.getInt("orderStatus"));
                o.setSaleId(rs.getInt("saleId"));
                o.setShipperId(rs.getInt("shipperId"));
                o.setShippingAddress(rs.getString("shippingAddress"));
                o.setQuantity(rs.getInt("quantity"));
                o.setDiscountId(rs.getInt("discountId"));
                o.setColorId(rs.getInt("colorId"));

            }

        } catch (SQLException e) {
            e.printStackTrace(); // In lỗi ra console
        }

        return o;
    }

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

        } catch (Exception e) {
        }

        return list;
    }

    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();

        List<OrderDetail> l = o.getListOrderdetailById("1");
        for (OrderDetail orderDetail : l) {
            System.out.println(orderDetail.getImageUrl());
        }

    }
}
