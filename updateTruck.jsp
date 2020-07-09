<%@ include file="connector/Connect.jsp" %>
<%@include file="model/Truck.jsp"%>
<%@page import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="style/updateTruck.css"/>
	<title>SMART System</title>
</head>
<body>
	<%
		String code = request.getParameter("code");
		String str_id = request.getParameter("id");
		Boolean has_response = (code != null);
		if(has_response){
		%>
			<input type="hidden" value="<%=code%>" id="code">
		<%
		}
		Integer id = 0;
		if(str_id != null){
			id = Integer.parseInt(str_id);
		}
		if(id == 0){
			response.sendRedirect("truckList.jsp");
		}
	%>

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

	<%
		Truck truck = new Truck().find(id);
	%> 

	<div id="updateForm">
		<p class="formTitle">
			Update Form
		</p>
		<form action="controller/val_updateTruck.jsp?id=<%=id%>" name="updateForm" method="post">
			<div class="formContainer">
				<div class="rowContainer">
					<div class="labelColumn">
						Brand
					</div>
					<div class="fieldColumn">
						: &nbsp&nbsp
						<input type="text" name="truckBrand" placeholder="Truck Brand" value="<%=truck.getTruckBrand()%>">
					</div>
				</div>
				<div class="rowContainer">
					<div class="labelColumn">
						Type
					</div>
					<div class="fieldColumn">
						: &nbsp&nbsp
						<input type="text" name="truckType" placeholder="Truck Type" value="<%=truck.getTruckType()%>">
					</div>
				</div>
				<div class="rowContainer">
					<div class="labelColumn">
						Year
					</div>
					<div class="fieldColumn">
						: &nbsp&nbsp
						<input type="text" name="truckYear" placeholder="Truck Year" value="<%=truck.getTruckYear()%>">
					</div>
				</div>
				<div class="rowContainer">
					<div class="labelColumn">
						Plate
					</div>
					<div class="fieldColumn">
						: &nbsp&nbsp
						<input type="text" name="truckPlate" placeholder="Truck Plate" value="<%=truck.getTruckPlate()%>">
					</div>
				</div>
				<div class="rowContainer">
					<div class="labelColumn">
						STNK No.
					</div>
					<div class="fieldColumn">
						: &nbsp&nbsp
						<input type="text" name="stnkNumber" placeholder="STNK Number" value="<%=truck.getStnkNumber()%>">
					</div>
				</div>
				<div class="rowContainer">
					<div class="labelColumn">
						STNK Year
					</div>
					<div class="fieldColumn">
						: &nbsp&nbsp
						<input type="text" name="stnkYear" placeholder="STNK Year" value="<%=truck.getStnkYear()%>">
					</div>
				</div>
				<div class="rowContainer">
					<div class="labelColumn">
						STNK Expired Date
					</div>
					<div class="fieldColumn">
						: &nbsp&nbsp
						<input type="text" name="stnkExpiredDate" placeholder="STNK Expired Date" value="<%=truck.getStnkExpiredDate()%>">
					</div>
				</div>
				<div class="rowContainer">
					<div class="labelColumn">
						Truck Location
					</div>
					<div class="fieldColumn">
						: &nbsp&nbsp
						<input type="text" name="location" placeholder="Truck Location" value="<%=truck.getLocation()%>">
					</div>
				</div>
				<div class="rowContainer">
					<div class="labelColumn">
						Driver Name
					</div>
					<div class="fieldColumn">
						: &nbsp&nbsp
						<input type="text" name="driverName" placeholder="Driver Name" value="<%=truck.getDriverName()%>">
					</div>
				</div>
				<div class="rowContainer">
					<div class="labelColumn">
						Image
					</div>
					<div class="fieldColumn">
						: &nbsp&nbsp
						<input type="file" id="image" name="image" accept=".jpg,.png">
					</div>
				</div>
				<div class="rowContainer">
					<button id="btnUpdateSubmit" name="submit">
						Submit
					</button>
					<button id="btnUpdateCancel" name="cancel" formaction="truckList.jsp">
						Cancel
					</button>
				</div>
			</div>
		</form>
	</div>



	<div class="footer">
		Copyright &copy MC 2020
	</div>
</body>
<script>
	var code = document.getElementById("code").value;
	if(code == 'emptyTruckBrand'){
		alert("Truck Brand should be filled");
	}
	else if(code == 'emptyTruckType'){
		alert("Truck Type should be filled");
	}
	else if(code == 'emptyTruckType'){
		alert("Truck Type should be filled");
	}
	else if(code == 'emptyTruckYear'){
		alert("Truck Year should be filled");
	}
	else if(code == 'emptyTruckPlate'){
		alert("Truck Plate should be filled");
	}
	else if(code == 'emptyStnkNumber'){
		alert("Truck STNK Number should be filled");
	}
	else if(code == 'emptyStnkYear'){
		alert("Truck STNK Year should be filled");
	}
	else if(code == 'emptyStnkExpiredDate'){
		alert("Truck STNK Expired Date should be filled");
	}
	else if(code == 'emptyDriverName'){
		alert("Truck Driver's Name should be filled");
	}
	else if(code == 'emptyImage'){
		alert("Truck Image should be choosen");
	}
	else if(code == 'truckExist'){
		alert("Truck already exists in Database");
	}
</script>
</html>