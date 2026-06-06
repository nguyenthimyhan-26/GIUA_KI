package dao;

import context.DBContext;
import model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    // Hiển thị tất cả sản phẩm
    public List<Product> getAllProducts() {

        List<Product> list = new ArrayList<>();

        try {

            Connection con =
                    DBContext.getConnection();

            String sql =
                    "SELECT * FROM Products";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Product p = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("brand"),
                        rs.getDouble("price"),
                        rs.getString("imageUrl")
                );

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Tìm kiếm
    public List<Product> searchProduct(String keyword) {

        List<Product> list = new ArrayList<>();

        try {

            Connection con =
                    DBContext.getConnection();

            String sql =
                    "SELECT * FROM Products WHERE name LIKE ?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1,
                    "%" + keyword + "%");

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Product p = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("brand"),
                        rs.getDouble("price"),
                        rs.getString("imageUrl")
                );

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Lấy sản phẩm theo ID
    public Product getProductById(int id) {

        try {

            Connection con =
                    DBContext.getConnection();

            String sql =
                    "SELECT * FROM Products WHERE id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                return new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("brand"),
                        rs.getDouble("price"),
                        rs.getString("imageUrl")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // Thêm sản phẩm
    public void addProduct(Product p) {

        try {

            Connection con =
                    DBContext.getConnection();

            String sql =
                    "INSERT INTO Products(name,brand,price,imageUrl) VALUES(?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, p.getName());
            ps.setString(2, p.getBrand());
            ps.setDouble(3, p.getPrice());
            ps.setString(4, p.getImageUrl());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Cập nhật sản phẩm
    public void updateProduct(Product p) {

        try {

            Connection con =
                    DBContext.getConnection();

            String sql =
                    "UPDATE Products SET name=?,brand=?,price=?,imageUrl=? WHERE id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, p.getName());
            ps.setString(2, p.getBrand());
            ps.setDouble(3, p.getPrice());
            ps.setString(4, p.getImageUrl());
            ps.setInt(5, p.getId());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Xóa sản phẩm
    public void deleteProduct(int id) {

        try {

            Connection con =
                    DBContext.getConnection();

            String sql =
                    "DELETE FROM Products WHERE id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}