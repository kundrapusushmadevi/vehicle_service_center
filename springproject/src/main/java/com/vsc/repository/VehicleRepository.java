package com.vsc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.vsc.entity.VehicleEntity;

@Repository
public interface VehicleRepository
        extends JpaRepository<VehicleEntity, Integer> {

    List<VehicleEntity> findByUserId(Integer userId);

    VehicleEntity findByVehicleNumber(String vehicleNumber);

    List<VehicleEntity> findByBrand(String brand);

    List<VehicleEntity> findByVehicleType(String vehicleType);
}