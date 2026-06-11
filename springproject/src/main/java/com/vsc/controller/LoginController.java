package com.vsc.controller;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vsc.db.DBConnection;
import com.vsc.entity.UserEntity;
import com.vsc.entity.VehicleEntity;
import com.vsc.service.AuthService;
import com.vsc.service.VehicleService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/auth")
public class LoginController {
	@Autowired
	AuthService authSerice;
	public LoginController(AuthService authSerice,
            VehicleService vehicleService) {
             this.authSerice = authSerice;
             this.vehicleService = vehicleService;
         }
	
	@Autowired
	private VehicleService vehicleService;
	
    @GetMapping("/login")
    public String showLoginPage() {
        return "user_login";
    }
    @PostMapping("/login")
    public String doLogin(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            HttpSession session,
            Model model) {
    	
    	UserEntity loggedInUser =
                authSerice.doLogin(email, password);

        if (loggedInUser != null) {

            session.setAttribute("loggedInUser", loggedInUser);

            List<VehicleEntity> userVehList =
                    vehicleService.getVehiclesByUserId(
                            loggedInUser.getId());

            session.setAttribute("userVehList", userVehList);

            return "redirect:/auth/dashboard";
        }

        model.addAttribute("errorMessage",
                "Invalid Email or Password");
    	
    	return "redirect:/auth/dashboard";
    	
//        Connection con = null;
//        try {
//            con = DBConnection.getConnection();
//            if (con == null) {
//                model.addAttribute("errorMessage", "Database Connection Failed");
//                return "user_login";
//            }
//            String query = "SELECT * FROM users WHERE email=? AND password=?";
//            PreparedStatement ps = con.prepareStatement(query);
//            ps.setString(1, email);
//            ps.setString(2, password);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                int userId         = rs.getInt("id");
//                String user_name   = rs.getString("name");
//                String user_email  = rs.getString("email");
//                String user_phone  = rs.getString("phone");
//                String user_date   = rs.getString("created_date");
//
//                UserEntity loggedInUser = new UserEntity(
//                        userId,
//                        user_name,
//                        user_email,
//                        user_phone,
//                        "",
//                        user_date
//                );
//                session.setAttribute("loggedInUser", loggedInUser);
//                List<VehicleEntity> userVehList = getUserVehicleInfo(userId);
//                session.setAttribute("userVehList", userVehList);
//                return "redirect:/auth/dashboard";
//            } else {
//                model.addAttribute("errorMessage", "Invalid Email or Password");
//                return "user_login";
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            model.addAttribute("errorMessage", "ERROR: " + e.getMessage());
//            return "user_login";
//        } finally {
//            try {
//                if (con != null) con.close();
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
    }
}