/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBContext;

import Model.Brand;
import Model.Cart;
import Model.Item;
import Model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductDBContext extends DBContext2 {

    public int getTotalProduct() {
        try {
            String sql = "select count(*) from Product";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<Product> pagingProductByDate(int index) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = """
                         SELECT ProductID, ProductName, Description, GenderP, DateP, 
                                BrandID, Price, Discount, Image, StatusP, Quantity, Sold 
                         FROM product
                         ORDER BY DateP DESC
                         LIMIT 8 OFFSET ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 8);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setGenderP(rs.getBoolean("GenderP"));
                p.setDateP(rs.getString("DateP"));
                Brand b = new Brand();
                b.setBrandID(rs.getInt("BrandID"));
                p.setBrand(b);
                p.setPrice(rs.getDouble("Price"));
                p.setDiscount(rs.getDouble("Discount"));
                p.setImage(rs.getString("Image"));
                p.setStatusP(rs.getBoolean("StatusP"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setSold(rs.getInt("Sold"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> pagingProductByDiscount() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = """
                         SELECT ProductID, ProductName, Description, GenderP, DateP, 
                                BrandID, Price, Discount, Image, StatusP, Quantity, Sold 
                         FROM product
                         ORDER BY Discount DESC
                         LIMIT 8 OFFSET 0""";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setGenderP(rs.getBoolean("GenderP"));
                p.setDateP(rs.getString("DateP"));
                Brand b = new Brand();
                b.setBrandID(rs.getInt("BrandID"));
                p.setBrand(b);
                p.setPrice(rs.getDouble("Price"));
                p.setDiscount(rs.getDouble("Discount"));
                p.setImage(rs.getString("Image"));
                p.setStatusP(rs.getBoolean("StatusP"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setSold(rs.getInt("Sold"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Product getProductByID(int pid) {
        try {
            String sql = """
                         SELECT * FROM product p join brand b 
                         on p.BrandID = b.BrandID
                         where ProductID = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setGenderP(rs.getBoolean("GenderP"));
                p.setDateP(rs.getString("DateP"));
                Brand b = new Brand();
                b.setBrandID(rs.getInt("BrandID"));
                b.setBrandName(rs.getString("BrandName"));
                p.setBrand(b);
                p.setPrice(rs.getDouble("Price"));
                p.setDiscount(rs.getDouble("Discount"));
                p.setImage(rs.getString("Image"));
                p.setStatusP(rs.getBoolean("StatusP"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setSold(rs.getInt("Sold"));
                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Product> getProductByGender(int gender, int index) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = """
                         SELECT * FROM product
                         where GenderP = ?
                         LIMIT 9 OFFSET ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gender);
            stm.setInt(2, (index - 1) * 9);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setGenderP(rs.getBoolean("GenderP"));
                p.setDateP(rs.getString("DateP"));
                Brand b = new Brand();
                b.setBrandID(rs.getInt("BrandID"));
                p.setBrand(b);
                p.setPrice(rs.getDouble("Price"));
                p.setDiscount(rs.getDouble("Discount"));
                p.setImage(rs.getString("Image"));
                p.setStatusP(rs.getBoolean("StatusP"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setSold(rs.getInt("Sold"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getTotalProductWithGender(int gender) {
        try {
            String sql = """
                         SELECT count(*) FROM product
                         where GenderP = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gender);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<Product> getProductByBrand(int brand, int index) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = """
                         SELECT * FROM product
                         where BrandID = ?
                         LIMIT 9 OFFSET ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, brand);
            stm.setInt(2, (index - 1) * 9);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setGenderP(rs.getBoolean("GenderP"));
                p.setDateP(rs.getString("DateP"));
                Brand b = new Brand();
                b.setBrandID(rs.getInt("BrandID"));
                p.setBrand(b);
                p.setPrice(rs.getDouble("Price"));
                p.setDiscount(rs.getDouble("Discount"));
                p.setImage(rs.getString("Image"));
                p.setStatusP(rs.getBoolean("StatusP"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setSold(rs.getInt("Sold"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getSimilarProduct(int brand) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = """
                         SELECT * FROM product
                         where BrandID = ?
                         LIMIT 4 OFFSET 0""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, brand);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setGenderP(rs.getBoolean("GenderP"));
                p.setDateP(rs.getString("DateP"));
                Brand b = new Brand();
                b.setBrandID(rs.getInt("BrandID"));
                p.setBrand(b);
                p.setPrice(rs.getDouble("Price"));
                p.setDiscount(rs.getDouble("Discount"));
                p.setImage(rs.getString("Image"));
                p.setStatusP(rs.getBoolean("StatusP"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setSold(rs.getInt("Sold"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getTotalProductWithBrand(int brand) {
        try {
            String sql = """
                         SELECT count(*) FROM product
                         where BrandID = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, brand);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<Brand> getAllBrand() {
        List<Brand> brand = new ArrayList<>();
        try {
            String sql = "select * from brand";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setBrandID(rs.getInt("BrandID"));
                b.setBrandName(rs.getString("BrandName"));
                b.setBrandStatus(rs.getBoolean("BrandStatus"));
                b.setBrandImg(rs.getString("BrandImg"));
                brand.add(b);
            }
        } catch (SQLException e) {
        }
        return brand;
    }

    public List<Product> pagingProduct(int index) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = """
                         SELECT ProductID, ProductName, Description, GenderP, DateP, 
                            BrandID, Price, Discount, Image, StatusP, Quantity, Sold 
                            FROM product
                            ORDER BY Sold DESC
                            LIMIT 9 OFFSET ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 9);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setGenderP(rs.getBoolean("GenderP"));
                p.setDateP(rs.getString("DateP"));
                Brand b = new Brand();
                b.setBrandID(rs.getInt("BrandID"));
                p.setBrand(b);
                p.setPrice(rs.getDouble("Price"));
                p.setDiscount(rs.getDouble("Discount"));
                p.setImage(rs.getString("Image"));
                p.setStatusP(rs.getBoolean("StatusP"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setSold(rs.getInt("Sold"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductByName(String name, int index) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM product "
                    + "where ProductName like '%" + name + "%' LIMIT 9 OFFSET ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 9);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setGenderP(rs.getBoolean("GenderP"));
                p.setDateP(rs.getString("DateP"));
                Brand b = new Brand();
                b.setBrandID(rs.getInt("BrandID"));
                p.setBrand(b);
                p.setPrice(rs.getDouble("Price"));
                p.setDiscount(rs.getDouble("Discount"));
                p.setImage(rs.getString("Image"));
                p.setStatusP(rs.getBoolean("StatusP"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setSold(rs.getInt("Sold"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getTotalProductWithName(String name) {
        try {
            String sql = "SELECT count(*) FROM product "
                    + "where ProductName like '%" + name + "%'";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<Product> getProductIdOrderByDate() {
        List<Product> products = new ArrayList<>();
        try {
            String sql = """
                         SELECT ProductID
                         FROM product
                         ORDER BY DateP DESC
                         LIMIT 10 OFFSET 0""";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                products.add(p);
            }
        } catch (SQLException e) {
        }
        return products;
    }

    public List<Product> getThreeLastestProducts() {
        List<Product> products = new ArrayList<>();
        try {
            String sql = """
                         SELECT * FROM product
                         order by DateP desc
                         limit 3 offset 0""";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setGenderP(rs.getBoolean("GenderP"));
                p.setDateP(rs.getString("DateP"));
                Brand b = new Brand();
                b.setBrandID(rs.getInt("BrandID"));
                p.setBrand(b);
                p.setPrice(rs.getDouble("Price"));
                p.setDiscount(rs.getDouble("Discount"));
                p.setImage(rs.getString("Image"));
                p.setStatusP(rs.getBoolean("StatusP"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setSold(rs.getInt("Sold"));
                products.add(p);
            }
        } catch (SQLException e) {
        }
        return products;
    }

    public Cart getUserCart(int userID) {
    Cart cart = new Cart();
    String sql = "SELECT ProductID, Quantity FROM cart WHERE UserID = ?";
    try (PreparedStatement stm = connection.prepareStatement(sql)) {
        stm.setInt(1, userID);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            int productId = rs.getInt("ProductID");
            int quantity = rs.getInt("Quantity");
            Product product = getProductByID(productId); // Assuming this method returns a Product object
            if (product != null) {
                double price = product.getPrice();
                cart.addItem(new Item(product, quantity, price)); // Assuming Cart has this method
            }
        }
    } catch (Exception e) {
        e.printStackTrace(); // Handle exceptions
    }
    return cart;
}
    
    public void deleteCart(int userID) {
    String sql = "DELETE FROM cart WHERE UserID = ?";
    try (PreparedStatement stm = connection.prepareStatement(sql)) {
        stm.setInt(1, userID);
        stm.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace(); // Proper error handling
    }
}
        public void insertCart(int userID, List<Item> items) {
    String sql = "INSERT INTO cart (UserID, ProductID, Quantity) VALUES (?, ?, ?)";
    try (PreparedStatement stm = connection.prepareStatement(sql)) {
        for (Item item : items) {
            stm.setInt(1, userID);
            stm.setInt(2, item.getProduct().getProductID());
            stm.setInt(3, item.getQuantity());
            stm.addBatch(); // Prepare this insert for batch execution
        }
        stm.executeBatch(); // Execute all inserts in a batch
    } catch (SQLException e) {
        e.printStackTrace(); // Proper error handling
    }
}
        public boolean updateFullNameMailAddressPhoneByID(int userID, String fullName, String mail, String address, String phone) {
    try {
        // Câu lệnh SQL để cập nhật thông tin người dùng
        String sql = "UPDATE User SET Fullname = ?, Mail = ?, Address = ?, Phone = ? WHERE UserID = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        // Thiết lập các giá trị cho các tham số trong câu lệnh SQL
        statement.setString(1, fullName);
        statement.setString(2, mail);
        statement.setString(3, address);
        statement.setString(4, phone);
        statement.setInt(5, userID);
        
        // Thực thi câu lệnh SQL
        int rowsUpdated = statement.executeUpdate();
        // Kiểm tra số dòng được cập nhật
        if (rowsUpdated > 0) {
            return true; // Cập nhật thành công
        }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return false; // Cập nhật không thành công
}





    public static void main(String[] args) {
    ProductDBContext db = new ProductDBContext();
    int userID = 1; // Giả sử bạn muốn kiểm tra giỏ hàng của người dùng có ID là 1
    Cart userCart = db.getUserCart(userID);
    
    // Kiểm tra xem giỏ hàng có trống không
    if (userCart != null && userCart.getItems() != null && !userCart.getItems().isEmpty()) {
        System.out.println("Giỏ hàng của người dùng ID " + userID + " bao gồm các sản phẩm sau:");
        for (Item item : userCart.getItems()) {
            System.out.println("Sản phẩm: " + item.getProduct().getProductName() +
                               ", Số lượng: " + item.getQuantity() +
                               ", Giá: " + item.getPrice());
        }
    } else {
        System.out.println("Giỏ hàng của người dùng ID " + userID + " trống.");
    }
}

}
