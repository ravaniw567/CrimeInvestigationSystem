<%@page import="DataHandler.DBHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="DataHandler.DBHandler" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DBHandler</title>
</head>
<body>

<% DBHandler objDB=new DBHandler();

String strBtn=request.getParameter("btn");

System.out.println(strBtn);

if(strBtn.equals("ReportCase")){
	
	int intReportId=Integer.parseInt(request.getParameter("refno"));
	String strName=request.getParameter("name");
	String strEmail=request.getParameter("email");
	int intContact=Integer.parseInt(request.getParameter("contact"));
	String strAddress=request.getParameter("address");
	String strState=request.getParameter("state");
	String strCity=request.getParameter("city");
	String strType=request.getParameter("type");
	String strDesc=request.getParameter("description");
	
	System.out.println(intReportId+" "+strName+" "+intContact);
	objDB.Reportcase(intReportId, strName, strEmail, intContact, strAddress, strState, strCity, strType, strDesc);

	response.sendRedirect(request.getContextPath()+"/ReportCrime.jsp");
}


%>




</body>
</html>