<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
	String dbConnVar = "BAKESHACk";
	try {
%>
<head>
<jsp:include page="../common/cssfiles.jsp"></jsp:include>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
</head>
<body id="kt_body"
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack003.jpg)"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed subheader-enabled page-loading">
	
	<jsp:include page="/form/common/mobile-header.jsp"></jsp:include>
	<!--end::Header Mobile-->
	<div class="d-flex flex-column flex-root">
		<!--begin::Page-->
		<div class="d-flex flex-row flex-column-fluid page">
			<!--begin::Wrapper-->
			<div class="d-flex flex-column flex-row-fluid wrapper"
				id="kt_wrapper">

				<!--begin::Content-->
				<div class="content d-flex flex-column flex-column-fluid"
					id="kt_content">
					<!--begin::Subheader-->
					<div class="subheader py-2 py-lg-12 subheader-transparent"
						id="kt_subheader">
						<div
							class="container d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
							<!--begin::Info-->
							<div class="d-flex align-items-center flex-wrap mr-1">
								<!--begin::Heading-->
								<div class="d-flex flex-column">
									<!--begin::Title-->
									<h2 class="text-white font-weight-bold my-2 mr-5">Role
										Master</h2>
									<!--end::Title-->

								</div>
								<!--end::Heading-->
							</div>
							<!--end::Info-->

						</div>
					</div>
					<!--end::Subheader-->
					<!--begin::Entry-->
					<div class="d-flex flex-column-fluid">
						<!--begin::Container-->
						<div class="container">
							<div class="row">
								<div class="col-xl-7">
									<div class="card card-custom gutter-b">
										<div class="card-body">
											<div class="example mb-10">
												<div class="example-preview">
													<div class="card card-custom">
														<form class="form" id="kt_form_1">
															<div class="card-body">
																<div class="form-group">
																	<label>Role</label><span class="text-danger" id="type">*</span>
																	<input type="text" name="role" id="role"
																		class="form-control form-control-solid"
																		placeholder="Enter Role" required /> <span
																		class="msg text-danger" id="type1"> </span>
																</div>
															</div>
															<div class="text-center">
																<button type="button" id="addRole"
																	class="btn btn-primary mr-2">Submit</button>
																<button type="submit" id="updateRole"
																	class="btn btn-primary mr-2">Update</button>
																<button type="button" class="btn btn-secondary"
																	id="cancel">Cancel</button>
															</div>
														</form>
														<!--end::Form-->
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-5">
									<div class="card card-custom gutter-b">
										<div class="card-body">
										<div class="input-icon ml-10" style = "width: 30%;">
																<input type="text" class="form-control form-control-solid" placeholder="Search..." id="txt_searchall" />
																<span>
																	<i class="flaticon2-search-1 text-muted"></i>
																</span>
															</div>
											<br />
											<!--begin: Datatable-->
											<table data-toggle="table" class='a'
											data-classes="table table-hover table-condensed "
											data-striped="true" data-sort-name="Quality"
											data-sort-order="desc" data-pagination="false"
											data-scroll="false" data-height=200 id="table-id">
											<thead>
												<tr>
													<th class="col-sm-1 text-center" data-field="NO"
														data-sortable="true">No</th>
													<th class="col-sm-3 text-center" data-field="Role-name"
														data-sortable="true">Role Name</th>
													<th class="col-sm-2 text-center" data-field="Action"
														data-sortable="false">Action</th>


												</tr>

											</thead>
											<tbody class="data">


											</tbody>
										</table>
											<!--end: Datatable-->
										</div>
									</div>
								</div>
							</div>
						
							<style>
.alert {
	padding: 20px 40px;
	min-width: 40%;
	position: fixed;
	right: 0;
	top: 10px;
	border-radius: 4px;
	border-left: 8px solid #ffa502;
	overflow: hidden;
	opacity: 0;
	pointer-events: none;
}

.alert.hide {
	animation: hide_slide 1s ease forwards;
}

.alert.showAlert {
	opacity: 1;
	pointer-events: auto;
}

.alert.show {
	animation: show_slide 1s ease forwards;
}

@
keyframes show_slide { 0%{
	transform: translateX(100%);
}

40
%
{
transform
:
translateX(
-10%
);
}
80
%
{
transform
:
translateX(
0%
);
}
100
%
{
transform
:
translateX(
-10px
);
}
}
@
keyframes hide_slide { 0%{
	transform: translateX(-10px);
}

40
%
{
transform
:
translateX(
0%
);
}
80
%
{
transform
:
translateX(
-10%
);
}
100
%
{
transform
:
translateX(
100%
);
}
}
.alert-text {
	padding: 0 20px;
	font-size: 18px;
}
</style>
							<div class="alert alert-success  " role="alert"
								id="success_alert">
								<div class="alert-text">
									<span id="success_msg"></span>
								</div>
							</div>
							<div class="alert alert-danger " role="alert" id="danger_alert">
								<div class="alert-text">
									<span id="danger_msg"></span>
								</div>
							</div>
							<div class="alert alert-warning " role="alert" id="warning_alert">
								<div class="alert-text">
									<span id="warning_msg"></span>
								</div>
							</div>
						
						</div>
						<!--end::Container-->
					</div>
					<!--end::Entry-->
				</div>
				<!--end::Content-->
				<!--begin::Footer-->
				<div style=" position:fixed; bottom:0;   width:100%;" class="fixed">
				<jsp:include page="../common/footer.jsp"></jsp:include>
				</div>
				<!--end::Footer-->
			</div>
			<!--end::Wrapper-->
		</div>
		<!--end::Page-->
	</div>


	<!--begin::Scrolltop-->
	<div id="kt_scrolltop" class="scrolltop">
		<span class="svg-icon"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/Navigation/Up-2.svg-->
			<svg xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
				height="24px" viewBox="0 0 24 24" version="1.1">
					<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
						<polygon points="0 0 24 0 24 24 0 24" />
						<rect fill="#000000" opacity="0.3" x="11" y="10" width="2"
					height="10" rx="1" />
						<path
					d="M6.70710678,12.7071068 C6.31658249,13.0976311 5.68341751,13.0976311 5.29289322,12.7071068 C4.90236893,12.3165825 4.90236893,11.6834175 5.29289322,11.2928932 L11.2928932,5.29289322 C11.6714722,4.91431428 12.2810586,4.90106866 12.6757246,5.26284586 L18.6757246,10.7628459 C19.0828436,11.1360383 19.1103465,11.7686056 18.7371541,12.1757246 C18.3639617,12.5828436 17.7313944,12.6103465 17.3242754,12.2371541 L12.0300757,7.38413782 L6.70710678,12.7071068 Z"
					fill="#000000" fill-rule="nonzero" />
					</g>
				</svg> <!--end::Svg Icon-->
		</span>
	</div>

<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/features/custom/spinners.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/crud/forms/widgets/form-repeater.js?v=7.2.7"></script>
	<script src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/crud/forms/widgets/select2.js?v=7.2.8"></script>
	


	<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>';

		$('#updateRole').hide();
		$("#addRole").show();

		$("#role").change(function() {
			var text = $("#role").val();
			var letters = /^[A-Za-z() .]+$/;
			if (text.match(letters)) {

				$('.msg').text('');
				return true;
			} else {

				$('.msg').text('Please Enter Letters Only.');
				$("#role").val("");

				return false;
			}
		});

		$('#addRole')
				.click(
						function() {
                                
							var role_type = $('#role').val();
							var flag = 1; // Addition
							var letters = /^[A-Za-z() .]+$/;
							if (role_type != '' && role_type.match(letters)) {
								
								   
								$
										.ajax({
											url : base + "/bakeshackAPI/api/insertUpdateRole",
											type : "post",
											dataType : "json",
											async : false,
											data : {
												"role_type" : role_type,
												"flag" : flag
											},

											error : function(xhr) {
												var msg = "(Data insertion failed. Error : "
														+ xhr.status
														+ " "
														+ xhr.statusText;
												 $('#warning_msg').text(msg);
												 $('#warning_alert').addClass("show");
										           $('#warning_alert').removeClass("hide");
										           $('#warning_alert').addClass("showAlert");
										           setTimeout(function(){
										             $('#warning_alert').removeClass("show");
										             $('#warning_alert').addClass("hide");
										           },2000);
											},
											success : function(response) {
												if (response != null) {

													if (response == 1) {

														var msg = "Role Data inserted Successfully.";
														 $('#success_msg').text(msg);
														 $('#success_alert').addClass("show");
												           $('#success_alert').removeClass("hide");
												           $('#success_alert').addClass("showAlert");
												           setTimeout(function(){
												             $('#success_alert').removeClass("show");
												             $('#success_alert').addClass("hide");
												           },2000);
														location.reload(true);

													}
												}
											}

										});
							}

						})

		"use strict";
		//Class definition

		var role_id;
		var html = "";

		$.ajax({
			url : base + "/bakeshackAPI/api/getRoleDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {"role_id": role_id},
			success:function(data)
			{
				  
				
				const row = data.find(d => d.role_id == role_id);
				data.forEach((row)=> {
					html +="<tr id= tr-id-2 class= tr-class-2>"
					html += "<td>"+row.role_id+"</td>"; 
					 html += "<td>"+row.role_type+"</td>";
			        
			         
/* 		     	       	  '<a href="javascript:update('+row.role_id+');" class="btn_action btn-sm btn-clean btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="20" height="20"/><path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#B5B5C3" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "/><rect fill="#000000" opacity="0.3" x="5" y="20" width="12" height="2" rx="1"/></g></svg></span>'
 */		         

		     	       	html += '<td><a href="javascript:deleteById('+row.role_id+');" class="btn_action btn-sm btn-clean btn-icon" title="Delete"><span class="svg-icon svg-icon-md"> <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="20" height="20"/><path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#B5B5C3" fill-rule="nonzero"/>\ <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"/></g> </svg></span></a></td>';
			            html +="</tr>"
				
				
				});
				 $(".data").html(html);
			}
			
		});	



		$(document).ready(function (){
			   var table = $('#table-id').DataTable();
			 
			});

		// Update data by district name and id
		function update(id,role_type) {

			$('#updateRole').show();
			$("#addRole").hide();
			$(".btn_action").hide();
			
			
			$.ajax({
		        type:"POST",
		        dataType: "json",
		        data:{"role_id": id},
				async : false,
		        url: base + "/bakeshackAPI/api/getRoleDetails",
		        success:function(data)
		        {
		        	
		            const row = data.find(d => d.role_id ==id);
		           
		            $('#role').val(row.role_type);
		        	
		        }
		     });
			/* var rolll_id = id;
           alert(rolll_id);
			$('#role').val(rolll_id); */

			$('#updateRole')
					.click(
							function() {

								var role_type = $('#role').val();


								var flag = 2; // Addition
								
							

									$.ajax({
										url : base + "/bakeshackAPI/api/insertUpdateRole",
												type : "post",
												dataType : "json",
												async : false,
												data : {
													"role_id" : role_id,
													"role" : role_type,
													"flag" : flag
												},
												error : function(xhr) {
													var msg = "(Data Updation failed. Error : "
															+ xhr.status
															+ " "
															+ xhr.statusText;
													 $('#warning_msg').text(msg);
													 $('#warning_alert').addClass("show");
											           $('#warning_alert').removeClass("hide");
											           $('#warning_alert').addClass("showAlert");
											           setTimeout(function(){
											             $('#warning_alert').removeClass("show");
											             $('#warning_alert').addClass("hide");
											           },2000);
												},
												success : function(response) {
													if (response != null) {

														if (response >= 1) {

															var msg = "Role Data Updated Successfully.";
															 $('#success_msg').text(msg);
															 $('#success_alert').addClass("show");
													           $('#success_alert').removeClass("hide");
													           $('#success_alert').addClass("showAlert");
													           setTimeout(function(){
													             $('#success_alert').removeClass("show");
													             $('#success_alert').addClass("hide");
													           },2000);

														}
													}
												}

											});
								 

							})

			"use strict";

		}
		$('#cancel').click(function() {
			window.location.reload();
		})

		// Delete data by role_id
		function deleteById(id) {

			Swal.fire({
		        title: "Are you sure?",
		        text: "You won't be able to revert this!",
		        icon: "warning",
		        showCancelButton: true,
		        confirmButtonText: "Yes, delete it!",
		        cancelButtonText: "No, cancel!",
		        reverseButtons: true
		    }).then(function(result) {
		        if (result.value) {
				var role_id = id;
				/* alert(role_id); */
				var flag = 3;
				$.ajax({
					url : base + "/bakeshackAPI/api/insertUpdateRole",
					type : "post",
					dataType : "json",
					async : false,
					data : {
						"role_type" : " ",
						"role_id" : id,
						
						"flag" : flag
						
					},
					
					error : function(xhr) {
						var msg = "(Data deletion failed. Error : "
								+ xhr.status + " " + xhr.statusText;
						 $('#warning_msg').text(msg);
						 $('#warning_alert').addClass("show");
				           $('#warning_alert').removeClass("hide");
				           $('#warning_alert').addClass("showAlert");
				           setTimeout(function(){
				             $('#warning_alert').removeClass("show");
				             $('#warning_alert').addClass("hide");
				           },2000);
					},
					success : function(response) {
						if (response != null) {

							if (response >= 1) {

								var msg = "Role Data deleted Successfully.";
								 $('#danger_msg').text(msg);
									$('#danger_alert').addClass("show");
						   	           $('#danger_alert').removeClass("hide");
						   	           $('#danger_alert').addClass("showAlert");
						   	           setTimeout(function(){
						   	             $('#danger_alert').removeClass("show");
						   	             $('#danger_alert').addClass("hide");
						   	           },2000);
								location.reload(true);

							}
						}
					}

				});
				Swal.fire(
		                "Deleted!",
		                "Your file has been deleted.",
		                "success"
		            )
		            // result.dismiss can be "cancel", "overlay",
		            // "close", and "timer"
		        } else if (result.dismiss === "cancel") {
		            window.location.reload();
		        }
		    });
		}
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
	</script>
</body>
</html>

<%
	} catch (Exception e) {
		Logger.log(dbConnVar, "" + e);
	}
%>