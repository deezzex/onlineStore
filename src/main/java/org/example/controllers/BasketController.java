/**
 * @author deezzex <3
 */


package org.example.controllers;

import org.example.entities.Order;
import org.example.entities.Product;
import org.example.entities.User;
import org.example.repos.OrderRepo;
import org.example.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;
import java.util.stream.Collectors;

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
        long total = 0L;
        for (Order order: orders){
            total += Long.parseLong(order.getCount())*order.getProduct().getPrice();
        }
        model.addAttribute("total",total);
        model.addAttribute("isCurrentUser",currentUser.equals(user));
        model.addAttribute("orders" , orders);
        model.addAttribute("user" , currentUser);
        return "basket";
    }

    @PostMapping("{user}")
    public String addOrder(@RequestParam Product product, @AuthenticationPrincipal User user, @RequestParam String count,@Valid Order order, BindingResult bindingResult,Model model){

        order = new Order(user, product, false, count);

        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);

            model.addAttribute("map",errorsMap);
        } else {
            orderRepo.save(order);
        }
        return "redirect:/basket/{user}";
    }

    @PostMapping("{user}/delete")
    public String deleteOrder(@RequestParam Order order){
        productService.deleteOrder(order);
        return "redirect:/basket/{user}";
    }
}
