/**
 * @author deezzex <3
 */


package org.example.controllers;

import org.example.entities.Product;
import org.example.entities.User;
import org.example.entities.dto.ProductDto;
import org.example.repos.ProductRepo;
import org.example.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.Set;

@Controller
public class MainController {
    @Autowired
    private ProductRepo productRepo;

    @Autowired
    private ProductService productService;

    @GetMapping("/")
    public String greeting() {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter,
                       @PageableDefault(sort = {"id"},direction = Sort.Direction.DESC) Pageable pageable,
                       @AuthenticationPrincipal User user,
                       Model model) {

        productService.filterForProducts(model, filter, pageable, productRepo,user);
        model.addAttribute("url","/main");

        return "main";
    }

    @GetMapping("/main/category")
    public String categoryMain(@RequestParam(required = false, defaultValue = "") String category,
                               @PageableDefault(sort = {"id"},direction = Sort.Direction.DESC) Pageable pageable,
                               @AuthenticationPrincipal User user,
                               Model model){

        productService.categoryForProducts(model,category,pageable,productRepo,user);
        model.addAttribute("url","/main");
        return "main";
    }

    @GetMapping("/product/{product}/like")
    public String like(
            @AuthenticationPrincipal User user,
            @PathVariable Product product,
            RedirectAttributes redirectAttributes,
            @RequestHeader(required = false) String referer
            ){

        UriComponents components = productService.getUriComponents(user, product, redirectAttributes, referer);
        return "redirect:"+components.getPath();
    }

    @GetMapping("/liked")
    public String myLikes(@AuthenticationPrincipal User user,
                          @PageableDefault(sort = {"id"},direction = Sort.Direction.DESC) Pageable pageable,
                          Model model
                          ){

        Page<ProductDto> page = productRepo.findAll(pageable,user);
        model.addAttribute("page1",page);
        model.addAttribute("url","/liked");

        return "myLikes";
    }
}
