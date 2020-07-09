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
			response.sendRedirect("../updateOutflow.jsp?code=emptyTrxDate");
		}
		else if(trxDescription.length()<1){
			response.sendRedirect("../updateOutflow.jsp?code=emptyTrxDescription");
		}
		else if(trxValue == 0){
			response.sendRedirect("../updateOutflow.jsp?code=emptyTrxValue");
		}
		else{
			Outflow outflow = new Outflow().find(id);
			outflow.setTrxDate(trxDate);
			outflow.setTrxDescription(trxDescription);
			outflow.setTrxValue(trxValue);
			outflow.update();
			response.sendRedirect("../updateOutflow.jsp?code=updateSuccess");
		}
	%>
</body>
</html>