<%@page import="java.util.ArrayList"%>
<%@page import="com.project.voting.DAO.DAOClass"%>
<%@page import="com.project.voting.bean.CandiBean"%>
<%@page import="com.project.voting.bean.VoterBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OVS | Candidate List</title>
</head>
<style>
@import url(http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100);

body {
  background-color: #3e94ec;
  font-family: "Roboto", helvetica, arial, sans-serif;
  font-size: 16px;
  font-weight: 400;
  text-rendering: optimizeLegibility;
}

div.table-title {
   display: block;
  margin: auto;
  max-width: 600px;
  padding:5px;
  width: 100%;
}

.table-title h3 {
   color: #fafafa;
   font-size: 30px;
   font-weight: 400;
   font-style:normal;
   font-family: "Roboto", helvetica, arial, sans-serif;
   text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
   text-transform:uppercase;
}


/*** Table Styles **/

.table-fill {
  background: white;
  border-radius:3px;
  border-collapse: collapse;
  height: 320px;
  margin: auto;
  max-width: 600px;
  padding:5px;
  width: 100%;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  animation: float 5s infinite;
}
 
th {
  color:#D5DDE5;;
  background:#1b1e24;
  border-bottom:4px solid #9ea7af;
  border-right: 1px solid #343a45;
  font-size:23px;
  font-weight: 100;
  padding:24px;
  text-align:left;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
  vertical-align:middle;
}

th:first-child {
  border-top-left-radius:3px;
}
 
th:last-child {
  border-top-right-radius:3px;
  border-right:none;
}
  
tr {
  border-top: 1px solid #C1C3D1;
  border-bottom-: 1px solid #C1C3D1;
  color:#666B85;
  font-size:16px;
  font-weight:normal;
  text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}
 
tr:hover td {
  background:#4E5066;
  color:#FFFFFF;
  border-top: 1px solid #22262e;
  border-bottom: 1px solid #22262e;
}
 
tr:first-child {
  border-top:none;
}

tr:last-child {
  border-bottom:none;
}
 
tr:nth-child(odd) td {
  background:#EBEBEB;
}
 
tr:nth-child(odd):hover td {
  background:#4E5066;
}

tr:last-child td:first-child {
  border-bottom-left-radius:3px;
}
 
tr:last-child td:last-child {
  border-bottom-right-radius:3px;
}
 
td {
  background:#FFFFFF;
  padding:10px;
  text-align:left;
  vertical-align:middle;
  
  font-size:18px;
  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
  border-right: 1px solid #C1C3D1;
}

td:last-child {
  border-right: 0px;
}

th.text-left {
  text-align: left;
}

th.text-center {
  text-align: center;
}

th.text-right {
  text-align: right;
}

td.text-left {
  text-align: left;
}

td.text-center {
  text-align: center;
}

td.text-right {
  text-align: right;
}


</style>
<%
		VoterBean v= (VoterBean)session.getAttribute("voter");
		DAOClass d = new DAOClass();
		ArrayList<CandiBean> arr = d.getCandi(v.getVoterPin());
		if(arr.size()==0)
		{
			RequestDispatcher rd = request.getRequestDispatcher("nocandidate.jsp");
			rd.forward(request, response);
		}
		else
%>
<body>
		
			<div class="table-title">
	<h3>Candidate List for area <%=v.getVoterArea()%>&nbsp;<%=v.getVoterPin()%></h3>
		</div>
		<table class="table-fill">
<thead>
				<tr>
									<th>Aadhar Number</th>
									<th>Name</th>
									<th>Age</th>
									<th>Party</th>
									<th>Voting Area</th>
									<th>Voting Pincode</th>
									
				</tr>
</thead>		
				
				<%for(int i =0;i<arr.size();i++){ %>
						<tbody class="table-hover">
						<tr>
							
											<td class="text-left"><%out.println(arr.get(i).getCandiAdno()); %></td>
											<td class="text-left"><%out.println(arr.get(i).getCandiName()); %></td>
											<td class="text-left"><%out.println(arr.get(i).getCandiAge()); %></td>
											<td class="text-left"><%out.println(arr.get(i).getCandiParty()); %></td>
											<td class="text-left"><%out.println(arr.get(i).getCandiVoterArea()); %></td>
											<td class="text-left"><%out.println(arr.get(i).getCandiVotingPin()); %></td>
											
									</tr>
									
							<%} %>
							</tbody>

		</table>	
</body>
</html>