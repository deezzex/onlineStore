/**
 * @author deezzex <3
 */


package org.example.controllers;

import org.example.entities.Role;
import org.example.entities.User;
import org.example.repos.UserRepo;
import org.example.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.persistence.GeneratedValue;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping
    @PreAuthorize("hasAuthority('ADMIN')")
    public String userList(Model model){
        model.addAttribute("users",userService.findAll());
        return "userList";
    }

    @GetMapping("{user}")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String userEdit(@PathVariable User user,Model model){
        model.addAttribute("user",user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @PostMapping
    @PreAuthorize("hasAuthority('ADMIN')")
    public String userSave(@RequestParam("userId") User user,@RequestParam String username,@RequestParam String firstName,@RequestParam String lastName,@RequestParam Map<String,String> form){
        userService.saveUser(user,username,firstName,lastName,form);

        return "redirect:/user";
    }

    @GetMapping("profile")
    public String getProfile(Model model, @AuthenticationPrincipal User user) {

        model.addAttribute("username", user.getUsername());
        model.addAttribute("email", user.getEmail());
        model.addAttribute("user",user);

        return "profile";
    }

    @PostMapping("profile")
    public String updateProfile(
            @AuthenticationPrincipal User user,
            @RequestParam String password,
            @RequestParam String email
    ) {
        userService.updateProfile(user, password, email);

        return "redirect:/user/profile";
    }
}
