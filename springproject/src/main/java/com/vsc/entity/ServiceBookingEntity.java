package com.vsc.entity;

public class ServiceBookingEntity {
    private int id;
    private int userId;
    private String vehicleNumber;
    private String vehicleType;
    private String brand;
    private String services;
    private String serviceDate;
    private String serviceTime;
    private String pickup;
    private String issueDescription;
    private String bookingStatus;
    private String createdAt;
    public ServiceBookingEntity() {
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public String getVehicleNumber() {
        return vehicleNumber;
    }
    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }
    public String getVehicleType() {
        return vehicleType;
    }
    public void setVehicleType(String vehicleType) {
        this.vehicleType = vehicleType;
    }
    public String getBrand() {
        return brand;
    }
    public void setBrand(String brand) {
        this.brand = brand;
    }
    public String getServices() {
        return services;
    }
    public void setServices(String services) {
        this.services = services;
    }
    public String getServiceDate() {
        return serviceDate;
    }
    public void setServiceDate(String serviceDate) {
        this.serviceDate = serviceDate;
    }
    public String getServiceTime() {
        return serviceTime;
    }
    public void setServiceTime(String serviceTime) {
        this.serviceTime = serviceTime;
    }
    public String getPickup() {
        return pickup;
    }
    public void setPickup(String pickup) {
        this.pickup = pickup;
    }

    public String getIssueDescription() {
        return issueDescription;
    }
    public void setIssueDescription(String issueDescription) {
        this.issueDescription = issueDescription;
    }
    public String getBookingStatus() {
        return bookingStatus;
    }
    public void setBookingStatus(String bookingStatus) {
        this.bookingStatus = bookingStatus;
    }
    public String getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}