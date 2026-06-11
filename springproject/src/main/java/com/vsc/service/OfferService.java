package com.vsc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vsc.entity.OfferEntity;
import com.vsc.repository.OfferRepository;

@Service
public class OfferService {

    @Autowired
    private OfferRepository offerRepository;

    public List<OfferEntity> getActiveOffers() {
        return offerRepository.findByStatus("ACTIVE");
    }

    public OfferEntity saveOffer(OfferEntity offer) {
        return offerRepository.save(offer);
    }
}