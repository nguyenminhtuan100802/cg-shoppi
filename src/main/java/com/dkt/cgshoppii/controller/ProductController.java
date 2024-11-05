package com.dkt.cgshoppii.controller;

import com.dkt.cgshoppii.dao.impl.CartItemDAO;
import com.dkt.cgshoppii.model.entity.Product;
import com.dkt.cgshoppii.service.ICartItemService;
import com.dkt.cgshoppii.service.ICartService;
import com.dkt.cgshoppii.service.IProductService;
import com.dkt.cgshoppii.service.impl.CartItemService;
import com.dkt.cgshoppii.service.impl.CartService;
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
    private IProductService productService = new ProductService();
    private ICartItemService cartItemService = new CartItemService();
    private ICartService cartService = new CartService();
    private List<Product> products;
    RequestDispatcher dispatcher;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String username = request.getParameter("username");
        request.setAttribute("username", username);
        int cartId = cartService.findCartIdByUsername(username);

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
                int productId = Integer.parseInt(request.getParameter("product-id"));
                cartItemService.addCartItem(cartId, productId);

                products = productService.findAllProducts();
                request.setAttribute("products", products);
                request.setAttribute("username", username);
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
