<%@page import="oracle.sql.BINARY_FLOAT"%>
<%@page import="DataHandler.DBHandler"%>
 <%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Button Handler</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
<body>

<%

String strBtn=request.getParameter("btn");

System.out.println(strBtn);

DBHandler objDB=new DBHandler();

if(strBtn.equals("updateStatus")){
	String strStatus=request.getParameter("status");
	String strCaseId=request.getParameter("reportid");
	
	objDB.UpdateCase(strStatus, strCaseId);
	response.sendRedirect(request.getContextPath()+"/StatusUpdate.jsp");

}

else if(strBtn.equals("Add")){
	
	int intId=Integer.valueOf(request.getParameter("id"));
	String strPwd=request.getParameter("pwd");
	String strName=request.getParameter("name");
	int intPno=Integer.valueOf(request.getParameter("cntct"));
	String strAdd=request.getParameter("add");
	String strEmail=request.getParameter("email");
	String strArea=request.getParameter("area");
	//BINARY_FLOAT strImg= Float.valueOf(request.getParameter("img"));
	Part img=request.getPart("img");
	
	System.out.println(intId+" "+strName);
	
	//objDB.AddOfficer(intId, strPwd, strName, intPno, strAdd, strEmail, strArea, img);
}
else if(strBtn.equals("track")){
	String strRefNo=request.getParameter("refno");
	
	objDB.RetriveReportId(strRefNo);
	response.sendRedirect(request.getContextPath()+"/TrackStatus.jsp?refno="+strRefNo+"");
	
}else if(strBtn.equals("pwdChange")){
	String strOldPwd=request.getParameter("old");
	String strNewPwd=request.getParameter("new");
	String id=(String)session.getAttribute("oid");
	objDB.UpdatePwd(id, strOldPwd, strNewPwd);
	response.sendRedirect(request.getContextPath()+"/MyProfile.jsp");
}else if(strBtn.equals("addPS")){
	String strName=request.getParameter("namePS");
	String strInc=request.getParameter("incharge");
	String strAdd=request.getParameter("address");
	String strState=request.getParameter("state");
	String strCity=request.getParameter("city");
	String strPin=request.getParameter("pin");
	String strPhn=request.getParameter("phn");
	String strHC=request.getParameter("hc");
	
	objDB.AddPS(strName, strPin, strInc, strAdd, strState, strCity, strPhn, strHC);
	response.sendRedirect(request.getContextPath()+"/AddPS.jsp");
	
	
}
	


%>

</body>
</html>