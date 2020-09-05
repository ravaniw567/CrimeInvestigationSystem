<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Header.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Prisoners</title>

<style>
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


.btn{
height: 50px;
width: 100px;
font-size:26px;
align-content:center;
background-color: white;
color: maroon;
}
.btn:hover{
color: white;
background-color: maroon;
height: 50px;
width: 100px;
}

</style>


</head>
<body>

<h1><center>Add Prisoners</center></h1>


<div class="container">
  <form action="DBH" method="post" enctype="multipart/form-data">
    
    
    <div class="group">      
      <input type="text" name="caseid" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Case id</label>
    </div>
    
    <div class="group">      
      <input type="text" name="name" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Name</label>
    </div>
      
    <div class="group">      
      <input type="text" name="id" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Prisoner no.</label>
    </div>
    
    <div class="group">      
      <input type="text" name=add" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Address</label>
    </div>
    
    
    <div class="group">      
      <input type="text" name="crime" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Crime</label>
    </div>
    
    <div class="group">      
      <input type="text" name="yop" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Years of Punishment</label>
    </div>
    
    <div class="group">      
      <input type="text" name="pdate" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Date of Punishment</label>
    </div>
    
    <div class="group">      
      <input type="text" name="rdate" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Date of Release</label>
    </div>
    
  
    <div class="group">      
      <input type="text" name="prison" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Name of Prison</label>
    </div>
    
   <label for="img">Image:</label>
    	<input type="file" id="img" name="img"> <label>Image</label>
	<img id="blah1" style="display: none; margin-left:40%;" src="#"/>
	<br>
	</div>
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

<center><button type="submit" class="btn" name="btn" value="prisoners">Add Prisoner</button>
</center>
  </form>
 
  
</div>


</body>
<%@ include file="Footer.html" %>