<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.vsc.entity.UserEntity"%>
<%@ page import="com.vsc.entity.VehicleEntity"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Vehicle Service Center - User Dashboard</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}
body {
	background: #f4f6f9;
}
/* Header */
.header {
	background: #1e3a8a;
	color: white;
	padding: 15px 30px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}
.header h1 {
	font-size: 28px;
}
.header button {
	padding: 10px 18px;
	border: none;
	border-radius: 5px;
	background: #ef4444;
	color: white;
	cursor: pointer;
}
/* Layout */
.container {
	display: grid;
	grid-template-columns: 250px 1fr;
	min-height: 100vh;
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
/* Main Content */
.main {
	padding: 25px;
}
/* Cards */
.card {
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
	margin-bottom: 25px;
}
/* Profile */
.profile {
	display: flex;
	align-items: center;
	gap: 20px;
}
.profile img {
	width: 90px;
	height: 90px;
	border-radius: 50%;
	border: 3px solid #1e3a8a;
}
.profile-details h3 {
	margin-bottom: 8px;
}
/* Tables */
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 15px;
}
table th, table td {
	padding: 12px;
	border-bottom: 1px solid #ddd;
	text-align: left;
}
table th {
	background: #1e3a8a;
	color: white;
}
/* Offers */
.offers {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
	gap: 20px;
}
.offer-box {
	background: linear-gradient(135deg, #2563eb, #1d4ed8);
	color: white;
	padding: 20px;
	border-radius: 10px;
}
.offer-box h3 {
	margin-bottom: 10px;
}
</style>
</head>

<%
UserEntity loggedInUser = (UserEntity) session.getAttribute("loggedInUser");
if (loggedInUser == null) {
    response.sendRedirect("/auth/login");
    return;
}
%>
<body>
	<div class="header">
		<h1>Vehicle Service Dashboard</h1>
		<button>Logout</button>
	</div>
	<div class="container">
		<div class="sidebar">
			<h2>User Panel</h2>

			<ul>
   <li class="active-menu"
        onclick="window.location='user_dashboard'">
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
    <li onclick="window.location='/auth/settings'">
        ⚙ Settings
    </li>
    
</ul>
		</div>
		<div class="main">
			<div class="card">
				<h2>User Profile</h2>
				<div class="profile">
					<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
						alt="profile">
					<div class="profile-details">
						<h3>
							<%
							out.write(loggedInUser.getName());
							%>
						</h3>
						<p>
							Email:
							<%=loggedInUser.getEmail()%></p>
						<p>
							Phone:
							<%=loggedInUser.getPhone()%></p>
						<p>
							Member Since:
							<%=loggedInUser.getDate_created()%></p>
					</div>
				</div>
			</div>
			<div class="card">
				<h2>My Vehicles</h2>
				<table>
					<tr>
						<th>Vehicle Number</th>
						<th>Type</th>
						<th>Brand</th>
						<th>Model</th>
					</tr>
					<%
					List<VehicleEntity> vehList =
					(List<VehicleEntity>) request.getAttribute("userVehList");

					if(vehList != null && !vehList.isEmpty()){

					    for(VehicleEntity v : vehList){
					%>

					<tr>
					    <td><%=v.getVehicleNumber()%></td>
					    <td><%=v.getVehicleType()%></td>
					    <td><%=v.getBrand()%></td>
					    <td><%=v.getModel()%></td>
					</tr>

					<%
					    }
					}else{
					%>

					<tr>
					    <td colspan="4">No Vehicles Found</td>
					</tr>

					<%
					}
					%>

				</table>
			</div>
			<div class="card">
				<h2>Service / Order History</h2>
				<table>
					<tr>
						<th>Order ID</th>
						<th>Service</th>
						<th>Date</th>
						<th>Status</th>
						<th>Amount</th>
					</tr>
					<tr>
						<td>ORD1001</td>
						<td>General Service</td>
						<td>12-May-2026</td>
						<td>Completed</td>
						<td>₹3,500</td>
					</tr>
					<tr>
						<td>ORD1002</td>
						<td>Oil Change</td>
						<td>25-Apr-2026</td>
						<td>Completed</td>
						<td>₹1,200</td>
					</tr>
					<tr>
						<td>ORD1003</td>
						<td>Engine Repair</td>
						<td>18-Mar-2026</td>
						<td>In Progress</td>
						<td>₹8,000</td>
					</tr>
				</table>
			</div>
			<div class="card">
				<h2>Latest Offers</h2>
				<div class="offers">
					<div class="offer-box">
						<h3>20% OFF</h3>
						<p>On complete car service this weekend.</p>
					</div>
					<div class="offer-box">
						<h3>Free Wash</h3>
						<p>Get free vehicle wash with oil change.</p>
					</div>
					<div class="offer-box">
						<h3>Membership Offer</h3>
						<p>Premium members get priority servicing.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html> 