<%@ page contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="com.vsc.entity.UserEntity"%>
<%@ page import="com.vsc.entity.VehicleEntity"%>
<%@ page import="java.util.List"%>
<%
List<VehicleEntity> vehList =
(List<VehicleEntity>)request.getAttribute("userVehList");
%>
<%
UserEntity loggedInUser =
(UserEntity) session.getAttribute("loggedInUser");
if(loggedInUser == null){
    response.sendRedirect("user_login.jsp");
    return;
}
String success = request.getParameter("success");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
content="width=device-width, initial-scale=1.0">
<title>
    Book a Service
</title>
<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,sans-serif;
}
body{
    background:#f4f6f9;
}
/* HEADER */
.header{
    background:#1e3a8a;
    color:white;
    padding:15px 30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}
.header h1{
    font-size:28px;
}
.logout-btn{
    padding:10px 18px;
    border:none;
    border-radius:5px;
    background:#ef4444;
    color:white;
    cursor:pointer;
    font-size:15px;
}
.logout-btn:hover{
    background:#dc2626;
}
/* LAYOUT */
.container{
    display:grid;
    grid-template-columns:250px 1fr;
    min-height:100vh;
}
/* SIDEBAR */
.sidebar{
    background:linear-gradient(180deg,#0f172a,#172554);
    color:white;
    padding:25px 18px;
    min-height:100vh;
}
.sidebar h2{
    color:#3b82f6;
    font-size:22px;
    font-weight:700;
    margin-bottom:35px;
    padding-left:8px;
}
.sidebar ul{
    list-style:none;
}
.sidebar ul li{
    padding:16px 18px;
    margin-bottom:16px;
    background:rgba(255,255,255,0.05);
    border-radius:14px;
    cursor:pointer;
    transition:0.3s;
    font-size:17px;
    font-weight:500;
    display:flex;
    align-items:center;
    gap:12px;
    color:#f3f4f6;
    box-shadow:0px 3px 10px rgba(0,0,0,0.10);
}
.sidebar ul li:hover{
    background:rgba(59,130,246,0.25);
    transform:translateX(4px);
}
.active-menu{
    background:linear-gradient(90deg,#2563eb,#38bdf8) !important;
    color:white;
    font-weight:700;
    box-shadow:0px 6px 18px rgba(37,99,235,0.35);
}
/* MAIN */
.main{
    display:flex;
    justify-content:center;
    align-items:center;
    padding:30px;
}
/* CARD */
.booking-card{
    background:white;
    border-radius:18px;
    padding:35px;
    box-shadow:0px 2px 10px rgba(0,0,0,0.08);
    width:100%;
    max-width:900px;
}
/* TITLES */
.page-title{
    font-size:34px;
    margin-bottom:10px;
    color:#111827;
    text-align:center;
}
.page-subtitle{
    color:#666;
    margin-bottom:35px;
    text-align:center;
}
/* SUCCESS MESSAGE */
.success-box{
    background:#dcfce7;
    color:#166534;
    padding:15px;
    border-radius:10px;
    margin-bottom:25px;
    text-align:center;
    font-weight:600;
}
/* SECTION */
.section{
    margin-bottom:28px;
}
.section h2{
    margin-bottom:15px;
    font-size:20px;
    color:#222;
}
/* INPUTS */
select,
input[type="text"],
input[type="date"],
input[type="time"],
textarea{
    width:100%;
    padding:14px;
    border-radius:10px;
    border:1px solid #d0d0d0;
    font-size:15px;
    outline:none;
}
textarea{
    min-height:120px;
    resize:none;
}
select:focus,
input:focus,
textarea:focus{
    border-color:#2563eb;
}
/* SERVICE BOX */
.service-box{
    border:1px solid #e1e1e1;
    border-radius:14px;
    padding:18px;
    margin-bottom:15px;
    transition:0.3s;
    background:#fafafa;
}
.service-box:hover{
    border-color:#2563eb;
    background:#f4f9ff;
}
.service-box label{
    display:flex;
    align-items:flex-start;
    gap:14px;
    cursor:pointer;
}
.service-box input{
    margin-top:5px;
    transform:scale(1.2);
}
.service-title{
    font-size:17px;
    font-weight:600;
}
.service-desc{
    font-size:14px;
    color:#666;
    margin-top:4px;
}
/* DATE TIME */
.datetime{
    display:flex;
    gap:20px;
}
.datetime-box{
    flex:1;
}
/* PICKUP */
.pickup-box{
    background:#f8fafc;
    padding:18px;
    border-radius:12px;
    border:1px solid #ddd;
}
/* BUTTON */
.continue-btn{
    width:100%;
    padding:16px;
    border:none;
    border-radius:12px;
    background:#2563eb;
    color:white;
    font-size:18px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
    margin-top:10px;
}
.continue-btn:hover{
   background:#1d4ed8;
}
/* RESPONSIVE */
@media(max-width:900px){
    .container{
        grid-template-columns:1fr;
    }
    .datetime{
        flex-direction:column;
    }
}
</style>

</head>
<body>
<!-- HEADER -->
<div class="header">
    <h1>
        Vehicle Service Dashboard
    </h1>
    <button class="logout-btn" onclick="window.location.href='LogoutServlet'">
        Logout
    </button>
</div>
<div class="container">
    <!-- SIDEBAR -->
    <div class="sidebar">
        <h2>
            User Panel
        </h2>
        <ul>
          <li onclick="window.location='/auth/dashboard'">
             🏠 Dashboard
          </li>
          <li onclick="window.location='/auth/profile'">
             👤 Profile
          </li>
          <li onclick="window.location='/auth/myvehicles'">
             🚗  My Vehicles
          </li>
          <li class="active-menu" onclick="window.location='/auth/bookservice'">
             🛠 Book Service
          </li>
          <li onclick="window.location='/auth/orders'">
             📦 Orders
          </li>
          <li onclick="window.location='/auth/offers'">
             🎁 Offers
         </li>
          <li onclick="window.location='/auth/settings'">
             ⚙ Settings
          </li>
        </ul>
    </div>
    <!-- MAIN -->
    <div class="main">
        <div class="booking-card">
            <h1 class="page-title">
                Book a Service
            </h1>
            <p class="page-subtitle">
                Schedule your vehicle service appointment
            </p>
<%
String successMessage =
(String) request.getAttribute("successMessage");
String errorMessage =
(String) request.getAttribute("errorMessage");
%>
<% if(successMessage != null){%>
<div class="success-box">
    <%= successMessage %>
</div>
<% } %>
<% if(errorMessage != null){ %>

<div style=" background:#fee2e2; color:#b91c1c; padding:15px; border-radius:10px; margin-bottom:25px; text-align:center; font-weight:600;">
    <%= errorMessage %>
</div>
<% } %>
            <form action="/auth/bookservice" method="post">
                <!-- VEHICLE DETAILS -->
                <div class="section">
                    <h2>
                        Vehicle Details
                    </h2>
                    
       <!-- VEHICLE NUMBER -->
<div style="margin-bottom:18px;">
    <label style="display:block; margin-bottom:8px; font-weight:600;">
        Vehicle Number
    </label>

    <input type="text"
           id="vehicleNumber"
           name="vehicleNumber"
           placeholder="Enter Vehicle Number"
           required>
</div>
                   
                    
                    <!-- VEHICLE TYPE -->
                    <div style="margin-bottom:18px;">
                        <label style=" display:block; margin-bottom:8px; font-weight:600;">
                            Vehicle Type
                        </label>
                       <select id="vehicleType" name="vehicleType" required>
                            <option value="">
                                Select Vehicle Type
                            </option>
                            <option value="Car">
                                Car
                            </option>
                            <option value="Bike">
                                Bike
                            </option>
                        </select>
                    </div>

                    <!-- BRAND -->
                    <div style="margin-bottom:18px;">
                        <label style=" display:block; margin-bottom:8px; font-weight:600;">
                            Brand
                        </label>
                        <select id="brand" name="brand" required>
                            <option value="">
                                Select Brand
                            </option>

                            <!-- CAR BRANDS -->
                            <option value="Honda">
                                Honda
                            </option>
                            <option value="Hyundai">
                                Hyundai
                            </option>
                            <option value="Tata">
                                Tata
                            </option>
                            <option value="Mahindra">
                                Mahindra
                            </option>
                            <option value="Toyota">
                                Toyota
                            </option>
                            <option value="Suzuki">
                                Maruti Suzuki
                            </option>
                            <option value="Kia">
                                Kia
                            </option>

                            <!-- BIKE BRANDS -->
                            <option value="Hero">
                                Hero
                            </option>
                            <option value="Honda Bike">
                                Honda Bike
                            </option>
                            <option value="TVS">
                                TVS
                            </option>
                            <option value="Bajaj">
                                Bajaj
                            </option>
                            <option value="Royal Enfield">
                                Royal Enfield
                            </option>
                            <option value="Yamaha">
                                Yamaha
                            </option>
                            <option value="KTM">
                                KTM
                            </option>
                        </select>
                    </div>
                </div>

                <!-- SERVICES -->
                <div class="section">
                    <h2>
                        Select Services
                    </h2>
                    <div class="service-box">
                        <label>
                            <input type="checkbox" name="services" value="General Service">
                            <div>
                                <div class="service-title">
                                    General Service
                                </div>
                                <div class="service-desc">
                                    Complete routine maintenance check
                                </div>
                            </div>
                        </label>
                    </div>
                    <div class="service-box">
                        <label>
                            <input type="checkbox" name="services" value="Oil Change">
                            <div>
                                <div class="service-title">
                                    Oil Change
                                </div>
                                <div class="service-desc">
                                    Engine oil replacement service
                                </div>
                            </div>
                        </label>
                    </div>
                    <div class="service-box">
                        <label>
                            <input type="checkbox" name="services" value="Repair">
                            <div>
                                <div class="service-title">
                                    Repair & Maintenance
                                </div>
                                <div class="service-desc">
                                    Vehicle issue diagnosis and repair
                                </div>
                            </div>
                        </label>
                    </div>
                    <div class="service-box">
                        <label>
                            <input type="checkbox" name="services" value="Washing">
                            <div>
                                <div class="service-title">
                                    Washing & Cleaning
                                </div>
                                <div class="service-desc">
                                    Interior and exterior cleaning
                                </div>
                            </div>
                        </label>
                    </div>
                </div>

                <!-- DATE TIME -->
                <div class="section">
                    <h2>
                        Select Date & Time
                    </h2>
                    <div class="datetime">
                        <div class="datetime-box">
                            <label>
                                Date
                            </label>
                            <input type="date" name="serviceDate" required>
                        </div>
                        <div class="datetime-box">
                            <label>
                                Time
                            </label>
                            <input type="time" name="serviceTime" required>
                        </div>
                    </div>
                </div>

                <!-- PICKUP -->
                <div class="section">
                    <h2>
                        Pickup Option
                    </h2>
                    <div class="pickup-box">
                        <label>
                            <input type="checkbox" name="pickup" value="Yes">
                            Request Doorstep Pickup Service
                        </label>
                    </div>
                </div>

                <!-- ISSUE -->
                <div class="section">
                    <h2>
                        Describe Issue
                    </h2>
                    <textarea name="issueDescription" placeholder="Describe your vehicle issue or special instructions..."></textarea>
                </div>

                <!-- BUTTON -->
                <button class="continue-btn" type="submit">
                    Book Service
                </button>
            </form>
        </div>
    </div>
</div>
<script>

</script>
</body>
</html>