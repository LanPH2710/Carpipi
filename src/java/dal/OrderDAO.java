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
import model.OrderDetail;
import model.Role;

/**
 *
 * @author tuana
 */
public class OrderDAO extends DBContext {

    public OrderDetail getOrderDetail(int orderDetailId) {
        OrderDetail o = new OrderDetail();
        String sql = "SELECT acc.firstName, acc.lastName, acc.mobile, acc.email, acc.gender,\n"
                + "orr.*, od.orderDetailId, od.productId, od.shipperId, od.shippingAddress,\n"
                + "p.name\n"
                + "FROM carpipi.order orr\n"
                + "Join carpipi.account acc\n"
                + "ON orr.userId = acc.userId\n"
                + "JOIN carpipi.orderdetail od\n"
                + "ON orr.orderId = od.orderId\n"
                + "Join carpipi.product p\n"
                + "ON od.productId = p.productId\n"
                + "Where od.orderDetailId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderDetailId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                o.setUserId(rs.getInt("userId"));
                o.setFirstName(rs.getString("firstName"));
                o.setLastName(rs.getString("lastName"));
                o.setMobile(rs.getString("mobile"));
                o.setEmail(rs.getString("email"));
                o.setGender(rs.getInt("gender"));
                o.setOrderId(rs.getInt("orderId"));
                o.setOrderDetailId(rs.getInt("orderDetailId"));
                o.setProductId(rs.getString("productId"));
                o.setCreateDate(rs.getString("createDate"));
                o.setOrderStatus(rs.getInt("orderStatus"));
                o.setShipperId(rs.getInt("shipperId"));
                o.setShippingAddress(rs.getString("shippingAddress"));
                o.setProductId(rs.getString("productId"));
            }

        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra console
        }

        return o;
    }

//    public Account getAccountByCar(){
//        
//    }
    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();
        o.getOrderDetail(1);
        System.out.println(o.getOrderDetail(1));
        OrderDetail oo = o.getOrderDetail(1);
        System.out.println(oo.getProductId());
    }
}
