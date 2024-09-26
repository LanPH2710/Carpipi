package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PostDAO extends DBContext {
    public String getUserFullNameById(int userId) {
        String sql = "SELECT a.firstName, a.lastName FROM account a " +
                     "JOIN post p ON a.userId = p.userId " +
                     "WHERE p.userId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                return firstName + " " + lastName; // Trả về full name
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
