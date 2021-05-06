<%@page import="com.issuetracker.bean.ProjectDetails"%>
<%@page import="com.issuetracker.bean.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
	function selectRole() {
		var area = document.getElementById("project");
		var selectedValue = project.options[project.selectedIndex].value;
		var larea = document.getElementById("lproject");
		larea.innerHTML = "";

		if (selectedValue == "") {
			larea.innerHTML = "Role is Not Selected.";
			document.getElementById("project").style.borderColor = "red";
			document.getElementById("uproject").style.color = "red";

		} else {
			document.getElementById("project").style.borderColor = "green";
			document.getElementById("uproject").style.color = "green";
		}

	}
	function ValidateUser() {
		var uname = document.getElementById("username").value;
		var lblError = document.getElementById("ulabel");

		lblError.innerHTML = "";

		if (uname.length <= 0) {
			lblError.innerHTML = "Please Enter Message.";
			document.getElementById("username").style.borderColor = "red";
			document.getElementById("msgl").style.color = "red";

		} else {
			document.getElementById("username").style.borderColor = "green";
			document.getElementById("msgl").style.color = "green";
		}

	}

	function selectModule() {
		var area = document.getElementById("module");
		var selectedValue = module.options[module.selectedIndex].value;
		var larea = document.getElementById("lmodule");
		larea.innerHTML = "";

		if (selectedValue == "") {
			larea.innerHTML = "User is Not Selected.";
			document.getElementById("module").style.borderColor = "red";
			document.getElementById("umodule").style.color = "red";

		} else {
			document.getElementById("module").style.borderColor = "green";
			document.getElementById("umodule").style.color = "green";
		}

	}

	function validateForm() {
		
		var flag = 0;
		var area1 = document.getElementById("project");
		var selectedValue11 = project.options[project.selectedIndex].value;
		var larea1 = document.getElementById("lproject");
		larea1.innerHTML = "";

		if (selectedValue11 == "") {
			larea1.innerHTML = "Role is Not Selected.";
			document.getElementById("project").style.borderColor = "red";
			document.getElementById("uproject").style.color = "red";
			flag=1;

		} else {
			document.getElementById("project").style.borderColor = "green";
			document.getElementById("uproject").style.color = "green";
			flag=0;
		}
		var uname1 = document.getElementById("username").value;
		var lblError1 = document.getElementById("ulabel");

		lblError1.innerHTML = "";

		if (uname1.length <= 0) {
			lblError1.innerHTML = "Please Enter Message.";
			document.getElementById("username").style.borderColor = "red";
			document.getElementById("msgl").style.color = "red";
			flag=1;

		} else {
			document.getElementById("username").style.borderColor = "green";
			document.getElementById("msgl").style.color = "green";
			flag=0;
		}
		var area1 = document.getElementById("module");
		var selectedValue1 = module.options[module.selectedIndex].value;
		var larea1 = document.getElementById("lmodule");
		larea1.innerHTML = "";

		if (selectedValue1 == "") {
			larea1.innerHTML = "User is Not Selected.";
			document.getElementById("module").style.borderColor = "red";
			document.getElementById("umodule").style.color = "red";
			flag=1;

		} else {
			document.getElementById("module").style.borderColor = "green";
			document.getElementById("umodule").style.color = "green";
			flag=0;
		}
		if (flag == 1) {
			return false;
		} else {
			return true;
		}

	}
	$(document).ready(
			function() {

				$("#project").change(
						function() {
							var str = $("#project").val();
							$.get("GetUserList", {
								UserRole : str
							}).done(
									function(data) {
										$("#module").children().remove();
										var modules = jQuery.parseJSON(data);
										$.each(modules, function(key, value) {

											$("#module").append(
													'<option value='+value.userId+'>'
															+ value.userName
															+ '</option>');
										});
									});
							$("#report").children().remove();
							if(str==1)
							{
								$("#report").append('<option value="ProjectWise">Project Wise</option>');
							}
							if(str==2)
							{
								$("#report").append('<option value="IssueWiseD">Issue Wise</option>');
								$("#report").append('<option value="ModuleWise">Module Wise</option>');

							}
							if(str==3)
							{
								$("#report").append('<option value="IssueWiseTester">Issue Wise</option>');
								$("#report").append('<option value="ModuleWise">Module Wise</option>');

							}
							
						});
			});
</script>

<title>Create Report</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<div class="se-pre-con"></div>

	<div class="container-scroller">
		<!-- partial:../../partials/_navbar.jsp -->
		<%@include file="_navbar.jsp"%>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:../../partials/_sidebar.html -->
			<%@include file="adminsidebar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="container-fluid page-body-wrapper full-page-wrapper">
						<div
							class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">

							<div class="row w-100">
								<div style="align-content: center;">
									<h1
										style="color: darkblue; font-family: Apple; font-style: italic; margin-left: 200px; text-align: center">
										<b><i class="bi bi-file-earmark-person" style="margin-right: 10px;"></i>Create 
											Report</b>
									</h1>
									<div class="auto-form-wrapper"
										style="border: solid blue; margin-left: 200px; width: 800px; border-radius: 20px">
										<form action="ReportCreation">

											<div class="form-group">
												<label class="label" style="font-size: small;"><i
													class="bi bi-person-check-fill" style="margin-right: 10px;"></i>User
													Role</label>
												<div class="input-group">

													<select title="Please select User Role."
														onchange="selectRole();" class="form-control" id="project"
														style="font-size: small;" name="projectName">
														<option value="">Select Role</option>
														<option value="1">Project Manager</option>
														<option value="2">Developer</option>
														<option value="3">Tester</option>
													</select> <i id="uproject" class="mdi mdi-check-circle-outline"
														style="margin-left: 5px;"></i>
												</div>
												<span id="lproject" style="color: red; font-size: small;"></span>

											</div>

											<div class="form-group">
												<label class="label" style="font-size: small;"><i
													class="bi bi-person-bounding-box"
													style="margin-right: 10px;"></i>User List</label>
												<div class="input-group">
													<select title="Please select User."
														onchange="selectModule();" class="form-control"
														id="module" style="font-size: small;" name="moduleId">
														<option value="0">Select User</option>

													</select> <i id="umodule" class="mdi mdi-check-circle-outline"
														style="margin-left: 5px;"></i>

												</div>
												<span id="lmodule" style="color: red; font-size: small;"></span>

											</div>
											
											<div class="form-group">
												<label class="label" style="font-size: small;"><i
													class="bi bi-file-earmark-person"
													style="margin-right: 10px;"></i>Report Selection</label>
												<div class="input-group">
													<select title="Please select User."
														onchange="selectModule();" class="form-control"
														id="report" style="font-size: small;" name="Reportc">
														<option value="0">Select Catagory</option>

													</select> <i id="umodule" class="mdi mdi-check-circle-outline"
														style="margin-left: 5px;"></i>

												</div>
												<span id="lmodule" style="color: red; font-size: small;"></span>

											</div>
											

											<div class="form-group">
												<input type="submit" onclick=" return validateForm();"
													class="btn btn-primary submit-btn btn-block"
													value="View Report" />
											</div>
											<p class="footer-text text-center text-center">
												<a href="AdminHome.jsp"
													style="color: black; font-weight: bolder;"><i
													class="bi bi-reply-fill" style="margin-right: 10px;"></i>Go
													Back</a>
												
											</p>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="commonjspluggins.jsp"%>
</body>
</html>