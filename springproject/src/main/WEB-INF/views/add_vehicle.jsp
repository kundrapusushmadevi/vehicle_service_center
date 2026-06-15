<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Vehicle</title>

<style>
body{
    font-family:Arial,sans-serif;
    background:#f4f6f9;
}
.container{
    width:500px;
    margin:50px auto;
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 0 10px rgba(0,0,0,0.1);
}
input,select{
    width:100%;
    padding:10px;
    margin-top:10px;
    margin-bottom:15px;
}

button{
    width:100%;
    padding:12px;
    background:#2563eb;
    color:white;
    border:none;
    border-radius:5px;
}
</style>

</head>
<body>

<div class="container">

<h2>Add Vehicle</h2>

<form action="${pageContext.request.contextPath}/auth/addVehicle" method="post">
    <label>Vehicle Number</label>
    <input type="text" name="vehicleNumber" required>

    <label>Vehicle Type</label>
    <select name="vehicleType">
        <option>Bike</option>
        <option>Car</option>
    </select>

    <label>Brand</label>
    <input type="text" name="brand" required>

    <label>Model</label>
    <input type="text" name="model" required>

    <label>Chassis Number</label>
    <input type="text" name="chassisNumber" required>

    <label>Manufacture Year</label>
    <input type="number" name="manufactureYear" required>

    <button type="submit">
        Add Vehicle
    </button>

</form>

</div>

</body>
</html>