package dao;


import pojos.Product;

import java.util.ArrayList;


public interface ProductDaoInterface {
    public void createProduct(double price, double volume, int quantity, String for_sale, String sparkly, String name_product, String color, String grape, String origin_country, String origin_area, int production_year, String production_date, String description, int location, String date_added);
    public void deleteProduct(int product_id);
    public void updateProduct(Product product);
    public ArrayList<Product> getAllProducts(String string);
    public Product getProductById(int productId);
}
