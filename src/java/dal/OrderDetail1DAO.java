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
                + "    od.orderId,\n"
                + "    od.productId,\n"
                + "    od.quantity,\n"
                + "    od.shippingAddress,\n"
                + "    od.discountId,\n"
                + "    od.colorId,\n"
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
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    OrderDetail1 orderDetail = new OrderDetail1(
                            rs.getInt("orderId"),
                            rs.getString("productId"),
                            rs.getInt("quantity"),
                            rs.getString("shippingAddress"),
                            rs.getInt("discountId"),
                            rs.getInt("colorId"),
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
                + "    od.orderId,\n"
                + "    od.productId,\n"
                + "    od.quantity,\n"
                + "    od.shippingAddress,\n"
                + "    od.discountId,\n"
                + "    od.colorId,\n"
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
                + "LIMIT 0, 1000;";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            st.setInt(2, statusId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    OrderDetail1 orderDetail = new OrderDetail1(
                            rs.getInt("orderId"),
                            rs.getString("productId"),
                            rs.getInt("quantity"),
                            rs.getString("shippingAddress"),
                            rs.getInt("discountId"),
                            rs.getInt("colorId"),
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
    
    public List<OrderDetail1> getMyOrderListByPage(List<OrderDetail1> order, int start, int end) {
        ArrayList<OrderDetail1> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(order.get(i));
        }
        return arr;
    }

}
