<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.vsc.entity.UserEntity"%>
<%@ page import="com.vsc.entity.VehicleEntity"%>
<%@ page import="java.util.List"%>

<%
UserEntity loggedInUser =
(UserEntity) session.getAttribute("loggedInUser");

if(loggedInUser == null){

    response.sendRedirect("user_login.jsp");
    return;
}

List<VehicleEntity> vehList =
(List<VehicleEntity>)
request.getAttribute("userVehList");

System.out.println("Vehicle List : " + vehList);
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>My Vehicles</title>

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
    margin-bottom:25px;
}

/* VEHICLE GRID */

.vehicle-container{
    display:grid;

    grid-template-columns:
    repeat(auto-fit,minmax(320px,1fr));

    gap:20px;
}

/* VEHICLE CARD */

.vehicle-card{
    background:#ffffff;
    border-radius:12px;
    padding:20px;
    display:flex;
    align-items:center;
    gap:20px;
    box-shadow:0px 2px 8px rgba(0,0,0,0.1);
    transition:0.3s;
}

.vehicle-card:hover{
    transform:translateY(-5px);
}

.vehicle-card img{
    width:90px;
    height:90px;
    object-fit:contain;
}

/* DETAILS */

.vehicle-details h3{
    color:#1e3a8a;
    margin-bottom:10px;
}

.vehicle-details p{
    margin-bottom:6px;
    color:#444;
}

/* NO DATA */

.no-vehicle{
    text-align:center;
    font-size:20px;
    color:#666;
    padding:40px;
}

</style>

</head>

<body>

<!-- HEADER -->

<div class="header">

    <h1>
        Vehicle Service Dashboard
    </h1>

    <button class="logout-btn"
    onclick="window.location.href='LogoutServlet'">

        Logout

    </button>

</div>

<div class="container">

    <!-- SIDEBAR -->

    <div class="sidebar">

        <h2>User Panel</h2>

        <ul>

      <li onclick="window.location='/auth/dashboard'">
         🏠 Dashboard
    </li>
    <li onclick="window.location='/auth/profile'">
        👤 Profile
    </li>
    <li class="active-menu" onclick="window.location='/auth/myvehicles'">
        🚗  My Vehicles
    </li>
     <li onclick="window.location='/auth/bookservice'">
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

        <div class="card">
<div style="display:flex;
            justify-content:space-between;
            align-items:center;
            margin-bottom:25px;">

    <h2 class="page-title" style="margin-bottom:0;">
        My Vehicles
    </h2>

    <button
        onclick="window.location='/auth/addVehicle'"
        style="
            background:#2563eb;
            color:white;
            border:none;
            padding:12px 20px;
            border-radius:8px;
            cursor:pointer;
            font-size:15px;
            font-weight:bold;">
        ➕ Add Vehicle
    </button>

</div>
            <div class="vehicle-container">

            <%
            if(vehList != null &&
               vehList.size() > 0){

                for(VehicleEntity v : vehList){
            %>

                <div class="vehicle-card">

                    <%
                    if(v.getVehicleType()
                    .equalsIgnoreCase("Bike")){
                    %>

                    <img
                    src="https://cdn-icons-png.flaticon.com/512/744/744467.png">

                    <%
                    }else{
                    %>

                    <img
                    src="https://cdn-icons-png.flaticon.com/512/744/744465.png">

                    <%
                    }
                    %>

                    <div class="vehicle-details">

                        <h3>
                            <%= v.getBrand() %>
                            <%= v.getModel() %>
                        </h3>

                        <p>
                            Vehicle Number :
                            <%= v.getVehicleNumber() %>
                        </p>

                        <p>
                            Vehicle Type :
                            <%= v.getVehicleType() %>
                        </p>

                        <p>
                            Chassis Number :
                            <%= v.getChassisNumber() %>
                        </p>

                        <p>
                            Manufacture Year :
                            <%= v.getManufactureYear() %>
                        </p>

                    </div>

                </div>

            <%
                }

            }else{
            %>

                <div class="no-vehicle">

                    No Vehicles Found In Database

                </div>

            <%
            }
            %>

            </div>
        </div>
    </div>
</div>
</body>
</html>