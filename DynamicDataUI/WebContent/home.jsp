<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<script src="js/jquery-1.11.1.min.js"></script>
<script>
	$(function() {

		//We commented this code because we are directly loading the drop down options via struts UI tag
		/*$('#state').html('');
		$.getJSON("readStates", function(res) {
			for ( var i = 0; i < res.states.length; i++) {
				$('#state').append(
						'<option value='+res.states[i]+'>' + res.states[i]
								+ '</option>');
			}
		});*/

		$("#state").change(
				function() {
					$('#district').html('');
					var state = {
						"state" : $("#state").val()
					};
					$.ajax({
						url : "readDistricts",
						data : JSON.stringify(state),
						dataType : 'json',
						contentType : 'application/json',
						type : 'POST',
						async : true,
						success : function(res) {
							console.log(res.districts.length);
							for ( var i = 0; i < res.districts.length; i++) {
								console.log(" " + res.districts[i]);
								$('#district').append(
										'<option value=' + res.districts[i] + '>'
												+ res.districts[i]
												+ '</option>');
							}
						}
					});
				});
		$("#district").change(
				function() {
					$('#panchayat').html('');
					var district = {
						"district" : $("#district").val()
					};
					$.ajax({
						url : "readPanchayats",
						data : JSON.stringify(district),
						dataType : 'json',
						contentType : 'application/json',
						type : 'POST',
						async : true,
						success : function(res) {
							console.log(res.panchayats.length);
							for ( var i = 0; i < res.panchayats.length; i++) {
								console.log(" " + res.panchayats[i]);
								$('#panchayat').append(
										'<option value=' + res.panchayats[i] + '>'
												+ res.panchayats[i]
												+ '</option>');
							}
						}
					});
				});
	});
</script>
</head>

<body>
	<h3>Struts 2 Dynamic Drop down List</h3>
	<s:select label="What's your State" headerKey="-1"
		headerValue="Select State" list="states" name="state"
		value="defaultState" />
	District :
	<select id="district"><option>Pleset Select State</option></select>
	Panchayat:
	<select id="panchayat"></select>
</body>

</html>
