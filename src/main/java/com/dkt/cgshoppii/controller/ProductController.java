package com.dkt.cgshoppii.controller;

import com.dkt.cgshoppii.dao.impl.CartItemDAO;
import com.dkt.cgshoppii.model.entity.Product;
import com.dkt.cgshoppii.service.impl.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/product"})
public class ProductController extends HttpServlet {
    private ProductService productService = new ProductService();
    private CartItemDAO cartItemDAO = new CartItemDAO();
    private List<Product> products;
    RequestDispatcher dispatcher;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "search":
                products = productService.findProductByName(request.getParameter("searchByName"));
                request.setAttribute("products", products);
                dispatcher = request.getRequestDispatcher("WEB-INF/view/product/productList.jsp");
                dispatcher.forward(request, response);
                break;
            case "add-cart":
                int cartId = Integer.parseInt(request.getParameter("cart-id"));
                int productId = Integer.parseInt(request.getParameter("product-id"));
                cartItemDAO.addCartItem(cartId, productId);

                products = productService.findAllProducts();
                request.setAttribute("products", products);
                dispatcher = request.getRequestDispatcher("WEB-INF/view/product/productList.jsp");
                dispatcher.forward(request, response);
                break;
            default:
                products = productService.findAllProducts();
                request.setAttribute("products", products);
                dispatcher = request.getRequestDispatcher("WEB-INF/view/product/productList.jsp");
                dispatcher.forward(request, response);

        }
    }
}
