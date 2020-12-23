/**
 * @author deezzex <3
 */


package org.example.controllers;

import org.example.repos.ProductRepo;
import org.example.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

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
                       Model model) {
        productService.filterForProducts(model, filter, pageable, productRepo);

        model.addAttribute("url","/main");

        return "main";
    }
    @GetMapping("/main/category")
    public String categoryMain(@RequestParam(required = false, defaultValue = "") String category,
                               @PageableDefault(sort = {"id"},direction = Sort.Direction.DESC) Pageable pageable,
                               Model model){

        productService.categoryForProducts(model,category,pageable,productRepo);
        model.addAttribute("url","/main");
        return "main";
    }
}
