<%@ include file="../connector/Connect.jsp" %>
<%@include file="../model/Inflow.jsp"%>
<%@page import="java.sql.*, java.util.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<%
		String str_truckID = request.getParameter("truckID");
		String trxDate = request.getParameter("trxDate");
		String trxDescription = request.getParameter("trxDescription");
		String str_trxValue = request.getParameter("trxValue");
		Integer truckID = 0;
		Integer trxValue = 0;
		if(str_truckID != null && !str_truckID.equals("selectOne")){
			truckID = Integer.parseInt(str_truckID);
		}
		if(str_trxValue != null){
			trxValue = Integer.parseInt(str_trxValue);
		}

		//Validation
		if(truckID == 0){
			response.sendRedirect("../insertInflow.jsp?code=invalidTruckID");
		}
		else if(trxDate.length()<1){
			response.sendRedirect("../insertInflow.jsp?code=emptyTrxDate");
		}
		else if(trxDescription.length()<1){
			response.sendRedirect("../insertInflow.jsp?code=emptyTrxDescription");
		}
		else if(trxValue == 0){
			response.sendRedirect("../insertInflow.jsp?code=emptyTrxValue");
		}
		else{
			Inflow inflow = new Inflow();
			inflow.setTruckID(truckID);
			inflow.setTrxDate(trxDate);
			inflow.setTrxDescription(trxDescription);
			inflow.setTrxValue(trxValue);
			inflow.insert();
			response.sendRedirect("../insertInflow.jsp?code=insertSuccess");
		}
	%>
</body>
</html>