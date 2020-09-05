<%@page import="java.util.LinkedList"%>
<%@page import="DataHandler.DBHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="Header.html" %>
    <%@ page import="GetterSetter.Officer" %>
        <%@ page import="GetterSetter.Status" %>
        <%@page import="GetterSetter.ReportCase" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Cases</title>
</head>
<body>

<%String oid=(String)session.getAttribute("oid");

//Officer off=new Officer();
Status status=null;
DBHandler objDB=new DBHandler();
Officer off=objDB.RetriveOfficerBio(oid);
System.out.println("Officer data "+off);
status=objDB.RetriveMyCases(oid);
String reportid=status.getReportid();
System.out.println(reportid+" reportid in my cases");
ReportCase rc=objDB.RetriveReportId(reportid);
LinkedList<Status> lst=new LinkedList<>();
%>

<h1><center>Welcome <%=oid %></center></h1>

<%=status.getReportid() %>

<%=off.getStrName() %>
<%-- <%=status.getReportid() %> --%>
<table class="table table-bordered">
<tr>
	<th>Case Id</th>
	<th>Officer Name</th>
	<th>Name of Case Reporter</th>
	<th>Email</th>
	<th>Contact No.</th>
	<th>Address</th>
	<th>State</th>
	<th>City</th>
	<th>Report Type</th>
	<th>Description</th>
	<th>Date of Reporting Case</th>
	<th>Status</th>
</tr>
	<tr>
		<td><%=status.getReportid() %></td>
		<td><%=off.getStrName() %></td>
		<td><%=rc.getStrName() %></td>
		<td><%=rc.getStrEmail() %></td>
		<td><%=rc.getStrContact() %></td>
		<td><%=rc.getStrAdd() %></td>
		<td><%=rc.getStrState() %></td>
		<td><%=rc.getStrCity() %></td>
		<td><%=rc.getStrReportType() %></td>
		<td><%=rc.getStrDesc() %></td>
		<td><%=rc.getStrDate() %></td>
		<td><%=rc.getStrStatus() %></td>

	</tr>
</table>


</body>
<%@ include file="Footer.html" %>