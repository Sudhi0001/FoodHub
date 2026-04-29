package dao;

import java.sql.*;
import model.DBConnection;

public class UpdateDAO {

    public static boolean updateOrderStatus(int id) {

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "UPDATE orders SET status=? WHERE id=?"
            );

            ps.setString(1, "Completed");
            ps.setInt(2, id);

            int rows = ps.executeUpdate();

            System.out.println("Rows updated: " + rows);

            con.close();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}