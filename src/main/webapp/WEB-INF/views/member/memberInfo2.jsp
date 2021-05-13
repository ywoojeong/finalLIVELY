<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="css/memberInfo.css" />
<script src="js/memberInfo.js"></script>

<!-- cookie -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

</head>
<body>
<div class="container">
	<div id="logo"><h1 class="logo"><img src="image/logo.png" width="120" height="42"></h1>
		<div class="CTA"><h1>가입하기</h1></div>
	</div>
<!-- 	<div class="leftbox">
		<nav>
			<a id="profile" class="active"><i class="fa fa-user"></i></a>
			<a id="payment"><i class="fa fa-credit-card"></i></a>
			<a id="subscription"><i class="fa fa-tv"></i></a>
			<a id="privacy"><i class="fa fa-tasks"></i></a>
			<a id="settings"><i class="fa fa-cog"></i></a>
		</nav>
	</div> -->
	<div class="rightbox">
		<div class="profile">
			<h1>Personal Info</h1>
			<h2>Full Name</h2>
			<p>Julie Park <button class="btn">update</button></p>
			<h2>Birthday</h2>
			<p>July 21</p>
			<h2>Gender</h2>
			<p>Female</p>
			<h2>Email</h2>
			<p>example@example.com <button class="btn">update</button></p>
			<h2>Password </h2>
			<p>••••••• <button class="btn">Change</button></p>
		</div>

		<div class="payment noshow">
			<h1>Payment Info</h1>
			<h2>Payment Method</h2>
			<p>Mastercard •••• •••• •••• 0000 <button class="btn">update</button></p>
			<h2>Billing Address</h2>
			<p>1234 Example Ave | Seattle, WA <button class="btn">change</button></p>
			<h2>Zipcode</h2>
			<p>999000</p>
			<h2>Billing History</h2>
			<p>2018<button class="btn">view</button></p>
			<h2>Redeem Gift Subscription </h2>
			<p><input type="text" placeholder="Enter Gift Code"></input> <button class="btn">Redeem</button></p>
		</div>

		<div class="subscription noshow">
			<h1>Your Subscription</h1>
			<h2>Payment Date</h2>
			<p>05-15-2018 <button class="btn">pay now</button></p>
			<h2>Your Next Charge</h2>
			<p>$8.48<span> includes tax</span></p>
			<h2>Hulu Base Plan</h2>
			<p>Limited Commercials <button class="btn">change plan</button></p>
			<h2>Add-ons</h2>
			<p>None <button class="btn">manage</button></p>
			<h2>Monthly Recurring Total </h2>
			<p>$7.99/month</p>
		</div>

		<div class="privacy noshow">
			<h1>Privacy Settings</h1>
			<h2>Manage Email Notifications<button class="btn">manage</button></h2>
			<p></p>
			<h2>Manage Privacy Settings<button class="btn">manage</button></h2>
			<p></p>
			<h2>View Terms of Use <button class="btn">view</button></h2>
			<p></p>
			<h2>Personalize Ad Experience <button class="btn">update</button></h2>
			<p></p>
			<h2>Protect Your Account <button class="btn">protect</button></h2>
			<p></p>
		</div>
		<div class="settings noshow">
			<h1>Account Settings</h1>
			<h2>Sync Watchlist to My Stuff<button class="btn">sync</button></h2>
			<p></p>
			<h2>Hold Your Subscription<button class="btn">hold</button></h2>
			<p></p>
			<h2>Cancel Your Subscription <button class="btn">cancel</button></h2>
			<p></p>
			<h2>Your Devices <button class="btn">Manage Devices</button></h2>
			<p></p>
			<h2>Referrals <button class="btn">get $10</button></h2>
			<p></p>
		</div>
	</div>
</div>
</body>
</html>