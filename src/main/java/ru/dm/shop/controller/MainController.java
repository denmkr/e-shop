package ru.dm.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ru.dm.shop.entity.*;
import ru.dm.shop.service.*;

import java.util.List;


/**
 * Created by Denis on 22/03/2016.
 */

@Controller
@RequestMapping("/")
public class MainController {

    @Autowired
    GroupService groupService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String homePage(ModelMap model) {
        List<ProductGroup> groups = groupService.findAllParentGroups();

        model.addAttribute("groups", groups);
        model.addAttribute("page", "main");

        return "main";
    }
}
