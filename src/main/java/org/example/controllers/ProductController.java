/**
 * @author deezzex <3
 */


package org.example.controllers;

import org.example.entities.*;
import org.example.entities.enums.Category;
import org.example.entities.enums.Stock;
import org.example.repos.ProductRepo;
import org.example.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;
import java.util.Set;


@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductRepo productRepo;

    @Autowired
    private ProductService productService;

    @GetMapping("{product}")
    public String viewProduct(@AuthenticationPrincipal User user,@PathVariable Product product, Model model){
        Set<Stock> stocks = product.getInStock();
        if (stocks.contains(Stock.TRUE)){
            model.addAttribute("stock",true);
        }else {
            model.addAttribute("stock",false);
        }

        model.addAttribute("product",product);
        model.addAttribute("user",user);
        return "product";
    }

    @GetMapping
    public String productList(Model model,
                              @PageableDefault(sort = {"id"},direction = Sort.Direction.DESC) Pageable pageable,
                              @RequestParam(required = false, defaultValue = "") String filter){
        productService.filterForProducts(model, filter,pageable,productRepo);
        model.addAttribute("url","/product");
        return "productList";
    }

    @GetMapping("/add")
    public String addProduct(){
        return "productAdd";
    }

    @PostMapping("/add")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String name,
            @RequestParam String consist,
            @RequestParam String description,
            @RequestParam String producer,
            @RequestParam Long price,
            @RequestParam String subtitle,
            @RequestParam String weight,
            @RequestParam String evaluationForm,
            @RequestParam("file") MultipartFile file,
            Map<String, Object> model
    ) throws IOException {
        Product product = new Product(name,consist,description,producer,price,subtitle,weight,evaluationForm,user);
        productService.saveFile(product, file);
        productRepo.save(product);
        Iterable<Product> products = productRepo.findAll();

        model.put("products", products);

        return "redirect:/main";
    }


    @GetMapping("/edit/{product}")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String productEdit(Model model,@PathVariable Product product){
        model.addAttribute("product",product);
        model.addAttribute("categories", Category.values());
        model.addAttribute("stocks", Stock.values());
        return "productEdit";
    }

    @PostMapping
    @PreAuthorize("hasAuthority('ADMIN')")
    public String productSave(@RequestParam("productId") Product product, @RequestParam String name, @RequestParam String consist, @RequestParam String description, @RequestParam String producer, @RequestParam String weight, @RequestParam String subtitle, @RequestParam Long price, @RequestParam String evaluationForm
            , @RequestParam Map<String,String> form){
        productService.saveProduct(product,name,consist,description,producer,weight,subtitle,price,evaluationForm,form);

        return "redirect:/product";
    }

    @PostMapping("/stock")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String productStock(@RequestParam Product product){
        productService.checkedForStock(product);
        return "redirect:/product";
    }

    @PostMapping("{product}/delete")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String deleteProduct(@RequestParam @PathVariable Product product){
        productService.deleteProduct(product);
        return "redirect:/product";
    }

}
