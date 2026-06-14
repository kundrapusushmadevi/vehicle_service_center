package com.vsc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vsc.entity.UserEntity;
import com.vsc.entity.VehicleEntity;
import com.vsc.service.VehicleService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/auth")
public class AddVehicleController {

    @Autowired
    private VehicleService vehicleService;

    @PostMapping("/addVehicle")
    public String addVehicle(
            VehicleEntity vehicle,
            HttpSession session) {

        UserEntity loggedInUser =
                (UserEntity) session.getAttribute("loggedInUser");

        if (loggedInUser == null) {
            return "redirect:/auth/login";
        }

        vehicle.setUserId(loggedInUser.getId());

        vehicleService.saveVehicle(vehicle);

        return "redirect:/auth/myvehicles";
    }
}