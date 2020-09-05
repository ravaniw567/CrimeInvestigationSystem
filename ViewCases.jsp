<%@page import="java.util.LinkedList"%>
<%@page import="DataHandler.DBHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="GetterSetter.ReportCase" %>
    <%@ page import="GetterSetter.MissingPersons" %>
    <%@ page import="GetterSetter.StolenVehicles" %>
    <%@include file="Header.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Cases</title>

<style>
.table{
padding: 60px;
margin: 20px;
max-width: 100%;
}
th, td {
  text-align: left;
  padding: 68px;

}
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


<script>
$(document).ready(function() {
    var activeSystemClass = $('.list-group-item.active');

    //something is entered in search form
    $('#system-search').keyup( function() {
       var that = this;
        // affect all table rows on in systems table
        var tableBody = $('.table-list-search tbody');
        var tableRowsClass = $('.table-list-search tbody tr');
        $('.search-sf').remove();
        tableRowsClass.each( function(i, val) {
        
            //Lower text for case insensitive
            var rowText = $(val).text().toLowerCase();
            var inputText = $(that).val().toLowerCase();
            if(inputText != '')
            {
                $('.search-query-sf').remove();
                tableBody.prepend('<tr class="search-query-sf"><td colspan="6"><strong>Searching for: "'
                    + $(that).val()
                    + '"</strong></td></tr>');
            }
            else
            {
                $('.search-query-sf').remove();
            }

            if( rowText.indexOf( inputText ) == -1 )
            {
                //hide rows
                tableRowsClass.eq(i).hide();
                
            }
            else
            {
                $('.search-sf').remove();
                tableRowsClass.eq(i).show();
            }
        });
        //all tr elements are hidden
        if(tableRowsClass.children(':visible').length == 0)
        {
            tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6">No entries found.</td></tr>');
        }
    });
    
});





$(function () {
    $("input[name=vehicles]").click(function () {
    	$("#missingPersons").hide();
            $("#vehicles").show();
            $("#Case").hide();
       
    });
    $("input[name=missing]").click(function () {
           
        $("#vehicles").hide();
        $("#Case").hide();
        $("#missingPersons").show();
   
});
    $("input[name=case]").click(function () {
           
        $("#vehicles").hide();
        $("#Case").show();
        $("#missingPersons").hide();
   
}); 
});


</script>

<div class="col-md-4">
<input type="button" class="butn" name="vehicles" value="Stolen Vehicles"></button>
</div>

<div class="col-md-4">
<input type="button" class="butn" name="case" value="Case"></div>


<div class="col-md-4">
<input type="button" class="butn" name="missing" value="Missing Persons"></div>


<div id=Case> 
<h1><center>Registered Cases</center></h1>



<div class="container">
	<div class="row" style="overflow-x:auto;">
            <form action="#" method="get">
                <div class="input-group">
                    <!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->
                    <input class="form-control" id="system-search" name="q" placeholder="Search for" required>
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-default"><i class="glyphicon glyphicon-search"></i></button>
                    </span>
                </div>
            </form>
     
    	 <table class="table table-list-search" >
                    <thead>
                        <tr>
                        	<th>Sno</th>
                            <th>Case Id</th>
                            <th>Date of Reporting Case</th>
                            <th>Name of Reporter</th>
                            <th>Email</th>
                            <th>Mobile no.</th>
                            <th>Address</th>
                            <th>State</th>
                            <th>City</th>
                            <th>Report Type</th>
                            <th>Description</th>
                           <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                    <%
                   
                    DBHandler objDB=new DBHandler();
                    LinkedList<ReportCase> lst=objDB.ViewCases();
                    %>
                    <%
                    int Sno=1;
                    for(ReportCase rc:lst){ %>
                        <tr>
                            <td><%=Sno %></td>
                            <td><%=rc.getStrReportId() %></td>
                            <td><%=rc.getStrDate() %></td>
                            <td><%=rc.getStrName() %></td>
                            <td><%=rc.getStrEmail() %></td>
                            <td><%=rc.getStrContact() %></td>
                            <td><%=rc.getStrAdd() %></td>
                            <td><%=rc.getStrState() %></td>
                            <td><%=rc.getStrCity() %></td>
                            <td><%=rc.getStrReportType() %></td>
                            <td><%=rc.getStrDesc() %></td>
                            <td><%=rc.getStrStatus() %></td>
                        </tr>
                        
                        
						<%	
						Sno++;
						}
						
						%>
                        
                    </tbody>
                </table>   
		</div>
	</div>
</div>

</div>


<div id="missingPersons" style="display:none">
<h1><center>Missing Persons</center</h1>

<div class="container">
	<div class="row" style="overflow-x:auto;>
            <form action="#" method="get">
                <div class="input-group">
                    <!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->
                    <input class="form-control" id="system-search" name="q" placeholder="Search for" required>
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-default"><i class="glyphicon glyphicon-search"></i></button>
                    </span>
                </div>
            </form>
     
    	 <table class="table table-list-search" >
                    <thead>
                        <tr>
                        	<th>Sno</th>
                            <th>Case Id</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>age</th>
                            <th>Gender</th>
                            <th>Name of case reporter</th>
                            <th>Relationship with missing person</th>
                            <th>Email</th>
                            <th>Mobile no.</th>
                            <th>Address</th>
                            <th>State</th>
                            <th>City</th>
                            <th>Missing Since</th>
                            <th>Date of Reporting Case</th>
                            <th>Image</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                    <%
                     LinkedList<MissingPersons> mlst=objDB.ViewMissingPersons();
                    %>
                    <%
                    //int Sno=1;
                    for(MissingPersons mp:mlst){ %>
                        <tr>
                            <td><%=Sno %></td>
                            <td><%=mp.getStrrefid() %></td>
                            <td><%=mp.getStrfnmae() %></td>
                            <td><%=mp.getStrlame() %></td>
                            <td><%=mp.getStrage() %></td>
                            <td><%=mp.getStrgender() %></td>
                           <td><%=mp.getStrrname() %></td>
                           <td><%=mp.getStrrelation() %></td>
                           <td><%=mp.getStremail() %></td>
                            <td><%=mp.getStrcontact() %></td>
                            <td><%=mp.getStraddress() %></td>
                            <td><%=mp.getStrstate() %></td>
                            <td><%=mp.getStrcity() %></td>
                            <td><%=mp.getStrmdate() %></td>
                            <td><%=mp.getStrdate() %></td>
                            <td><img src="data:image/jpg;<%=mp.getImg() %>" width="200px"; height="200px"></td>
                        </tr>
                        
                        
						<%	
						Sno++;
						}
						
						%>
                        
                    </tbody>
                </table>   
</div>
</div>
</div>

</div>

<div id="vehicles" style="display:none">
<h1><center>Stolen Vehicles</center></h1>


<div class="container">
	<div class="row" style="overflow-x:auto;">
            <form action="#" method="get">
                <div class="input-group">
                    <!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->
                    <input class="form-control" id="system-search" name="q" placeholder="Search for" required>
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-default"><i class="glyphicon glyphicon-search"></i></button>
                    </span>
                </div>
            </form>
     
    	 <table class="table table-list-search" >
                    <thead>
                        <tr>
                        	<th>Sno</th>
                            <th>Case Id</th>
                            <th>Name</th>
                            <th>Contact</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>State</th>
                            <th>City</th>
                            <th>Vehicle Type</th>
                            <th>Manufacturer</th>
                            <th>Registration Number</th>
                            <th>Chasis</th>
                            <th>Engine Number</th>
                            <th>Year of Manufacture</th>
                            <th>Color</th>
                            <th>Date of Missing</th>
                            <th>Date of Reporting</th>
                            <th>Img</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                    <%
                     LinkedList<StolenVehicles> vlst=objDB.getSVeh();
                    %>
                    <%
                    //int Sno=1;
                    for(StolenVehicles sv:vlst){ %>
                        <tr>
                            <td><%=Sno %></td>
                            <td><%=sv.getStrRefno() %></td>
                            <td><%=sv.getStrName() %></td>
                            <td><%=sv.getStrCntct() %></td>
                            <td><%=sv.getStrEmail() %></td>
                            <td><%=sv.getStrAdd() %></td>
                            <td><%=sv.getStrState() %></td>
                            <td><%=sv.getStrCity() %></td>
                            <td><%=sv.getStrVType() %></td>
                            <td><%=sv.getStrMan() %></td> 
                            <td><%=sv.getStrRno() %></td>
                            <td><%=sv.getStrChasis() %></td>
                            <td><%=sv.getStrEngine() %></td>
                            <td><%=sv.getStrYom() %></td>
                            <td><%=sv.getStrColor() %></td>
                            <td><%=sv.getStrsdate() %></td>
                            <td><%=sv.getStrdate() %></td>
                           <td><img src="url(data:image/jpg;<%=sv.getVimg() %>)" width="200px"; height="200px"></td>
                        </tr>
                        
                        
						<%	
                    
						Sno++;
						}
						
						%>
                        
                    </tbody>
                </table>   
</div>
</div>
</div>



</div>


</body>
<%@include file="Footer.html"%>