package com.dkt.cgshoppii.controller;

import com.dkt.cgshoppii.dao.CartItemDAO;
import com.dkt.cgshoppii.model.entity.Product;
import com.dkt.cgshoppii.service.ProductService;

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
                products = productService.findByName(request.getParameter("searchByName"));
                request.setAttribute("products", products);
                dispatcher = request.getRequestDispatcher("WEB-INF/view/product/productList.jsp");
                dispatcher.forward(request, response);
                break;
            case "add-cart":
                int cartId = Integer.parseInt(request.getParameter("cart-id"));
                int productId = Integer.parseInt(request.getParameter("product-id"));
                cartItemDAO.addCartItem(cartId, productId);
                dispatcher = request.getRequestDispatcher("WEB-INF/view/product/productList.jsp");
                dispatcher.forward(request, response);
                break;
            default:
                products = productService.findAll();
                request.setAttribute("products", products);
                dispatcher = request.getRequestDispatcher("WEB-INF/view/product/productList.jsp");
                dispatcher.forward(request, response);

        }
//        List < Product> products = productService.findAll();




//        if ("viewProduct".equals(action)) {
//            int productId = Integer.parseInt(request.getParameter("productId"));
//            request.setAttribute("product", productService.getProductById(productId));
//            request.getRequestDispatcher("/product/viewProduct.jsp").forward(request, response);
//        } else if ("viewTopProducts".equals(action)) {
//            request.setAttribute("topProducts", productService.getTopSellingProducts());
//            request.getRequestDispatcher("/product/topProducts.jsp").forward(request, response);
//        } else {
//            request.setAttribute("newProducts", productService.getNewProducts());
//            request.getRequestDispatcher("/product/newProducts.jsp").forward(request, response);
//        }
    }
}
