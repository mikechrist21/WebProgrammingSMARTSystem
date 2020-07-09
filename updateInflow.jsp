<%@ include file="connector/Connect.jsp" %>
<%@ include file="model/Truck.jsp"%>
<%@ include file="model/Inflow.jsp"%>
<%@ page import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="style/updateInflow.css"/>
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
			if(code.equals("updateSuccess")){
				response.sendRedirect("viewInflow.jsp");
			}
		}
		Integer id = 0;
		Inflow inflow = new Inflow();
		Truck truck = new Truck();
		Integer truckID = 0;
		if(str_id != null){
			id = Integer.parseInt(str_id);
			inflow = new Inflow().find(id);
			truckID = inflow.getTruckID();
			truck = new Truck().find(truckID);
		}
		else if(code == null && str_id == null){
			response.sendRedirect("index.jsp");
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

	

	<div id="updateInflowForm">
		<p class="formTitle">
			Update Inflow
		</p>
		<form action="controller/val_updateInflow.jsp?id=<%=id%>" method="post">
			<div class="formContainer">
				<div class="rowContainer">
					<div class="labelColumn">
						Plate
					</div>
					<div class="fieldColumn">
						: &nbsp&nbsp
						<%=truck.getTruckPlate()%>
						</select>
					</div>
				</div>
				<div class="rowContainer">
					<div class="labelColumn">
						Transaction Date
					</div>
					<div class="fieldColumn">
						: &nbsp&nbsp
						<input type="date" name="trxDate" value="<%=inflow.getTrxDate()%>" placeholder="Transaction Date">
					</div>
				</div>
				<div class="rowContainer">
					<div class="labelColumn">
						Description
					</div>
					<div class="fieldColumn">
						: &nbsp&nbsp
						<input type="text" name="trxDescription" value="<%=inflow.getTrxDescription()%>" placeholder="Transaction Description">
					</div>
				</div>
				<div class="rowContainer">
					<div class="labelColumn">
						Transaction Value
					</div>
					<div class="fieldColumn">
						: &nbsp&nbsp
						<input type="text" name="trxValue" value="<%=inflow.getTrxValue()%>" placeholder="Transaction Value (in Rupiah)">
					</div>
				</div>
				<div class="rowContainer">
					<button id="btnUpdateInflowSubmit" name="submit">
						Submit
					</button>
					<button id="btnUpdateInflowCancel" name="cancel" onclick="window.location.href='/WebProg/Project_Kelas/index.jsp'">
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
	else if(code == 'updateSuccess'){
		alert("Update Inflow Success");
	}
</script>
</html>