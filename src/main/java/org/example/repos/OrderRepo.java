package org.example.repos;

import org.example.entities.Order;
import org.example.entities.User;
import org.springframework.data.repository.CrudRepository;

import java.util.Set;

public interface OrderRepo extends CrudRepository<Order,Long> {
   Set<Order> findByAuthor(User user);


}
