package org.example.repos;

import org.example.entities.User;
import org.example.entities.dto.ProductDto;
import org.example.entities.enums.Category;
import org.example.entities.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.parameters.P;

import java.util.Set;


public interface ProductRepo extends CrudRepository<Product,Long> {

    @Query("select new org.example.entities.dto.ProductDto( " +
            "   m, " +
            "   count(ml), " +
            "   sum(case when ml = :user then 1 else 0 end) > 0" +
            ") " +
            "from Product m left join m.likes ml " +
            "where m.name = :name "+
            "group by m")
    Page<ProductDto> findByName(@Param("name") String name, Pageable pageable, @Param("user")User author);

    @Query("select new org.example.entities.dto.ProductDto(" +
            "   m, " +
            "   count(ml), " +
            "   sum(case when ml = :user then 1 else 0 end) > 0" +
            ") " +
            "from Product m left join m.likes ml " +
            "group by m")
    Page<ProductDto> findAll(Pageable pageable, @Param("user")User author);

    Page<Product> findByCategories(@Param("category")Category category, Pageable pageable);

}
