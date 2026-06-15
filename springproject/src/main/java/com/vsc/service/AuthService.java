package com.vsc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vsc.entity.UserEntity;
import com.vsc.repository.UserRepository;

@Service
public class AuthService {

    @Autowired
    private UserRepository userRepository;
    public UserEntity registerUser(
            String name,
            String email,
            String phone,
            String vehicle,
            String password) {

        UserEntity user = new UserEntity();

        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setVehicle(vehicle);
        user.setPassword(password);

        return userRepository.save(user);
    }

    public UserEntity saveUser(UserEntity user) {
        return userRepository.save(user);
    }

    public List<UserEntity> getAllUsers() {
        return userRepository.findAll();
    }

    public UserEntity getUserById(Integer userId) {
        return userRepository.findById(userId)
                             .orElse(null);
    }

    public void deleteUser(Integer userId) {
        userRepository.deleteById(userId);
    }

    public UserEntity updateUser(UserEntity user) {
        return userRepository.save(user);
    }

    public UserEntity getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public UserEntity doLogin(
            String email,
            String password) {

        return userRepository
                .findByEmailAndPassword(
                        email,
                        password);
    }
}