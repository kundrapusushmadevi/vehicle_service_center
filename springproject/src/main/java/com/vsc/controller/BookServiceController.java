package com.vsc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vsc.entity.BookServiceEntity;
import com.vsc.entity.UserEntity;
import com.vsc.entity.VehicleEntity;
import com.vsc.service.BookServiceService;
import com.vsc.service.VehicleService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/auth")
public class BookServiceController {

    @Autowired
    private VehicleService vehicleService;

    @Autowired
    private BookServiceService bookServiceService;

    @GetMapping("/bookservice")
    public String showBookServicePage(
            HttpSession session,
            Model model) {

        UserEntity loggedInUser =
                (UserEntity) session.getAttribute("loggedInUser");

        if (loggedInUser == null) {
            return "redirect:/auth/login";
        }

        List<VehicleEntity> vehList =
                vehicleService.getVehiclesByUserId(
                        loggedInUser.getId());

        model.addAttribute("userVehList", vehList);

        return "user_book_service";
    }

    @PostMapping("/bookservice")
    public String bookService(

            @RequestParam("vehicleNumber")
            String vehicleNumber,

            @RequestParam("vehicleType")
            String vehicleType,

            @RequestParam("brand")
            String brand,

            @RequestParam(value = "services",
                    required = false)
            String[] services,

            @RequestParam("serviceDate")
            String serviceDate,

            @RequestParam("serviceTime")
            String serviceTime,

            @RequestParam(value = "pickup",
                    required = false)
            String pickup,

            @RequestParam("issueDescription")
            String issueDescription,

            HttpSession session,
            Model model) {

        try {

            UserEntity loggedInUser =
                    (UserEntity) session.getAttribute("loggedInUser");

            if (loggedInUser == null) {
                return "redirect:/auth/login";
            }

            String serviceList = "";

            if (services != null) {
                serviceList = String.join(", ", services);
            }

            BookServiceEntity booking =
                    new BookServiceEntity();

            booking.setUserId(loggedInUser.getId());
            booking.setVehicleNumber(vehicleNumber);
            booking.setVehicleType(vehicleType);
            booking.setBrand(brand);
            booking.setServices(serviceList);
            booking.setServiceDate(serviceDate);
            booking.setServiceTime(serviceTime);
            booking.setPickup(pickup);
            booking.setIssueDescription(issueDescription);

            bookServiceService.saveBooking(booking);

            model.addAttribute(
                    "successMessage",
                    "Your service has been booked successfully!");

        } catch (Exception e) {

            e.printStackTrace();

            model.addAttribute(
                    "errorMessage",
                    "ERROR: " + e.getMessage());
        }

        UserEntity loggedInUser =
                (UserEntity) session.getAttribute("loggedInUser");

        if (loggedInUser != null) {

            List<VehicleEntity> vehList =
                    vehicleService.getVehiclesByUserId(
                            loggedInUser.getId());

            model.addAttribute("userVehList", vehList);
        }

        return "user_book_service";
    }
}