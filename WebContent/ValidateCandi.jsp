<%@page import="com.project.voting.bean.AadharBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OVS | Candidate Validation</title>
</head>
<style>
body{
	background-color: #222;
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
</style>
<%
	AadharBean a = (AadharBean)request.getAttribute("candi");
%>
<body>
		<form id="msform" action="CandiSetter.jsp">
			<!-- Fieldsets -->
			<fieldset>
				<h2 class="fs-title">Following details were fetched from aadhar database</h2>
				<h3 class="fs-subtitle"></h3>
					Aadhar Number<input type="text" name="candiAdno" value="<%out.println(a.getAdno());%>">
					Name<input type="text" name="candiName" value="<%out.println(a.getName());%>">
					Age<input type="text" name="candiAge" value="<%out.println(a.getAge());%>">
					Party<input type="text" name="candiParty" style="background-color:yellow">
					Voting Area<input type="text" name="candiVoterArea" style="background-color:yellow">
					Area Pin Code<input type="text" name="candiVotingPin" style="background-color:yellow">
					Voting Status<input type="text" name="candiVoteCount" value="0">
					<input type="submit" name="next" value="Validate" class="next action-button">
			</fieldset>
		</form>
</body>
</html>