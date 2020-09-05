<%@page import="java.util.LinkedList"%>
<%@page import="DataHandler.DBHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="GetterSetter.ReportCase" %>
    <%@include file="Header.html" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Case Status</title>

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
</script>
<form action="" method="post">

<h2><center>Update Case Status</center></h2>
<div class="container">
	<div class="row" style="overflow-x:auto";>
           
                <div class="input-group">
                    <!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->
                    <input class="form-control" id="system-search" name="q" placeholder="Search for" >
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-default"><i class="glyphicon glyphicon-search"></i></button>
                    </span>
                </div>
                
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
                           <th>Update Status</th>
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
                            <td><button><a href="StatusUpdate.jsp?ReportId=<%=rc.getStrReportId()%>">Update Status</a></button></td>
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



</form>



</body>
<%@include file="Footer.html" %>
