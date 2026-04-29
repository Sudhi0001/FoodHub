package dao;

import java.sql.*;
import model.DBConnection;

public class FoodDAO {

    public static ResultSet getAll() {

        ResultSet rs = null;

        try {
            Connection con = DBConnection.getConnection();

            Statement st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM food");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }

    public static void insert(String name, String category, double price, String image) {

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO food(name, category, price, image_url) VALUES(?,?,?,?)"
            );

            ps.setString(1, name);
            ps.setString(2, category);
            ps.setDouble(3, price);
            ps.setString(4, image);

            ps.executeUpdate();

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

public static void delete(int id) {

    try {
        Connection con = DBConnection.getConnection();

        PreparedStatement ps = con.prepareStatement(
            "DELETE FROM food WHERE id=?"
        );

        ps.setInt(1, id);
        ps.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    }
}
public static void update(int id, String name, String category, double price, String image) {

    try {
        Connection con = DBConnection.getConnection();

        PreparedStatement ps = con.prepareStatement(
            "UPDATE food SET name=?, category=?, price=? WHERE id=?"
        );

        ps.setString(1, name);
        ps.setString(2, category);
        ps.setDouble(3, price);
        ps.setInt(4, id);

        ps.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    }
}
}