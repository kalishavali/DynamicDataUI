<%@ page pageEncoding="UTF-8" %> 
<!DOCTYPE html> 
<html lang="en"> 
<head> 
<title></title> 
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script type="text/javascript" > 

function getCountry(){ 
	$.getJSON('readDropdown', function(data) { 
	ddl2=$("#district"); 
		if (data) { 
			ddl2.html();
			$.each(data.dropDownData, function(key, val) {
	           $('#district').append('<option value="' + key + '">' + val + '</option>');
	        }); 
		} else { 
			ddl2.append($('<option/>').text('Select' + ddl)); 
		} 
	}); 
} 

$(document).ready(function() { 
	getCountry(); 
	$('select').on('change', function() {
		fillOptions(this.id);
	});
}); 

function fillOptions(dropdownId) { 
	// $("#test1").text($('#'+dropdownId).val()); 
	//$("#ddi").text(dropdownId); 
	var dropdown = $('#' + dropdownId); 
	var ddl2; 
	if(dropdownId=="district"){
		ddl="mandal";
		ddl2=$("#mandal");
		var url='readDropdown?did=' + $(dropdown).val();
	}
	else if(dropdownId=="mandal"){
		ddl="panchayat";
		ddl2=$("#panchayat");
		var url='readDropdown?mid=' + $(dropdown).val();
	}
	else if(dropdownId="panchayat"){
		ddl="village";
		ddl2=$("#village");
		var url='readDropdown?pid=' + $(dropdown).val();
	}
	$.getJSON(url , function(data) { 
		$('option', ddl2).remove(); // Clean old options first. 
		if (data) { 
			$.each(data.dropDownData, function(key, value) { 
				ddl2.append($('<option/>').val(key).text(value)); 
			}); 
		} else { 
			ddl2.append($('<option/>').text('Please select' + ddl)); 
		} 
	}); 
} 
</script> 
</head> 
<body> 
<form> 
<select id="district" name="district"> 
<option>Select district</option> 
</select> 
<select id="mandal" name="mandal"> 
<option>Select mandal</option> 
</select> 
<select id="panchayat" name="panchayat"> 
<option>Select panchayat</option> 
</select> 
<select id="village" name="village"> 
<option>Select village</option> 
</select> 



</form> 
</body> 
</html> 