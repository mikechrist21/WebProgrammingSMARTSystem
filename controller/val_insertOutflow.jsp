<%@ include file="../connector/Connect.jsp" %>
<%@include file="../model/Outflow.jsp"%>
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
			response.sendRedirect("../insertOutflow.jsp?code=invalidTruckID");
		}
		else if(trxDate.length()<1){
			response.sendRedirect("../insertOutflow.jsp?code=emptyTrxDate");
		}
		else if(trxDescription.length()<1){
			response.sendRedirect("../insertOutflow.jsp?code=emptyTrxDescription");
		}
		else if(trxValue == 0){
			response.sendRedirect("../insertOutflow.jsp?code=emptyTrxValue");
		}
		else{
			Outflow outflow = new Outflow();
			outflow.setTruckID(truckID);
			outflow.setTrxDate(trxDate);
			outflow.setTrxDescription(trxDescription);
			outflow.setTrxValue(trxValue);
			outflow.insert();
			response.sendRedirect("../insertOutflow.jsp?code=insertSuccess");
		}
	%>
</body>
</html>