<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OVS | Adding Success</title>
</head>
<link rel="stylesheet" href="bootstrap/css/style.css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="bootstrap/js/jquery-3.2.0.min.js"></script>
<script src="bootstrap/js/jquery-easing.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<link	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"	rel="stylesheet">
	
	
<style>
.nav {margin-left: 180px;}
.container {width: 100%;height: 600px;}
#msform {width: 400px;margin: 50px auto;text-align: center;}
#msform fieldset {background: grey;border: 0 none;border-radius: 3px;box-shadow: 0 0 15px 1px rgba(0, 0, 0, 4);	padding: 20px 30px;
box-sizing: border-box;	width: 80%;margin: 0 10%;}
#msform fieldset:not(:first-of-type){display: none;}
#msform input {	padding: 15px;	border: 1px solid #ccc;border-radius: 3px;margin-bottom: 10px;width: 100%;	box-sizing: border-box;
font-family: montserrat;color: #2C3E50;font-size: 13px;}
#msform .action-button {width: 100px;background: #27AE60;	font-weight: bold;color: white;border-radius: 1px;cursor: pointer;
padding: 10px 5px;margin: 10px 5px;}
#msform .action-button:HOVER, #msform .action-button:FOCUS {box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;}
.fs-title {font-size: 15px;text-transform: uppercase;color: #2C3E50;	margin-bottom: 10px;}
.fs-subtitle {font-weight: normal;font-size: 13px;color: #666;	margin-bottom: 20px;}
#progressbar {margin-bottom: 20px;overflow: hidden;counter-reset: step;}
#progressbar li {	list-style-type: none;color: black;text-transform: uppercase;font-size: 9px;width: 33.33%;float: left;position: relative;}
#progressbar li:BEFORE {content: counter(step);	counter-increment: step;width: 20px;line-height: 20px;display: block;font-size: 10px;
color: white;background: black;border-radius: 3px;margin: 0 auto 5px auto;}
#progressbar li:AFTER {content: '';	width: 100%;height: 2px;background: black;	position: absolute;left: -50%;	top: 9px;z-index: -1;}
#progressbar li:FIRST-CHILD:AFTER {content: none;}
#progressbar li .active:BEFORE {background: #27AE60;color: white;}
footer {	width: 100%;height: 150px;background-color: #262626;	position: absolute;margin-top: 15px;}
.foot {display: flex;text-align: center;position: absolute;	top: 50%;left: 50%;	transform: translate(-50%, -50%);}
.foot li {	background: #000;margin: 10px;	list-style: none;font-size: 24px;transition: .5s;}
.foot li a {width: 60px;	padding: 16px 0;display: block;color: #fff;}
.foot li:NTH-CHILD(1) {	background: rgb(59, 89, 152);}
.foot li:NTH-CHILD(3) {	background: rgb(187, 0, 0);}
.foot li:NTH-CHILD(5) {	background: #bc2a8d;}
.icon:HOVER {	transform: translateY(-8px);color: red;box-shadow: 0 10px 10px rgba(0, 0, 0, .5);}
</style>


<body>
		<header>
		<nav>
			<h1>Online Voting Project</h1>
			<ul id="main-menu">
				<li><a href="index.jsp">Logout</a>
				<li><a href="#"> contact us</a>
					<ul class="submenuv">
						<li><a href="#0">Meet the Team</a>
							<ul class="submenuv">
								<li><a href="#0">S.M. deshmukh</a></li>
								<li><a href="#0">Ayush agarwal</a></li>
								<li><a href="#0">Shubham dubey</a></li>
								<li><a href="#0">Rishabh bajaj</a></li>
								<li><a href="#0">Rachit sharma</a></li>
							</ul></li>
					</ul></li>
				<li><a href="aboutus.html"> about</a></li>
				<li><a href="#">RTI</a></li>
				<li><a href="index.jsp">Home</a></li>

			</ul>
		</nav>
	</header>
	
	<form id="msform" action="AdminCheck.jsp">
		
<br><br><br>
		<!-- Fieldsets -->
		<fieldset align="center">
			<h2 class="fs-title">Registration Successfull</h2>
			<h3 class="fs-subtitle"></h3>
			 <input type="submit" name="next" value="Home Page" class="next action-button">
		</fieldset>
</form>	
</body>
<br><br><br><br><br>
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