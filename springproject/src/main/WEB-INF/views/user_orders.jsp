<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.vsc.entity.UserEntity"%>
<%@ page import="java.util.List"%>
<%@ page import="com.vsc.entity.BookServiceEntity"%>
<%
UserEntity loggedInUser =
(UserEntity) session.getAttribute("loggedInUser");
if(loggedInUser == null){
    RequestDispatcher rd =
    request.getRequestDispatcher("user_login.jsp");
    rd.forward(request,response);
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
content="width=device-width, initial-scale=1.0">
<title>User Orders</title>

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
/* USER PANEL */
.sidebar h2{
    color:#3b82f6;
    font-size:22px;
    font-weight:700;
    margin-bottom:35px;
    padding-left:8px;
}
/* MENU */
.sidebar ul{
    list-style:none;
}
/* MENU ITEMS */
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
/* HOVER EFFECT */
.sidebar ul li:hover{
    background:rgba(59,130,246,0.25);
    transform:translateX(4px);
}
/* ACTIVE MENU */
.active-menu{
    background:linear-gradient(90deg,#2563eb,#38bdf8) !important;
    color:white;
    font-weight:700;
    box-shadow:0px 6px 18px rgba(37,99,235,0.35);
}
/* MAIN */
.main{
    padding:25px;
}
/* CARD */
.card{
    background:white;
    padding:25px;
    border-radius:10px;
    box-shadow:0px 2px 8px rgba(0,0,0,0.1);
}
/* TITLE */
.page-title{
    font-size:32px;
    color:#111;
    margin-bottom:25px;
}
/* ORDER CONTAINER */
.order-container{
    display:grid;
    grid-template-columns:
    repeat(auto-fit,minmax(340px,1fr));
    gap:20px;
}
/* ORDER CARD */
.order-card{
    background:#ffffff;
    border-radius:12px;
    padding:20px;
    display:flex;
    gap:20px;
    align-items:center;
    box-shadow:0px 2px 8px rgba(0,0,0,0.1);
    transition:0.3s;
}
.order-card:hover{
   transform:translateY(-5px);
}
.order-card img{
    width:90px;
    height:90px;
    object-fit:contain;
}
/* DETAILS */
.order-details h3{
    color:#1e3a8a;
    margin-bottom:10px;
}
.order-details p{
    margin-bottom:6px;
    color:#444;
}
/* STATUS */
.status{
    font-weight:bold;
    margin-top:10px;
    color:#2563eb;
}
@media(max-width:900px){
    .container{
        grid-template-columns:1fr;
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
       <li onclick="window.location='/auth/bookservice'">
           🛠 Book Service
        </li>
       <li class="active-menu" onclick="window.location='/auth/orders'">
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
        <div class="card">
            <h2 class="page-title">
                My Orders
            </h2>
            <div class="order-container">
<%
List<BookServiceEntity> orders =
(List<BookServiceEntity>)
request.getAttribute("orders");
if(orders != null
&& !orders.isEmpty()){
    for(BookServiceEntity order : orders){
        String imagePath;
        if(order.getVehicleType() != null
        && order.getVehicleType()
        .equalsIgnoreCase("Bike")){
            imagePath =
            "https://cdn-icons-png.flaticon.com/512/744/744467.png";
        }else{
            imagePath =
            "https://cdn-icons-png.flaticon.com/512/744/744465.png";
        }
%>

<div class="order-card">
    <img src="<%= imagePath %>" alt="Vehicle">
    <div class="order-details">
        <h3>
            <%= order.getServices() %>
        </h3>
        <p>
            Booking ID :
            ORD<%= order.getId() %>
        </p>
        <p>
            Vehicle :
            <%= order.getBrand() %>
            -
            <%= order.getVehicleNumber() %>
        </p>
        <p>
            Vehicle Type :
            <%= order.getVehicleType() %>
        </p>
        <p>
            Service Date :
            <%= order.getServiceDate() %>
        </p>
        <p>
            Time :
            <%= order.getServiceTime() %>
        </p>
        <p class="status">
            <%= order.getBookingStatus() %>
        </p>
    </div>
</div>

<%
    }
}else{
%>

<h2>
    No Orders Found
</h2>
<%
}
%>
            </div>
        </div>
    </div>
</div>
</body>
</html>