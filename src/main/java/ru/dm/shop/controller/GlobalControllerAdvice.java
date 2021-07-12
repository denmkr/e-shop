package ru.dm.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import ru.dm.shop.domain.UserDetail;
import ru.dm.shop.entity.Cart;
import ru.dm.shop.entity.CartProduct;
import ru.dm.shop.entity.Num;
import ru.dm.shop.entity.User;
import ru.dm.shop.service.CartProductService;


import javax.servlet.http.HttpSession;
import java.util.List;


/**
 * Created by Denis on 22/03/2016.
 */

@ControllerAdvice
public final class GlobalControllerAdvice {

    @Autowired
    CartProductService cartProductService;

    @ModelAttribute("username")
    public User getUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user;
        if (authentication instanceof AnonymousAuthenticationToken) {
            user = null;
        }
        else {
            UserDetail userDetail = (UserDetail) authentication.getPrincipal();
            user = (User) userDetail.getUser();
        }

        return user;
    }

    @ModelAttribute
    public void getCartSize(HttpSession session, ModelMap model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            if (session.getAttribute("cart") != null) {
                Cart cart = (Cart) session.getAttribute("cart");
                List<CartProduct> cartProducts = cart.getCartProducts();
                for (CartProduct cartProduct : cartProducts) {
                    for (int i = 0; i < cartProduct.getCount(); i++) {
                        cartProductService.addProduct(cartProduct.getProduct());
                    }
                }

                session.setAttribute("cart", null);
            }
        }

        Cart cart;
        if (authentication instanceof AnonymousAuthenticationToken) {
            if (session.getAttribute("cart") == null) session.setAttribute("cart", new Cart());
            cart = (Cart) session.getAttribute("cart");
        }
        else cart = cartProductService.getCart();
        Num size = new Num();

        size.setNum(cart.getSize());

        model.addAttribute("cart_size", size);
    }

    @ModelAttribute
    public void getCartPrice(HttpSession session, ModelMap model) {
        Cart cart;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication instanceof AnonymousAuthenticationToken) {
            if (session.getAttribute("cart") == null) session.setAttribute("cart", new Cart());
            cart = (Cart) session.getAttribute("cart");
        }
        else cart = cartProductService.getCart();
        Num price = new Num();

        price.setfNum(cart.getPrice());

        model.addAttribute("cart_price", price);
    }
}
