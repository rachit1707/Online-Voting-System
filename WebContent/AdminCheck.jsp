<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.project.voting.connection.DBUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project.voting.DAO.DAOClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<meta charset="UTF-8">
<title>OVS | Admin</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script type="text/javascript">
	function err() {
		if (document.f1.adno.value == "")
			alert("Empty Field");
	}
	function err1() {
		if (document.f2.adno.value == ""||document.f2.name.value == ""||
				document.f2.dob.value == ""||document.f2.age.value == ""||
				document.f2.state.value == ""||document.f2.city.value == ""||
				document.f2.area.value == ""||document.f2.pincode.value == ""||
				document.f2.email.value == ""||document.f2.phno.value == "")
			alert("Empty Field");
		
	}
	function err3() {
		if (document.f3.pin.value == "")
			alert("Empty Field");
	}
	</script>
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Montserrat", sans-serif
}

.w3-row-padding img {
	margin-bottom: 12px
}
/* Set the width of the sidebar to 120px */
.w3-sidebar {
	width: 120px;
	background: #222;
}
/* Add a left margin to the "page content" that matches the width of the sidebar (120px) */
#main {
	margin-left: 120px
}
/* Remove margins from "page content" on small screens */
@media only screen and (max-width: 600px) {
	#main {
		margin-left: 0
	}
}

#msform {
	width: 400px;
	margin: 50px auto;
	text-align: center;
}

#msform fieldset {
	background: white;
	border: 0 none;
	border-radius: 3px;
	box-shadow: 0 0 15px 1px rgba(0, 0, 0, 4);
	padding: 20px 30px;
	box-sizing: border-box;
	width: 80%;
	margin: 0 10%;
}

#msform
 
fieldset
:not
 
(
:first-of-type
 
){
display
:
 
none
;


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

footer {
	width: 100%;
	height: 150px;
	background-color: #222;
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
<body class="w3-black">
<div class="parallax">
	<!-- Icon Bar (Sidebar - hidden on small screens) -->
	<nav class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center navbar-fixed-left">
		<!-- Avatar image in top left corner -->
		<a href="#home" class="w3-bar-item w3-button w3-padding-large w3-black">
			<i class="fa fa-home w3-xxlarge"></i>
			<p>HOME</p>
		</a> <a href="#aadhar"
			class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i class="fa fa-id-card-o w3-xxlarge " aria-hidden="true"></i>
			<p>ADD AADHAR DATA</p>
		</a> <a href="#candi"
			class="w3-bar-item w3-button w3-padding-large w3-hover-black"><i class="fa fa-users w3-xxlarge"" aria-hidden="true"></i>
			<p>ADD CANDIDATE</p>
		</a> <a href="#chkresult"
			class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
			class="fa fa-search w3-xxlarge"></i>
			<p>CHECK RESULTS</p>
		</a> <a href="#publish"
			class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
			class="fa fa-upload w3-xxlarge"></i>
			<p>PUBLISH RESULTS</p>
		</a>
		<a href="index.jsp"
			class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
			class="glyphicon glyphicon-off w3-xxlarge"></i>
			<p>LOGOUT</p>
		</a>
	</nav>

	<!-- Navbar on small screens (Hidden on medium and large screens) -->
	<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
		<div
			class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
			<a href="#home" class="w3-bar-item w3-button"
				style="width: 25% !important">HOME</a> <a href="#aadhar"
				class="w3-bar-item w3-button" style="width: 25% !important">ADD AADHAR</a>
			<a href="#candi" class="w3-bar-item w3-button"
				style="width: 25% !important">ADD CANDIDATE</a> <a href="#chkresult"
				class="w3-bar-item w3-button" style="width: 25% !important">CHECK RESULT</a>
				<a href="#publish"
				class="w3-bar-item w3-button" style="width: 25% !important">PUBLISH RESULT</a>
		</div>
	</div>
	<div class="w3-content w3-justify w3-text-grey w3-padding-64"	id="home">
		<img alt="" src="Images/nvsp.png" width="50%" height="55%" style="margin-left:300px;">	
		<h1><center>Election Commission of India</center></h1>
	</div>

	<div class="w3-content w3-justify w3-text-grey w3-padding-64"	id="candi">
		<br> <br> <br> <br>
		<form id="msform" action="AddCandi" name="f1">
			<!-- Fieldsets -->
			<fieldset>
				<h2 class="fs-title">Add Candidate Aadhar Number</h2>
				<h3 class="fs-subtitle">Number will be Validated</h3>
				<input type="text" name="adno" placeholder="Aadhar Number">
				<input type="submit" name="next" value="submit"
					class="next action-button" onmouseover="err()">
			</fieldset>
		</form>

	</div>

	<div class="w3-padding-64 w3-content" id="aadhar">
		<form id="msform" action="AadharSetter.jsp" name="f2">

			<!-- Fieldsets -->
			<fieldset>
			
				<h2 class="fs-title">Add Aadhar Details Here</h2>
				<input type="text" name="adno" placeholder="Aadhar Number">
				<input type="text" name="name" placeholder="Name"> 
				<input	type="date" name="dob" placeholder="Date of Birth"> 
				<input type="text" name="age" placeholder="Age">
				<input type="text" name="state" placeholder="State">
				<input type="text" name="city" placeholder="City">
				<input type="text" name="area" placeholder="Area"> 
				<input type="text" name="pincode" placeholder="Pincode"> 
				<input type="text" name="email" placeholder="Email"> 
				<input type="text" name="phno" placeholder="Phone Number"> 
				<input type="submit" name="submit" value="Add Details" class="next action-button" onmouseover="err1()">					
				
			</fieldset>
		</form>
	</div>
	<br> <br> <br> <br>
	<div class="w3-padding-64 w3-content" id="chkresult">
		<form id="msform" action="CheckResult" name="f3">
				<fieldset>
			
				<h2 class="fs-title">Add Pin Code to Check Result</h2>
				<input type="text" name="pin" placeholder="Pincode">
				<input type="submit" name="submit" value="Add Details" class="next action-button" onmouseover="err3()">	
				
				</fieldset>
				
		</form>
	</div>
	<%
		String sql = "select * from publish";
		int status = 0;
		try{
			Connection conn = DBUtil.ConnectDB();
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
			 status = rs.getInt(1);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	
	%>
	<br> <br> <br> <br><br><br>
	<%if(status == 0){ %>
	<div class="w3-padding-64 w3-content" id="publish">	
			<form id="msform" action="Publish">
				<fieldset>			
				<h2 class="fs-title">Click on the button to Publish Results</h2>
				<h3 class="fs-subtitle">On Clicking this Result will be Displayed to the Voters</h3>
				<input type="submit" name="submit" value="Publish Results" class="next action-button" style="width: 150px">	
								
				</fieldset>
		</form>
	</div>
	<%} %>
	<br> <br> <br> <br><br><br>
	<%if(status == 1){ %>
	<div class="w3-padding-64 w3-content" id="publish">	
			<form id="msform" action="Publish">
				<fieldset>			
				<h2 class="fs-title">Result has been Published</h2>								
				</fieldset>
		</form>
	</div>
	<%} %>
</body>
<script src="js/scroll.js"></script>
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
