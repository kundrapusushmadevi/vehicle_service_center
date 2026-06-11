package com.vsc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vsc.entity.UserEntity;
import com.vsc.repository.UserRepository;

@Service
public class SettingService {

    @Autowired
    private UserRepository userRepository;

    public UserEntity getUserSettings(Integer userId) {

        return userRepository.findById(userId)
                             .orElse(null);
    }

    public UserEntity updateSettings(UserEntity user) {

        return userRepository.save(user);
    }

    public void changePassword(
            Integer userId,
            String newPassword) {

        UserEntity user =
                userRepository.findById(userId)
                              .orElse(null);

        if (user != null) {

            user.setPassword(newPassword);

            userRepository.save(user);
        }
    }
}