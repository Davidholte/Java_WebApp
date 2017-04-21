package controller;

import dao.ProductDao;
import dao.UserDao;
import dao.WarehouseDao;
import pojos.Product;
import pojos.User;
import pojos.Warehouse;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by Dave on 31/03/2017.
 */

@WebServlet("")
public class Controller extends HttpServlet {

    /**Variables */
    private ProductDao   productDao;
    private UserDao      userDao;
    private WarehouseDao whDao;


    /** Using Servlet constructor to inherit methods from super class: */
    public Controller() {
        super();
        productDao  = new ProductDao();
        userDao     = new UserDao();
        whDao       = new WarehouseDao();
    }

    protected void doGet (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        HttpSession session = request.getSession();

        ArrayList<Product>   prodList      = productDao.getAllProducts("name_product");
        ArrayList<User>      userList      = userDao.getAllUsers("username");
        ArrayList<Warehouse> warehouseList = whDao.getAllWarehouses("name_warehouse");

        session.setAttribute("productList",   prodList);
        session.setAttribute("userList",      userList);
        session.setAttribute("warehouseList", warehouseList);


        RequestDispatcher view = request.getRequestDispatcher("jsp/index.jsp");
        view.forward(request, response);
    }

    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String  command = request.getServletPath();


        /** Login */
        // Handles both logging in as an admin and as a user, logging out is handled by one method
        String  username;
        String  password;

        if (command.equals("/login.do")) {
            username = request.getParameter("username");
            password = request.getParameter("password");

            boolean auth = userDao.login(username, password);

            if (auth) {
                RequestDispatcher dispatch = request.getRequestDispatcher("jsp/admin.jsp");
                dispatch.forward(request, response);
            }
            else if (!auth) {
                RequestDispatcher dispatch = request.getRequestDispatcher("jsp/index.jsp");
                dispatch.forward(request, response);
            }
            // else redirect to error page

        }

        /** Logout */
        if (command.equals("/logout.do")) {
            if (request.getParameter("btn-yes") != null && request.getParameter("btn-no") == null) {
                RequestDispatcher dispatch = request.getRequestDispatcher("jsp/index.jsp");
                dispatch.forward(request, response);
            }
        }


        /** Create User/Admin */
        if (request.getParameter("submit_btn_user") != null) {
            String usernameCrea   = request.getParameter("username");
            String passwordCrea   = request.getParameter("password");
            String emailCrea      = request.getParameter("email");
            int bought_itemsCrea  = Integer.parseInt(request.getParameter("bought_items"));
            int location_userCrea = Integer.parseInt(request.getParameter("location_user"));

            userDao.createUser(usernameCrea, passwordCrea, emailCrea, bought_itemsCrea, location_userCrea);

            RequestDispatcher dispatch = request.getRequestDispatcher("admin.jsp");
            dispatch.forward(request, response);

        }

        /** Create Product */
        if (request.getParameter("submit_btn_prod") != null) {
            String name_product    = request.getParameter("product_name");
            String color           = request.getParameter("color");
            String grape           = request.getParameter("grape");
            String origin_country  = request.getParameter("origin_country");
            String origin_area     = request.getParameter("origin_area");
            String description     = request.getParameter("description");
            int production_year    = Integer.parseInt(request.getParameter("production_year"));
            String production_date = request.getParameter("production_date");
            int quantity           = Integer.parseInt(request.getParameter("quantity"));
            int location_product   = Integer.parseInt(request.getParameter("location"));
            double price           = Double.parseDouble(request.getParameter("price"));
            double volume          = Double.parseDouble(request.getParameter("volume"));
            String sparkly         = request.getParameter("sparkly");
            String for_sale        = request.getParameter("for_sale");
            String date_added      = request.getParameter("date_added");

            productDao.createProduct(price, volume, quantity, for_sale, sparkly, name_product, color, grape, origin_country, origin_area, production_year, production_date, description, location_product, date_added);

            RequestDispatcher dispatch = request.getRequestDispatcher("admin.jsp");
            dispatch.forward(request, response);
        }

        /** Update product */
        // Getting Integer from HTML, compares the Integer with all products in for each loop and uses the Integer as parameter in the method that gets a product by ID
        // Use getters to set attributes and post it into a HTML form so it can be edited and then submitted
//        if(request.getParameter("submit_btn_edit") != null) {
//            int idFromForm = Integer.parseInt(request.getParameter("idforEdit"));
//            Product product = productDao.getProductById(idFromForm);
//            HttpSession session = request.getSession();
//            session.setAttribute("product", product);
//
//                    Det her skal slettes, objektet sættes på session!
//                    request.setAttribute("name_productSet", product.getName_product());
//                    request.setAttribute("colorSet", product.getColor());
//                    request.setAttribute("grapeSet", product.getGrape());
//                    request.setAttribute("origin_countrySet", product.getOrigin_country());
//                    request.setAttribute("origin_areaSet", product.getOrigin_area());
//                    request.setAttribute("descriptionSet", product.getDescription());
//                    request.setAttribute("production_yearSet", product.getProduction_year());
//                    request.setAttribute("production_dateSet", product.getProduction_date());
//                    request.setAttribute("quantitySet", product.getQuantity());
//                    request.setAttribute("locationSet", product.getLocation());
//                    request.setAttribute("priceSet", product.getPrice());
//                    request.setAttribute("volumeSet", product.getVolume());
//                    request.setAttribute("sparklySet", product.getSparkly());
//                    request.setAttribute("for_saleSet", product.getFor_sale());
//                    request.setAttribute("date_addedSet", product.getDate_added());
//
//
//        }

        /** Create Warehouse */
        if (request.getParameter("submit_btn_wrhs") != null) {
            String name_warehouse = request.getParameter("wh_name");
            String address        = request.getParameter("wh_address");
            String description    = request.getParameter("wh_description");

            whDao.createWarehouse(name_warehouse, address, description);

            RequestDispatcher dispatch = request.getRequestDispatcher("admin.jsp");
            dispatch.forward(request, response);
        }
    }
}