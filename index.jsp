<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.12/css/dataTables.semanticui.min.css">
	<script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.3.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.12/js/dataTables.semanticui.min.js"></script>
	<script type="text/javascript" language="javascript" src="//cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>
	<script type="text/javascript" class="init">
	
	(function(window, document, undefined){

	var factory = function( $, DataTable ) {
	"use strict";

	/* Set the defaults for DataTables initialisation */
	$.extend( true, DataTable.defaults, {
		dom:
			"<'left aligned eight wide column'l><'right aligned eight wide column'f>" +
			"<'sixteen wide column'tr>" +
			"<'left aligned four wide column'i><'right aligned twelve wide column'p>",
		renderer: 'semantic'
	} );

	$.extend( DataTable.ext.pager, {
			full_numbers_icon: DataTable.ext.pager.full_numbers
	});

	/* Default class modification */
	$.extend( DataTable.ext.classes, {
		sWrapper:      "ui grid dataTables_wrapper ",
		sFilterInput:  "",
		sLengthSelect: ""
	} );

	/* Bootstrap paging button renderer */
	DataTable.ext.renderer.pageButton.semantic = function ( settings, host, idx, buttons, page, pages ) {
		var api     = new DataTable.Api( settings );
		var classes = settings.oClasses;
		var lang    = settings.oLanguage.oPaginate;
		var btnDisplay, btnClass, btnIcon, counter=0;
	    var addIcons = (( !api.init().pagingType ? '' : api.init().pagingType.toLowerCase() ).indexOf('icon') !== -1 );
		
		var attach = function( container, buttons ) {
			var i, ien, node, button;
			var clickHandler = function ( e ) {
				e.preventDefault();
				if ( !$(e.currentTarget).hasClass('disabled') ) {
					api.page( e.data.action ).draw( 'page' );
				}
			};

			for ( i=0, ien=buttons.length ; i<ien ; i++ ) {
				button = buttons[i];

				if ( $.isArray( button ) ) {
					attach( container, button );
				}
				else {
					btnDisplay = '';
					btnClass = '';
	                btnIcon = '';
					switch ( button ) {
						case 'ellipsis':
						    btnDisplay = ( addIcons  ? '<i class="mini ellipsis horizontal icon"></i>' : '&hellip;');
							btnClass = 'disabled';
							break;

						case 'first':
						    btnIcon = ( addIcons ? '<i class="angle single left icon"></i>' : '');
							btnDisplay = btnIcon + lang.sFirst;
							btnClass = button + (page > 0 ?
								'' : ' disabled');
							break;

						case 'previous':
						    btnIcon = ( addIcons ? '<i class="angle double left icon"></i>' : '');
							btnDisplay = btnIcon + lang.sPrevious;
							btnClass = button + (page > 0 ?
								'' : ' disabled');
							break;

						case 'next':
	                        btnIcon = ( addIcons ? '<i class="angle double right icon"></i>' : '');
							btnDisplay = lang.sNext + btnIcon;
							btnClass = button + (page < pages-1 ?
								'' : ' disabled');
							break;

						case 'last':
	                        btnIcon = ( addIcons ? '<i class="angle single right icon"></i>' : '');
							btnDisplay = lang.sLast + btnIcon;
							btnClass = button + (page < pages-1 ?
								'' : ' disabled');
							break;

						default:
							btnDisplay = button + 1;
							btnClass = page === button ?
								'active' : '';
							break;
					}
	                
				
					
					if ( btnDisplay ) {
						node = $('<a>', {
								'class': classes.sPageButton+' '+btnClass+' item ',
								'id': idx === 0 && typeof button === 'string' ?
									settings.sTableId +'_'+ button :
									null
							} ).html( btnDisplay ).appendTo( container );

						settings.oApi._fnBindAction(
							node, {action: button}, clickHandler
						);

						counter++;
					}
				}
			}
		};

	    
					 
		// IE9 throws an 'unknown error' if document.activeElement is used
		// inside an iframe or frame. 
		var activeEl;

		try {
			// Because this approach is destroying and recreating the paging
			// elements, focus is lost on the select button which is bad for
			// accessibility. So we want to restore focus once the draw has
			// completed
			activeEl = $(host).find(document.activeElement).data('dt-idx');
		}
		catch (e) {}

		attach(
			$(host).empty().html('<div class="ui stackable small pagination menu"/>').children('div'),
			buttons
		);

		if ( activeEl ) {
			$(host).find( '[data-dt-idx='+activeEl+']' ).focus();
		}
	};

	}; // /factory


	// Define as an AMD module if possible
	if ( typeof define === 'function' && define.amd ) {
		define( ['jquery', 'datatables'], factory );
	}
	else if ( typeof exports === 'object' ) {
	    // Node/CommonJS
	    factory( require('jquery'), require('datatables') );
	}
	else if ( jQuery ) {
		// Otherwise simply initialise as normal, stopping multiple evaluation
		factory( jQuery, jQuery.fn.dataTable );
	}


	})(window, document);


	$(document).ready(function() {
	    

	    
		 var dtable = $('#example').DataTable({
	     	  "pagingType": "full_numbers_icon",
			order: [ 1, 'desc' ],
		 
		

		 });
	   
	    
	});
	</script>
	<style>
	.ui.table.dataTable thead th {
  cursor: pointer;
  white-space: nowrap;
  border-left: 1px solid rgba(34, 36, 38, 0.15);
  color: rgba(0, 0, 0, 0.87);
}

.ui.table.dataTable thead th:first-child {
  border-left: none;
}

.ui.table.dataTable thead .sorting,
.ui.table.dataTable thead .sorting_asc ,
.ui.table.dataTable thead .sorting_desc ,
.ui.table.dataTable thead .sorting_asc_disabled ,
.ui.table.dataTable thead .sorting_desc_disabled,
.ui.table.dataTable thead .sorting:hover,
.ui.table.dataTable thead .sorting_asc:hover ,
.ui.table.dataTable thead .sorting_desc:hover ,
.ui.table.dataTable thead .sorting_asc_disabled:hover ,
.ui.table.dataTable thead .sorting_desc_disabled:hover  {
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.ui.table.dataTable thead th:after {
  display: none;
  font-style: normal;
  font-weight: normal;
  text-decoration: inherit;
  content: '';
  height: 1em;
  width: auto;
  opacity: 0.8;
  margin: 0em 0em 0em 0.5em;
  font-family: 'Icons';
}

.ui.table.dataTable thead th.sorting_asc:after {
  /*content: '\f0d8';*/
  content: '\f160';
}

.ui.table.dataTable thead th.sorting_desc:after {
  /*content: '\f0d7';*/
  content: '\f161';
}

.ui.table.dataTable thead th.sorting:after {
    content: '\f0dc';
    opacity: 0.2;
}

/* Hover */

.ui.table.dataTable th.disabled:hover {
  cursor: auto;
  color: rgba(40, 40, 40, 0.3);
}

.ui.table.dataTable thead th:hover {
  background: rgba(0, 0, 0, 0.05);
  color: rgba(0, 0, 0, 0.8);
}

/* Sorted */

.ui.table.dataTable thead .sorting_asc ,
.ui.table.dataTable thead .sorting_desc ,
.ui.table.dataTable thead .sorting_asc_disabled ,
.ui.table.dataTable thead .sorting_desc_disabled {
  background: rgba(0, 0, 0, 0.05);
  color: rgba(0, 0, 0, 0.95);
}

.ui.table.dataTable thead .sorting:after ,
.ui.table.dataTable thead .sorting_asc:after ,
.ui.table.dataTable thead .sorting_desc:after ,
.ui.table.dataTable thead .sorting_asc_disabled:after ,
.ui.table.dataTable thead .sorting_desc_disabled:after {
  display: inline-block;
}

/* Sorted Hover */

.ui.table.dataTable thead .sorting_asc:hover ,
.ui.table.dataTable thead .sorting_desc:hover ,
.ui.table.dataTable thead .sorting_asc_disabled:hover ,
.ui.table.dataTable thead .sorting_desc_disabled:hover  {
  background: rgba(0, 0, 0, 0.05);
  color: rgba(0, 0, 0, 0.95);
}


.dataTables_length select {
   background: #fff none repeat scroll 0 0;
    border: 1px solid rgba(34, 36, 38, 0.15);
    border-radius: 0.285714rem;
    box-shadow: none;
    color: rgba(0, 0, 0, 0.87);
    cursor: pointer;
    display: inline-block;
     line-height: 1.2142em;
    min-height:   0.714286em;
  
    outline: 0 none;
    padding: 0.3em;
    transform: rotateZ(0deg);
    transition: box-shadow 0.1s ease 0s, width 0.1s ease 0s;
    white-space: normal;
    word-wrap: break-word; 
	 }
  
  .dataTables_wrapper .dataTables_filter {
	text-align: right; 
   
    color: rgba(0, 0, 0, 0.87);
    display: inline-flex;
    position: relative;
   }
	
   .dataTables_wrapper .dataTables_filter input {
	  margin-left: 0.5em; 
   }
  
  .dataTables_wrapper .dataTables_info {
	clear: both;
	padding-top: 0.755em; 
   }
   
.dataTables_filter input {
    background: #fff none repeat scroll 0 0;
    border: 1px solid rgba(34, 36, 38, 0.15);
    border-radius: 0.285714rem;
    box-shadow: none;
    color: rgba(0, 0, 0, 0.87);
    flex: 1 0 auto;
    font-family: "Helvetica Neue",Arial,Helvetica,sans-serif;
	height:1em;
    margin: 0;
    max-width: 100%;
    outline: 0 none;
    padding: .4em;
    text-align: left;
    transition: background-color 0.1s ease 0s, box-shadow 0.1s ease 0s, border-color 0.1s ease 0s;
}





	
	</style>
<%
	ArrayList<ArrayList<String>> resultList=new ArrayList<ArrayList<String>>();
	resultList=(ArrayList)request.getAttribute("resultList");
	
%>
</head>
<body>
<div class="ui main container" >
<p></p>
  <table id="example" class="ui compact selectable striped celled table" cellspacing="0" width="100%" >
  <thead>
            <tr>
            	<th>S.No</th>
                <th>Date</th>
                <th>Newspaper Name</th>
                <th>District Name</th>
                <th>Article Discription</th>
                <th>Article Download</th>
            </tr>
        </thead>
 
  
 
        <tbody>
        <%if(resultList.size()>0){
        	for(int i=0;i<resultList.size();i++){ %>
        		<tr>
        		<td></td>
                <td><%=resultList.get(i).get(0)%></td>
                <td><%=resultList.get(i).get(1)%></td>
                <td><%=resultList.get(i).get(2)%></td>
                <td><%=resultList.get(i).get(3)%></td>
                <td><a href="#"><%=resultList.get(i).get(4)%></a></td>
            	</tr>
        <% 	}
        } %>
                
            
        </tbody>
</table></div>

</body>
</html>