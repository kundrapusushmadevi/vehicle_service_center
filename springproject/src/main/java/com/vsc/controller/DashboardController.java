package com.vsc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vsc.entity.BookServiceEntity;
import com.vsc.entity.UserEntity;
import com.vsc.entity.VehicleEntity;
import com.vsc.service.BookServiceService;
import com.vsc.service.VehicleService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/auth")
public class DashboardController {

    @Autowired
    private VehicleService vehicleService;

    @Autowired
    private BookServiceService bookServiceService;

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {

        System.out.println("Dashboard Entered");

        UserEntity user =
                (UserEntity) session.getAttribute("loggedInUser");

        if (user == null) {
            return "redirect:/auth/login";
        }

        System.out.println("Logged User ID = " + user.getId());

        // Load Vehicles
        List<VehicleEntity> vehList =
                vehicleService.getVehiclesByUserId(user.getId());

        System.out.println("Vehicle Count = " + vehList.size());

        model.addAttribute("userVehList", vehList);

        // Load Orders / Service Bookings
        List<BookServiceEntity> orders =
                bookServiceService.getBookingsByUserId(user.getId());

        System.out.println("Orders Count = " + orders.size());

        model.addAttribute("orders", orders);

        return "user_dashboard";
    }
}