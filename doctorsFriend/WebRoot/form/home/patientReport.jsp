<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
String dbConnVar = "BAFNA";
try {
%>
<head>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
<script src="//code.jquery.com/jquery.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>
<style>
table, th, td {
	border: 1px solid white;
	border-collapse: collapse;
	background-color: #ffffff;
}
</style>
<style>
table.a {
	table-layout: auto;
	width: 100%;
}
</style>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
</head>

<jsp:include page="../common/header.jsp"></jsp:include>
<script type="text/javascript"
	src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/jquery.table2excel.js"></script>
</head>
<script type="text/javascript"
	src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/jspdf.min.js"></script>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/jsfiles.jsp"></jsp:include>
<script type="text/javascript"
	src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/pages/features/custom/spinners.js"></script>
<script type="text/javascript"
	src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/main.js"></script>


<body id="kt_body"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed aside-enabled aside-static page-loading">
	<jsp:include page="/form/common/mobile-header.jsp"></jsp:include>
	<div class="d-flex flex-column flex-root">
		<!--begin::Page-->
		<div class="d-flex flex-row flex-column-fluid page">
			<!--begin::Aside-->
			<jsp:include page="/form/common/sidebar.jsp"></jsp:include>
			<!--end::Aside-->
			<!--begin::Wrapper-->
			<div class="d-flex flex-column flex-row-fluid wrapper"
				id="kt_wrapper">
				<!--begin::Header-->
				<jsp:include page="/form/common/navbar.jsp"></jsp:include>
				<!--end::Header-->
				
				
				<div class="card card-custom gutter-b ">
				<div class="dropdown dropdown-inline " >
					<button type="button1" class="  btn  font-weight-bolder " style="float:right;"
						value="Create Print" id="Print" onclick="MyApp.printTable()">
						<i class="icon-2x flaticon2-printer" style="color: #f64e60"></i>
					</button>
					<button type="button " class=" btn font-weight-bolder " style="float:right;"
						value="Create PDF" id="PDF" onclick="run()">
						<i class=" icon-2x fas fa-file-pdf " style="color: #f64e60"></i>
					</button>
					<button onclick="dataContentExportExl('card_Report', 'user-data')"
						class="  btn  font-weight-bolder " style="float:right;" value="Create Excel" id="Excel">
						<i class=" icon-2x fas fa-file-excel" style="color: #f64e60"></i>
					</button>
				</div>
		<div class="card-body" id="card_Report">
			<font size="+4"><u><center>Patient Report</center></u></font> <br />
			<table class="table" style="border: 1px solid black">
				<thead>
					<tr>
						<th style="text-align: center;" scope="col">Patient Code</th>
						<th style="text-align: center" scope="col">Patient Name</th>
						<th style="text-align: center" scope="col">Visit Date</th>
						<th style="text-align: center" scope="col">Age</th>
						<th style="text-align: center" scope="col">Gender</th>
						<th style="text-align: center" scope="col">Blood Group</th>
						<th style="text-align: center" scope="col">City</th>
						<th style="text-align: center" scope="col">Diagnosis Name</th>
					</tr>
				</thead>
				<tbody class="table_body">
				</tbody>
			</table>
		</div>
	</div>
	<!-- </div> -->
				<!--end::Entry-->
			</div>
			<!--end::Content-->
			<!--begin::Footer-->
			<%-- <jsp:include page="../common/footer.jsp"></jsp:include> --%>
			<!--end::Footer-->
		</div>
		<!--end::Wrapper-->
	</div>
	<!--end::Page-->
	</div>
	<!--end::Main-->


	<jsp:include page="../common/jsfiles.jsp"></jsp:include>

	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/pages/features/custom/spinners.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/js/main.js"></script>

	<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>'; 
	
	
	
	var date = new Date();
	var today = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
	var from_date = today;
	var till_date = today;
	var patient_code = " ";
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	patient_code = urlParams.get('patient_code');
	const patient_name = urlParams.get('patient_name');
	const sort_by = urlParams.get('sort_by');
	 from_date = urlParams.get('from_date');
	 till_date = urlParams.get('till_date');
	const order = urlParams.get('order');
	var html;
	$.ajax({
		url : base + "/dssAPI/dfapi/filterPatientRecord1",
		type : "post",
		dataType : "json",
		async : false,
		data : {
			"patient_code1":patient_code,
		    "sorted_by":sort_by,
		    "date_range" : from_date,
		    "upto_date" : till_date,
		    "order"  : order
			},
		success:function(data)
	    {
			const row = data.find(d => d.patient_code == patient_code);
			data.forEach((row)=> {
	     	html +="<tr id= tr-id-2 class= tr-class-2>"
			html += "<td>"+row.patient_code+"</td>"; 
			 html += "<td>"+row.patient_name+"</td>";
	            html += "<td>"+row.visit_date+"</td>";
	            html += "<td>"+row.age+"</td>";
	            html += "<td>"+row.gender+"</td>";
	            html += "<td>"+row.blood_group+"</td>";
	            html += "<td>"+row.city_desc+"</td>";
	            html += "<td>"+row.diagnosis_desc+"</td>";
	 	       	 html +="</tr>"
				});
			 $(".table_body").html(html);
		}
	});	
	$(document).ready(function(){
		  // Search all columns
		  $('#txt_searchall').keyup(function(){
		    // Search Text
		    var search = $(this).val();

		    // Hide all table tbody rows
		    $('table tbody tr').hide();

		    // Count total search result
		    var len = $('table tbody tr:not(.notfound) td:contains("'+search+'")').length;

		    if(len > 0){
		      // Searching text in columns and show match row
		      $('table tbody tr:not(.notfound) td:contains("'+search+'")').each(function(){
		        $(this).closest('tr').show();
		      });
		    }else{
		      $('.notfound').show();
		    }

		  });
		});
	$.expr[":"].contains = $.expr.createPseudo(function(arg) {
		   return function( elem ) {
		     return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
		   };
		});
	 
	 var MyApp = new function () {
	     this.printTable = function () {
	         var tab = document.getElementById('card_Report');
	         printHeader:"<h1>Example Table Header<h1>"

	         var style = "<style>";
	             style = style + "table {width: 100%;font: 17px Calibri;}";
	             style = style + "table, th, td {border: solid 1px #DDD; border-collapse: collapse;";
	             style = style + "padding: 2px 3px;text-align: center;}";
	             style = style + "</style>";

	         var win = window.open('', '', 'height=700,width=700');
	         win.document.write(style);          //  add the style.
	         win.document.write(card_Report.outerHTML);
	         win.document.close();
	         win.print();
	     }
	 }

	 function run() {
		  var doc = new jsPDF("l",'pt','a3');
		  doc.setFontSize(15);
		    doc.text( '', 10, 15,{
		        align: 'justify'
		    });
		    doc.setFontSize(10);
		  doc.fromHTML($("#card_Report").get(0), 150, 20,{
		    width: 1000,
		    align: 'justify'
		  },function(a) {
		    doc.save("Image.pdf");
		  });
		}
	function dataContentExportExl(memberId, filename = ''){
		    var fourceFileSaveDataUrl;
		    var dataFileType = 'application/vnd.ms-excel';
		    var tableSelect = document.getElementById(memberId);
		    var dataContentSource = tableSelect.innerHTML.replace(/ /g, '%20');
		    
		    // Specify file name
		    filename = filename?filename+'.xls':'export_excel_data.xls';
		    
		    // Create download link element
		    fourceFileSaveDataUrl = document.createElement("a");
		    
		    document.body.appendChild(fourceFileSaveDataUrl);
		    
		    if(navigator.msSaveOrOpenBlob){
		        var blob = new Blob(['\ufeff', dataContentSource], {
		            type: dataFileType
		        });
		        navigator.msSaveOrOpenBlob( blob, filename);
		    }else{
		        // Create a link to the file
		        fourceFileSaveDataUrl.href = 'data:' + dataFileType + ', ' + dataContentSource;
		    
		        // Setting the file name
		        fourceFileSaveDataUrl.download = filename;
		        
		        //triggering the function
		        fourceFileSaveDataUrl.click();
		    }
		};
	
	</script>
</body>
</html>

<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>



