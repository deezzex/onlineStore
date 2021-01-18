/**
 * @author deezzex <3
 */


package org.example.controllers;

import org.example.entities.enums.Role;
import org.example.entities.User;
import org.example.repos.UserRepo;
import org.example.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserRepo userRepo;

    @GetMapping
    @PreAuthorize("hasAuthority('ADMIN')")
    public String userList(Model model,
                           @RequestParam(required = false, defaultValue = "") String filter){
        Iterable<User> users;

        if (filter != null && !filter.isEmpty()) {
            users = userRepo.findByLastName(filter);
        } else {
            users = userRepo.findAll();
        }
        model.addAttribute("users",users);

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
    public String userSave(@RequestParam("userId") User user,
                           @RequestParam String username,
                           @RequestParam String firstName,
                           @RequestParam String lastName,
                           @RequestParam Map<String,String> form){
        userService.saveUser(user,username,firstName,lastName,form);

        return "redirect:/user";
    }

    @GetMapping("profile")
    public String getProfile(Model model, @AuthenticationPrincipal User user) {

        model.addAttribute("username", user.getUsername());
        model.addAttribute("email", user.getEmail());
        model.addAttribute("user",user);

        return "userProfile";
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
