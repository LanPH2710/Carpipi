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
import model.OrderDetail;

/**
 *
 * @author tuana
 */
public class OrderDetailDAO extends DBContext {

    public List<OrderDetail> getAllOrderDetail(int userId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        String sql = "SELECT \n"
                + "    od.quantity,\n"
                + "    od.shippingAddress,\n"
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
                + "LIMIT 0, 1000;";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId); // Thiết lập userId
            try (ResultSet rs = st.executeQuery()) { // Đưa ResultSet vào try-with-resources
                while (rs.next()) {
                    OrderDetail o = new OrderDetail(
                            rs.getInt("quantity"),
                            rs.getString("shippingAddress"),
                            rs.getString("productName"),
                            rs.getString("description"),
                            rs.getString("createDate"),
                            rs.getString("brandName"),
                            rs.getString("colorName"),
                            rs.getDouble("price"),
                            rs.getDouble("discount"),
                            rs.getString("imageUrl")
                    );
                    orderDetails.add(o);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // In lỗi ra console
        }
        return orderDetails; // Trả về danh sách OrderDetail
    }
    
      public List<OrderDetail> getAllOrderList() {
        List<OrderDetail> list = new ArrayList<>();

        String sql = "SELECT acc.firstName, \n"
                + "       acc.lastName, \n"
                + "       orr.orderId, \n"
                + "       orr.createDate, \n"
                + "       orr.totalPrice, \n"
                + "       orr.orderStatus,\n"
                + "       SUBSTRING_INDEX(GROUP_CONCAT(p.name ORDER BY od.orderId SEPARATOR ', '), ', ', 1) AS firstProductName,\n"
                + "       COUNT(od.productId) - 1 AS additionalProductCount\n"
                + "FROM carpipi.order orr\n"
                + "JOIN carpipi.account acc ON orr.userId = acc.userId\n"
                + "JOIN carpipi.orderdetail od ON orr.orderId = od.orderId\n"
                + "JOIN carpipi.product p ON od.productId = p.productId\n"
                + "GROUP BY orr.orderId";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                OrderDetail o = new OrderDetail();
                o.setOrderId(rs.getInt("orderId"));
                o.setUserId(rs.getInt("userId"));
                o.setCreateDate(rs.getString("createDate"));
                o.setFirstName(rs.getString("firstName"));
                o.setLastName(rs.getString("lastName"));
                o.setTotalPrice(rs.getDouble("totalPrice"));
                o.setOrderStatus(rs.getInt("orderStatus"));
                o.setProductId(rs.getString("productId"));
                o.setProductName(rs.getString("firstProductName"));
                o.setQuantity(rs.getInt("additionalProductCount"));
               

                list.add(o);

            }

        } catch (SQLException e) {
        }
        

        return list;

    }

    public static void main(String[] args) {
        OrderDetailDAO oddao = new OrderDetailDAO();
        List<OrderDetail> o = oddao.getAllOrderList();
        for (OrderDetail orderDetail : o) {
            System.out.println(orderDetail.getFirstName());
        }
    }
}
