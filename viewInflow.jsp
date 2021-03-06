<%@ include file="connector/Connect.jsp" %>
<%@ include file="model/Truck.jsp"%>
<%@ include file="model/Inflow.jsp"%>
<%@ page import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="style/viewInflow.css"/>
	<title>SMART System</title>
</head>
<body>
	<%!
	public static String separator(int nominal){
        if (nominal == 0) {
            return "0";
        }

        String temp = "";
        String res = "Rp ";
        int cnt = 0;
        if(nominal < 0) {
            nominal *= -1;
            res += "-";
        }
        while(nominal > 0){
            temp += String.valueOf(nominal%10);
            nominal /= 10;
            cnt += 1;
            if(cnt == 3 && nominal>0){
                temp += '.';
                cnt = 0;
            }
        }
        for(int i=temp.length()-1;i>=0;i--){
            res += temp.charAt(i);
        }
        return res;
    }
	%>
	<%
		String code = request.getParameter("code");
		String str_id = request.getParameter("id");
		Boolean has_response = (code != null);
		if(has_response){
		%>
			<input type="hidden" value="<%=code%>" id="code">
		<%
			if(code.equals("updateSuccess")){
				response.sendRedirect("truckList.jsp");
			}
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

	

	<div id="viewInflowForm">
		<p class="formTitle">
			View Inflow
		</p>
		<div class="formContainer">
			<div class='grid_row tableHeader'>
				<div>No.</div>
				<div>Plate</div>
				<div>Transaction Date</div>
				<div>Description</div>
				<div>Value</div>
				<div>Action</div>
			</div>
			<%
				Vector<Inflow>inflow = new Inflow().get();
				for(int i=0;i<inflow.size();i++){
					Truck truck = new Truck().find(inflow.elementAt(i).getTruckID());
					%>
					<div class='grid_row'>
						<div>
							<%=i+1%>	
						</div>
						<div>
							<%=truck.getTruckPlate()%>
						</div>
						<div>
							<%=inflow.elementAt(i).getTrxDate()%>
						</div>
						<div>
							<p class="trxDesc">
								<%=inflow.elementAt(i).getTrxDescription()%>
							</p>
						</div>
						<div>
							<%=separator(inflow.elementAt(i).getTrxValue())%>
						</div>
						<div>
							<button id="btnInflowUpdate" onclick="window.location.href='/WebProg/Project_Kelas/updateInflow.jsp?id=<%=inflow.elementAt(i).getId()%>'">
								Update
							</button>
						</div>
					</div>
					<%
				}
			%>
		</div>
	</div>

	<div class="footer">
		Copyright &copy MC 2020
	</div>
</body>
<script>
	
</script>
</html>