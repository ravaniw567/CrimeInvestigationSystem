<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="Header.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Police Stations</title>

<style>
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
  width: 500px;
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
  width:80%;
}

/* HIGHLIGHTER ================================== */
.highlight {
  position:absolute;
  height:60%; 
  width:200px; 
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
  width: 300px;
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

.btn{
width:300px;
font-size: 28px;
border: 2px solid maroon;
background-color: white;
}
.btn:hover{
color:white;
background-color:maroon;
font-size: 32px;
}


</style>

</head>
<body>

<h1><center>Add Police Stations</center></h1>
<br>

<script type="text/javascript">

$(function() {

    $("#state").change(function() {

        $("#city").load("TextData/" + $(this).val() + ".txt");

    });

          });
          

</script>

<div class="container">
  <form action="BtnHandler.jsp" method="post">
    <div class="group">      
      <input type="text" name="namePS" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Name of Police Station</label>
    </div>
      
    <div class="group">      
      <input type="text" name="incharge" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Incharge</label>
    </div>

    <div class="group">      
      <input type="text" name="address" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Address</label>
    </div>
    
    <div class="col-md-4">
    <label>State</label>
    </div>
    
    <div class="col-md-8">
    <select class="input" name="state" id="state" >
	
	    <option value="AndamanAndNicobarIslands">Andaman and Nicobar Islands</option>
		<option value="AndhraPradesh"> Andhra Pradesh</option>
		<option value="ArunachalPradesh">Arunachal Pradesh</option>
	    <option value="Assam">Assam</option>
	    <option value="Bihar">Bihar</option>
	    <option value="Chandigarh">Chandigarh</option>
	    <option value="Chhattisgarh">Chhattisgarh</option>
	    <option value="DadraAndNagarHaveli"> Dadra and Nagar Haveli</option>
	    <option value="DamanAndDiu"> Daman and Diu</option>
	    <option value="Delhi">Delhi</option>
	    <option value="Goa"> Goa</option>
	    <option value="Gujarat"> Gujarat</option>
	    <option value="Haryana"> Haryana</option>
	    <option value="HimachalPradesh">Himachal Pradesh</option>
	    <option value="JammuAndKashmir">Jammu and Kashmir</option>
	    <option value="Jharkhand">Jharkhand</option>
	    <option value="Karnataka">Karnataka</option>
	    <option value="Kerala">Kerala</option>
	    <option value="Ladakh">Ladakh</option>
	    <option value="Lakshadweep">Lakshadweep</option>
	    <option value="MadhyaPradesh">Madhya Pradesh</option>
	    <option value="Maharashtra">Maharashtra</option>
	    <option value="Manipur">Manipur</option>
	    <option value="Meghalaya">Meghalaya</option>
	    <option value="Mizoram">Mizoram</option>
	    <option value="Nagaland">Nagaland</option>
	    <option value="Odisha">Odisha</option>
	    <option value="Puducherry"> Puducherry</option>
	    <option value="Punjab">Punjab</option>
	    <option value="Rajasthan">Rajasthan</option>
	    <option value="Sikkim">Sikkim</option>
	    <option value="TamilNadu">Tamil Nadu</option>
	    <option value="Telangana">Telangana</option>
	    <option value="Tripura">Tripura</option>
	    <option value="UttarPradesh">Uttar Pradesh</option>
	    <option value="Uttarakhand">Uttarakhand</option>
	    <option value="WestBengal">West Bengal</option>   
	  </select>
	
    </div>
    <br><br><br>
        <div class="group">      
      <!-- <input type="text" name="city" id="city" required> -->
     <!--  <span class="highlight"></span>
      <span class="bar"></span> -->
    <div class="col-md-4">
      <label>City</label>
    </div>
    
    <div class="col-md-8">
    <select class="input" name="city" id="city" >
    <option>Select District</option>
    </select>
    
    </div>
    </div>
    <br><br>
    
        <div class="group">      
      <input type="text" name="pin" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>PIN Code</label>
    </div>
    
        <div class="group">      
      <input type="text" name="phn" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Contact No</label>
    </div>
    
        <div class="group">      
      <input type="text" name="hc" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>High Court</label>
    </div>
 
 
 <button class="btn" name="btn" value="addPS">Add Police Station</button>
  
</div>
 </form>
 
 
 
 
</body>
    <%@include file="Footer.html" %>