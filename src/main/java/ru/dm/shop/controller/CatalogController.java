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
import org.springframework.web.util.UriComponentsBuilder;
import ru.dm.shop.domain.UserDetail;
import ru.dm.shop.entity.*;
import ru.dm.shop.service.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * Created by Denis on 22/03/2016.
 */

@Controller
@RequestMapping("/")
public class CatalogController {

    String url;

    @Autowired
    ProductService productService;
    @Autowired
    GroupService groupService;

    @RequestMapping(value = "catalog", method = RequestMethod.GET)
    public String catalogPage(ModelMap model) {
        if (url != null) {
            url = url.replace("ajax=1&","");
            return "redirect:" + url;
        }
        else return "redirect:/catalog/page/1";
    }

    @RequestMapping(value = "catalog/group/{group}", method = RequestMethod.GET)
    public String catalogGroup(ModelMap model, @PathVariable(value = "group") String group) {
        if (!group.equals("catalog")) {
            if (url != null) {
                url = url.replace("ajax=1&","");

                UriComponentsBuilder urlBuilder = UriComponentsBuilder.fromUriString(url);
                urlBuilder.replaceQueryParam("groupId", group);
                String result = urlBuilder.build().toUriString();

                return "redirect:" + result;
            }
            else return "redirect:/catalog/page/1";
        }
        else {
            return "redirect:/catalog/";
        }

    }

    @RequestMapping(value = "catalog/page/{page}", method = RequestMethod.GET)
    public String catalog(HttpServletRequest request, ModelMap model, @RequestParam(value = "stock", required = false, defaultValue = "off") String stock,
                          @RequestParam(value = "sort", required = false, defaultValue = "name_ASC") String sort,
                          @RequestParam(value = "groupId", required = false, defaultValue = "") String groupId,
                          @RequestParam(value = "search", required = false, defaultValue = "") String search,
                          @RequestParam(value = "ajax", required = false, defaultValue = "0") String ajax,
                          @RequestParam(value = "mode", required = false, defaultValue = "none") String mode,
                          @RequestParam(value = "count", required = false, defaultValue = "20") String count,
                          @PathVariable(value = "page") int page) throws UnsupportedEncodingException {



        url = request.getRequestURL().toString() + "?" + request.getQueryString();

        if (mode.equals("all")) {
            groupId = "";
        }

        Page<Product> products = productService.findAll(StringEscapeUtils.escapeHtml4(groupId), page, StringEscapeUtils.escapeHtml4(stock), StringEscapeUtils.escapeHtml4(search), StringEscapeUtils.escapeHtml4(search), StringEscapeUtils.escapeHtml4(sort), Integer.parseInt(StringEscapeUtils.escapeHtml4(count)));

        //Page<Product> products = productService.findAll(groupId, page, stock, StringEscapeUtils.escapeHtml4(new String(search.getBytes("ISO-8859-1"), "UTF-8")), StringEscapeUtils.escapeHtml4(new String(search.getBytes("ISO-8859-1"), "UTF-8")), sort, Integer.parseInt(count));
        int current = products.getNumber() + 1;
        int begin = Math.max(1, current - 3);
        int end = Math.min(begin + 5, products.getTotalPages());

        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);

        model.addAttribute("currentGroup", groupService.findByGroupId(groupId));

        model.addAttribute("products", products);

        model.addAttribute("groups", groupService.findAllParents());

        model.addAttribute("page", "catalog");

        // cartProductService.getCart().getSizeByArticule();

        if (ajax.equals("1")) return "ajax/catalog_content";
        else return "catalog";
    }

    @RequestMapping(value = "catalog/breadcrumbs", method = RequestMethod.GET)
    public String getBreadcrumbs(ModelMap model, @RequestParam(value = "groupId", required = false, defaultValue = "") String groupId) {
        model.addAttribute("currentGroup", groupService.findByGroupId(groupId));
        return "modules/breadcrumbs";
    }

}
