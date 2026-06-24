<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport"
content="width=device-width, initial-scale=1.0">
<title>Offers Page</title>
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
/* CONTAINER */
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
    box-shadow:4px 0px 15px rgba(0,0,0,0.15);
}
/* USER PANEL */
.sidebar h2{
    color:#3b82f6;
    font-size:24px;
    font-weight:700;
    margin-bottom:35px;
    padding-left:10px;
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
/* PAGE TITLE */
.page-title{
    font-size:32px;
    margin-bottom:25px;
    color:#111;
}
.offer-banner{
    background:linear-gradient(
        135deg,
        #1e3a8a,
        #2563eb,
        #38bdf8
    );
    color:white;
    padding:35px;
    border-radius:15px;
    margin-bottom:30px;
    box-shadow:0 10px 25px rgba(0,0,0,0.15);
}

.offer-banner h1{
    font-size:34px;
    margin-bottom:10px;
}

.offer-banner p{
    font-size:17px;
    opacity:0.95;
}
/* OFFERS GRID */
.offers-container{
    display:grid;
    grid-template-columns:
        repeat(auto-fill,minmax(340px,1fr));
    gap:25px;
}
/* OFFER CARD */
.offer-card{
    position:relative;
    background:white;
    border-radius:18px;
    overflow:hidden;
    box-shadow:0 8px 20px rgba(0,0,0,0.08);
    transition:0.3s ease;
}

.offer-card:hover{
    transform:translateY(-8px);
    box-shadow:0 15px 35px rgba(0,0,0,0.15);
}
/* IMAGE */
.offer-card img{
    width:100%;
    height:220px;
    object-fit:cover;
}

/* DISCOUNT BADGE */
.discount-badge{
    position:absolute;
    top:15px;
    right:15px;
    background:#ef4444;
    color:white;
    padding:10px 14px;
    border-radius:30px;
    font-size:14px;
    font-weight:bold;
    z-index:5;
}
/* CONTENT */
.offer-content{
    padding:20px;
}

.offer-content h3{
    color:#1e3a8a;
    margin-bottom:10px;
    font-size:22px;
}

.offer-content p{
    color:#555;
    line-height:1.6;
    margin-bottom:15px;
}

/* FOOTER */
.offer-footer{
    display:flex;
    justify-content:space-between;
    align-items:center;
}

/* STATUS */
.status-active{
    background:#dcfce7;
    color:#15803d;
    padding:6px 12px;
    border-radius:20px;
    font-weight:bold;
}

.status-expired{
    background:#fee2e2;
    color:#dc2626;
    padding:6px 12px;
    border-radius:20px;
    font-weight:bold;
}
/* BUTTON */
.claim-btn{
    border:none;
    padding:10px 18px;
    border-radius:8px;
    background:linear-gradient(
        90deg,
        #2563eb,
        #38bdf8
    );
    color:white;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;
}

.claim-btn:hover{
    transform:scale(1.05);
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
    <li class="active-menu" onclick="window.location='/auth/offers'">
        🎁 Offers
    </li>
    <li onclick="window.location='/auth/settings'">
        ⚙ Settings
    </li>
        </ul>
    </div>
    <!-- MAIN -->
    <div class="main">

    <!-- HERO SECTION -->
    <div class="offer-banner">
        <div>
            <h1>🚗 Exclusive Vehicle Service Offers</h1>
            <p>
                Save more on servicing, repairs,
                oil changes and vehicle maintenance.
            </p>
        </div>
    </div>

    <h2 class="page-title">
        Latest Offers
    </h2>

    <div class="offers-container">

        <c:forEach var="offer" items="${offers}">

            <div class="offer-card">

                <div class="discount-badge">
                    ${offer.discountPercentage}% OFF
                </div>

                <img src="${offer.imageUrl}"
                     alt="${offer.offerTitle}">

                <div class="offer-content">

                    <h3>${offer.offerTitle}</h3>

                    <p>
                        ${offer.offerDescription}
                    </p>

                    <div class="offer-footer">

                        <span class="${offer.status eq 'ACTIVE' ? 'status-active' : 'status-expired'}">

                            ${offer.status}

                        </span>

                        <button class="claim-btn">
                            Claim Offer
                        </button>

                    </div>

                </div>

            </div>

        </c:forEach>

    </div>

</div>
        </div>
    </div>
<script>
</script>
</body>
</html>
