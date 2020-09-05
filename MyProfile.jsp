<%@page import="GetterSetter.Officer"%>
<%@page import="DataHandler.DBHandler"%>
<%@page import="DataHandler.DBH"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file='Header.html' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>

<style>
.custom-breadcrumb{
    list-style:none;
    overflow: hidden;
    width: 100%;
}

.custom-breadcrumb li {
    text-decoration: none; 
    padding: 10px 0 10px 50px;
    position: relative; 
    display: block;
    float: left;
    width: 50%;
    font-size: 30px;
    text-align: center;
}

.custom-breadcrumb li:after {
    content: " ";
    display: block;
    width: 0;
    height: 0;
    border-top: 50px solid transparent;
    border-bottom: 50px solid transparent;
    position: absolute;
    top: 50%;
    margin-top: -50px;
    left: 100%;
    z-index: 2;
}

.custom-breadcrumb li:before {
    content: " "; 
  display: block; 
  width: 0; 
  height: 0;
  border-top: 50px solid transparent;       
  border-bottom: 50px solid transparent;
  border-left: 30px solid white;
  position: absolute;
  top: 50%;
  margin-top: -50px; 
  margin-left: 1px;
  left: 100%;
  z-index: 1;
}



.light-blue-crumb:after{
    border-left:30px solid #3498db;
}
.light-blue-crumb{
    background: #3498db;
    color: white;
}

.faded-crumb:after{
    border-left:30px solid #ecf0f1;
}

.faded-crumb{
    background: #ecf0f1;
    color: white;
}



.row{
    padding: 30px;
}

#profile{
font-size: 28px;
text-align: center;
}

#pwd{
visibility: hidden;
}

</style>

</head>
<body>


<script>

$(function () {
    $("input[name=pwd]").click(function () {
    	$("#profile").hide();
            $("#pwd").show();       
    });
    $("input[name=profile]").click(function(){
    	$("#pwd").hide();
    	$("#profile").show();
    })
});

</script>

<div class="container">
	<div class="row">
		<ul class="custom-breadcrumb">
		    <li class="light-blue-crumb" class="active"><input type="button" name="profile" value="My Profile"></li>
		    <li class="faded-crumb"><input type="button" name="pwd" value="Change Password"></li>
		   
		</ul>
	</div>
</div>

<div id="profile">
<% 
String id=(String)session.getAttribute("oid");
System.out.println(id);
DBHandler objDB=new DBHandler();
Officer officer=new Officer();
officer=objDB.RetriveOfficerBio(id);

%>


<%=officer.getStrName() %><br>
Password: <%=officer.getStrPwd() %><br>
Email: <%=officer.getStrEmail() %><br>
Contact No: <%=officer.getStrPno() %><br>
Address: <%=officer.getStrAdd() %><br>
<span style="heigth:200px; width:200px;">
<img src="<%=officer.getPic() %>">
</span>

</div>


<div id="pwd">
<h2>Change Password</h2>
Old Password: <input type="password" name="old" required/><br>
New Password: <input type="password" name="new" required/><br>
Confirm Password: <input type="password" required/><br>
<button type="submit" value="pwdChange" name="btn">Change</button>
</div>


</body>
<%@ include file='Footer.html' %>