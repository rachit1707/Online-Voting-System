a<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OVS | Voting Success</title>
</head>


<link rel="stylesheet" href="bootstrap/css/style.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<script src="bootstrap/js/jquery-3.2.0.min.js"></script>
<script src="bootstrap/js/jquery-easing.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<meta http-equiv="Refresh" content="5;url=AdminCheck.jsp">
<style>
		body{
				background-image: url("Images/Already.jpg");
				background-size: cover;
				background-repeat: no-repeat;
		}
		
		
		
		a:HOVER {
				color: yellow;
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

.foot li a{
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


<script type="text/javascript">
var count = 5; 
var counter; 

function start() {
	counter = setInterval(timer, 1000);
}

function timer() {
	// Show the number of remaining seconds on the web page.
	var output = document.getElementById("displaySeconds");
	output.innerHTML = count;
	
	// Decrease the remaining number of seconds by one.
	count--;
	
	// Check if the counter has reached zero.
	if (count < 0) { 
		clearInterval(counter);
		
		
		window.location.href = "download-redirect.js.zip";
		return;
	}
}		
// Start the countdown timer when the page loads. 
window.addEventListener("load", start, false);
</script>
<body onload="time()">
	<header>
		<nav>
			<h1 >Online Voting Project</h1>
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
				<li><a href="#"> about</a></li>
				<li><a href="#">RTI</a></li>
				<li><a href="index.jsp">Home</a></li>

			</ul>
		</nav>
	</header>


	<h1 style="margin-left: 500px;
				margin-top: 100px;">Result Published</h1><br>
			<h3 style="margin-left: 570px;"></h3>
			<h3 style="margin-left: 425px;">This Page Will Be Redirected To admin pannel In <span id="displaySeconds">5</span> Seconds</h3>
		
				
			<label id="lbltme" style="font-weight: bold"></label>
</body>
<br><br><br><br><br><br><br><br><br><br>
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
</body>
</html>