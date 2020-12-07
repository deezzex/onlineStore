/**
 * @author deezzex <3
 */


package org.example.controllers;

import org.example.entities.Product;
import org.example.entities.User;
import org.example.repos.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class MainController {
    @Autowired
    private ProductRepo productRepo;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Product> products = productRepo.findAll();

        if (filter != null && !filter.isEmpty()) {
            products = productRepo.findByName(filter);
        } else {
            products = productRepo.findAll();
        }

        model.addAttribute("products", products);
        model.addAttribute("filter", filter);

        return "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String name,
            @RequestParam String consist,@RequestParam String description,@RequestParam String producer,@RequestParam Long price, Map<String, Object> model
    ) {
        Product product = new Product(name,consist,description,producer,price);

        productRepo.save(product);

        Iterable<Product> products = productRepo.findAll();

        model.put("products", products);

        return "main";
    }
}
