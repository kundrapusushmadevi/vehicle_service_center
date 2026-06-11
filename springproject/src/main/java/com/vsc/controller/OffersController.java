package com.vsc.controller;

import java.util.List;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vsc.entity.OfferEntity;
import com.vsc.entity.UserEntity;
import com.vsc.service.OfferService;

@Controller
@RequestMapping("/auth")
public class OffersController {

    @Autowired
    private OfferService offerService;

    @GetMapping("/offers")
    public String showOffersPage(
            HttpSession session,
            Model model) {

        UserEntity loggedInUser =
                (UserEntity) session.getAttribute("loggedInUser");

        if (loggedInUser == null) {
            return "redirect:/auth/login";
        }

        List<OfferEntity> offers =
                offerService.getActiveOffers();

        model.addAttribute("offers", offers);

        return "user_offers";
    }
}