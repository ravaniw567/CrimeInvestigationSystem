<%@page import="GetterSetter.ReportCase"%>
<%@page import="DataHandler.DBHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Header.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Case Status</title>

<style>
body{
font-size: 22px;
text-align: center;
}

.btn{
color: maroon;
background-color:white;
font-size: 24px;
height: 60px;

}
.btn:hover{
background-color: maroon;
color: white;
}
</style>

</head>
<body>



<%

String strCaseId=request.getParameter("ReportId");
System.out.println(strCaseId+" update case status");

ReportCase rc=null;

DBHandler objDB=new DBHandler();
rc=objDB.RetriveReportId(strCaseId);
%>
 <form action="DBH" method="post">
 
 <h1><center>Update Case <%=strCaseId %></center></h1>

<div class="content">

 CaseId: <input type="text" name="ReportId" value="<%=rc.getStrReportId() %> "readonly>

<br>
Name of Reporter: <span style="color:green"> <%=rc.getStrName() %></span>
<br>
Email: <span style="color:green"><%=rc.getStrEmail() %></span>
<br>
Contact:  <span style="color:green"><%=rc.getStrContact() %></span>
<br>
Address:  <span style="color:green"><%=rc.getStrAdd() %></span>
<br>
State:  <span style="color:green"><%=rc.getStrState() %></span>
<br>
City:  <span style="color:green"><%=rc.getStrCity() %></span>
<br>
Crime Type:  <span style="color:green"><%=rc.getStrReportType() %></span>
<br>
Description:  <span style="color:green"><%=rc.getStrDesc() %></span>
<br>
Date of Reporting Case:  <span style="color:green"><%=rc.getStrDate() %></span>
<br>
Status: <input type="text" name="status" value="<%=rc.getStrStatus()%>">
<br>
OfficerId: <input type="number" name="oid"/>
<br><br>
<button type="submit" class="btn" name="btn" value="updateStatus" id="updateStatus"  data-toggle="modal" data-target="#myModal">Update Status</button>




</form> 



</body>
<%@ include file="Footer.html" %>