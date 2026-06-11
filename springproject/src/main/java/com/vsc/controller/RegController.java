package com.vsc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vsc.entity.UserEntity;
import com.vsc.service.AuthService;

@Controller
public class RegController {

    @Autowired
    private AuthService authService;

    @PostMapping("/register")
    public String registerUser(

            @RequestParam("customerName") String name,

            @RequestParam("email") String email,

            @RequestParam("phone") String phone,

            @RequestParam("vehicleNumber") String vehicle,

            @RequestParam("password") String password) {

        try {

            UserEntity existingUser =
                    authService.getUserByEmail(email);

            if (existingUser != null) {

                System.out.println("Email already exists");

                return "user_registration";
            }

            authService.registerUser(
                    name,
                    email,
                    phone,
                    vehicle,
                    password);

            return "redirect:/login";

        } catch (Exception e) {

            e.printStackTrace();

            return "user_registration";
        }
    }
}