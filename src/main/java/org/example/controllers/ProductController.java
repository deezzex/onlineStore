/**
 * @author deezzex <3
 */


package org.example.controllers;

import org.example.entities.Product;
import org.example.entities.User;
import org.example.repos.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;


@Controller
@RequestMapping("/product")
public class ProductController {

    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    private ProductRepo productRepo;

    @GetMapping("{product}")
    public String viewProduct(@PathVariable Product product, Model model){
        model.addAttribute("product",product);
        return "product";
    }

    @GetMapping
    public String productList(Model model,
                              @PageableDefault(sort = {"id"},direction = Sort.Direction.DESC) Pageable pageable,
                              @RequestParam(required = false, defaultValue = "") String filter){
        filterForProducts(model, filter,pageable,productRepo);
        model.addAttribute("url","/product");
        return "productList";
    }

    @GetMapping("/add")
    public String addProduct(){
        return "addProduct";
    }


    @PostMapping("/add")
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
        saveFile(product, file);
        productRepo.save(product);

        Iterable<Product> products = productRepo.findAll();

        model.put("products", products);

        return "redirect:/main";
    }

    static void filterForProducts(Model model, String filter,
                                  @PageableDefault(sort = {"id"},direction = Sort.Direction.DESC) Pageable pageable,
                                  ProductRepo productRepo) {
        Page<Product> page;

        if (filter != null && !filter.isEmpty()) {
            page = productRepo.findByName(filter,pageable);
        } else {
            page = productRepo.findAll(pageable);
        }

        model.addAttribute("page1",page);
        model.addAttribute("filter", filter);
    }

    private void saveFile(Product product, @RequestParam("file") MultipartFile file) throws IOException {
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            product.setFileName(resultFilename);
        }
    }
}
