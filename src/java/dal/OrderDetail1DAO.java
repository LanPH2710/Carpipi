package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Order1;
import model.OrderDetail1;

public class OrderDetail1DAO extends DBContext {

    public List<OrderDetail1> getOrderDetail(int orderId) {
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
                + "    o.orderId = ?\n"
                + "ORDER BY o.createDate desc\n"
                + "LIMIT 0, 1000;";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, orderId); // Thiết lập userId
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

    public List<Order1> getOrderByUserId(int userId) {
        List<Order1> orders = new ArrayList<>();
        String query = "SELECT orderId, orderDeliverCode, userId, orderName, orderEmai, orderPhone, "
                + "totalPrice, note, saleId, shipperId, createDate, orderStatus "
                + "FROM `order` "
                + "WHERE userId = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Order1 order = new Order1(
                            resultSet.getInt("orderId"),
                            resultSet.getString("orderDeliverCode"),
                            resultSet.getInt("userId"),
                            resultSet.getString("orderName"),
                            resultSet.getString("orderEmai"),
                            resultSet.getString("orderPhone"),
                            resultSet.getDouble("totalPrice"),
                            resultSet.getString("note"),
                            resultSet.getInt("saleId"),
                            resultSet.getInt("shipperId"),
                            resultSet.getString("createDate"),
                            resultSet.getInt("orderStatus")
                    );
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public List<Order1> getOrderByStatus(int userId, int status) {
        List<Order1> orders = new ArrayList<>();
        String query = "SELECT orderId, orderDeliverCode, userId, orderName, orderEmai, orderPhone, "
                + "totalPrice, note, saleId, shipperId, createDate, orderStatus "
                + "FROM `order` "
                + "WHERE userId = ? and orderStatus = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);
            statement.setInt(2, status);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Order1 order = new Order1(
                            resultSet.getInt("orderId"),
                            resultSet.getString("orderDeliverCode"),
                            resultSet.getInt("userId"),
                            resultSet.getString("orderName"),
                            resultSet.getString("orderEmai"),
                            resultSet.getString("orderPhone"),
                            resultSet.getDouble("totalPrice"),
                            resultSet.getString("note"),
                            resultSet.getInt("saleId"),
                            resultSet.getInt("shipperId"),
                            resultSet.getString("createDate"),
                            resultSet.getInt("orderStatus")
                    );
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
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

    public List<Order1> getShipOrder() {
        List<Order1> orders = new ArrayList<>();
        String query = "SELECT orderId, orderDeliverCode, userId, orderName, orderEmai, orderPhone, "
                + "totalPrice, note, saleId, shipperId, createDate, orderStatus "
                + "FROM `order` "
                + "WHERE orderStatus IN (3, 4)";

        try (PreparedStatement statement = connection.prepareStatement(query); ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Order1 order = new Order1(
                        resultSet.getInt("orderId"),
                        resultSet.getString("orderDeliverCode"),
                        resultSet.getInt("userId"),
                        resultSet.getString("orderName"),
                        resultSet.getString("orderEmai"),
                        resultSet.getString("orderPhone"),
                        resultSet.getDouble("totalPrice"),
                        resultSet.getString("note"),
                        resultSet.getInt("saleId"),
                        resultSet.getInt("shipperId"),
                        resultSet.getString("createDate"),
                        resultSet.getInt("orderStatus")
                );
                orders.add(order);
            }
        } catch (SQLException e) {
            System.err.println("Error retrieving ship orders: " + e.getMessage());
        }
        return orders;
    }

    public List<Order1> getShipOrderByStatus(int statusId) {
        List<Order1> orders = new ArrayList<>();
        String query = "SELECT orderId, orderDeliverCode, userId, orderName, orderEmai, orderPhone, "
                + "totalPrice, note, saleId, shipperId, createDate, orderStatus "
                + "FROM `order` "
                + "WHERE orderStatus = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, statusId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Order1 order = new Order1(
                            resultSet.getInt("orderId"),
                            resultSet.getString("orderDeliverCode"),
                            resultSet.getInt("userId"),
                            resultSet.getString("orderName"),
                            resultSet.getString("orderEmai"),
                            resultSet.getString("orderPhone"),
                            resultSet.getDouble("totalPrice"),
                            resultSet.getString("note"),
                            resultSet.getInt("saleId"),
                            resultSet.getInt("shipperId"),
                            resultSet.getString("createDate"),
                            resultSet.getInt("orderStatus")
                    );
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
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

    public List<OrderDetail1> getAllOrder(int userId, int orderId) {
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
                + "    o.userId = ? and o.orderId = ?\n"
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

    public List<Order1> getMyOrderListByPage(List<Order1> order, int start, int end) {
        ArrayList<Order1> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(order.get(i));
        }
        return arr;
    }

}
