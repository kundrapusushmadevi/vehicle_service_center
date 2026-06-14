package com.vsc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vsc.entity.VehicleEntity;
import com.vsc.repository.VehicleRepository;

@Service
public class VehicleService {

    @Autowired
    private VehicleRepository vehicleRepository;

    public List<VehicleEntity> getVehiclesByUserId(Integer userId) {
        return vehicleRepository.findByUserId(userId);
    }

    public VehicleEntity saveVehicle(VehicleEntity vehicle) {
        return vehicleRepository.save(vehicle);
    }

    public VehicleEntity getVehicleById(Integer vehicleId) {
        return vehicleRepository.findById(vehicleId).orElse(null);
    }

    public void deleteVehicle(Integer vehicleId) {
        vehicleRepository.deleteById(vehicleId);
    }

    public VehicleEntity updateVehicle(VehicleEntity vehicle) {
        return vehicleRepository.save(vehicle);
    }
}