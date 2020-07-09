<%@ include file="connector/Connect.jsp" %>
<%@include file="model/Truck.jsp"%>
<%@page import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="style/index.css"/>
	<title>SMART System</title>
</head>
<body>
	<div class="header">
		<!-- Left Side Header-->
		<div class="dropdown">
			<ul>
				<a href="index.jsp">
					<li>
						Home
					</li>
				</a>
				<li>
					Truck
					<ul>
						<a href="truckList.jsp"><li>Truck List</li></a>
						<li>
							Manage Truck
							<ul>
								<a href="insertTruck.jsp"><li>Insert New Truck</li></a>
								<a href="deleteTruck.jsp"><li>Delete Truck</li></a>
							</ul>
						</li>
						<a href="insertOutflow.jsp"><li>Insert New Outflow</li></a>
					</ul>
				</li>
				<li>
					Finance
					<ul>
						<li>
							Truck Status
							<ul>
								<a href="viewStatus.jsp"><li>View Status</li></a>
								<a href="viewInflow.jsp"><li>View Inflow</li></a>
								<a href="viewOutflow.jsp"><li>View Outflow</li></a>
							</ul>
						</li>
						<a href="insertInflow.jsp"><li>Insert New Inflow</li></a>
					</ul>
				</li>
			</ul>
		</div> 
	</div>
	
	<div class="content">

	</div>
			<%--
		</div>
		
		<!-- Right Side Header-->
		<div class="subHeader1">
			<div class="dropdown">
				<div class="dropMenu">
					<a href="#">Profile</a>
					<a href="#">Cart</a>
					<a href="#">Transaction</a>
					<a href="#">Logout</a>
				</div>

			</div>
		</div>
		<form action="#" method="post">
			<div class="subHeader1">
				<button class="headerButtonSearch"> 
					Search
				</button>
			</div>
			<div class="subHeader1">
				<input type="text" class="searchBar" name="searchBar" placeholder="Truck Type / Police Number">
			</div>
		</form>
	</div>
	--%>
	<div class="footer">
		Copyright &copy MC 2020
	</div>
</body>
<script>
	
</script>
</html>