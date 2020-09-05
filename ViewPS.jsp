<%@page import="DataHandler.DBHandler"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="Header.html" %>
    <%@page import="GetterSetter.PoliceStation" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Police Station</title>
<style>
    	.row{
		    margin-top:40px;
		    padding: 0 10px;
		}
		.clickable{
		    cursor: pointer;   
		}

		.panel-heading div {
			margin-top: -18px;
			font-size: 15px;
		}
		.panel-heading div span{
			margin-left:5px;
		}
		.panel-body{
			display: none;
		}
		
		
		.container{
		width: 100%;
		}
</style>


</head>
<body>


<script>
(function(){
    'use strict';
	var $ = jQuery;
	$.fn.extend({
		filterTable: function(){
			return this.each(function(){
				$(this).on('keyup', function(e){
					$('.filterTable_no_results').remove();
					var $this = $(this), 
                        search = $this.val().toLowerCase(), 
                        target = $this.attr('data-filters'), 
                        $target = $(target), 
                        $rows = $target.find('tbody tr');
                        
					if(search == '') {
						$rows.show(); 
					} else {
						$rows.each(function(){
							var $this = $(this);
							$this.text().toLowerCase().indexOf(search) === -1 ? $this.hide() : $this.show();
						})
						if($target.find('tbody tr:visible').size() === 0) {
							var col_count = $target.find('tr').first().find('td').size();
							var no_results = $('<tr class="filterTable_no_results"><td colspan="'+col_count+'">No results found</td></tr>')
							$target.find('tbody').append(no_results);
						}
					}
				});
			});
		}
	});
	$('[data-action="filter"]').filterTable();
})(jQuery);

$(function(){
    // attach table filter plugin to inputs
	$('[data-action="filter"]').filterTable();
	
	$('.container').on('click', '.panel-heading span.filter', function(e){
		var $this = $(this), 
			$panel = $this.parents('.panel');
		
		$panel.find('.panel-body').slideToggle();
		if($this.css('display') != 'none') {
			$panel.find('.panel-body input').focus();
		}
	});
	$('[data-toggle="tooltip"]').tooltip();
})
</script>


<%

DBHandler objDB=new DBHandler();
LinkedList<PoliceStation> lst=objDB.getPS();
%>


<h1><center>Find Police Stations Near You</center></h1>


<div class="container">
    
    	<div class="row">
			
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Police Stations</h3>
						<div class="pull-right">
							<span class="clickable filter" data-toggle="tooltip" title="Toggle table filter" data-container="body">
								<i class="glyphicon glyphicon-filter"></i>  Search Police Stations Near me
							</span>
						</div>
					</div>
					<div class="panel-body">
						<input type="text" class="form-control" id="dev-table-filter" data-action="filter" data-filters="#dev-table" placeholder="Enter your location here..." />
					</div>
					<table class="table table-hover" id="dev-table">
						<thead>
							<tr>
								<th>Sno</th>
								<th>Name</th>
								<th>PIN</th>
								<th>Address</th>
								<th>Incharge</th>
								<th>City</th>
								<th>State</th>
								<th>Contact no.</th>
								<th>High Court</th>
							</tr>
						</thead>
						<tbody>
						
						<%int Sno=1; %>
						<%
						
						for(PoliceStation ps:lst){ %>
							
							<tr>
							<td><%=Sno %></td>
							<td><%=ps.getStrPSname() %></td>
							<td><%=ps.getStrPin() %></td>
							<td><%=ps.getStrIncharge() %></td>
							<td><%=ps.getStrAdd() %></td>
							<td><%=ps.getStrCity() %></td>
							<td><%=ps.getStrState() %></td>
							<td><%=ps.getStrPno() %></td>
							<td><%=ps.getStrHC() %></td>
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


</body>



<%@ include file='Footer.html' %>