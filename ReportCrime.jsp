<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="Header.html" %>
    <%@page import="java.util.Random" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Report a Crime</title>

<style>


 { box-sizing:border-box; }

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
  width:500px;
  border:none;
  border-bottom:1px solid #757575;
}
input:focus 		{ outline:none; }

@media(max-width: 786px){
input{
width: 200px;
margin-top: 0;
}
}




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
  left:100%;
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


.btn{
font-size: 30px;
background-color: white;
text-align: center;
padding: 10px;
color: maroon;
radius: 4px;
}
.btn:hover{
background-color: maroon;
color: white;
}


.myBtn{
background-color:blue;
color:white;
font-size:24px;
}
.myBtn:hover
{
color:white;
   font-size:30px;
}



/* 
 .background{
  width: 100%;
  height: 100%;
  background: radial-gradient(ellipse at top, rgb(67, 76, 100), rgb(48, 49, 51)),
            radial-gradient(ellipse at bottom, rgb(89, 69, 89), rgb(107, 139, 174));
} */

 article{
 /*   width: 25rem;

  min-height: 40rem;
 */   background: linear-gradient(45deg, rgb(86, 84, 83), rgb(86, 84, 103)); 
  box-shadow: inset 0 0 1.4rem rgb(56, 56, 58);
  margin: 0 auto;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  color:white;
}

.shiny-button {
  margin: 3rem auto;
  width: 50%;
  text-align: center;
  padding: 1.3rem 2rem 1.5rem 2rem;
  position: relative;
  font-size: 2.5rem;
  z-index: 1;
  border-radius: 0.8rem;
  overflow: hidden;
  box-shadow: 0rem 0.25rem 0.25rem rgb(45, 50, 58);
  cursor: pointer;
  transition: all 200ms ease;
  height: 25%;
}
.shiny-button:active{
  transform: translateY(0.3rem);
   box-shadow: 0rem 0.1rem 0rem rgb(45, 50, 58); 
}
.shiny-button p {
  margin: 0;
  text-shadow: 0 0.2rem 0.2rem rgb(200, 222, 237);
}
canvas{
 position: absolute;
  
  top: 0;
  left: 0;
  z-index: -1;
}

.themeBtn3 {
    background: #ff6666;
    color: #ffffff !important;
    display: inline-block;
    font-size: 24px;
    font-weight: 500;
    height: 50px;
    line-height: 0.8;
    padding: 18px 30px;
    text-transform: capitalize;
    border-radius: 1px;
    letter-spacing: 0.5px;
	border:0px !important;
	cursor:pointer;
	border-radius:100px;
	width: 100%;
	text-align: center;
}
.themeBtn3:hover {
    background: rgb(255, 46, 77);
    color: #ffffff;
    box-shadow: 0 10px 25px -2px rgba(255, 46, 77, 0.6);
}
.themeBtn4 {
    background: #0000e6;
    color: #ffffff !important;
    display: inline-block;
    font-size: 24px;
    font-weight: 500;
    height: 50px;
    line-height: 0.8;
    padding: 18px 30px;
    text-transform: capitalize;
    border-radius: 1px;
    letter-spacing: 0.5px;
	border:0px !important;
	cursor:pointer;
	border-radius:100px;
	width: 100%;
	text-align: center;

}
.themeBtn4:hover {
    background: rgb(0, 110, 255);
    color: #ffffff;
    box-shadow: 0 10px 25px -2px rgba(0, 110, 255, 0.6);
}



/* 
body{
margin: 2%;
} */
.butn{
width: 100%;
font-size: 28px;
padding: 6px;
margin: 32px;
margin-right: 1%;
background-color: #6666ff;
}

</style>

</head>
<body>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

  <script>

    $(function() {

        $("#state").change(function() {

            $("#city").load("TextData/" + $(this).val() + ".txt");

        });

              });

    
    
    function myFunction() {
		  var x = document.getElementById("Select").value;
			document.getElementById("Select").innerHTML=x;
		}

	function confrm(){
		var y=document.getElementById("refno").value;
		document.getElementById("refno").innerHTML=y;
		
		confirm("Your Report has been Submitted Successfully. Your case id:-"+y+" Please save it for future reference.");
	}
    
	
	 $(function () {
	        $("input[name=vehicles]").click(function () {
	        	$("#missingPersons").hide();
	                $("#vehicles").show();
	                $("#Case").hide();
	           
	        });
	       
	        $("input[name=case]").click(function () {
		           
                $("#vehicles").hide();
                $("#Case").show();
                $("#missingPersons").hide();
           
        });
	        $("input[name=missingPersons]").click(function () {
		           
                $("#vehicles").hide();
                $("#Case").hide();
                $("#missingPersons").show();
           
        });
	    });

	 $(function() {

		    $("#rstate").change(function() {

		        $("#rcity").load("TextData/" + $(this).val() + ".txt");

		    });

		          });
	 
	 
	 $(function() {

		    $("#vstate").change(function() {

		        $("#vcity").load("TextData/" + $(this).val() + ".txt");

		    });

		          });
	 
	 
	 $(function() {

		    $("#mstate").change(function() {

		        $("#mcity").load("TextData/" + $(this).val() + ".txt");

		    });

		          });
	 
</script>

<%!
public int main()
         {
            Random ram = new Random();
              int ram_int1 = ram.nextInt(100000000);
              int ran_int2= ram.nextInt(999999999);
              int ran_int3= ram_int1+ran_int2;
              System.out.println(ram_int1);
              System.out.println(ran_int2);
              System.out.println(ran_int3);
              return ran_int3;
                }

  %>

<form action="DBH" method="post"  enctype="multipart/form-data">

<div class="container1">
	<div class="row">
	<div class="alert alert-danger alert-dismissible" role="alert">
  <button type="button" onclick="this.parentNode.parentNode.removeChild(this.parentNode);" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
  <strong><i class="fa fa-warning"></i> Note: </strong> <marquee><p style="font-family: Impact; font-size: 18pt">Any fraud can lead to very severe punishment.</p></marquee>
</div>
	</div>
</div>






<div class="container-fluid margin">
	<a  onClick="window.location='ViewPS.jsp'" class="themeBtn3">Find Police Stations Near You</a>
</div>
<br>
<div class="container-fluid margin">
	<a onClick="window.location='TrackStatus.jsp'" class="themeBtn4">Check Your Case Status</a>
</div>
<br>


<div class="col-md-4">
<input type="button" class="butn" name="vehicles" value="Stolen Vehicles">
</div>

<div class="col-md-4">
<input type="button" class="butn" name="case" value="Case"></div>


<div class="col-md-4">
<input type="button" class="butn" name="missingPersons" value="Missing Persons"></div>



	<input type="hidden" value="<%= main() %>" name="refno" id="refno">
	
	
	
	<div class="Case" id="Case">
		
		<h1><center>Report Case</center></h1>
		
		
		
		
			<div class="container">
			
			
	  
	    <div class="group">      
	      <input type="text" name="name" >
	      <span class="highlight"></span>
	      <span class="bar"></span>
	      <label>Name</label>
	    </div>
	      
	    <div class="group">      
	      <input type="text" name="email" >
	      <span class="highlight"></span>
	      <span class="bar"></span>
	      <label>Email</label>
	    </div>
	    
	     <div class="group">      
	      <input type="text" name="contact" >
	      <span class="highlight"></span>
	      <span class="bar"></span>
	      <label>Contact No.</label>
	    </div>
	    
	     <div class="group">      
	      <input type="text" name="address" >
	      <span class="highlight"></span>
	      <span class="bar"></span>
	      <label>Address</label>
	    </div>
	
	
		  <div class="group">  
			<div class="col-md-4">    
		    	<label>State</label>  
	 		 </div>
	  <div class="col-md-8">
	  <select class="input" name="rstate" id="rstate" >
	
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
		    </div>
		    
		    <br><Br>
		   
	
		   <div class="col-md-6 ">      
		     <!--  <input type="text" name="city" id="name" >
		      <span class="highlight"></span>
		      <span class="bar"></span> -->
		      <label>City</label>
		    </div>
			<div class="col-md-6">
				<select class="input" name="rcity" class="rcity">
				<option>Select District</option>
				</select>
			</div>	
	
<br><br>
	
		 <div class="col-md-4">	    
		    
		      <label>Crime Type</label>
		     </div>
		     <div class="col-md-8">
		      <select class="input" name="type">
		      	<option>Missing Person</option>
		      	<option>Proclaimed Offenders</option>
		      	<option>Stolen Vehicles</option>
		      	<option>Unclaimed Dead Body</option>
		      	<option>Criminals on Reward</option>
		      	<option>Unidentified/Found Person</option>
		      	<option>Sex Offender Register</option>
		      </select>
		    </div>
		
		 
	   <br><Br><br><Br>
	   		<div class="group">      
		      <input type="text" name="description" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label>Description</label>
		    </div>
	   
	   <div class="col-md-6">
	   	<button type="submit" class="btn" onClick="confrm()" name="btn" value="ReportCase">Report Your Case</button>
	   </div>
	   <div class="col-md-6">
	   <button type="button" class="btn" name="btn" value="track" id="track" onClick="window.location='TrackStatus.jsp'">Check Status</button>		
		</div>   
   
   
  

   </div>




   </div>


</body>
  

<script>
$(document).ready(function() {
    $('track').hover(function() {
      $(this).html('Track Your Case Now');
    }, function() {
      $(this).html('Check Status');
    });
  });

/* function vehicles(){
	document.getElementById('vehicles').style.display="block";
} */

</script>

<div id="vehicles" style="display:none">
<h1><center>Report Stolen Vehicles</center></h1><br>

<div class="container">
<center>
			<div class="group ">      
		      <input type="text" name="vname" id="name" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label> Name:</label>
		    </div>
		    
		    <div class="group ">      
		      <input type="text" name="vphn" id="name" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label>Contact no:</label>
		    </div>
		    
		    <div class="group ">      
		      <input type="text" name="vemail" id="name" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label>Email:</label>
		    </div>
		    
		    <div class="group ">      
		      <input type="text" name="vadd" id="name" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label>Address:</label>
		    </div>
	
	<div class="group ">      
		      <div class="col-md-4">
		      <label>state</label>
		    </div></div>
		    
		    <select class="input" name="vstate" id="vstate" >
	
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
	 
	
		    <br><br>
		    
	  <div class="col-md-6">      
		      <!-- <input type="text" name="vcity" id="name" >
		      <span class="highlight"></span>
		      <span class="bar"></span> -->
		      <label>City</label>
		    </div>
		    <div class="col-md-6">
		    <select type="input" name="vcity" id="vcity">
		    <option> Select District </option>
		    </select>
		    </div>
	<br><Br><br><br>
		    
		    <div class="group ">      
		      <input type="text" name="vtype" id="name" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label>Vehicle Type:</label>
		    </div>
		    
		    <div class="group ">      
		      <input type="text" name="vman" id="name" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label>Manufacturer:</label>
		    </div>
		    
		    <div class="group ">      
		      <input type="text" name="vreg" id="name" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label>Registration number:</label>
		    </div>
		    
		    <div class="group ">      
		      <input type="text" name="chasis" id="name" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label>Chasis:</label>
		    </div>
		    
		    <div class="group ">      
		      <input type="text" name="engine" id="name" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label>Engine Number:</label>
		    </div>
		    
		    <div class="group ">      
		      <input type="text" name="yom" id="name" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label>Year of Manufacture:</label>
		    </div>
		    
		    <div class="group ">      
		      <input type="text" name="colour" id="name" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label>Colour:</label>
		    </div>
		    
		      <div class="group ">      
		      <input type="text" name="sdate" id="name" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label>Stolen From:</label>
		    </div>
		    
		    
		      <label>Img if any:</label>
		   
		<input type="file" id="vimg" name="vimg">
	<img id="blah1" style="display: none; margin-left:40%;" src="#"/>
	<br>
	</div>
	<button type="submit" class="btn" name="btn" value="vehicles" onClick="confrm()"  onchange="readURL(this);">Report Case</button><br><br>
	<script>
	function readURL(input) {
	       if (input.files && input.files[0]) {
	           var reader = new FileReader();

	           reader.onload = function (e) {
	               $('#blah1')
	                   .attr('src', e.target.result)
	                   .width(150)
	                   .height(150);
	           };
	           document.getElementById("blah1").style.display = "block";
	           reader.readAsDataURL(input.files[0]);
	       }
	   }

		    

</script>
</div>



<div id="missingPersons" style="display:none">
<h1><center>Report Missing Persons</center></h1>
<div class="container">
<center>
  <div class="group ">      
		      <input type="text" name="fname" id="fname" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label>First Name:</label>
		    </div>
		    
		      <div class="group ">      
		      <input type="text" name="lname" id="lname" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label>Last Name:</label>
		    </div>
		
		  <div class="group ">      
		      <input type="text" name="mage" id="mage" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label>Age</label>
		    </div>
		    
		    <div class="col-md-4">
		    <label>Gender</label>
		    </div>
		   
		  
		    <input type="radio" name="gender" value="Male" id="Male">
		     <label for="Male">Male</label>
		    
		    <input type="radio" name="gender" value="female" id="female">
		    <label for="female">Female</label>
		    
		    <input type="radio" name="gender" value="others" id="others"><br>
		    <label for="others">Others</label>
		    
		    
		    <br><Br><br><Br>
	
	<div class="group ">      
		      <input type="text" name="mreporter" id="mreporter" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label>Name of Reporter</label>
		    </div>
		    
		    <div class="group ">      
		      <input type="text" name="mrelation" id="mrelation" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label>Relationship with Missing Person</label>
		    </div>
	
	  <div class="group ">      
		      <input type="text" name="memail" id="email" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label>Email</label>
		    </div>
	
	  <div class="group ">      
		      <input type="text" name="mcntct" id="phnno" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label>Contact No.</label>
		    </div>
		    
		    <div class="group ">      
		      <input type="text" name="madd" id="madd" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label>Address</label>
		    </div>
	
	
	  <div class="group ">      
		      <div class="col-md-4">
		      <label>state</label>
		    </div></div>
		    
		    <select class="input" name="mstate" id="mstate" >
	
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
	 
	
		    <br><br><br><br>
		    
	  <div class="col-md-6 ">      
		      <!-- <input type="text" name="mcity" id="mcity" >
		      <span class="highlight"></span>
		      <span class="bar"></span> -->
		      <label>City</label>
		    </div>
		    
		    <div class="col-md-6">
		    <select class="input" name="mcity" id="mcity">
		    	<option>Select District</option>
		    </select>
		    </div>
	
	<br><Br><Br>
	  <div class="group ">      
		      <input type="text" name="mdate" id="mdate" >
		      <span class="highlight"></span>
		      <span class="bar"></span>
		      <label>Missing Since</label>
		    </div>
	
	<div>
	<label>Image:</label>
		<input type="file" id="mimg" name="mimg">
	<img id="blah2" style="display: none; margin-left:40%;" src="#"/>
	<br>
	</div>
	</div>
	<button type="submit" class="btn" name="btn" value="missingPersons" onClick="confrm()"  onchange="readURL2(this);">Report Case</button><br><br>
	<script>
	function readURL2(input) {
	       if (input.files && input.files[0]) {
	           var reader = new FileReader();

	           reader.onload = function (e) {
	               $('#blah2')
	                   .attr('src', e.target.result)
	                   .width(150)
	                   .height(150);
	           };
	           document.getElementById("blah2").style.display = "block";
	           reader.readAsDataURL(input.files[0]);
	       }
	   }
	</script>
</center>

</div>


</form>

<%@ include file="Footer.html" %>