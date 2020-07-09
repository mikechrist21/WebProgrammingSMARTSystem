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
		String str_id = request.getParameter("id");
		Integer id = 0;
		if(str_id != null){
			id = Integer.parseInt(str_id);
		}
		String truckBrand = "";
		String truckType = "";
		String truckYear = "";
		String truckPlate = "";
		String stnkNumber = "";
		String stnkYear = "";
		String stnkExpiredDate = "";
		String location = "";
		String driverName = "";
		String image = "";
		String path = "";
		Boolean update_image = false;
		String contentType = request.getContentType();
      	// Parsing Form Result to get several important information
      	if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
            DataInputStream in = new DataInputStream(request.getInputStream());
            int formDataLength = request.getContentLength();
            byte dataBytes[] = new byte[formDataLength];
            int byteRead = 0;
            int totalBytesRead = 0;
            while (totalBytesRead < formDataLength) {
                  byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                  totalBytesRead += byteRead;
            }
            String file = new String(dataBytes);
            truckBrand = file.substring(file.indexOf("name=\"truckBrand\"")+21);
            truckBrand = truckBrand.substring(0, truckBrand.indexOf("------WebKitFormBoundary")-2);
            //out.println(truckBrand);
            truckType = file.substring(file.indexOf("name=\"truckType\"")+20);
            truckType = truckType.substring(0, truckType.indexOf("------WebKitFormBoundary")-2);
            truckYear = file.substring(file.indexOf("name=\"truckYear\"")+20);
            truckYear = truckYear.substring(0, truckYear.indexOf("------WebKitFormBoundary")-2);
			truckPlate = file.substring(file.indexOf("name=\"truckPlate\"")+21);
			truckPlate = truckPlate.substring(0, truckPlate.indexOf("------WebKitFormBoundary")-2);
			stnkNumber = file.substring(file.indexOf("name=\"stnkNumber\"")+21);
			stnkNumber = stnkNumber.substring(0, stnkNumber.indexOf("------WebKitFormBoundary")-2);
			stnkYear = file.substring(file.indexOf("name=\"stnkYear\"")+19);
			stnkYear = stnkYear.substring(0, stnkYear.indexOf("------WebKitFormBoundary")-2);
			stnkExpiredDate = file.substring(file.indexOf("name=\"stnkExpiredDate\"")+26);
			stnkExpiredDate = stnkExpiredDate.substring(0, stnkExpiredDate.indexOf("------WebKitFormBoundary")-2);
			location = file.substring(file.indexOf("name=\"location\"")+19);
			location = location.substring(0, location.indexOf("------WebKitFormBoundary")-2);
			driverName = file.substring(file.indexOf("name=\"driverName\"")+21);
			driverName = driverName.substring(0, driverName.indexOf("------WebKitFormBoundary")-2);
			image = file.substring(file.indexOf("filename=\"") + 10);
            image = image.substring(0, image.indexOf("\n"));
            image = image.substring(0,image.indexOf("\""));
            if(image.length()>0){
            	path = "C:/xampp/tomcat/webapps/WebProg/Project_Lab/img/" + image;
	            int lastIndex = contentType.lastIndexOf("=");
	            String boundary = contentType.substring(lastIndex + 1, contentType.length());
	            int pos;
	            pos = file.indexOf("filename=\"");
	            pos = file.indexOf("\n", pos) + 1;
	            pos = file.indexOf("\n", pos) + 1;
	            pos = file.indexOf("\n", pos) + 1;
	            int boundaryLocation = file.indexOf(boundary, pos) - 4;
	            int startPos = ((file.substring(0, pos)).getBytes()).length;
	            int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
	            File ff = new File(path);
	            FileOutputStream fileOut = new FileOutputStream(ff);
	            fileOut.write(dataBytes, startPos, (endPos - startPos));
	            fileOut.flush();
	            fileOut.close();
	            update_image = true;
        	}
		}
		//Validation
		if(truckBrand.length()<1){
			response.sendRedirect("../updateTruck.jsp?code=emptyTruckBrand");
		}
		else if(truckType.length()<1){
			response.sendRedirect("../updateTruck.jsp?code=emptyTruckType");
		}
		else if(truckYear.length()<1){
			response.sendRedirect("../updateTruck.jsp?code=emptyTruckYear");
		}
		else if(truckPlate.length()<1){
			response.sendRedirect("../updateTruck.jsp?code=emptyTruckPlate");
		}
		else if(stnkNumber.length()<1){
			response.sendRedirect("../updateTruck.jsp?code=emptyStnkNumber");
		}
		else if(stnkYear.length()<1){
			response.sendRedirect("../updateTruck.jsp?code=emptyStnkYear");
		}
		else if(stnkExpiredDate.length()<1){
			response.sendRedirect("../updateTruck.jsp?code=emptyStnkExpiredDate");
		}
		else if(driverName.length()<1){
			response.sendRedirect("../updateTruck.jsp?code=emptyDriverName");
		}
		else if(image.length()<1){
			response.sendRedirect("../updateTruck.jsp?code=emptyImage");
		}
		else{
			Truck truck = new Truck().find(id);
			if(truck.exists("truckPlate",truckPlate)!=null){
				response.sendRedirect("../updateTruck.jsp?code=truckExist");
			}
			else{
				truck.setTruckBrand(truckBrand);
				truck.setTruckType(truckType);
				truck.setTruckYear(truckYear);
				truck.setTruckPlate(truckPlate);
				truck.setStnkNumber(stnkNumber);
				truck.setStnkYear(stnkYear);
				truck.setStnkExpiredDate(stnkExpiredDate);
				truck.setLocation(location);
				truck.setDriverName(driverName);
				if(update_image){
					truck.setImage(image);
				}
				truck.update();
				response.sendRedirect("../truckList.jsp?code=updateSuccess");
			}

		}
	%>
</body>
</html>