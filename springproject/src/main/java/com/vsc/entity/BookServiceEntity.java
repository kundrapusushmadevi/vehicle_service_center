package com.vsc.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "service_bookings")
@Getter
@Setter
@NoArgsConstructor
public class BookServiceEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "user_id")
    private int userId;

    @Column(name = "vehicle_number")
    private String vehicleNumber;

    @Column(name = "vehicle_type")
    private String vehicleType;

    @Column(name = "brand")
    private String brand;

    @Column(name = "services")
    private String services;

    @Column(name = "service_date")
    private String serviceDate;

    @Column(name = "service_time")
    private String serviceTime;

    @Column(name = "pickup")
    private String pickup;

    @Column(name = "issue_description")
    private String issueDescription;

    @Column(name = "booking_status")
    private String bookingStatus;

    @Column(name = "created_at")
    private String createdAt;
}