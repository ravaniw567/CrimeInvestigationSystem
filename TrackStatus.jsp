<%@page import="GetterSetter.ReportCase"%>
<%@page import="DataHandler.DBHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="Header.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Track Status of Case</title>

<style type="text/css">
 #data{
visibility: hidden;
}

 </style>

</head>

<body>



 
 

<%
%>

<form action="CaseStatus.jsp" method="post">
<div id="inpt">

<label>Enter your reference no. here:</label>

<input type="number" id="refno"  name="refno" required/><br><Br>

<button type="submit" name="btn" value="track" onClick="window.location='CaseStatus.jsp'" >Track status now</button>


<%
DBHandler objDb=new DBHandler();

String strRefid=request.getParameter("refno");
System.out.println("Case id in Track status:"+strRefid );
//objDb.RetriveMyCases(strRefid);
ReportCase reportCase=new ReportCase();
reportCase=objDb.RetriveReportId(strRefid);

//reportCase=objDb.RetriveReportId();

%>

</div>



</form>

</body>
<%@ include file="Footer.html"%>