<%@page import="GetterSetter.ReportCase"%>
<%@page import="java.util.LinkedList"%>
<%@page import="DataHandler.DBHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="Header.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Suspects</title>

<Style>
.suspects{
font-size: 24px;
}
* { box-sizing:border-box; }

/* basic stylings ------------------------------------------ */
body 				 { background:url(https://scotch.io/wp-content/uploads/2014/07/61.jpg); }
.container 		{ 
  font-family:'Roboto';
  width:600px; 
  margin:30px auto 0; 
  display:block; 
  background:#FFF;
  padding:10px 50px 50px;
}
h2 		 { 
  text-align:center; 
  margin-bottom:50px; 
}
h2 small { 
  font-weight:normal; 
  color:#888; 
  display:block; 
}
.footer 	{ text-align:center; }
.footer a  { color:#53B2C8; }

/* form starting stylings ------------------------------- */
.group 			  { 
  position:relative; 
  margin-bottom:45px; 
}
input 				{
  font-size:18px;
  padding:10px 10px 10px 5px;
  display:block;
  width:300px;
  border:none;
  border-bottom:1px solid #757575;
}
input:focus 		{ outline:none; }

/* LABEL ======================================= */
label 				 {
  color:#999; 
  font-size:18px;
  font-weight:normal;
  position:absolute;
  pointer-events:none;
  left:5px;
  top:10px;
  transition:0.2s ease all; 
  -moz-transition:0.2s ease all; 
  -webkit-transition:0.2s ease all;
}

/* active state */
input:focus ~ label, input:valid ~ label 		{
  top:-20px;
  font-size:14px;
  color:#5264AE;
}

/* BOTTOM BARS ================================= */
.bar 	{ position:relative; display:block; width:300px; }
.bar:before, .bar:after 	{
  content:'';
  height:2px; 
  width:0;
  bottom:1px; 
  position:absolute;
  background:#5264AE; 
  transition:0.2s ease all; 
  -moz-transition:0.2s ease all; 
  -webkit-transition:0.2s ease all;
}
.bar:before {
  left:50%;
}
.bar:after {
  right:50%; 
}

/* active state */
input:focus ~ .bar:before, input:focus ~ .bar:after {
  width:50%;
}

/* HIGHLIGHTER ================================== */
.highlight {
  position:absolute;
  height:60%; 
  width:100px; 
  top:25%; 
  left:0;
  pointer-events:none;
  opacity:0.5;
}

/* active state */
input:focus ~ .highlight {
  -webkit-animation:inputHighlighter 0.3s ease;
  -moz-animation:inputHighlighter 0.3s ease;
  animation:inputHighlighter 0.3s ease;
}

/* ANIMATIONS ================ */
@-webkit-keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}
@-moz-keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}
@keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}


</Style>

</head>
<body>
<form action="DBH" method="post" enctype="multipart/form-data">
<h1><center>Add Suspects</center></h1>

<%
DBHandler objDB=new DBHandler();
LinkedList<ReportCase> lst=objDB.ViewCases();
%>

<center>

<div class="container">

<div class="suspects">
Case Id: <select name="caseid">

<%
for(ReportCase rc:lst){
	%>
	<option><%=rc.getStrReportId() %></option>
	<%
}
%>
<br>
<br>

 <div class="group">      
      <input type="text" placeholder="Name of Suspect" name="sname" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Suspect Name</label>
    </div>
    
    <br>
    
    <div class="group">      
      <input type="text" placeholder="Address" name="address" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      
    </div>
    
    
    
    <label>Evidence Type</label>
    <select name="etype">
    	<option>Real Evidence</option>
    	<option>Demonstrative Evidence</option>
    	<option>Documentary Evidence</option>
    	<option>Testimonal Evidence</option>
    </select>
    <br>
    
    <div class="group">      
      <input type="text" placeholder="Evidence" name="evi" required>
      <span class="highlight"></span>
      <span class="bar"></span>
     
    </div>
    
    <div class="group">      
      <input type="text" placeholder="Points" name="points" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      
    </div>
  
  <label>Image of Suspect</label>
  	<input type="file" id="suspect" name="suspect">
	<img id="blah1" style="display: none; margin-left:40%;" src="#"/>

  <label>Evidence</label>	
	<input type="file" id="evidence" name="evidence">
	<img id="blah1" style="display: none; margin-left:40%;" src="#"/>
	
	
	<br>
	</div>
	<button type="submit" class="btn" name="btn" value="suspects"   onchange="readURL(this);">Add Suspect</button><br><br>
	<script>
	function readURL(input) {
	       if (input.files && input.files[0]) {
	           var reader = new FileReader();

	           reader.onload = function (e) {
	               $('#suspect')
	                   .attr('src', e.target.result)
	                   .width(150)
	                   .height(150);
	           };
	           document.getElementById("suspect").style.display = "block";
	           reader.readAsDataURL(input.files[0]);
	       }
	   }

		    
	function readURL(input) {
	       if (input.files && input.files[0]) {
	           var reader = new FileReader();

	           reader.onload = function (e) {
	               $('#evidence')
	                   .attr('src', e.target.result)
	                   .width(150)
	                   .height(150);
	           };
	           document.getElementById("evidence").style.display = "block";
	           reader.readAsDataURL(input.files[0]);
	       }
	   }
</script>
    
</select>
  

</div>
</div>
</center>

</form>
</body>
<%@ include file="Footer.html" %>