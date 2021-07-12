package ru.dm.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ru.dm.shop.entity.Cart;
import ru.dm.shop.entity.CartProduct;
import ru.dm.shop.service.CartProductService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class SignInController {

    @Autowired
    CartProductService cartProductService;

    // @PreAuthorize("hasRole('ROLE_ANONYMOUS')")
    @RequestMapping(value = "/signin", method = RequestMethod.GET)
    public String signin(ModelMap model, @RequestParam(value = "error", required = false) boolean error) {
        if (error) model.addAttribute("error", error);

        return "signin";
    }


}