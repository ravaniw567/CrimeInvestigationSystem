<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="Header.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Officer</title>

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
width: 260px;
height: 60px;
font-size:30px;
background-color: white;
color: maroon;
border: 2px solid maroon;
}
.btn:hover{
background-color: maroon;
color: white;

}

</style>

</head>
<body>

<h1><center>Add New Officer</center></h1>

<div class="container">
  <form action="DBH" method="post" enctype="multipart/form-data">  
  <div class="group">      
      <input type="text" name="oidd" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Officer ID</label>
    </div>
  
  
    <div class="group">      
      <input type="text" name="name" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Name</label>
    </div>
      
        <div class="group">      
      <input type="text" name="pwd" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Password</label>
    </div>
      
    <div class="group">      
      <input type="text" name="email" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Email</label>
    </div>
    
      <div class="group">      
      <input type="text" name="contact" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Contact</label>
    </div>
    
      <div class="group">      
      <input type="text" name="address" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Address</label>
    </div>
    
      <div class="group">      
      <input type="text" name="post" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Post</label>
    </div>
    
      <div class="group">      
     
      <label>Image</label><br>
    <input type="file" name="img" id="img" required/>
    
    <script>
	function readURL(input) {
	       if (input.files && input.files[0]) {
	           var reader = new FileReader();

	           reader.onload = function (e) {
	               $('#img')
	                   .attr('src', e.target.result)
	                   .width(150)
	                   .height(150);
	           };
	           document.getElementById("img").style.display = "block";
	           reader.readAsDataURL(input.files[0]);
	       }
	   }

		    

</script>
    
    
    <br>
    <button type="submit" class="btn" name="btn" value="addOfficer">Add Officer</button>
    
    </div>
  </form>
 </div>

</body>
<%@ include file="Footer.html" %>