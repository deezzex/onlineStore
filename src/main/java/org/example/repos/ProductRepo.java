package org.example.repos;

import org.example.entities.enums.Category;
import org.example.entities.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;



public interface ProductRepo extends CrudRepository<Product,Long> {
    Page<Product> findByName(String name, Pageable pageable);

    Page<Product> findAll(Pageable pageable);

    Page<Product> findByCategories(Category category, Pageable pageable);
}
