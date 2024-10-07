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
import model.Segment;

/**
 *
 * @author tuana
 */
public class SegmentDAO extends DBContext{
    
    public int getSegmentIdByName(String name) {
        String sql = "SELECT segmentId FROM carpipi.segment where segmentName = ?";

        String segmentId = null; // Biến để lưu kết quả trả về

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {                
                segmentId = rs.getString("segmentId");
            }

        } catch (SQLException e) {
        }
        
        int sId = Integer.parseInt(segmentId);
        
        return sId;
    }
    
    public List<Segment> getAllSegment(){
        List<Segment> list = new ArrayList<>();
        String sql = "select * from Segment";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Segment p = new Segment(rs.getInt(1),
                        rs.getString(2));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
