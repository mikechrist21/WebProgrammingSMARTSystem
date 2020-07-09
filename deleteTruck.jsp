<%@ include file="connector/Connect.jsp" %>
<%@include file="model/Truck.jsp"%>
<%@page import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="style/deleteTruck.css"/>
	<title>SMART System</title>
</head>
<body>
	<%
		String code = request.getParameter("code");
		String str_id = request.getParameter("id");
		Boolean has_response = (code != null);
		Boolean has_id = (str_id != null);
		if(has_response){
		%>
			<input type="hidden" value="<%=code%>" id="code">
		<%
			if(code.contains("deleteSuccess")){
				response.sendRedirect("truckList.jsp");
			}
		}
		Integer id = -1;
		if(has_id){
			id = Integer.parseInt(str_id);
		}
		if(id==0){
		%>
			<input type="hidden" value="emptyPlate" id="code">
		<%
			id = -1;
			response.sendRedirect("deleteTruck.jsp");
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

	

	<div id="deleteForm">
		<p class="formTitle">
			Delete Form
		</p>
		<%
			if(!has_id){
			%>
				<form action="controller/val_deleteTruck.jsp" name="deleteForm" method="post">
					<div class="formContainer">
						<div class="rowContainer">
							<div class="labelColumn">
								Plate No
							</div>
							<div class="fieldColumn">
								: &nbsp&nbsp
								<input type="text" name="truckPlate" placeholder="Truck Plate">
								<button name="btnFind" id="btnDeleteFind">
									Find
								</button>
							</div>
						</div>
					</div>
				</form>
			<%
		}
			else{
			%>
				<div class="formContainer">
			<%
					Truck truck = new Truck().find(id);
					if(truck != null){
				%>
					<div class="rowContainer">
						<div class="labelColumn">
							Plate
						</div>
						<div class="fieldColumn">
							: &nbsp&nbsp
							<%=truck.getTruckPlate()%>
						</div>
					</div>
					<div class="rowContainer">
						<div class="labelColumn">
							Brand
						</div>
						<div class="fieldColumn">
							: &nbsp&nbsp
							<%=truck.getTruckBrand()%>
						</div>
					</div>
					<div class="rowContainer">
						<div class="labelColumn">
							Type
						</div>
						<div class="fieldColumn">
							: &nbsp&nbsp
							<%=truck.getTruckType()%>
						</div>
					</div>
					<div class="rowContainer">
						<div class="labelColumn">
							Year
						</div>
						<div class="fieldColumn">
							: &nbsp&nbsp
							<%=truck.getTruckYear()%>
						</div>
					</div>
					<div class="rowContainer">
						<div class="labelColumn">
							STNK No.
						</div>
						<div class="fieldColumn">
							: &nbsp&nbsp
							<%=truck.getStnkNumber()%>
						</div>
					</div>
					<div class="rowContainer">
						<div class="labelColumn">
							STNK Year
						</div>
						<div class="fieldColumn">
							: &nbsp&nbsp
							<%=truck.getStnkYear()%>
						</div>
					</div>
					<div class="rowContainer">
						<div class="labelColumn">
							STNK Expired Date
						</div>
						<div class="fieldColumn">
							: &nbsp&nbsp
							<%=truck.getStnkExpiredDate()%>
						</div>
					</div>
					<div class="rowContainer">
						<div class="labelColumn">
							Truck Location
						</div>
						<div class="fieldColumn">
							: &nbsp&nbsp
							<%=truck.getLocation()%>
						</div>
					</div>
					<div class="rowContainer">
						<div class="labelColumn">
							Driver Name
						</div>
						<div class="fieldColumn">
							: &nbsp&nbsp
							<%=truck.getDriverName()%>
						</div>
					</div>
					<div class="rowContainer">
						<div class="labelColumnImage">
							Image
						</div>
						<div class="fieldColumnImage">
							<p id="imgTD">: &nbsp&nbsp</p>
							<img src="img/<%=truck.getImage()%>" width="150px">
						</div>
					</div>
					<div class="rowContainer">
						<button id="btnDeleteSubmit" name="submit" onclick="window.location.href='/WebProg/Project_Kelas/controller/val_deleteTruck.jsp?id=<%=truck.getId()%>&action=delete'">
							Submit
						</button>
						<button id="btnDeleteCancel" name="cancel" onclick="window.location.href='/WebProg/Project_Kelas/truckList.jsp'">
							Cancel
						</button>
					</div>
				</div>
			<%
					}
					else{

					}
				}
		%>
	</div>

	<div class="footer">
		Copyright &copy MC 2020
	</div>
</body>
<script>
	var code = document.getElementById("code").value;
	if(code == 'emptyPlate'){
		alert("Truck Plate is invalid");
	}
</script>
</html>