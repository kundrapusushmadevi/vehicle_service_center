<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Vehicle Service Center</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:url('https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=1974&auto=format&fit=crop') no-repeat center center/cover;
}

.overlay{
    width:100%;
    min-height:100vh;
    background:rgba(0,0,0,0.6);
    display:flex;
    justify-content:center;
    align-items:center;
}

.container{
    width:420px;
    margin:40px 0;
    background:rgba(255,255,255,0.95);
    padding:30px;
    border-radius:15px;
    box-shadow:0 0 15px rgba(0,0,0,0.4);
}

.container h1{
    text-align:center;
    color:#ff6600;
    margin-bottom:5px;
}

.container p{
    text-align:center;
    color:#555;
    margin-bottom:20px;
}

.input-box{
    margin-bottom:15px;
}

.input-box label{
    display:block;
    margin-bottom:5px;
    font-weight:bold;
    color:#333;
}

.input-box input,
.input-box select,
.input-box textarea{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
    outline:none;
    transition:0.3s;
}

.input-box input:focus,
.input-box select:focus,
.input-box textarea:focus{
    border-color:#ff6600;
    box-shadow:0 0 5px #ff6600;
}

textarea{
    resize:none;
    height:80px;
}

button{
    width:100%;
    padding:14px;
    background:#ff6600;
    border:none;
    color:white;
    font-size:16px;
    border-radius:8px;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    background:#e65c00;
}

.vehicle-images{
    display:flex;
    justify-content:space-around;
    margin-bottom:20px;
}

.vehicle-images img{
    width:80px;
    height:80px;
    border-radius:50%;
    border:3px solid #ff6600;
    object-fit:cover;
}

</style>
</head>

<body>

<div class="overlay">

<div class="container">

    <h1>Vehicle Service Center</h1>
    <p>Register Your Vehicle for Service</p>

    <div class="vehicle-images">
        <img src="https://images.unsplash.com/photo-1503376780353-7e6692767b70?q=80&w=800&auto=format&fit=crop" alt="Car">

        <img src="https://images.unsplash.com/photo-1558981806-ec527fa84c39?q=80&w=800&auto=format&fit=crop" alt="Bike">
    </div>

   <form action="RegServlet" method="post">

        <div class="input-box">
            <label>Customer Name</label>
            <input type="text" name="customerName" placeholder="Enter your name" required>
        </div>

        <div class="input-box">
            <label>Phone Number</label>
            <input type="tel" name="phone" placeholder="Enter phone number" required>
        </div>

        <div class="input-box">
            <label>Email</label>
            <input type="email" name="email" placeholder="Enter email" required>
        </div>
  
        <div class="input-box">
            <label>Password</label>
            <input type="password" name="password" placeholder="Enter password" required>
        </div>
        
        <div class="input-box">
            <label>Vehicle Number</label>
            <input type="text" name="vehicleNumber" placeholder="AP39AB1234" required>
        </div>

        <div class="input-box">
            <label>Vehicle Type</label>
            <select name="vehicleType" required>
                <option value="">Select Vehicle</option>
                <option>Bike</option>
                <option>Car</option>
                <option>Truck</option>
                <option>Bus</option>
            </select>
        </div>

        <div class="input-box">
            <label>Service Type</label>
            <select name="serviceType" required>
                <option value="">Select Service</option>
                <option>General Service</option>
                <option>Oil Change</option>
                <option>Engine Repair</option>
                <option>Water Wash</option>
            </select>
        </div>

        <div class="input-box">
            <label>Address</label>
            <textarea name="address" placeholder="Enter address"></textarea>
        </div>

        <button type="submit">Register Vehicle</button>

    </form>

</div>

</div>
       

</body>
</html>