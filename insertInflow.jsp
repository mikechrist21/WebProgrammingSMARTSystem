<%@ include file="connector/Connect.jsp" %>
<%@include file="model/Truck.jsp"%>
<%@page import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="style/insertInflow.css"/>
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

	

	<div id="insertInflowForm">
		<p class="formTitle">
			Insert Inflow
		</p>
		<form action="controller/val_insertInflow.jsp" method="post">
			<div class="formContainer">
				<div class="rowContainer">
					<div class="labelColumn">
						Plate
					</div>
					<div class="fieldColumn">
						: &nbsp&nbsp
						<select id="truckPlate" name="truckID">
							<option value="selectOne">== Select One == </option>
						<%
							Vector<Truck> truck = new Truck().get();
							for(int i=0;i<truck.size();i++){
							%>
								<option value="<%=truck.elementAt(i).getId()%>"><%=truck.elementAt(i).getTruckPlate()%></option>
							<%
							}
						%>
						</select>
					</div>
				</div>
				<div class="rowContainer">
					<div class="labelColumn">
						Transaction Date
					</div>
					<div class="fieldColumn">
						: &nbsp&nbsp
						<input type="date" name="trxDate" placeholder="Transaction Date">
					</div>
				</div>
				<div class="rowContainer">
					<div class="labelColumn">
						Description
					</div>
					<div class="fieldColumn">
						: &nbsp&nbsp
						<input type="text" name="trxDescription" placeholder="Transaction Description">
					</div>
				</div>
				<div class="rowContainer">
					<div class="labelColumn">
						Transaction Value
					</div>
					<div class="fieldColumn">
						: &nbsp&nbsp
						<input type="text" name="trxValue" placeholder="Transaction Value (in Rupiah)">
					</div>
				</div>
				<div class="rowContainer">
					<button id="btnInsertInflowSubmit" name="submit">
						Submit
					</button>
					<button id="btnInsertInflowCancel" name="cancel" onclick="window.location.href='/WebProg/Project_Kelas/index.jsp'">
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
	if(code == 'invalidTruckID'){
		alert("Truck Plate is invalid");
	}
	else if(code == 'emptyTrxDate'){
		alert("Transaction Date should be Filled");
	}
	else if(code == 'emptyTrxDescription'){
		alert("Transaction Description should be Filled");
	}
	else if(code == 'emptyTrxValue'){
		alert("Transaction Value should be Filled");
	}
	else if(code == 'insertSuccess'){
		alert("Insert New Inflow Success");
	}
</script>
</html>