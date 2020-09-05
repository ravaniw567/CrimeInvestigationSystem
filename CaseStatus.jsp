<%@page import="GetterSetter.Suspect"%>
<%@page import="GetterSetter.Officer"%>
<%@page import="GetterSetter.Status"%>
<%@page import="GetterSetter.ReportCase"%>
<%@page import="DataHandler.DBHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="Header.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Case Status</title>

<style type="text/css">
body{
padding: 4px;
}

table{
font-size: 20px;
padding: 8px;
margin: 4px;
}

th,td{
padding: 4px;
}


.pop-up{
    background-color: #222;
}
*{
    font-family: calibri, sans-serif;
    font-weight: normal;
    color: #333333;
}
h1{
    font-size: 40px;
    margin: 10px 0px;
}
p{
    margin-bottom: 40px;
}
#pop-up{
    position: relative;
    top: 100px;
    width: 500px;
    margin: 0 auto;
    text-align: center;
}
#pop-up .container{
    background-color: #f0e4d4;
    padding:30px;
    position: absolute;
    top:50px;   
    width:100%;
    box-sizing:border-box;
}
#pop-up input{
    padding: 10px;
    border: 0;
    border-radius: 10px 0 0 10px;
    border: 1px solid #333;
    font-size: 18px;
}
button{
    padding: 10px;
    border: 0;
    color: #fff;
    background-color: #333;
    margin-left: -5px;
    border-radius: 0 10px 10px 0;
    border: 1px solid #333;
    font-size: 18px;
}
.cross{

    position: absolute;
    top: 10px;
    left: 10px;
    background-color: #555;
    color: #ddd;
    font-weight: bold;
    width: 22px;
    height: 22px;
    text-align: center;
    border-radius: 11px;


}

/* ANIMATED POP-UP Style */

#pop-up{
    transform-origin: 10px 10px;
    top: -400px;
    animation: drop 0.5s ease forwards,
                swing 2s 3s ease forwards;
}
@keyframes drop{
    0%{opacity: 0;}
    70%{ transform: translateY(650px);}
    100%{transform: translateY(400px); opacity: 1;}
}
@keyframes swing{
    0%{transform: translateY(400px) rotateZ(0deg);}
    40%{transform: translateY(400px) rotateZ(90deg);}
    70%{transform: translateY(400px) rotateZ(70deg);}
    100%{transform: translateY(400px) rotateZ(75deg);}
}


@import url(https://fonts.googleapis.com/css?family=Pacifico);
@import url('https://fonts.googleapis.com/css?family=Anton');



.container{
/*   background-color:#E0F2F1; */
  padding:10px;
  border-radius:15px;
  box-shadow: 10px 10px 20px 0px rgba(0,0,0,0.75);
}

h1, h2{
  text-align:center;
}

h1{
  color:rgba(100, 50, 255, .8);
  font-family: 'Pacifico', cursive;
  color:#212121;
}

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

</head>
<body>

<%
String strCaseId=request.getParameter("refno");
ReportCase rc=new ReportCase();

DBHandler objDB=new DBHandler();
rc=objDB.RetriveReportId(strCaseId);
System.out.println("Case id in status update:"+strCaseId);

Status s=new Status();
s=objDB.RetriveOidUsingRid(strCaseId);
System.out.println("Officer id from status is"+s.getOfficerid());

String strOid=s.getOfficerid();
System.out.println("status table se officer id get kr li  "+strOid);

Officer off=new Officer();
off=objDB.RetriveOfficerBio(strOid);

Suspect su=new Suspect();
su=objDB.RetriveSuspectsFromRefid(strCaseId);
System.out.println("Suspect Name: "+su.getStrSname());

%>
<div class="pop-up">

    <div id="pop-up">
        <!-- <img src="images/cross.png"> -->

        <div class="container">
            <h2>Please FEEL FREE to contact the officer looking after this Case.
            <br>
            Hope that you get justice soon.
            <br>
            <h2 class="rainbow">Have a Great Day!! :)</h2>
            
            </h2>
            
            
            
              <div class="cross" ><i class="fa fa-times" style="color: #fff;"></i></div>
        </div>
    </div>
    
</div>
<h1><center>Your Case Status</center></h1>

<h4>
<center>
<table>
<i>
<tr>
<th>Case Reported by: </th>
<td><%=rc.getStrName() %></td>
</tr>

<tr>
<th>Case:</th>
<td><%=rc.getStrDesc() %></td>
</tr>
 
 <tr>
 <th>Case Type:</th>
 <td><%=rc.getStrReportType() %></td>
 </tr>
  
  <tr>
  <th>Status: </th>
  <td><%=rc.getStrStatus() %></td>
  </tr>
  
</table>

 <br>
<br>
<span style="color:red">Officer looking After this Case</span>

<br>

<table>
<tr>
<th>Officer Name:</th>
<td> <%=off.getStrName() %></td>
</tr>

<tr>
<th>Contact Number: </th>
<td><%=off.getStrPno() %></td>
</tr>

<tr>
<th>Email:</th>
<td> <%=off.getStrEmail() %></td>
</tr>
</table>


<br>
<span style="color:red">Suspects:</span>
<br>

<table>
<tr>
<th>Suspect Name:</th>
<td> <%=su.getStrSname() %></td>
</tr>

<tr>
<th>Evidence:</th>
<td> <%=su.getStrEvidence() %></td>
</tr>

<tr>
<th>Points: </th>
<td><%=su.getStrPoints() %></td>
</tr>

<tr>
<th>Evidence img: </th>
<td><img src="<%=su.getEvidence()%>" height="100px;" width="100px;"></td>
</tr>
</table>

</i>





</center>
</h4>



</body>
<%@ include file="Footer.html" %>