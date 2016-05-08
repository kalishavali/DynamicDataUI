<html>
<head>
    <title>Localhost</title>
    <link href="semantic.min.css" rel="stylesheet" type="text/css" />  
    <link rel="stylesheet" href="icon.css" >  
    <script src="jquery.min.js" type="text/javascript"></script>
    <script src="semantic.min.js" type="text/javascript"></script>
<style>
.ui.action.input input[type="file"] {
    display: none;
}
</style>
<style>
.ui.action.input input[type="file"] {
    display: none;
}
.ig-error-message {
	color:#dc0028;
	border:1px dashed #dc0028
}
.ig-success-message {
    color: green;
    border: 1px dashed green;
}
.ig-message {
    display: block;
    text-align: center;
    padding: 4px;
    font-weight: 400px;
    font-size: 22px;
    margin-bottom: 7px;
}
.ig-color-red, .ig-delivery, .ig-form-message, .ig-message {
    font-family: Lato,"Trebuchet MS",Helvetica,sans-serif;
}
*, :after, :before {
    box-sizing: border-box;
    -moz-box-sizing: border-box;
}
</style>
</head>
<script>
//Stops the submit request


$( document ).ready(function() {
	
	loadDefault();
	
	
	
});

function loadDefault(){
	 //get the form data and then serialize that
    dataString = $("#myAjaxRequestForm").serialize();
   
    //get the form data using another method 
    var countryCode = $("input#countryCode").val(); 
    dataString = "year=2016";
   
    //make the AJAX request, dataType is set to json
    //meaning we are expecting JSON data in response from the server
    $.ajax({
        type: "POST",
        url: "CountryInformation",
        data: dataString,
        dataType: "json",
       
        //if received a response from the server
        success: function( data, textStatus, jqXHR) {
        	var result = JSON.parse(data);
        	alert(result['Name']);
            //our country code was correct so we have some information to display
             if(data.length>0){
				$("#ajaxResponse").html("");
            	 for(var i=0;i<data.length;i++){
            		 var obj=data[i];
                     $("#ajaxResponse").append("<tr><td> " + obj[0]+ "</td><td> " + obj[1] + "</td><td> " + obj[2] + "</td><td><a href='#' id='editLink' onclick='loadEditData(\""+obj[1]+"\");'>Edit</a></td><td><a href='#' id='deleteLink'>Delete</a></td></tr>");
            	 }
                 
             } 
             //display error message
             else {
                 $("#ajaxResponse").html("<div><b>Country code in Invalid!</b></div>");
             }
        },
       
        //If there was no resonse from the server
        error: function(jqXHR, textStatus, errorThrown){
             console.log("Something really bad happened " + textStatus);
              $("#ajaxResponse").html(jqXHR.responseText);
        },
       
        //capture the request before it was sent to server
        beforeSend: function(jqXHR, settings){
            //adding some Dummy data to the request
            settings.data += "&dummyData=whatever";
            //disable the button until we get the response
            $('#myButton').attr("disabled", true);
        },
       
        //this is called after the response or error functions are finsihed
        //so that we can take some action
        complete: function(jqXHR, textStatus){
            //enable the button 
            $('#myButton').attr("disabled", false);
        }

    });        
}
//For Loading Edit GO Information in Form
function loadEditDetails(seqNumber){
   
    //get the form data using another method 
    var dataString = "seqNumber="+seqNumber;
   
    //make the AJAX request, dataType is set to json
    //meaning we are expecting JSON data in response from the server
    $.ajax({
        type: "POST",
        url: "CountryInformation",
        data: dataString,
        dataType: "json",
       
        //if received a response from the server
        success: function( data, textStatus, jqXHR) {
            //our country code was correct so we have some information to display
             if(data.length>0){
				$("#ajaxResponse").html("");
            	 for(var i=0;i<data.length;i++){
            		 var obj=data[i];
                     $("#ajaxResponse").append("<tr><td> " + obj[0]+ "</td><td> " + obj[1] + "</td><td> " + obj[2] + "</td><td><a href='#' id='editLink' onclick='loadEditData(\""+obj[1]+"\");'>Edit</a></td><td><a href='#' id='deleteLink'>Delete</a></td></tr>");
            	 }
                 
             } 
             //display error message
             else {
                 $("#ajaxResponse").html("<div><b>Country code in Invalid!</b></div>");
             }
        },
       
        //If there was no resonse from the server
        error: function(jqXHR, textStatus, errorThrown){
             console.log("Something really bad happened " + textStatus);
              $("#ajaxResponse").html(jqXHR.responseText);
        },
       
        //capture the request before it was sent to server
        beforeSend: function(jqXHR, settings){
            //adding some Dummy data to the request
            settings.data += "&dummyData=whatever";
            //disable the button until we get the response
            $('#editLink').attr("disabled", true);
        },
       
        //this is called after the response or error functions are finsihed
        //so that we can take some action
        complete: function(jqXHR, textStatus){
            //enable the button 
            $('#editLink').attr("disabled", false);
        }

    });        
}
</script>
<script>
$(document).on("click", "#editLink", function () {
	$("#modalHeader").text("Edit GO Details");
	$("#deleteForm").hide();
	$("#confirm").hide();
	$("#editForm").show();
    $(".ui.modal").modal("setting", {
        closable: false,
        onApprove: function () {
            return false;
        }
    }).modal("show");
}).on("click", ".ui.button", function () {
    switch ($(this).data("value")) {
        case 'close':
            $("#result").html("easy");
            $(".ui.modal").modal("hide");
            break;
    }
});
$(document).on("click", "#deleteLink", function () {
	$("#modalHeader").text("Delete GO Information");
	$("#editForm").hide();
	$("#submit").hide();
	$("#deleteForm").show();
    $(".ui.modal").modal("setting", {
        closable: false,
        onApprove: function () {
            return false;
        }
    }).modal("show");
}).on("click", ".ui.button", function () {
    switch ($(this).data("value")) {
        case 'close':
            $("#result").html("easy");
            $(".ui.modal").modal("hide");
            break;
    }
});
$(function(){
	$('.ui.dropdown').dropdown();
	$('input:text, .ui.button', '.ui.action.input').on('click', function(e) {
    	$('input:file', $(e.target).parents()).click();
	});
	$('input:file', '.ui.action.input').on('change', function(e) {
    	var name = e.target.files[0].name;
    	$('input:text', $(e.target).parent()).val(name);
	});
});
</script>
<body>
<div style="height:120px">
</div>
   <table class="ui center aligned celled structured table" style="width:600px;margin-left:400px">
   	<thead>
   		<tr>
   			<th>Date</th>
   			<th>GO/Circular/Memo No</th>
   			<th>Subject</th>
   			<th>Edit</th>
   		</tr>
   	</thead>
   	<tbody id="ajaxResponse" class="celled structured table">
   	</tbody>
   </table>  
<!-- Modal -->
<div class="ui small modal">
	<div class="ui header" id="modalHeader"></div>
    <div class="content" id="modalResponse">
    	<form class="ui form" id="editForm">
		   <div class="two fields">
		    <div class="field">
		    <div class="ui labeled input"> 
		    <div class="ui label">Category</div>
		      <select class="ui fluid dropdown" name="category" id="category">
		        <option value="Go">Go</option>
		    <option value="Circular">Circular</option>
		    <option value="Memo">Memo</option>
		      </select>
		      </div>
		    </div>
		    <div class="field">
		        <div class="ui labeled input"> 
			       <div class="ui label">GO/Circular/Memo No</div>
			       <input  name="goNumber" id="goNumber"/>
		         </div>
		      </div>
		  </div>
		    <div class="two fields">
		      <div class="field">
		      	<div class="ui labeled input"> 
		      	<div class="ui label">Date</div>
		        <input type="text" name="goDate" id="goDate">
		        </div>
		      </div>
		      <div class="field">
		      	<div class="ui labeled input"> 
		      	<div class="ui label">Subject</div>
		        <input type="text" name="subject" id="subject">
		      </div>
		    </div>
		  </div>
		 <div class="two fields" style="margin-left:160px;width:800px">
			    <div class="ui fluid action input field">
			        <input type="text" readonly>
			        <input type="file" name="file" id="file">
			        <div class="ui icon button">
			            Upload<i class="cloud upload icon"></i>
			        </div>
			   </div>
		  </div>
		</form>
		<div class="content" id="deleteForm" style="font-family:Lato;color:teal;text-align:center">
			Please confirm that you wish to delete GO/Circular/Memo No: <span id="goNumberModal"></span> Information
		</div>
	</div>
	<div class="actions" id="modalActions">
	    <div class="ui button" id="submit" style="height:35px">Submit</div>
	    <div class="ui button" id="confirm" style="height:35px">Confirm</div>
	    <div class="ui cancel button" id="cancelButton" style="height:35px">Cancel</div>
  	</div>
</div>


</body>
</html>