package com.vsc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.vsc.entity.OfferEntity;

@Repository
public interface OfferRepository
        extends JpaRepository<OfferEntity, Integer> {

    List<OfferEntity> findByStatus(String status);
}