package com.vsc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vsc.entity.BookServiceEntity;
import com.vsc.repository.BookServiceRepository;

@Service
public class BookServiceService {

    @Autowired
    private BookServiceRepository bookServiceRepository;

    public BookServiceEntity saveBooking(
            BookServiceEntity booking) {

        return bookServiceRepository.save(booking);
    }

    public List<BookServiceEntity> getBookingsByUserId(
            Integer userId) {

        return bookServiceRepository
                .findByUserIdOrderByIdDesc(userId);
    }

    public List<BookServiceEntity> getAllBookings() {

        return bookServiceRepository.findAll();
    }

    public BookServiceEntity getBookingById(
            Integer bookingId) {

        return bookServiceRepository.findById(bookingId)
                .orElse(null);
    }
}