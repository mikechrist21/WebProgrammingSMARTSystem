<%@ include file="../connector/Connect.jsp" %>
<%@include file="../model/Truck.jsp"%>
<%@page import="java.sql.*, java.util.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<%
		String truckPlate = request.getParameter("truckPlate");
		String str_id = request.getParameter("id");
		Truck truck = new Truck();
		if(truckPlate != null){
			truck = new Truck().exists("truckPlate",truckPlate);
		}
		String action = request.getParameter("action");
		Integer id = 0;
		if(str_id != null){
			id = Integer.parseInt(str_id);
		}
		else if(truck != null){
			id = truck.getId();
		}
		if(action != null){
			if(action.equals("delete")){
				truck = new Truck();
				truck.delete(id);
				out.println(id);
				response.sendRedirect("../truckList.jsp?code=deleteSuccess");
			}
		}
		else{
			response.sendRedirect("../deleteTruck.jsp?id="+id);
		}
			 
	%>
</body>
</html>