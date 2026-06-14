package com.vsc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vsc.entity.UserEntity;
import com.vsc.service.AuthService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/auth")
public class ProfileController {

    @Autowired
    private AuthService authService;

    @GetMapping("/profile")
    public String userProfile(
            HttpSession session,
            Model model) {

        UserEntity loggedInUser =
                (UserEntity) session.getAttribute("loggedInUser");

        if (loggedInUser == null) {
            return "redirect:/auth/login";
        }

        UserEntity user =
                authService.getUserById(
                        loggedInUser.getId());

        model.addAttribute(
                "loggedInUser",
                user);

        return "user_profile_page";
    }
}