package org.example.repos;

import org.example.entities.Product;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ProductRepo extends CrudRepository<Product,Long> {
    List<Product> findByName(String name);
}
