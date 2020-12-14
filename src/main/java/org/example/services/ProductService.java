/**
 * @author deezzex <3
 */


package org.example.services;

import org.example.entities.Product;
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
import java.util.UUID;

@Service
public class ProductService {
    @Autowired
    private ProductRepo productRepo;

    @Value("${upload.path}")
    private String uploadPath;

    public void saveProduct(Product product, String name, String consist, String description, String producer, String weight, String subtitle, Long price, String evaluationForm) {
        product.setName(name);
        product.setConsist(consist);
        product.setDescriptions(description);
        product.setProducer(producer);
        product.setSubtitle(subtitle);
        product.setWeight(weight);
        product.setPrice(price);
        product.setEvaluationForm(evaluationForm);
        productRepo.save(product);
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
}
