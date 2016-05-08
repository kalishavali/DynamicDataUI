<html>
<head>
    <title>Localhost</title>
    <link href="semantic.min.css" rel="stylesheet" type="text/css" />  
    <link rel="stylesheet" href="icon.css" >  
    <link rel="stylesheet" href="app.css" >  
    <script src="jquery.min.js" type="text/javascript"></script>
    <script src="semantic.min.js" type="text/javascript"></script>
    <script src="js/amcharts.js" type="text/javascript"></script>
    <script src="js/serial.js" type="text/javascript"></script>
    <script src="js/themes/light.js" type="text/javascript"></script>
    <script src="js/export.js" type="text/javascript"></script>
    <script src="js/libs/blob.js" type="text/javascript"></script>
    <script src="js/libs/fabric.js" type="text/javascript"></script>
    <script src="js/libs/FileSaver.js" type="text/javascript"></script>
    <script src="js/libs/jszip.js" type="text/javascript"></script>
    <script src="js/libs/pdfmake.js" type="text/javascript"></script>
    <script src="js/libs/vfs_fonts.js" type="text/javascript"></script>
    <script src="js/libs/xlsx.js" type="text/javascript"></script>
    <link href="css/export.css" rel="stylesheet" type="text/css">
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
    font-size: 12px;
    margin-bottom: 7px;
}
.ig-color-red, .ig-delivery, .ig-form-message, .ig-message {
    font-family: Lato,"Trebuchet MS",Helvetica,sans-serif;
}
*, :after, :before {
    box-sizing: border-box;
    -moz-box-sizing: border-box;
}
#chartdiv {
	width		: 100%;
	height		: 500px;
	font-size	: 11px;
}
.soldout {
    float: right;
    display: block;
    padding: 5px 8px;
    text-transform: uppercase;
    background: #dc0028;
    color: #fff;
    font-size: 10px;
    border: 1px dashed #fff;
    margin: 28px 10px 0 0;
}
.removebut {
    float: right;
    display: block;
    padding: 4px 6px;
    text-transform: uppercase;
    color: #333;
    font-size: 10px;
    border: 1px solid #333;
    margin: 28px 0 0;
}

.ig-plus-minus, .ig-pointer {
    cursor: pointer;
}
.fancybox-nav, a {
    text-decoration: none;
}
</style>
</head>
<script>
$(document).ready(function() { 
	var chartData =  [{"country":"One","visits":100}];
    var str=chartData.Name;
    alert(chartData['country']);
});
$(document).on("click", "#chart", function () {
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
/* var chart = AmCharts.makeChart("chartdiv", {
    "type": "serial",
    "theme": "none",
    "depth3D": 20,
	"angle": 30,
    "columnWidth:": 0.2,
    "columnSpacing": 2,
    "valueAxis.labelsEnabled" : true,
    "dataProvider": [{
        "year": 2005,
        "income": 23.5,
        "expenses": 18.1
    }, {
        "year": 2006,
        "income": 26.2,
        "expenses": 22.8
    }, {
        "year": 2007,
        "income": 30.1,
        "expenses": 23.9
    }, {
        "year": 2008,
        "income": 29.5,
        "expenses": 25.1
    }, {
        "year": 2009,
        "income": 24.6,
        "expenses": 25
    }],
    "valueAxes": [{
        "axisAlpha": 0,
        "position": "left"
    }],
    "startDuration": 1,
    "graphs": [{
        "balloonText": "Income:[[value]]",
        "fillAlphas": 0.8,
        "lineAlpha": 0.2,
        "title": "Income",
        "type": "column",
        "valueField": "income"
    }, {
        "balloonText": "Expenses:[[value]]",
        "fillAlphas": 0.8,
        "lineAlpha": 0.2,
        "title": "Expenses",
        "type": "column",
        "valueField": "expenses"
    }],
    "rotate": false,
    "categoryField": "year",
    "categoryAxis": {
        "gridPosition": "start",
        "position": "left"
    },
    "export": {
	    "enabled": true
	  }
}); */
var chart;
var chartData =  [ 
		{"country":"One","visits":100},
		{"country":"Two","visits":102},
		{"country":"Three","visits":103},
		{"country":"Four","visits":104},
		{"country":"Five","visits":105},
];
var chart = AmCharts.makeChart( "chartdiv", {
  "theme": "light",
  type: "serial",
  dataProvider: chartData,
  categoryField: "country",
  depth3D: 15,
  angle: 30,
  "titles": [{"text": "My Chart Title"}, {"text": "My Chart Sub-Title","bold": false}],
    

  categoryAxis: {
    labelRotation: 90,
    gridPosition: "start",
    title:"Category Title"
  },

  valueAxes: [ {
    title: "Value Title"
  } ],

  graphs: [ {

    valueField: "visits",
    colorField: "color",
    type: "column",
    lineAlpha: 0.1,
    balloonText: "[[category]]: <b>[[value]]</b>",
    fillAlphas: 0.8
    
    
  } ],
  chartCursor: {
    cursorAlpha: 0,
    zoomable: false,
    categoryBalloonEnabled: false
  },
  "export": {
	    "enabled": true
	  }
	  
} ); 

</script>
<body>
<button id="chart">Chart</button>
<div class="ui modal">
  <div class="header">
    Graph
  </div>
  <div class="content">
    <div id="chartdiv" class="content" style="width:100%;height:400px;"></div>				
  </div>
  <div class="actions">
    <div class="ui black deny button">
      Close
    </div>
    
  </div>
</div>

<!-- Button -->
<a ng-click="cart.removeFromCart(lineItem)" class="removebut ig-pointer">Remove</a>
<span class="soldout" ng-show="lineItem.isSoldOut">Soldout</span>
</body>
</html>