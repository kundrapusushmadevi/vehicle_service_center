<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.vsc.entity.UserEntity"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Profile Page</title>
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
    padding:35px;
    width:100%;
}
/* PROFILE CARD */
.profile-card{
    background:white;
    border-radius:10px;
    padding:35px;
    box-shadow:0px 2px 8px rgba(0,0,0,0.1);
    max-width:900px;
}
/* TOP SECTION */
.profile-top{
    display:flex;
    align-items:center;
    gap:25px;
    margin-bottom:35px;
}
.profile-image{
    width:120px;
    height:120px;
    border-radius:50%;
    background:#2563eb;
    display:flex;
    align-items:center;
    justify-content:center;
    color:white;
    font-size:42px;
    font-weight:bold;
}
.profile-name{
    font-size:32px;
    font-weight:bold;
    color:#111;
    margin-bottom:8px;
}
.profile-role{
    font-size:18px;
    color:#666;
}
/* DETAILS */
.details-grid{
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:20px;
}
.detail-box{
    background:#f8fafc;
    padding:20px;
    border-radius:10px;
    border:1px solid #ddd;
}
.detail-title{
    font-size:14px;
    color:#666;
    margin-bottom:8px;
}
.detail-value{
    font-size:18px;
    color:#111;
    font-weight:600;
}
/* BUTTONS */
.button-row{
    margin-top:35px;
    display:flex;
    gap:15px;
}
.btn{
    padding:14px 22px;
    border:none;
    border-radius:8px;
    cursor:pointer;
    font-size:15px;
    font-weight:600;
}
.edit-btn{
    background:#2563eb;
    color:white;
}
.edit-btn:hover{
    background:#1d4ed8;
}
.logout-profile-btn{
    background:#ef4444;
    color:white;
}
.logout-profile-btn:hover{
    background:#dc2626;
}
/* RESPONSIVE */
@media(max-width:900px){
    .container{
        grid-template-columns:1fr;
    }
    .details-grid{
        grid-template-columns:1fr;
    }
    .profile-top{
        flex-direction:column;
        align-items:flex-start;
    }
}
</style>
</head>

<body>
<div class="header">
    <h1>Vehicle Service Dashboard</h1>
    <button class="logout-btn"
        onclick="window.location='LogoutServlet'">
        Logout
    </button>
</div>
<div class="container">
    <div class="sidebar">
        <h2>User Panel</h2>
        <ul>
             <li onclick="window.location='/auth/dashboard'">
         🏠 Dashboard
    </li>
    <li class="active-menu" onclick="window.location='/auth/profile'">
        👤 Profile
    </li>
    <li onclick="window.location='/auth/myvehicles'">
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
    <div class="main">
        <div class="profile-card">
            <div class="profile-top">
                <div class="profile-image">
                   ${loggedInUser.name.substring(0,1).toUpperCase()}
                </div>
                <div>
                    <div class="profile-name">
                       ${loggedInUser.name}
                    </div>
                    <div class="profile-role">
                        Vehicle Service Customer
                    </div>
                </div>
            </div>
            <div class="details-grid">
                <div class="detail-box">
                    <div class="detail-title">
                        Full Name
                    </div>
                    <div class="detail-value">
                       ${loggedInUser.name}
                    </div>
                </div>
                <div class="detail-box">
                    <div class="detail-title">
                        Email Address
                    </div>
                    <div class="detail-value">
                       ${loggedInUser.email}
                    </div>
                </div>
                <div class="detail-box">
                    <div class="detail-title">
                        Phone Number
                    </div>
                    <div class="detail-value">
                       ${loggedInUser.phone}
                    </div>
                </div>
                <div class="detail-box">
                    <div class="detail-title">
                        Address
                    </div>
                    <div class="detail-value">
                        Hyderabad, India
                    </div>
                </div>
                <div class="detail-box">
                    <div class="detail-title">
                        Role
                    </div>
                    <div class="detail-value">
                        Customer
                    </div>
                </div>
                <div class="detail-box">
                    <div class="detail-title">
                        Joined Date
                    </div>
                    <div class="detail-value">
                        ${loggedInUser.date_created}
                    </div>
                </div>
            </div>
            <div class="button-row">
                <button class="btn edit-btn"
                    onclick="window.location='edit_profile.jsp'">
                    Edit Profile
                </button>
                <button class="btn logout-profile-btn"
                    onclick="window.location='LogoutServlet'">
                    Logout
                </button>
            </div>
        </div>
    </div>
</div>
<script>
console.log("Profile Page Loaded Successfully");
</script>
</body>
</html>