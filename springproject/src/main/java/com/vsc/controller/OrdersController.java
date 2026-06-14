package com.vsc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vsc.entity.BookServiceEntity;
import com.vsc.entity.UserEntity;
import com.vsc.service.BookServiceService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/auth")
public class OrdersController {

    @Autowired
    private BookServiceService bookServiceService;

    @GetMapping("/orders")
    public String viewOrders(
            HttpSession session,
            Model model) {

        UserEntity loggedInUser =
                (UserEntity) session.getAttribute("loggedInUser");

        if (loggedInUser == null) {
            return "redirect:/auth/login";
        }

        List<BookServiceEntity> orders =
                bookServiceService.getBookingsByUserId(
                        loggedInUser.getId());

        model.addAttribute("orders", orders);

        System.out.println(
                "Orders Found = " + orders.size());

        return "user_orders";
    }
}