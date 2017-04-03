package controller;

import dao.ProductDao;
import pojos.Product;

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
    private ProductDao productDao;
    private String login = "User Login";
    private String modalLink = "#userModal";

    /** Using Servlet constructor to inherit methods from super class: */
    public Controller() {
        super();
        productDao = new ProductDao();
    }

    protected void doGet (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        HttpSession session = request.getSession();

        ArrayList<Product> list = productDao.getAllProducts();
        session.setAttribute("productList", list);
        session.setAttribute("name", login);
        session.setAttribute("modalLink", modalLink);



        RequestDispatcher view = request.getRequestDispatcher("jsp/index.jsp");
        view.forward(request, response);
    }

    protected void doPost (HttpServletRequest request, HttpServletResponse response) {


    }
}