/**
 * @author deezzex <3
 */


package org.example.controllers;

import org.example.entities.*;
import org.example.entities.enums.Status;
import org.example.repos.COrderRepo;
import org.example.repos.OrderRepo;
import org.example.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/basket")
public class BasketController {
    @Autowired
    private OrderRepo orderRepo;

    @Autowired
    private ProductService productService;

    @Autowired
    private COrderRepo cOrderRepo;

    @GetMapping("{user}")
    public String viewBasket(@AuthenticationPrincipal User currentUser,
                             @PathVariable User user,
                             Model model){

        Iterable<ConfirmedOrder> confirmedOrder = cOrderRepo.findByAuthor(user);
        Iterable<Order> orders = orderRepo.findByAuthor(currentUser);
        long total = 0L;
        for (Order order: orders){
            total += Long.parseLong(order.getCount())*order.getProduct().getPrice();
        }
        model.addAttribute("total",total);
        model.addAttribute("isCurrentUser",currentUser.equals(user));
        model.addAttribute("orders" , orders);
        model.addAttribute("user" , currentUser);
        model.addAttribute("confirmedOrder",confirmedOrder);
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

    @GetMapping("/new-order")
    public String confirmedOrder(Model model,
                                 @AuthenticationPrincipal User user){
        Set<Order> orders = orderRepo.findByAuthor(user);
        model.addAttribute("orders",orders);
        return "confirmedOrder";
    }

    @PostMapping("/new-order")
    public String newOrder(@AuthenticationPrincipal User user,
                            @RequestParam String city,
                           @RequestParam String street,
                           @RequestParam String phone,
                           @RequestParam String firstName,
                           @RequestParam String lastName){
        Set<Order> orders = orderRepo.findByAuthor(user);
        long total = 0L;
        for (Order order: orders){
            total += Long.parseLong(order.getCount())*order.getProduct().getPrice();
        }

        ConfirmedOrder confirmedOrder = new ConfirmedOrder(city,street,phone,firstName,lastName,orders,total);
        confirmedOrder.setAuthor(user);
        cOrderRepo.save(confirmedOrder);
        return "greeting";
    }

    @GetMapping("/all")
    public String allOrders(Model model){
        Iterable<ConfirmedOrder> confirmedOrders = cOrderRepo.findAll();

        model.addAttribute("confirmedOrders",confirmedOrders);
        return "allOrders";
    }

    @PostMapping("/all")
    public String confirmAndDelete(@RequestParam ConfirmedOrder order){
        cOrderRepo.deleteById(order.getId());
        return "redirect:/basket/all";
    }
    @GetMapping("/all/{order}/change-status")
    public String changeStatus(@PathVariable ConfirmedOrder order,Model model){
        model.addAttribute("order",order);
        model.addAttribute("status", Status.values());

        return "orderChangeStatus";
    }
    @PostMapping("/all/{order}/change-status")
    public String changeStatusSave(@PathVariable ConfirmedOrder order ,
                                   @RequestParam Map<String,String> form){
        productService.addStatus(form, order,cOrderRepo);
        return "redirect:/basket/all";
    }
}
