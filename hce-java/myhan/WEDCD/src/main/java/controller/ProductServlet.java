package controller;

import dao.ProductDAO;
import model.Product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    private ProductDAO dao = new ProductDAO();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if(action == null){
            action = "list";
        }

        switch(action){

            case "delete":
                deleteProduct(request,response);
                break;

            case "edit":
                showEditForm(request,response);
                break;

            default:
                listProducts(request,response);
                break;
        }
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if(action == null){
            action = "";
        }

        switch(action){

            case "add":
                addProduct(request,response);
                break;

            case "update":
                updateProduct(request,response);
                break;
        }
    }

    private void listProducts(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String keyword =
                request.getParameter("search");

        List<Product> list;

        if(keyword == null || keyword.trim().isEmpty()){

            list = dao.getAllProducts();

        }else{

            list = dao.searchProduct(keyword);

        }

        request.setAttribute("products", list);

        request.getRequestDispatcher(
                "products.jsp")
                .forward(request,response);
    }

    private void addProduct(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        String name =
                request.getParameter("name");

        String brand =
                request.getParameter("brand");

        double price =
                Double.parseDouble(
                        request.getParameter("price"));

        String imageUrl =
                request.getParameter("imageUrl");

        Product p = new Product(
                0,
                name,
                brand,
                price,
                imageUrl
        );

        dao.addProduct(p);

        response.sendRedirect("products");
    }

    private void showEditForm(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id =
                Integer.parseInt(
                        request.getParameter("id"));

        Product p =
                dao.getProductById(id);

        request.setAttribute(
                "product",
                p);

        request.getRequestDispatcher(
                "editproduct.jsp")
                .forward(request,response);
    }

    private void updateProduct(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        int id =
                Integer.parseInt(
                        request.getParameter("id"));

        String name =
                request.getParameter("name");

        String brand =
                request.getParameter("brand");

        double price =
                Double.parseDouble(
                        request.getParameter("price"));

        String imageUrl =
                request.getParameter("imageUrl");

        Product p = new Product(
                id,
                name,
                brand,
                price,
                imageUrl
        );

        dao.updateProduct(p);

        response.sendRedirect("products");
    }

    private void deleteProduct(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        int id =
                Integer.parseInt(
                        request.getParameter("id"));

        dao.deleteProduct(id);

        response.sendRedirect("products");
    }
}