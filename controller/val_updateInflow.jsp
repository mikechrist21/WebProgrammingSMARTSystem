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
		String str_trxID = request.getParameter("id");
		String trxDate = request.getParameter("trxDate");
		String trxDescription = request.getParameter("trxDescription");
		String str_trxValue = request.getParameter("trxValue");
		Integer id = 0;
		Integer trxValue = 0;
		if(str_trxID != null){
			id = Integer.parseInt(str_trxID);
		}
		if(str_trxValue != null){
			trxValue = Integer.parseInt(str_trxValue);
		}

		//Validation
		if(trxDate.length()<1){
			response.sendRedirect("../updateInflow.jsp?code=emptyTrxDate");
		}
		else if(trxDescription.length()<1){
			response.sendRedirect("../updateInflow.jsp?code=emptyTrxDescription");
		}
		else if(trxValue == 0){
			response.sendRedirect("../updateInflow.jsp?code=emptyTrxValue");
		}
		else{
			Inflow inflow = new Inflow().find(id);
			inflow.setTrxDate(trxDate);
			inflow.setTrxDescription(trxDescription);
			inflow.setTrxValue(trxValue);
			inflow.update();
			response.sendRedirect("../updateInflow.jsp?code=updateSuccess");
		}
	%>
</body>
</html>