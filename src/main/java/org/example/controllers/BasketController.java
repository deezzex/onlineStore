/**
 * @author deezzex <3
 */


package org.example.controllers;

import org.aspectj.weaver.ast.Or;
import org.example.entities.Order;
import org.example.entities.Product;
import org.example.entities.User;
import org.example.repos.OrderRepo;
import org.example.repos.ProductRepo;
import org.example.repos.UserRepo;
import org.example.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/basket")
public class BasketController {
    @Autowired
    private OrderRepo orderRepo;

    @Autowired
    private ProductService productService;

    @GetMapping("{user}")
    public String viewBasket(@AuthenticationPrincipal User currentUser,
                             @PathVariable User user,
                             Model model){

        Iterable<Order> orders = orderRepo.findByAuthor(currentUser);


        model.addAttribute("isCurrentUser",currentUser.equals(user));
        model.addAttribute("orders" , orders);
        model.addAttribute("user" , currentUser);
        return "basket";
    }

    @PostMapping("{user}")
    public String addOrder(@RequestParam Product product,@AuthenticationPrincipal User user,@RequestParam String count){

        Order order = new Order(user,product,false,count);

        orderRepo.save(order);
        return "redirect:/main";
    }

    @PostMapping("{user}/delete")
    public String deleteOrder(@RequestParam Order order){
        productService.deleteOrder(order);
        return "redirect:/basket/{user}";
    }
}
