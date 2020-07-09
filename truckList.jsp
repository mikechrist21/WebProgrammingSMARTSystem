<%@ include file="connector/Connect.jsp" %>
<%@include file="model/Truck.jsp"%>
<%@page import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="style/truckList.css"/>
	<title>SMART System</title>
</head>
<body>
	<%
		String code = request.getParameter("code");
		Boolean has_response = (code != null);
		if(has_response){
		%>
			<input type="hidden" value="<%=code%>" id="code">
		<%
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
		Vector<Truck>truckList = new Truck().get();
		Vector<Truck>truckListGresik = new Vector<Truck>();
		Vector<Truck>truckListTuban = new Vector<Truck>();
		for(int i=0;i<truckList.size();i++){
			if(truckList.elementAt(i).getLocation().equals("Gresik")){
				truckListGresik.add(truckList.elementAt(i));
			}
			else if(truckList.elementAt(i).getLocation().equals("Tuban")){
				truckListTuban.add(truckList.elementAt(i));
			}
		}
		if(truckListGresik.size()>0){
		%>
			<div class="content-container">
				<div class="content-location-container">
					<p class="locationName">
						Gresik - Petro
					</p>
					<div class="container">
					<%
						for(int i=0;i<truckListGresik.size();i++){
							Truck truck = truckListGresik.elementAt(i);
						%>
							<img src="img/<%=truck.getImage()%>">
							<div class="truckDetail">
								<div class="mainDetail">
									<p class="truckPlate">
										<%=truck.getTruckPlate()%>
									</p>
									<p class="truckBrand">
										<%=truck.getTruckBrand()%>&nbsp<%=truck.getTruckType()%>
									</p>
									<p class="truckYear">
										<%=truck.getTruckYear()%>
									</p>
								</div>
								<div class="truckDetailHidden">
									<p class="stnkNumber">
										STNK Number : <%=truck.getStnkNumber()%>
									</p>
									<p class="stnkYear">
										STNK Year : <%=truck.getStnkYear()%>
									</p>
									<p class="stnkExpiredDate">
										STNK Expired : <%=truck.getStnkExpiredDate()%>
									</p>
									<p class="driverName">
										Driver Name : <%=truck.getDriverName()%>
									</p>
								</div>
								<div class="hiddenButton">
									<button class="btnUpdate" onclick="window.location.href='/WebProg/Project_Kelas/updateTruck.jsp?id=<%=truck.getId()%>'">
										Update
									</button>
								</div>
							</div>
		
						<%
						}
						%>
					</div>
				</div>
			</div>
		<%
		}
		if(truckListTuban.size()>0){
		%>
			<div class="content-container">
				<div class="content-location-container">
					<p class="locationName">
						Tuban - KWSG
					</p>
					<div class="container">
					<%
						for(int i=0;i<truckListTuban.size();i++){
							Truck truck = truckListTuban.elementAt(i);
						%>
							<img src="img/<%=truck.getImage()%>">
							<div class="truckDetail">
								<div class="mainDetail">
									<p class="truckPlate">
										<%=truck.getTruckPlate()%>
									</p>
									<p class="truckBrand">
										<%=truck.getTruckBrand()%>&nbsp<%=truck.getTruckType()%>
									</p>
									<p class="truckYear">
										<%=truck.getTruckYear()%>
									</p>
								</div>
								<div class="truckDetailHidden">
									<p class="stnkNumber">
										STNK Number : <%=truck.getStnkNumber()%>
									</p>
									<p class="stnkYear">
										STNK Year : <%=truck.getStnkYear()%>
									</p>
									<p class="stnkExpiredDate">
										STNK Expired : <%=truck.getStnkExpiredDate()%>
									</p>
									<p class="driverName">
										Driver Name : <%=truck.getDriverName()%>
									</p>
								</div>
								<div class="hiddenButton">
									<button class="btnUpdate" onclick="window.location.href='/WebProg/Project_Kelas/updateTruck.jsp?id=<%=truck.getId()%>'">
										Update
									</button>
								</div>
							</div>
		
						<%
						}
						%>
					</div>
				</div>
			</div>
		<%
		}
	%>
	
	<div class="footer">
		Copyright &copy MC 2020
	</div>
	
</body>
<script>
	var code = document.getElementById("code").value;
	if(code == 'insertSuccess'){
		alert("Add New Truck Success");
	}
	else if(code == 'deleteSuccess'){
		alert("Delete Truck Success");
	}
	else if(code == 'updateSuccess'){
		alert("Update Truck Success");
	}
</script>
</html>