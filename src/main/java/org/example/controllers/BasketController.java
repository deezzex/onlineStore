/**
 * @author deezzex <3
 */


package org.example.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("user/basket")
public class BasketController {

    @GetMapping
    public String viewBasket(){

        return "basket";
    }
}
