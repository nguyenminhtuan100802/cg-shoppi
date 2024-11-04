package com.dkt.cgshoppii.controller;

import com.dkt.cgshoppii.model.entity.CartItem;
import com.dkt.cgshoppii.model.entity.Product;
import com.dkt.cgshoppii.service.ICartItemService;
import com.dkt.cgshoppii.service.IProductService;
import com.dkt.cgshoppii.service.ProductService;
import com.dkt.cgshoppii.service.impl.CartItemService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/cart"})
public class CartController extends HttpServlet {
    ICartItemService cartItemService = new CartItemService();
    IProductService productService = new ProductService();
    List<CartItem> cartItems = new ArrayList<>();
    List<Product> products = new ArrayList<>();
    List<Product> allProducts = new ArrayList<>();
    RequestDispatcher requestDispatcher;
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cartId = 1;
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete-cart-item":
                int cartItemId = Integer.parseInt(request.getParameter("id"));
                cartItemService.deleteCartItemById(cartItemId);
                cartItems = cartItemService.getAllCartItemByCartId(cartId);
                products = new ArrayList<>();
                for (CartItem cartItem : cartItems) {
                    products.add(productService.getProductById(cartItem.getProductId()));
                }
                request.setAttribute("cartItems", cartItems);
                request.setAttribute("products", products);
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/view/cart/Cart.jsp");
                requestDispatcher = request.getRequestDispatcher("Cart.jsp");
                requestDispatcher.forward(request, response);
                break;
            default:
                allProducts = productService.findAll();
                cartItems = cartItemService.getAllCartItemByCartId(cartId);
                products = new ArrayList<>();
                for (CartItem cartItem : cartItems) {
                    products.add(productService.getProductById(cartItem.getProductId()));
                }
                request.setAttribute("allProducts", allProducts);
                request.setAttribute("cartItems", cartItems);
                request.setAttribute("products", products);
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/view/cart/Cart.jsp");
                requestDispatcher = request.getRequestDispatcher("Cart.jsp");
                requestDispatcher.forward(request, response);

        }
    }
}
