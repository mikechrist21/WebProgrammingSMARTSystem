<%@ include file="connector/Connect.jsp" %>
<%@ include file="model/Truck.jsp"%>
<%@ include file="model/Inflow.jsp"%>
<%@ include file="model/Outflow.jsp"%>
<%@ page import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="style/viewStatus.css"/>
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

	

	<div id="viewStatusTable">
		<p class="formTitle">
			View Inflow
		</p>
		<div class="formContainer">
			<div class='grid_row tableHeader'>
				<div>No.</div>
				<div>Plate</div>
				<div>Inflow</div>
				<div>Outflow</div>
				<div>Profit</div>
				<div>Action</div>
			</div>
			<%
				Vector<Truck>truck_list = new Truck().get();
				Vector<Inflow>inflow_list = new Inflow().get();
				Vector<Outflow>outflow_list = new Outflow().get();
				for(int i=0;i<truck_list.size();i++){
					Truck truck = truck_list.elementAt(i);
					Integer total_inflow = 0;
					Integer total_outflow = 0;
					Integer total_profit = 0;
					for(int j=0;j<inflow_list.size();j++){
						Inflow inflow = inflow_list.elementAt(j);
						if(inflow.getTruckID().equals(truck.getId())){
							total_inflow += inflow.getTrxValue();
						}
					}
					for(int j=0;j<outflow_list.size();j++){
						Outflow outflow = outflow_list.elementAt(j);
						if(outflow.getTruckID().equals(truck.getId())){
							total_outflow += outflow.getTrxValue();
						}
					}
					total_profit = total_inflow - total_outflow;
					%>
					<div class='grid_row'>
						<div>
							<%=i+1%>	
						</div>
						<div>
							<%=truck.getTruckPlate()%>
						</div>
						<div>
							<%=separator(total_inflow)%>
						</div>						
						<div>
							<%=separator(total_outflow)%>
						</div>
						<div>
							<%
								if(total_profit>0){
									%>
									<p style="color: green">
								<%
								}
								else if(total_profit<0){
									%>
									<p style="color: red">
								<%	
								}
								else{
									%>
									<p style="color: yellow">
								<%	
								}
								%>
								<%=separator(total_profit)%>
							</p>
						</div>
						<div>
							<button id="btnInflowUpdate" onclick="window.location.href='/WebProg/Project_Kelas/viewDetail.jsp?id=<%=truck.getId()%>'">
								View Detail
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