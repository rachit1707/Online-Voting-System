<%@page import="com.project.voting.DAO.DAOClass"%>
<%@page import="com.project.voting.bean.AadharBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.project.voting.connection.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Voter</title>
<script type="text/javascript">
	function err() {
		if (document.f1.adno.value == ""
				|| document.f1.password.value == "")
			alert("Empty Field");
	}
</script>
</head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="bootstrap/js/jquery-3.2.0.min.js"></script>
<script src="bootstrap/js/jquery-easing.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">



<style>
.nav {
	margin-left: 180px;
}
body{
		background-image: url("Images/SignUp.jpg");
		background-size: cover;
		background-repeat: no-repeat;
}
.container {
	width: 100%;
	height: 600px;
}

#msform {
	width: 400px;
	margin: 50px auto;
	text-align: center;
}

#msform fieldset {
	background: grey;
	border: 0 none;
	border-radius: 3px;
	box-shadow: 0 0 15px 1px rgba(0, 0, 0, 4);
	padding: 20px 30px;
	box-sizing: border-box;
	width: 80%;
	margin: 0 10%;
}

#msform fieldset:not(:first-of-type){
	display: none;
}

#msform input {
	padding: 15px;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-bottom: 10px;
	width: 100%;
	box-sizing: border-box;
	font-family: montserrat;
	color: #2C3E50;
	font-size: 13px;
}

#msform .action-button {
	width: 100px;
	background: #27AE60;
	font-weight: bold;
	color: white;
	border-radius: 1px;
	cursor: pointer;
	padding: 10px 5px;
	margin: 10px 5px;
}

#msform .action-button:HOVER, #msform .action-button:FOCUS {
	box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}

.fs-title {
	font-size: 15px;
	text-transform: uppercase;
	color: #2C3E50;
	margin-bottom: 10px;
}

.fs-subtitle {
	font-weight: normal;
	font-size: 13px;
	color: #666;
	margin-bottom: 20px;
}

#progressbar {
	margin-bottom: 20px;
	overflow: hidden;
	counter-reset: step;
}

#progressbar li {
	list-style-type: none;
	color: black;
	text-transform: uppercase;
	font-size: 9px;
	width: 33.33%;
	float: left;
	position: relative;
}

#progressbar li:BEFORE {
	content: counter(step);
	counter-increment: step;
	width: 20px;
	line-height: 20px;
	display: block;
	font-size: 10px;
	color: white;
	background: black;
	border-radius: 3px;
	margin: 0 auto 5px auto;
}

#progressbar li:AFTER {
	content: '';
	width: 100%;
	height: 2px;
	background: black;
	position: absolute;
	left: -50%;
	top: 9px;
	z-index: -1;
}

#progressbar li:FIRST-CHILD:AFTER {
	content: none;
}

#progressbar li .active:BEFORE {
	background: #27AE60;
	color: white;
}

footer {
	width: 100%;
	height: 150px;
	background-color: #262626;
	position: absolute;
	margin-top: 15px;
}

.foot {
	display: flex;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.foot li {
	background: #000;
	margin: 10px;
	list-style: none;
	font-size: 24px;
	transition: .5s;
}

.foot li a {
	width: 60px;
	padding: 16px 0;
	display: block;
	color: #fff;
}

.foot li:NTH-CHILD(1) {
	background: rgb(59, 89, 152);
}

.foot li:NTH-CHILD(3) {
	background: rgb(187, 0, 0);
}

.foot li:NTH-CHILD(5) {
	background: #bc2a8d;
}

.icon:HOVER {
	transform: translateY(-8px);
	color: red;
	box-shadow: 0 10px 10px rgba(0, 0, 0, .5);
}
</style>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Online Voting System</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="index.jsp">Home</a></li>
			<li><a href="#">RTI</a></li>
			<li><a href="#">About Us</a></li>
			<li><a href="#">Team</a></li>
		</ul>
	</div>
	</nav>

	<!-- Multiphase Form Start -->

<form name=f1 id="msform" action="ValidateServlet">
		<!-- Progress Bar -->
		<ul id="progressbar">
			<li><font color="#27AE60">Aadhar Number</font></li>
			<li>Validate Details</li>
			<li>Verify Email</li>
		</ul>

		<!-- Fieldsets -->
		<fieldset>
			<h2 class="fs-title">Add Aadhar Number</h2>
			<h3 class="fs-subtitle">Number will be Validated</h3>
			<input type="text" name="adno" placeholder="Aadhar Number"> <input
				type="submit" name="next" value="Next" class="next action-button" onclick="err()">
		</fieldset>
</form>
</body>
<br><br><br>
<footer>
<ul class="foot">
	<li class="icon"><a href=""><i class="fa fa-facebook"
			aria-hidden="true"></i></a>
	<li>
	<li class="icon"><a href=""><i class="fa fa-youtube-square"
			aria-hidden="true"></i></a>
	<li>
	<li class="icon"><a href=""><i class="fa fa-instagram"
			aria-hidden="true"></i></a>
	<li>
</ul>
</footer>
</html>

