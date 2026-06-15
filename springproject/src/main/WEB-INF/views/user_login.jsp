<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Login Page</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', sans-serif;
}

body {
	height: 100vh;
	overflow: hidden;
	background: #f4f4f4;
	display: flex;
}

/* LEFT GREEN SIDE */
.left-section {
	width: 36%;
	background: linear-gradient(180deg, #93d89a 0%, #11b8a6 100%);
	position: relative;
	overflow: visible;
}

/* TRANSPARENT BOX */
.glass-box {
	position: absolute;
	width: 340px;
	height: 540px;
	background: rgba(255, 255, 255, 0.12);
	border-radius: 18px;
	top: 50%;
	left: 55%;
	transform: translate(-50%, -50%);
	backdrop-filter: blur(2px);
}

/* CAR IMAGE */
.car-img {
	position: absolute;
	width: 620px;
	top: 50%;
	left: 88%;
	transform: translate(-50%, -50%);
	z-index: 20;
	filter: drop-shadow(0 22px 30px rgba(0, 0, 0, 0.28));
}

/* RIGHT SIDE */
.right-section {
	width: 64%;
	background: #f7f7f7;
	display: flex;
	justify-content: center;
	align-items: center;
	position: relative;
}

/* LOGIN CARD */
.login-card {
	width: 420px;
	background: white;
	padding: 45px;
	border-radius: 15px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

/* CLOSE BUTTON */
.close-btn {
	position: absolute;
	top: 18px;
	right: 24px;
	font-size: 42px;
	color: #111;
	cursor: pointer;
	font-weight: 300;
}

/* TITLE */
.login-title {
	text-align: center;
	font-size: 24px;
	font-weight: 700;
	color: #111;
	margin-bottom: 10px;
}

/* SUBTITLE */
.login-subtitle {
	text-align: center;
	color: #8b8b8b;
	font-size: 15px;
	line-height: 1.5;
	margin-bottom: 38px;
}

/* INPUTS */
.input-box {
	width: 100%;
	height: 42px;
	border: 1px solid #d9d9d9;
	outline: none;
	padding: 0 14px;
	margin-bottom: 18px;
	font-size: 14px;
	border-radius: 6px;
}

/* LOGIN BUTTON */
.login-btn {
	width: 100%;
	height: 40px;
	background: #f7b500;
	border: none;
	color: white;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
	margin-top: 4px;
	border-radius: 6px;
}

.login-btn:hover {
	background: #e0a200;
}

/* BOTTOM LINKS */
.bottom-links {
	display: flex;
	justify-content: space-between;
	margin-top: 14px;
	font-size: 13px;
}

.green-link {
	color: #11b8a6;
	text-decoration: none;
}

.gray-link {
	color: #777;
	text-decoration: none;
}

/* SIGNUP */
.signup {
	text-align: center;
	margin-top: 26px;
	font-size: 15px;
	color: #555;
}

.signup a {
	color: #11b8a6;
	text-decoration: none;
	font-weight: 600;
}

/* RESPONSIVE */
@media ( max-width :1100px) {
	body {
		flex-direction: column;
	}
	.left-section {
		width: 100%;
		height: 260px;
	}
	.right-section {
		width: 100%;
		height: calc(100vh - 260px);
	}
	.glass-box {
		width: 260px;
		height: 220px;
		left: 50%;
	}
	.car-img {
		width: 330px;
		left: 50%;
	}
	.login-card {
		width: 92%;
		padding: 35px 25px;
	}
}
</style>
</head>

<body>

	<div class="left-section">

		<div class="glass-box"></div>

		<img src="images/car.png" alt="Car" class="car-img">

	</div>

	<div class="right-section">
		<div class="login-card">
			<div class="close-btn">×</div>
			<div class="login-title">Login your Account</div>
			<div class="login-subtitle">Since this is your first trip,
				you'll need to provide us with some information before you can check
				out.</div>
			<form action="${pageContext.request.contextPath}/auth/login" method="post">
				<input name="email" type="email" class="input-box"
					placeholder="Email Id" required> <input name="password"
					type="password" class="input-box" placeholder="Password" required>
				<button class="login-btn" type="submit">Login</button>
			</form>
			<div class="bottom-links">
				<a href="#" class="green-link"> Login with phone instead </a> <a
					href="#" class="gray-link"> Forgot password? </a>
			</div>
			<div class="signup">
				New member? <a href="user_reg.jsp"> Register </a>
			</div>
		</div>
	</div>
</body>
</html>