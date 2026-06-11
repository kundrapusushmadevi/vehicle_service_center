<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.vsc.entity.UserEntity"%>
<%@ page import="jakarta.servlet.RequestDispatcher"%>
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
<title>Settings</title>
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
    padding:30px;
}
/* PAGE TITLE */
.page-title{
    font-size:34px;
    margin-bottom:10px;
    color:#111827;
}
.page-subtitle{
    color:#666;
    margin-bottom:30px;
}
/* SETTINGS SECTION */
.settings-container{
    background:white;
    border-radius:10px;
    padding:30px;
    box-shadow:0px 2px 8px rgba(0,0,0,0.1);
}
/* SETTING ROW */
.setting-row{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:22px 0;
    border-bottom:1px solid #e5e7eb;
}
.setting-left h3{
    color:#1e3a8a;
    margin-bottom:8px;
}
.setting-left p{
    color:#555;
    font-size:15px;
}
/* BUTTON */
.setting-btn{
    padding:12px 20px;
    border:none;
    border-radius:6px;
    cursor:pointer;
    background:#2563eb;
    color:white;
    font-size:14px;
    font-weight:bold;
    transition:0.3s;
}
.setting-btn:hover{
    background:#1d4ed8;
}
.delete-btn{
    background:#ef4444;
}
.delete-btn:hover{
    background:#dc2626;
}
/* RESPONSIVE */
@media(max-width:900px){
    .container{
        grid-template-columns:1fr;
    }
    .setting-row{
        flex-direction:column;
        align-items:flex-start;
        gap:15px;
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
    <button class="logout-btn"
    onclick="window.location.href='LogoutServlet'">
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
    <li onclick="window.location='/auth/orders'">
        📦 Orders
    </li>
    <li onclick="window.location='/auth/offers'">
        🎁 Offers
    </li>
    <li class="active-menu" onclick="window.location='/auth/settings'">
        ⚙ Settings
    </li>  
        </ul>
    </div>
    <!-- MAIN -->
    <div class="main">
        <h1 class="page-title">
            Settings
        </h1>
        <p class="page-subtitle">
            Manage your account preferences and security
        </p>
        <div class="settings-container">
           <!-- PROFILE -->
            <div class="setting-row">
               <div class="setting-left">
                   <h3>
                        Edit Profile
                    </h3>
                    <p>
                        Update your personal information
                        and contact details.
                    </p>
                </div>
                <button class="setting-btn">
                    Edit
                </button>
            </div>
            <!-- PASSWORD -->
            <div class="setting-row">
                <div class="setting-left">
                    <h3>
                        Change Password
                    </h3>
                    <p>
                        Update your account password
                        for better security.
                    </p>
                </div>
                <button class="setting-btn">
                    Change
                </button>
            </div>
            <!-- NOTIFICATIONS -->
            <div class="setting-row">
                <div class="setting-left">
                    <h3>
                        Notifications
                    </h3>
                    <p>
                        Manage service updates and alerts.
                    </p>

                </div>

                <button class="setting-btn">
                    Manage
                </button>
            </div>
            <!-- VEHICLES -->
            <div class="setting-row">
                <div class="setting-left">
                   <h3>
                        Vehicle Preferences
                    </h3>
                   <p>
                        Manage your default vehicles
                        and preferences.
                    </p>
                </div>
                <button class="setting-btn">
                    Update
                </button>
            </div>
            <!-- DELETE -->
            <div class="setting-row"
            style="border-bottom:none;">
                <div class="setting-left">
                    <h3>
                        Delete Account
                    </h3>
                    <p>
                        Permanently remove your account
                        and all data.
                    </p>
                </div>
                <button class="setting-btn delete-btn">
                    Delete
                </button>
            </div>
        </div>
    </div>
</div>
</body>
</html>