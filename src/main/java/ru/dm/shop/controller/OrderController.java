package ru.dm.shop.controller;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ru.dm.shop.domain.UserDetail;
import ru.dm.shop.entity.*;
import ru.dm.shop.service.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;


/**
 * Created by Denis on 22/03/2016.
 */

@Controller
@RequestMapping("/")
public class OrderController {

    @Autowired
    OrderService orderService;

    @RequestMapping(value = "/orders", method = RequestMethod.GET)
    public String ordersPage(ModelMap model) {

        List<Order> orders = null;

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            UserDetail userDetail = (UserDetail) authentication.getPrincipal();
            User user = (User) userDetail.getUser();

            orders = orderService.findAllByUser(user);
        }

        model.addAttribute("orders", orders);

        return "orders";
    }


    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public String orderPage(ModelMap model, @RequestParam(value = "orderId", required = true) long orderId) {

        Order order = null;

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            UserDetail userDetail = (UserDetail) authentication.getPrincipal();
            User user = (User) userDetail.getUser();

            order = orderService.findByIdAndUser(orderId, user);
        }

        model.addAttribute("order", order);

        return "order";
    }



}
