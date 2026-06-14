package com.vsc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vsc.entity.UserEntity;
import com.vsc.entity.VehicleEntity;
import com.vsc.service.VehicleService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/auth")
public class MyVehiclesController {

    @Autowired
    private VehicleService vehicleService;

    @GetMapping("/myvehicles")
    public String showMyVehicles(HttpSession session, Model model) {

        UserEntity loggedInUser =
                (UserEntity) session.getAttribute("loggedInUser");

        if (loggedInUser == null) {
            return "redirect:/auth/login";
        }

        List<VehicleEntity> vehList =
                vehicleService.getVehiclesByUserId(loggedInUser.getId());

        model.addAttribute("userVehList", vehList);

        System.out.println("Vehicle Count = " + vehList.size());

        return "user_myvehicles";
    }
}