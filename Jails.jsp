<%@page import="java.util.LinkedList"%>
<%@page import="DataHandler.DBHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="GetterSetter.Jails" %>
<%@ include file="Header.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Jails</title>

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
  width: 100%;
  text-align: center;
  padding: 1.3rem 2rem 1.5rem 2rem;
  position: relative;
  font-size: 2.5rem;
  z-index: 1;
  margin: 32px;
  border-radius: 0.8rem;
  border: 4px solid white;
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
  background-color: white;
  color: black;
  font-size:32px;
}

</style>

</head>
<body>
<%
DBHandler objDB=new DBHandler();
LinkedList<Jails> lst=objDB.viewJails();
%>




	<div class="background">  
	<article>
	<div class="col-md-6">
	  <div  data-shiny-button class="shiny-button" onClick="window.location='https://en.wikipedia.org/wiki/Prisons_in_India'">
	      <p>Read More about Jails</p>
	   </div>
   </div>

	<div class="col-md-6">	  
	  <div data-shiny-button class="shiny-button" onClick="window.location='http://jail.cg.gov.in/Prisons%20Act%201894.pdf'">
	      <p>Read about Jail Manuals</p>
	   </div>
	  </div>
	  
	  
	   </article>
	   </div>



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


<h1><center>Jails</center></h1>



<div class="container">
    
    	<div class="row">
			
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Police Stations</h3>
						<div class="pull-right">
							<span class="clickable filter" data-toggle="tooltip" title="Toggle table filter" data-container="body">
								<i class="glyphicon glyphicon-filter"></i>  Search a Prison
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
								<th>Area</th>
								<th>City</th>
								<th>State</th>
								<th>PIN Code</th>
								<th>Contact No.</th>
								<th>No. of inmates present</th>
								<th>Capacity</th>
								<th>Official Website</th>
							</tr>
						</thead>
						<tbody>
						
						<%int Sno=1; %>
						<%
						
						for(Jails jails:lst){ %>
							
							<tr>
							<td><%=Sno %></td>
							<td><%=jails.getStrJname() %></td>
							<td><%=jails.getStrArea() %></td>
							<td><%=jails.getStrState() %></td>
							<td><%=jails.getStrCity() %></td>
							<td><%=jails.getStrPin() %></td>
							<td><%=jails.getStrContact() %></td>
							<td><%=jails.getStrNop() %></td>
							<td><%=jails.getStrCapacity() %></td>
							<td><a href="<%=jails.getStrOwebsite() %>"><%=jails.getStrOwebsite() %></a></td>
							</tr>						
							
				
						<%	
						Sno++;
						}
						
						%>
						
						
						</tbody>
					</table>
				</div>
	</div>








<br><br>



</body>
<%@ include file="Footer.html" %>