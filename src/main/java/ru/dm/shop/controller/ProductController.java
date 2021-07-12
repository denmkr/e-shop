package ru.dm.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ru.dm.shop.entity.Cart;
import ru.dm.shop.entity.Product;
import ru.dm.shop.service.ProductService;

/**
 * Created by Denis on 22/03/2016.
 */

@Controller
public class ProductController {

    @Autowired
    ProductService productService;

    @RequestMapping(value = "/product/{code}", method = RequestMethod.GET)
    public String product(ModelMap model, @PathVariable(value = "code") String code) {
        Product product = productService.findByCode(code);
        model.addAttribute("product", product);

        model.addAttribute("page", "catalog");

        return "product";
    }

}
