package com.vsc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vsc.entity.UserEntity;
import com.vsc.service.SettingService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/auth")
public class SettingController {

    @Autowired
    private SettingService settingService;

    @GetMapping("/settings")
    public String settingsPage(
            HttpSession session,
            Model model) {

        UserEntity loggedInUser =
                (UserEntity) session.getAttribute("loggedInUser");

        if (loggedInUser == null) {
            return "redirect:/auth/login";
        }

        UserEntity user =
                settingService.getUserSettings(
                        loggedInUser.getId());

        model.addAttribute("user", user);

        return "user_setting";
    }
}