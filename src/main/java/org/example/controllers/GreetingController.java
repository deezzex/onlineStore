/**
 * @author deezzex <3
 */


package org.example.controllers;

import org.example.entities.Product;
import org.example.repos.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class GreetingController {

    @Autowired
    private ProductRepo productRepo;
    @GetMapping("/")
    public String greeting() {
        return "greeting";
    }
    @GetMapping("/main")
    public String main(Map<String,Object> model){
        Iterable<Product> products = productRepo.findAll();
        model.put("products",products);
        return "main";
    }
    @PostMapping("/")
    public String add(@RequestParam String name,@RequestParam String consist,@RequestParam String description,@RequestParam String producer,@RequestParam Long price,Map<String,Object> model){
        Product product = new Product(name,consist,description,producer,price);
        productRepo.save(product);
        Iterable<Product> products = productRepo.findAll();
        model.put("products",products);
        return "main";
    }
    @PostMapping("filter")
    public String filter(@RequestParam String filter,Map<String,Object> model){
        List<Product> products = productRepo.findByName(filter);
        model.put("products",products);
        return "main";
    }
}
