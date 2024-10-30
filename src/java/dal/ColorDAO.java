package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Color;

/**
 *
 * @author tuana
 */
public class ColorDAO extends DBContext {

    public List<Color> getColorOfCar(String productId) {
        List<Color> colors = new ArrayList<>();
        String sql = "SELECT c.colorId, c.colorName "
                + "FROM color c "
                + "JOIN colorofcar coc ON c.colorId = coc.colorId "
                + "WHERE coc.productId = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, productId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int colorId = rs.getInt("colorId");
                String colorName = rs.getString("colorName");
                colors.add(new Color(colorId, colorName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return colors;
    }
    public static void main(String[] args) {
        ColorDAO cdao = new ColorDAO();
        List<Color> c = cdao.getColorOfCar("ME01");
        System.out.println(c.get(0).getColorName());
    }
}
