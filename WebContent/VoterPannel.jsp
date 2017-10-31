<%@page import="com.project.voting.bean.CandiBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project.voting.bean.VoterBean"%>
<%@page import="com.project.voting.DAO.DAOClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OVS | Voter Home Page</title>
<script src="http://s.codepen.io/assets/libs/modernizr.js"
	type="text/javascript"></script>


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
<style>
body{
		background-image: url("Images/VotingBack.jpg");
		background-size: cover;
		background-repeat: no-repeat;
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

.button {
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

.action-button {
	width: 100px;
	background: #27AE60;
	font-weight: bold;
	color: white;
	border-radius: 1px;
	cursor: pointer;
	padding: 10px 5px;
	margin: 10px 5px;
}

.action-button:HOVER, #msform .action-button:FOCUS {
	box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}
</style>


</head>

<%
		String user = (String)session.getAttribute("user");
		String pass = (String)session.getAttribute("pass");
		
		
		DAOClass d = new DAOClass();
		VoterBean v = d.getVoter(user, pass);
		
		
		session.setAttribute("voter", v);
		
		
		int x = d.returnPublish();
		System.out.println(x);
%>
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
								<li><a href="#0">Ayush Agarwal</a></li>
								<li><a href="#0">Shubham Dubey</a></li>
								<li><a href="#0">Rishabh Bajaj</a></li>
								<li><a href="#0">Rachit Sharma</a></li>
							</ul>
							</li>
					</ul></li>
				<li><a href="#"> about</a></li>
				<li><a href="#">RTI</a></li>
				<li><a href="index.jsp">Home</a></li>

			</ul>
		</nav>
	</header>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="js/index.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/npm.js"></script>
	<br>
	<br>
	<br>
	
	
	
	
	<center><h1><b>Welcome <%out.println(v.getVoterName()); %></b></h1></center>
	<center><h3>Aadhar Number :<%out.println(v.getVoterAdno()); %></h3></center>
	<br>
	<br>
	<br>
	<br>
	<br><br><br>
	<div class="sigma-content col-lg-4 col-md-6 votersel-bg-lightgray">
		<%if(v.getVoterIsVoted()==0){ %>
		<form action="Voting.jsp">
		<h2>Cast Vote</h2>
		<p>Click here to cast vote</p>

		<input type="submit" name="next" value="Cast Vote"
			class="next action-button" style="width: 150px;">
			<%} %>
		</form>
		<%if(v.getVoterIsVoted()==1){ %>
		<form action="Already.jsp">
		<h2>Cast Vote</h2>
		<p>Click here to cast vote</p>

		<input type="submit" name="next" value="Cast Vote"
			class="next action-button" style="width: 150px;">
			<%} %>
		</form>
	</div>
	<div class="sigma-content col-lg-4 col-md-6 votersel-bg-gray">
	<form action="ListVoter.jsp">
		<h2>SEE Candidates</h2>
		<p>Click here to see candidates</p>
		<input type="submit" name="next" value="List Candidate"
			class="next action-button" style="width: 150px;">
	</form>
	</div>
	<div class="sigma-content col-lg-4 col-md-12 votersel-bg-darkgray">
	<%if(x==0){ %>
	<form action="NotPublish.jsp">
		<h2>View Results</h2>
		<p>Result is Not Declared</p>
		<input type="submit" name="next" value="View Result"
			class="next action-button" style="width: 150px;">
	</form>
	<%} %>
	<%if(x==1){ %>
	<form action="PinChoice.jsp">
		<h2>View Results</h2>
		<p>Result Declared</p>
		<input type="submit" name="next" value="View Result"
			class="next action-button" style="width: 150px;">
	</form>
	<%} %>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
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