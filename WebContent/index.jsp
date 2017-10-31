<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OVS | Home</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="bootstrap/js/jquery-3.2.0.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>


<style>
.nav {margin-left: 180px;}
li {margin-right: 20px;}
.carousel-inner>.item>img, .carousel-inner>.item>a>img {width: 100%;height: 600px;margin-top: -20px;}
footer{width: 100%;height: 150px;	background-color: #262626;position: absolute;margin-top: 15px;}
.foot{display: flex;text-align: center;position: absolute;top: 50%;left: 50%;transform:translate(-50%,-50%);}
.foot li{	background: #000;margin: 10px;	list-style: none;font-size: 24px;transition:.5s;}
.foot li a{width: 60px;padding: 16px 0;display: block;	color: #fff;}
.foot li:NTH-CHILD(1) {	background: rgb(59, 89, 152);}
.foot li:NTH-CHILD(3) {	background:rgb(187, 0, 0);}
.foot li:NTH-CHILD(5) {	background: #bc2a8d;}
.icon:HOVER {	transform: translateY(-8px);color:red;	box-shadow: 0 10px 10px rgba(0,0,0,.5);}
</style>


<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Online Voting System</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="index.jsp">Home</a></li>
			<li><a href="#">RTI</a></li>
			<li><a href="">About Us</a></li>
			<li><a href="about.html">Team</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="RegisterVoter.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>		
			<li><a href="LoginVoter.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
		</ul>
	</div>
	</nav>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="Images/slide1.jpg">
			</div>
			<div class="item">
				<img src="Images/s2.jpg">
			</div>
			<div class="item">
				<img src="Images/s3.jpg">
			</div>
		</div>
	</div>
</body>
<footer>
		<ul class="foot">
				<li class="icon"><a href=""><i class="fa fa-facebook" aria-hidden="true"></i></a><li>
				<li class="icon"><a href=""><i class="fa fa-youtube-square" aria-hidden="true"></i></a><li>				
				<li class="icon"><a href=""><i class="fa fa-instagram" aria-hidden="true"></i></a><li>
		</ul>
</footer>
</html>