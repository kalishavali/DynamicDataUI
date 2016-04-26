<%@ page import="com.tcs.nregs.util.ComboUtil_eng,java.util.ArrayList,java.text.SimpleDateFormat,java.util.Calendar,java.util.Date,java.util.GregorianCalendar,com.tcs.nregs.common.dao.Common_engDAO,com.tcs.nregs.common.dao.Common_engDAOImpl"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML lang=en-uk xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>:: GO Details ::</TITLE>
<META content=text/html;charset=utf-8 http-equiv=Content-Type>
<meta name="google-translate-customization"
	content="f63a7f9efb51a908-e0466c9f1cd8045b-g27bd34fc51e61a62-f"></meta>
<link rel="shortcut icon" href="/Nregs/images/Rep-Nregs-AP-Logo.ico" type="image/x-icon"/>
<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', includedLanguages: 'en,hi,te', layout: google.translate.TranslateElement.InlineLayout.HORIZONTAL}, 'google_translate_element');
}
</script>
<script src="/Nregs/scripts/jquery.min.js" type="text/javascript"></script>
    <script src="/Nregs/scripts/styleswitch.js" type="text/javascript"></script>
     <link rel="stylesheet" type="text/css" href="/Nregs/css/icon.css" />
    <link rel="stylesheet" type="text/css" href="/Nregs/css/semantic.min.css" />
    <link rel="stylesheet" type="text/css" title="styles1" media="screen" href="/Nregs/css/styles1.css" />
    <link rel="alternate stylesheet" type="text/css" media="screen" title="styles2" href="/Nregs/css/styles2.css" />
    <link rel="alternate stylesheet" type="text/css" media="screen" title="styles3" href="/Nregs/css/styles3.css" />   
    <link rel="alternate stylesheet" type="text/css" media="screen" title=styles4 href="/Nregs/css/styles4.css" />   
    <script language="javascript" src="/Nregs/scripts/jqueryslidemenu.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
    <script type="text/javascript" src="/Nregs/scripts/jquery-1.10.2.min.js"></script>
    <script src="/Nregs/scripts/semantic.min.js" type="text/javascript"></script>
  	<script type="text/javascript" src="/Nregs/scripts/jquery.tablesorter.min.js"></script>
<!-- Disabling of right Click-->
<% 

String date1 = "";
int currentMonth;
String lStrDateKey="";

SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");

Calendar cal = new GregorianCalendar();
currentMonth=(int)cal.get(Calendar.MONTH) + 1;

Calendar c = Calendar.getInstance();
c.setTime(new java.util.Date());
int wk=c.get(Calendar.WEEK_OF_YEAR);

int curday1=c.get(Calendar.DAY_OF_WEEK);
if(curday1>4)
{
	wk=wk+1;
}

c.set(Calendar.WEEK_OF_YEAR,wk);
c.setFirstDayOfWeek(Calendar.MONDAY);
c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
date1 =df.format(new Date(System.currentTimeMillis()));
lStrDateKey=date1;

%>
<script type="text/javascript">

var msg = "Right-Click Disabled";
var iex=(document.all);
var nav=(document.layers);
var n_6=(window.sidebar);
if(nav)window.captureEvents(Event.MOUSEDOWN);
if(n_6) document.addEventListener("MOUSEDOWN",no_click,true);
function no_click(e)
{
  if((nav||n_6) && (e.which==2 || e.which==3))
  {
    alert(msg);return false;
  }
  if (navigator.appName == 'Microsoft Internet Explorer' 
       && (event.button == 2 || event.button == 3))
  {
    alert(msg);return false;
  }
}
(nav)?window.onmousedown=no_click:document.onmousedown=no_click;




//-->
</script>
<%

ArrayList<ArrayList<String>> spryearList = new ArrayList<ArrayList<String>>();
if(request.getAttribute("yearList")!=null){
	spryearList=(ArrayList<ArrayList<String>>)request.getAttribute("yearList");
}
ArrayList<ArrayList<String>> resultList = new ArrayList<ArrayList<String>>();
if(request.getAttribute("resultList")!=null){
	resultList=(ArrayList<ArrayList<String>>)request.getAttribute("resultList");
}
String lStrYearKey = "-1";

if(request.getAttribute("YearKey")!=null)
{
 	lStrYearKey = (String)request.getAttribute("YearKey");
}
%>
<style> 
	.HD-txt {
		font-family:Verdana, Arial, Helvetica, sans-serif; font-size:10px; font-weight:bold; color:#ffffff; padding-left:5px;
	}
	.ul-txt {
		font-family:Verdana, Arial, Helvetica, sans-serif; font-size:11px; font-weight:bold; color:#ffffff; background-image:url(/Nregs/images/HD-BG.gif); height:22px; background-repeat:no-repeat; background-position:left top; vertical-align:middle; padding-top:4px; padding-left:16px;
	}
	ul {
		list-style-image:url('/Nregs/images/Tick.gif'); line-height:20px;
	}
</style>
<script>
function openDoc(docName)
{
   window.open('LoadDocument?pathtype=GO&docName='+docName);
}
function window_open(val,x,y)
{
    //parameter val contains the name of the textbox
    var newWindow;
    var urlstring = '/Nregs/Calendar.jsp?requestSent='+val;
    var urlstyle = 'height=200,width=280,toolbar=no,minimize=no,status=no,memubar=no,location=no,scrollbars=no,top='+x+',left='+y;
    newWindow = window.open(urlstring,'Calendar',urlstyle);
}

</script>
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
    font-size: 14px;
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
<body >
<script>
var goNumberModal="";
var seqNumModal="";
function loadEditContent(goNumber) {
	
    dataString = $("#editForm").serialize(); 
    dataString = "sequenceNumber="+goNumber;
    $("#errorMsg").hide();
    $("#file").val("");
    $("#filetext").val("");
    $.ajax({
        type: "POST",
        url: "/Nregs/FrontServlet?requestType=LandDevelopmentNewRH&actionVal=goEdit",
        data: dataString,
        dataType: "json",
        success: function( data, textStatus, jqXHR) {
	    	 if(data.length!=0){
		            for ( var i = 0; i < data.length; i++) {
		            	var obj = data[i];
		            	$("#goNumber").val(obj[1]);
		            	$("#dmaDate12").val(obj[3]);
		            	$("#subject").val(obj[2]);
		            	$("#seqNumber").val(goNumber);
		            	$("#fileName").val(obj[4]);
		            }    
			 }else{
				$("#ajaxResponse").html("");
				$("#ajaxResponse").append("<tr><td colspan='4'>No Data Found for the Selection</td></tr>");
			 }
        },
        error: function(jqXHR, textStatus, errorThrown){
             console.log("Something really bad happened " + textStatus);
              $("#ajaxResponse").html(jqXHR.responseText);
        },
        beforeSend: function(jqXHR, settings){
            settings.data += "&dummyData=whatever";
            $('#myButton').attr("disabled", true);
        },
        complete: function(jqXHR, textStatus){
            $('#myButton').attr("disabled", false);
        }

    });        
}

$(document).on("click", "#editLink", function () {
    $("#editModalBox").modal("setting", {
        closable: false,
        onApprove: function () {
            return false;
        }
    }).modal("show");
}).on("click", ".ui.button", function () {
    switch ($(this).data("value")) {
        case 'close':
        	window.open("/Nregs/FrontServlet?requestType=LandDevelopmentNewRH&actionVal=displayGoDetails","_self")
            break;
        case 'normal':
            $("#result").html("normal");
            $(".ui.modal").modal("hide");
            break;
        case 'hard':
            $("#result").html("hard");
            $(".ui.modal").modal("hide");
            break;
    }
});
$(document).on("click", "#deleteLink", function () {
	goNumberModal=$(this).attr("data-number");
	seqNumModal=$(this).attr("data-value");
	$("#goNumberModal").text(goNumberModal);
    $("#deleteModalBox").modal("setting", {
        closable: false,
        onApprove: function () {
            return false;
        }
    }).modal("show");
}).on("click", ".ui.button", function () {
    switch ($(this).data("value")) {
        case 'close':
        	window.open("/Nregs/FrontServlet?requestType=LandDevelopmentNewRH&actionVal=displayGoDetails","_self")
            break;
        case 'normal':
            $("#result").html("normal");
            $(".ui.modal").modal("hide");
            break;
        case 'hard':
            $("#result").html("hard");
            $(".ui.modal").modal("hide");
            break;
    }
});

</script>
<script><!--

function displayGOData() {  
    dataString = "year=" + $( "#goYear" ).val();
    var sessionCheck='<%=session.getAttribute("Status")%>';
    $.ajax({
        type: "POST",
        url: "/Nregs/FrontServlet?requestType=LandDevelopmentNewRH&actionVal=goDetails",
        data: dataString,
        dataType: "json",
        success: function( data, textStatus, jqXHR) {
	    	 if(data.length!=0){
				$("#ajaxResponse").html("");
				for ( var i = 0; i < data.length; i++) {
		        	var obj = data[i];
		            if(sessionCheck == '' || sessionCheck == null || sessionCheck == 'null' || sessionCheck == "FAIL" ){
		            	$("#ajaxResponse").append("<tr><td>"+obj[0]+"</td><td>"+obj[1]+"</td><td><a href='javascript:openDoc(\""+obj[3]+"\")'>"+obj[2]+"</a></td></tr>");
			        }else{
			            $("#ajaxResponse").append("<tr><td>"+obj[0]+"</td><td>"+obj[1]+"</td><td><a href='javascript:openDoc(\""+obj[3]+"\")'>"+obj[2]+"</a></td><td><a href='#' id='editLink' onclick='loadEditContent(\""+obj[4]+"\");'><img src='/Nregs/images/Edit.png' align='middle' border='0' style='width:22px'></a><a href='#' id='deleteLink' data-value='"+obj[4]+"' data-number='"+obj[1]+"' ><img src='/Nregs/images/Delete.png' align='middle' border='0' style='width:22px'></a></td></tr>");
					}
				}    
			 }else{
				if(sessionCheck == null || sessionCheck == '' || sessionCheck == "FAIL" || sessionCheck == 'null' ){
					$("#ajaxResponse").html("");
					$("#ajaxResponse").append("<tr><td colspan='3' style='color:teal'>No Data Found for the Selection</td></tr>");
				}else{
					$("#ajaxResponse").html("");
					$("#ajaxResponse").append("<tr><td colspan='4' style='color:teal'>No Data Found for the Selection</td></tr>");
				}
			 }
        },
        error: function(jqXHR, textStatus, errorThrown){
             console.log("Something really bad happened " + textStatus);
              $("#ajaxResponse").html(jqXHR.responseText);
        },
        beforeSend: function(jqXHR, settings){
            settings.data += "&dummyData=whatever";
            $('#myButton').attr("disabled", true);
        },
        complete: function(jqXHR, textStatus){
            $('#myButton').attr("disabled", false);
        }

    });        
}

function TestDate(dateID)
{
	
	var dateVal=document.getElementById(dateID).value;
	if(dateVal.length>0)
	{
		var userDayStr=dateVal.split('/')[0];
		if(userDayStr.indexOf('0')==0)
		{
			userDayStr=userDayStr.substring(1);
		}
		var userMonthstr=dateVal.split('/')[1];
		if(userMonthstr.indexOf('0')==0)
		{
			userMonthstr=userMonthstr.substring(1);
		}
		var userDay=parseInt(userDayStr);
		var userMonth=parseInt(userMonthstr)-1;
		var userYear=parseInt(dateVal.split('/')[2]);
		var userDate=new Date();
		userDate.setFullYear(userYear,userMonth,userDay);
  		var todayDate=new Date();
    if(userDate>todayDate)
    {
    	alert("Date should not be Greater than Today's Date");
    	document.getElementById(dateID).value='<%=date1%>';
    	//document.getElementById(dateID).focus();
		return false;
		}
    }
	return true;
}
$(document).ready(function() {
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
	$("#editForm").submit(function(e){
	       e.preventDefault();
	});
	$("#upload").click(function(){
		var goNumber = document.getElementById('goNumber').value;
		var subject = document.getElementById('subject').value;
		var path = document.getElementById('file').value;
		var date=document.getElementById('dmaDate12').value;
		if(goNumber == ""){
			$("#errorMsg").hide();
			$("<span id='errorMsg' class='ig-message ng-binding ig-error-message' ng-class='{'ig-error-message' : (info.type == 'error'), 'ig-success-message' : (info.type == 'success')}'>Please Enter GO/Circular/Memo Number</span>").insertBefore("#editForm");
		    document.getElementById('goNumber').focus();
		    return false;
		}else if(subject == ""){
			$("#errorMsg").hide();
			$("<span id='errorMsg' class='ig-message ng-binding ig-error-message' ng-class='{'ig-error-message' : (info.type == 'error'), 'ig-success-message' : (info.type == 'success')}'>Please Enter Subject for the GO</span>").insertBefore("#editForm");
		     document.getElementById('subject').focus();
		     return false;
		}else if(path != "" && path.substring(path.lastIndexOf(".")+1)!='PDF' && path.substring(path.lastIndexOf(".")+1)!='pdf' ){
			$("#errorMsg").hide();
			$("<span id='errorMsg' class='ig-message ng-binding ig-error-message' ng-class='{'ig-error-message' : (info.type == 'error'), 'ig-success-message' : (info.type == 'success')}'>Please Select PDF Files Only</span>").insertBefore("#editForm");
		    document.getElementById('uploadFile').focus();
			document.getElementById("upload").disabled=true;
			return false; 
		}else if(date == ""){
			$("#errorMsg").hide();
			$("<span id='errorMsg' class='ig-message ng-binding ig-error-message' ng-class='{'ig-error-message' : (info.type == 'error'), 'ig-success-message' : (info.type == 'success')}'>Please Select the Date</span>").insertBefore("#editForm");
		     document.getElementById('dmaDate12').focus();
		}else{
			var seqNumber = document.getElementById("seqNumber").value;
			var fileName = document.getElementById("fileName").value;
			var category = document.getElementById("category").value;
			var gonumber = document.getElementById("goNumber").value;
			var godate = document.getElementById("dmaDate12").value;
			var subject = document.getElementById("subject").value;
			var file = document.getElementById("file").files[0];
			var formdata = new FormData();
				formdata.append("category", category);
				formdata.append("gonumber", gonumber);
				formdata.append("godate", godate);
				formdata.append("subject", subject);
				formdata.append("file", file);
			$("#errorMsg").hide();
			var xhr = new XMLHttpRequest();       
			xhr.open("POST","/Nregs/FrontServlet?requestType=LandDevelopmentNewRH&actionVal=updateGoData&seqNumber="+seqNumber+"&fileName="+fileName, true);
			xhr.send(formdata);
			xhr.onload = function(e) {
				if (this.status == 200) {
					var result = JSON.parse(this.responseText);
					if(result == 1){
						$("#errorMsg").hide();
						$("#editForm").hide();
						$("#upload").hide();
						$("#cancelButton").hide();
						$("#updateResponse").append("<span class='ig-message ng-binding ig-success-message' ng-class='{'ig-error-message' : (info.type == 'error'), 'ig-success-message' : (info.type == 'success')}'>Successfully Updated the GO Information </span>");
						$("#returnToHome").append("<div class='actions'><div class='ui approved button' data-value='close' style='margin-left:450px;height:35px'>Close</div></div>");
					}else{
						$("#errorMsg").hide();
						$("<span id='errorMsg' class='ig-message ng-binding ig-error-message' ng-class='{'ig-error-message' : (info.type == 'error'), 'ig-success-message' : (info.type == 'success')}'>File Upload Failed.Please Try Again.. </span>").insertBefore("#editForm");
						
					}
				}
			};
		}
	                        
	   
	});
	//Deletion 
	$("#confirm").click(function(){
			var seqNumber=seqNumModal;
			var goNumber=goNumberModal;
			$("#errorMsg").hide();
			var xhr = new XMLHttpRequest();       
			xhr.open("POST","/Nregs/FrontServlet?requestType=LandDevelopmentNewRH&actionVal=deleteGoDetails&seqNumber="+seqNumber+" ", true);
			xhr.send();
			xhr.onload = function(e) {
				if (this.status == 200) {
					var result = JSON.parse(this.responseText);
					if(result == 1){
						$("#confirm").hide();
						$("#cancelButton1").hide();
						$("#deleteResponse").replaceWith("<span class='ig-message ng-binding ig-success-message' ng-class='{'ig-error-message' : (info.type == 'error'), 'ig-success-message' : (info.type == 'success')}'>Successfully Deleted the GO/Circular/Memo No:"+goNumber+" Information </span>");
						$("#returnToHome1").append("<div class='actions'><div class='ui approved button' data-value='close' style='margin-left:600px;height:35px'>Close</div></div>");
					}else{
						$("#confirm").hide();
						$("#cancelButton1").hide();
						$("#deleteResponse").replaceWith("<span id='errorMsg' class='ig-message ng-binding ig-error-message' ng-class='{'ig-error-message' : (info.type == 'error'), 'ig-success-message' : (info.type == 'success')}'>Deleting GO Information Failed.Please Try Again.. </span>");
						$("#returnToHome1").append("<div class='actions'><div class='ui approved button' data-value='close' style='margin-left:600px;height:35px'>Close</div></div>");
					}
				}
			};
		
	                        
	   
	});
	//Deletion END
	
    

});

</script>
<!-- Edit Modal Box -->
<div class="ui small modal" id="editModalBox" style="width:550px">
	<div class="header" id="editHead">Edit GO Details</div>
    <div class="content" id="updateResponse">
    <form class="ui form" id="editForm" style="font-family:Lato">
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
			       <input type="text" name="goNumber" name="gonumber" id="goNumber" />
			       <input type="hidden" name="seqNumber" id="seqNumber" value=""/>
			       <input type="hidden" name="fileName" id="fileName" value=""/>
		         </div>
		    </div>
	      <div class="field">
	      	<div class="ui labeled input"> 
	      	<div class="ui label">Date</div>
	        	<input type="text" id="dmaDate12" name="dmaDate12">
	        	<a href="javascript:window_open('dmaDate12',350,150)"><img src="/Nregs/images/calendar.gif" align="middle" border="0" id="img1" 
	        		alt="Calender" style="margin-top:6px"></a>
	        </div>
	      </div>
	      <div class="field">
	      	<div class="ui labeled input"> 
	      	<div class="ui label">Subject</div>
	        	<input type="text" name="subject" id="subject">
	      	</div>
	      </div>
	     <div class="ui fluid action input field" style="width:400px">
        	<input type="text" id="filetext" readonly>
        	<input type="file" name="file" id="file">
        	<div class="ui icon button" style="height:35px">
            	Upload<i class="cloud upload icon"></i>
        </div>
  		</div>
	</form>
	</div>
	<div class="actions" id="returnToHome">
	    <div class="ui submit button" id="upload" style="height:35px">Submit</div>
	    <div class="ui cancel button" id="cancelButton" style="height:35px">Cancel</div>
  	</div>
</div>
<!-- Edit Modal Box -->
<!-- Delete Modal Box -->
<div class="ui small modal" id="deleteModalBox">
	<div class="header" id="deleteHead">Delete GO Details</div>
	
    <div class="content">
    	<div class="content" id="deleteResponse" style="font-family:Lato;color:teal;text-align:center">Please confirm that you wish to delete GO/Circular/Memo No: <span id="goNumberModal"></span> Information</div>
	</div>
	<div class="actions" id="returnToHome1">
	    <div class="ui submit button" id="confirm" style="height:35px">Confirm</div>
	    <div class="ui cancel button" id="cancelButton1" style="height:35px">Cancel</div>
  	</div>
</div>
<!-- Delete Modal Box End -->
<%if(request.getAttribute("result")!=null ){ %>
	<script>
		alert('<%=request.getAttribute("result")%>');
	</script>
<%}%>

<div class="zoomcontrol">
<script>
 	window.resizeTo (screen.availWidth, screen.availHeight);
  	window.moveTo (0, 0);
  	window.history.forward(1);
</script>
<%if(session.getAttribute("Status")!=null && session.getAttribute("Status").equals("SUCCESS")){ %>

<table width="98%" border="0" cellspacing="2" cellpadding="0" align="center">
<tr>
    <td align="center"><table width="98%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="25" colspan="3" align="right" valign="middle"><a href="#" class="top-mini-lnk">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#" class="top-mini-lnk">Sitemap</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#" class="top-mini-lnk">Contact Us</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#" class="top-mini-lnk">Feedback</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
      </tr>
      <tr>
        <td align="left" valign="middle"><img src="images/NREGS-LOGO.png" width="148" height="110" alt="NREGS LOGO" /></td>
        <td align="center" valign="middle"><img src="images/HD-TXT.png" width="693" height="80" /></td>
        <td align="right" valign="middle"><img src="images/MGNREGS-LOGO.png" width="130" height="100" alt="MGNREGS LOGO" /></td>
      </tr>
 <tr>
        <td height="28" colspan="3" style="background-image: url(images/Menu-bg.png)"><table cellpadding="0" cellspacing="0" border="0" width="100%">
          <tr>
            <td align="left" valign="middle" width="40%" style="padding-left: 5px;"><div id="myslidemenu" class="jqueryslidemenu" style="float: left;">
              <ul>                
                <li><a href="/Nregs/FrontServlet?requestType=NodalBankLogin_engRH&actionVal=GoChangePassword">Change Password</a></li>
                <li><a href="/Nregs/FrontServlet?requestType=LandDevelopmentNewRH&actionVal=goUpload">GO Upload</a></li>
                <li><a href="/Nregs/FrontServlet?requestType=NodalBankLogin_engRH&actionVal=Gologout">Logout</a></li>                
              </ul>
            </div></td>
          </tr>
        </table></td>
      </tr>
    </table>
    </td>
 </tr>
</table>
<%} %>
<table width="97%" border="0" cellspacing="0" cellpadding="0" align="center">
<%if(session.getAttribute("Status")==null || session.getAttribute("Status").equals("FAIL")){ %>

		 	<tr> 
				<td>
					<!-- Header JS starts-->
						<script src="/Nregs/scripts/Mainheader.js" type="text/javascript"></script>
					<!-- Header JS ends-->
				</td>
			</tr>
		<tr>
<%} %>	
			<td style="background-color: #fff; padding: 5px; height: 400px; vertical-align: top;">
				<!-- Body Content Starts -->
				<table width="60%" border="0" cellspacing="2" cellpadding="0" align="center">
					<tr>
						<td align="center" class="rpt-bg">
							<div class="ui attached message" style="font-family:Lato;font-size:12.5px;width:600px;margin-left:auto;margin-right:auto">
							  <div class="header">
							   <p class="ui horizontal divider" style="color:teal;font-size:19px">GO DETAILS</p>
							  </div>
							</div>
							<div class="ui attached fluid segment field" style="font-family:Lato;font-size:12.5px;width:600px;margin-left:auto;margin-right:auto">
								<div class="ui labeled input" style="width:240px">
									<div class="ui label">Select Year</div>
									<select class="ui fluid dropdown" name="goYear" id="goYear" onChange='displayGOData();'>
										<%for(int i=0;i<spryearList.size();i++){%>
											<option value="<%=spryearList.get(i).get(0)%>"> <%=spryearList.get(i).get(0)%></option>
										<% } %>
									</select>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td align="center" class="rpt-bg">
							<table class="ui center aligned celled structured table" style="font-family:Lato;font-size:12.5px;width:850px">
								<thead class="ui center aligned inverted grey table">
									<tr>
										<th >Date</th>
										<th >GO/Memo/Circular No</th>
										<th >Subject</th>
										<%if(session.getAttribute("Status") == "SUCCESS"){ %>
											<th>Action</th>
										<%} %>
									</tr>
								</thead>
								<tbody id="ajaxResponse">
								
									<%if(resultList.size()>0){
										for(int i=0;i<resultList.size();i++){%>
											<tr>
											<td><%=resultList.get(i).get(0) %></td>
											<td><%=resultList.get(i).get(1) %></td>
											<td><a  href="javascript:openDoc('<%=resultList.get(i).get(3) %>')"><%=resultList.get(i).get(2)%></a></td>
											<%if(session.getAttribute("Status")!=null && session.getAttribute("Status").equals("SUCCESS")){ %>
												<td><a href="#" id="editLink"  onclick="loadEditContent('<%=resultList.get(i).get(4)%>');"><img src="/Nregs/images/Edit.png" align="middle" border="0" style="width:22px"></a>
												<a href="#" id="deleteLink" data-value='<%=resultList.get(i).get(4)%>' data-number='<%=resultList.get(i).get(1) %>' ><img src="/Nregs/images/Delete.png" align="middle" border="0" style="width:22px"></a></td>
											<%} %>
											</tr>
										<%} 
									}else{%>
										<%if(session.getAttribute("Status")=="SUCCESS"){ %>
											<tr>
												<td colspan="4">No Data Found for the Selection</td>
											</tr>
										<% }else{ %>
											<tr>
												<td colspan="3">No Data Found for the Selection</td>
											</tr>
										<% } %>
									<%} %>
								</tbody>
							</table>
						</td>
					</tr>
				</table>
				</td>
				</tr>
				<tr><td><script src="/Nregs/scripts/Mainfooter.js" type="text/javascript"></script></td></tr>
				</table>
				
				
				
					</div>
				</body>
				</html>
