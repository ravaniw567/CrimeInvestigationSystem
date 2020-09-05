<%@page import="java.util.LinkedList"%>
<%@page import="GetterSetter.ReportCase"%>
<%@page import="DataHandler.DBHandler"%>
<%@page import="GetterSetter.Officer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="Header.html"%>
    <%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"   %>
    
<!DOCTYPE html>

<style>

.navv{
background-color: #FFFFCC;

}

.post-it {
	padding-left: 100px;
	padding-top: 100px;
	margin-bottom: -20px;
	font-size: 14px;
	radius: 50%;
}
.post-it > li{
	list-style: none;
	float: left;
	width: 120px;
	overflow: hidden;
	text-decoration: none;
	position: relative;
	margin-left: -55px;
	box-shadow: 2px 0px 1px rgba(0,0,0,0.5);

	-webkit-transform-origin: top left;
	-moz-transform-origin: top left;
	-o-transform-origin: top left;
	transform-origin: top left;

	-webkit-transform: rotate(-40deg);
	-moz-transform: rotate(-40deg);
	-o-transform: rotate(-40deg);
	transform: rotate(-40deg);

	-webkit-transition: all 0.3s ease;
	-moz-transition: all 0.3s ease;
	-o-transition: all 0.3s ease;
	transition: all 0.3s ease;
}
.post-it > li.active {
	z-index: 2;
}
.post-it > li:hover,
.post-it > li:focus,
.post-it > li.active {
	box-shadow: 10px 0px 6px rgba(0,0,0,0.5);
	-webkit-transform: rotate(-40deg) scalex(.95);
	-mox-transform: rotate(-40deg) scalex(.95);
	-o-transform: rotate(-40deg) scalex(.95);
	transform: rotate(-40deg) scalex(.95);
}
.post-it > li > a {
	color: rgba(255,255,255,0.5);
	display: block;
	width: 100%;
	padding: 10px 20px;
	white-space:nowrap; 
	font-family: Impact "Trebuchet MS" ;
	text-decoration: none;
	background: rgba(0,0,0, .4);
	
	-webkit-transition: all .3s ease;
	-moz-transition: all .3s ease;
	-o-transition: all .3s ease;
	transition: all .3s ease;
}
.post-it > li > a:hover,
.post-it > li > a:focus,
.post-it > li.active > a {
	color: white;
	background: rgba(255,255,255,0);
}

.post-it > li:nth-child(1) {
	background: #FF0000;
}
	.post-it > li:nth-child(2) {
	background: #FF3300;
}
.post-it  > li:nth-child(3) {
	background: #FFCC00;
}
.post-it  > li:nth-child(4) {
	background: #009933;
}
.post-it  > li:nth-child(5) {
	background: #0066CC;
}
.post-it  > li:nth-child(6) {
	background: #000099;
}
.post-it  > li:nth-child(7) {
	background: #9900CC;
}
.post-it  > li:nth-child(8) {
	background: #000000;
}
.post-it::after {
	content: "";
	display:block;
	clear:both;
}
@media (max-width: 400px) {
	.post-it {
		padding-left: 0px;
		padding-top: 0px;
		margin-left: 0px;
		margin-bottom: 10px;

	}
	.post-it > li {
		clear: both;
		width: 100%;
		margin-left:0;

		-webkit-transform-origin: bottom left;
		-moz-transform-origin: bottom left;
		-o-transform-origin: bottom left;
		transform-origin: bottom left;
		
		-webkit-transform: rotate(0deg);
		-moz-transform: rotate(0deg);
		-o-transform: rotate(0deg);
		transform: rotate(0deg);
	}
	.post-it > li:hover,
	.post-it > li:focus {
		box-shadow: 0px -6px 10px rgba(0,0,0,0.5);
	}
	.post-it > li > a {
		text-align: center;
		padding-left: 0px;
	}
	.post-it .active {
		-webkit-transform: skew(-20deg);
		-moz-transform: skew(-20deg);
		-o-transform: skew(-20deg);
		transform: skew(-20deg);
	}
} 

/**
 * Note
 */
.note {
  background: #fff;
  height: 200px;
  padding-top: 30px;  
  position: relative;
}



.nav {
    left:80%;
    margin-left:-150px;
    top:50px;
    position:absolute;
}
.nav>li>a:hover, .nav>li>a:focus, .nav .open>a, .nav .open>a:hover, .nav .open>a:focus {
    background:#fff;
}
.dropdown {
    background:#fff;
    border:1px solid #ccc;
    border-radius:4px;
    margin-left: 85%;   
	width:0%;
}
.dropdown-menu>li>a {
    color:#428bca;
}
.dropdown ul.dropdown-menu {
    border-radius:4px;
    box-shadow:none;
    margin-top:20px;
    width:200px;
}
.dropdown ul.dropdown-menu:before {
    content: "";
    border-bottom: 10px solid #fff;
    border-right: 10px solid transparent;
    border-left: 10px solid transparent;
    position: absolute;
    top: -10px;
    right: 16px;
    z-index: 10;
}
.dropdown ul.dropdown-menu:after {
    content: "";
    border-bottom: 12px solid #ccc;
    border-right: 12px solid transparent;
    border-left: 12px solid transparent;
    position: absolute;
    top: -12px;
    right: 14px;
    z-index: 9;
}



/*-------------------------------*/
/*      Code snippet by          */
/*      @maridlcrmn              */
/*-------------------------------*/


section {
    padding-top: 100px;
    padding-bottom: 100px;
}

.quote {
    color: rgba(0,0,0,.1);
    text-align: center;
    margin-bottom: 30px;
}
.profile-circle{
background-image: url("images/20lawsandrightseveryindianshouldbeawareof3.jpg");
}
/*-------------------------------*/
/*    Carousel Fade Transition   */
/*-------------------------------*/

#fade-quote-carousel.carousel {
  padding-bottom: 60px;
}
#fade-quote-carousel.carousel .carousel-inner .item {
  opacity: 0;
  -webkit-transition-property: opacity;
      -ms-transition-property: opacity;
          transition-property: opacity;
}
#fade-quote-carousel.carousel .carousel-inner .active {
  opacity: 1;
  -webkit-transition-property: opacity;
      -ms-transition-property: opacity;
          transition-property: opacity;
       
}
#fade-quote-carousel.carousel .carousel-indicators {
  bottom: 10px;
}
#fade-quote-carousel.carousel .carousel-indicators > li {
  background-color: #e84a64;
  border: none;
}
#fade-quote-carousel blockquote {
    text-align: center;
    border: none;
    
}
#fade-quote-carousel .profile-circle {
    width: 100px;
    height: 100px;
    margin: 0 auto;
    border-radius: 100px;
}



/* Rainbow Heading */

.rainbow {
  
   /* Font options */
  font-family: 'Pacifico', cursive;
  text-shadow: 2px 2px 4px #000000;
  font-size:40px;
  
   /* Chrome, Safari, Opera */
  -webkit-animation: rainbow 5s infinite; 
  
  /* Internet Explorer */
  -ms-animation: rainbow 5s infinite;
  
  /* Standar Syntax */
  animation: rainbow 5s infinite; 
}

/* Chrome, Safari, Opera */
@-webkit-keyframes rainbow{
  0%{color: orange;}	
  10%{color: purple;}	
	20%{color: red;}
  30%{color: CadetBlue;}
	40%{color: yellow;}
  50%{color: coral;}
	60%{color: green;}
  70%{color: cyan;}
  80%{color: DeepPink;}
  90%{color: DodgerBlue;}
	100%{color: orange;}
}

/* Internet Explorer */
@-ms-keyframes rainbow{
   0%{color: orange;}	
  10%{color: purple;}	
	20%{color: red;}
  30%{color: CadetBlue;}
	40%{color: yellow;}
  50%{color: coral;}
	60%{color: green;}
  70%{color: cyan;}
  80%{color: DeepPink;}
  90%{color: DodgerBlue;}
	100%{color: orange;}
}

/* Standar Syntax */
@keyframes rainbow{
    0%{color: orange;}	
  10%{color: purple;}	
	20%{color: red;}
  30%{color: CadetBlue;}
	40%{color: yellow;}
  50%{color: coral;}
	60%{color: green;}
  70%{color: cyan;}
  80%{color: DeepPink;}
  90%{color: DodgerBlue;}
	100%{color: orange;}
}

/* ANIMATED POP-UP Style */


</style>

<%String name=(String)session.getAttribute("oid"); %>

<% DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
LocalDateTime now = LocalDateTime.now();
System.out.println(dtf.format(now)); %>


<div class="col-md-8">
	<h2><center>Welcome <%=name %></center></h2>
</div>
<div class="col-md-4">
	<%=dtf.format(now) %>
</div>



<br><br><Br>

<div class="navv">

<ul class="post-it">
  <li><a href="ViewCases.jsp">View Cases</a></li>
  <li><a href="AddSuspects.jsp">Add Suspects</a></li>
  <li><a href="AddPS.jsp">Add Police Station</a></li>
  <li><a href="AddPrisoners.jsp">Add Prisoners</a></li>
  <li><a href="ReportCrime.jsp">Add Cases</a></li>
  <li><a href="Jails.jsp">View Jails</a></li>
  <li><a href="AddOfficer.jsp">Add Officer</a></li>
 <ul>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user pull-right" style="margin-left:80%;"></span></a>
          <ul class="dropdown-menu">
            <li><a href="MyProfile.jsp">My Profile </a></li>
            <li class="divider"></li>
            <li><a href="MyCases.jsp">My Cases </a></li>
            <li class="divider"></li>
            <li><a href="ReportCrime.jsp">Add new Case </a></li>
            <li class="divider"></li>
            <li><a href="UpdateCase.jsp">Update a Case </a></li>
            <li class="divider"></li>
            <li><a href="https://www.thehindu.com/news/national/">News and Updates </a></li>
            <li class="divider"></li>
            <li><a href="FrontPage.html">Log Out </a></li>
          </ul>
        </li>
      </ul>
</ul>
</div>

<br><Br><br><br>



<center><h2 class="rainbow">Some Interesting Facts About Indian Police</center></h2>


<section id="carousel">    				
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
                <div class="quote"><i class="fa fa-quote-left fa-4x"></i></div>
				<div class="carousel slide" id="fade-quote-carousel" data-ride="carousel" data-interval="3000">
				  <!-- Carousel indicators -->
                  <ol class="carousel-indicators">
				    <li data-target="#fade-quote-carousel" data-slide-to="0"></li>
				    <li data-target="#fade-quote-carousel" data-slide-to="1"></li>
				    <li data-target="#fade-quote-carousel" data-slide-to="2" class="active"></li>
                    <li data-target="#fade-quote-carousel" data-slide-to="3"></li>
                    <li data-target="#fade-quote-carousel" data-slide-to="4"></li>
                    <li data-target="#fade-quote-carousel" data-slide-to="5"></li>
				  </ol>
				  <!-- Carousel items -->
				  <div class="carousel-inner">
				    <div class="item">
                        <div class="profile-circle" style="background-color: rgba(0,0,0,.2);"></div>
				    	<blockquote>
				    	<p>P.O.L.I.C.E.</p>
				    		<p>Public Officer for Legal Investigations and Criminal Emergencies</p>
				    	</blockquote>	
				    </div>
				    <div class="item">
                        <div class="profile-circle" style="background-color: rgba(77,5,51,.2);"></div>
				    	<blockquote>
				    		<p>There’s an all-women squad on the Indo-China border.</p>
				    	</blockquote>
				    </div>
				    <div class="active item">
                        <div class="profile-circle" style="background-color: rgba(145,169,216,.2);"></div>
				    	<blockquote>
				    		<p>The study shows that poorer states tend to have weaker police forces.</p>
				    	</blockquote>
				    </div>
                    <div class="item">
                        <div class="profile-circle" style="background-color: rgba(77,5,51,.2);"></div>
    			    	<blockquote>
				    		<p>21% of private detectives and investigators are self-employed.</p>
				    	</blockquote>
				    </div>
                    <div class="item">
                        <div class="profile-circle" style="background-color: rgba(77,5,51,.2);"></div>
    			    	<blockquote>
				    		<p>1861 Police Act makes it clear that a police officer is "considered to be always on duty".</p>
				    	</blockquote>
				    </div>
                    <div class="item">
                        <div class="profile-circle" style="background-color: rgba(77,5,51,.2);"></div>
    			    	<blockquote>
				    		<p>Women cops make up 6% of the force, and Chandigarh tops the list.</p>
				    	</blockquote>
				    </div>
				  </div>
				</div>
			</div>							
		</div>
	</div>
</section>
</body>
<%@ include file="Footer.html" %>