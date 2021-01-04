/**
 * @author deezzex <3
 */


package org.example.services;

import org.example.entities.*;
import org.example.entities.enums.Category;
import org.example.entities.enums.Status;
import org.example.entities.enums.Stock;
import org.example.repos.COrderRepo;
import org.example.repos.OrderRepo;
import org.example.repos.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class ProductService {
    @Autowired
    private ProductRepo productRepo;
    @Autowired
    private OrderRepo orderRepo;
    @Autowired
    private COrderRepo cOrderRepo;


    @Value("${upload.path}")
    private String uploadPath;

    public void saveProduct(Product product, String name, String consist, String description, String producer, String weight, String subtitle, Long price, String evaluationForm
            , Map<String, String> form) {
        product.setName(name);
        product.setConsist(consist);
        product.setDescriptions(description);
        product.setProducer(producer);
        product.setSubtitle(subtitle);
        product.setWeight(weight);
        product.setPrice(price);
        product.setEvaluationForm(evaluationForm);

        addCategories(form, product, productRepo);
    }

    public void saveFile(Product product, @RequestParam("file") MultipartFile file) throws IOException {
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

    public void filterForProducts(Model model, String filter,
                                  @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable,
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

    public void deleteOrder(Order order) {
        orderRepo.deleteById(order.getId());
    }

    public void deleteProduct(Product product) {
        productRepo.deleteById(product.getId());
    }

    public void addCategories(Map<String, String> form, Product product, ProductRepo productRepo) {
        Set<String> categories = Arrays.stream(Category.values()).map(Category::name).collect(Collectors.toSet());

        product.getCategories().clear();
        for(String key: form.keySet()){
            if (categories.contains(key)){
                product.getCategories().add(Category.valueOf(key));
            }
        }

        productRepo.save(product);
    }

    public void checkedForStock(Product product) {
        if (product.getInStock().contains(Stock.FALSE)){
            product.getInStock().clear();
            product.getInStock().add(Stock.TRUE);
        }else if(product.getInStock().contains(Stock.TRUE)) {
            product.getInStock().clear();
            product.getInStock().add(Stock.FALSE);
        }else {
            product.getInStock().add(Stock.TRUE);
        }
        productRepo.save(product);
    }


    public void categoryForProducts(Model model, String category, @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable, ProductRepo productRepo) {
        Page<Product> page;

        Category cat = Category.valueOf(category);

        if (category != null && !category.isEmpty()) {
            page = productRepo.findByCategories(cat,pageable);
        } else {
            page = productRepo.findAll(pageable);
        }

        model.addAttribute("page1",page);
        model.addAttribute("filter", category);
    }

    public void addStatus(Map<String, String> form, ConfirmedOrder order, COrderRepo cOrderRepo) {
        Set<String> statuses = Arrays.stream(Status.values()).map(Status::name).collect(Collectors.toSet());

        order.getStatuses().clear();
        for(String key: form.keySet()){
            if (statuses.contains(key)){
                order.getStatuses().add(Status.valueOf(key));
            }
        }

        cOrderRepo.save(order);
    }
}
