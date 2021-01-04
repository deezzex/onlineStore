package org.example.repos;

import org.example.entities.ConfirmedOrder;
import org.example.entities.Order;
import org.example.entities.User;
import org.springframework.data.repository.CrudRepository;

import java.util.Set;

public interface COrderRepo extends CrudRepository<ConfirmedOrder,Long> {
    Set<ConfirmedOrder> findByAuthor(User user);
}
