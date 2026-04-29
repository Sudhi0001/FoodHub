package dao;

import java.sql.*;
import model.DBConnection;

public class OrderDAO {

    // ✅ INSERT ORDER
    public static void insert(String name, double price) {
        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO orders(food_name, price, status) VALUES(?,?, 'Pending')"
            );

            ps.setString(1, name);
            ps.setDouble(2, price);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ✅ UPDATE STATUS (Complete)
    public static boolean updateStatus(int id) {

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "UPDATE orders SET status=? WHERE id=?"
            );

            ps.setString(1, "Completed");
            ps.setInt(2, id);

            int rows = ps.executeUpdate();

            System.out.println("Rows updated: " + rows); // 👈 DEBUG

            con.close();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // ✅ COUNT PENDING ORDERS (Notification)
    public static int getPendingCount() {
        int count = 0;

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT COUNT(*) FROM orders WHERE status='Pending'"
            );

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    // ✅ GET ALL ORDERS (Better than writing SQL in JSP)
    public static ResultSet getAllOrders() {
        ResultSet rs = null;

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM orders ORDER BY id DESC"
            );

            rs = ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }
}