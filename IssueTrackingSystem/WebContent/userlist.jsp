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
		var selectedValue1 = project.options[project.selectedIndex].value;
		var larea1 = document.getElementById("lproject");
		larea1.innerHTML = "";
		var uname = document.getElementById("username").value;
		var lblError = document.getElementById("ulabel");
		lblError.innerHTML = "";
		var area = document.getElementById("module");
		var selectedValue = module.options[module.selectedIndex].value;
		var larea = document.getElementById("lmodule");
		larea.innerHTML = "";

		if (selectedValue == "") {
			larea1.innerHTML = "Role is Not Selected.";
			document.getElementById("module").style.borderColor = "red";
			document.getElementById("umodule").style.color = "red";
			flag = 1;

		} else {
			document.getElementById("module").style.borderColor = "green";
			document.getElementById("umodule").style.color = "green";
			flag = 0;
		}

		if (uname.length <= 0) {
			lblError.innerHTML = "Please Enter Message.";
			document.getElementById("username").style.borderColor = "red";
			document.getElementById("msgl").style.color = "red";
			flag = 1;

		} else {
			document.getElementById("username").style.borderColor = "green";
			document.getElementById("msgl").style.color = "green";
			flag = 0;
		}

		if (selectedValue1 == "") {
			larea.innerHTML = "User is Not Selected.";
			document.getElementById("project").style.borderColor = "red";
			document.getElementById("uproject").style.color = "red";
			flag = 1;

		} else {
			document.getElementById("project").style.borderColor = "green";
			document.getElementById("uproject").style.color = "green";
			flag = 0;
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
						});
			});
</script>

<title>Send Email</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<div class="se-pre-con"></div>

	<%
		int id = (Integer) request.getAttribute("uId");
	%>
	<%
		int sendId = (Integer) request.getAttribute("sendId");
	%>

	<div class="container-scroller">
		<!-- partial:../../partials/_navbar.jsp -->
		<%@include file="_navbar.jsp"%>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:../../partials/_sidebar.html -->
			<%
				if (id == 0) {
			%>
			<%@include file="adminsidebar.jsp"%>
			<%
				} else if (id == 1) {
			%>
			<%@include file="projectmanagersidebar.jsp"%>
			<%
				} else if (id == 2) {
			%>
			<%@include file="developersidebar.jsp"%>
			<%
				} else {
			%>
			<%@include file="testersidebar.jsp"%>
			<%
				}
			%>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="container-fluid page-body-wrapper full-page-wrapper">
						<div
							class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">

							<div class="row w-100">
								<div style="align-content: center;">
									<h1
										style="color: darkblue; font-family: Apple; font-style: italic; margin-left: 200px; text-align: center">
										<b><i class="bi bi-envelope" style="margin-right: 10px;"></i>Send
											E-mail</b>
									</h1>
									<div class="auto-form-wrapper"
										style="border: solid blue; margin-left: 200px; width: 800px; border-radius: 20px">
										<form action="SendMessage">

											<input type="hidden" value="<%=sendId%>" name="sendId">
											<input type="hidden" value="<%=id%>" name="idsidebar">
											<div class="form-group">
												<label class="label" style="font-size: small;"><i
													class="bi bi-person-check-fill" style="margin-right: 10px;"></i>User
													Role</label>
												<div class="input-group">

													<select title="Please select User Role."
														onchange="selectRole();" class="form-control" id="project"
														style="font-size: small;" name="projectName">
														<option value="">Select Role</option>
														<%if(id!=0){ %>
														<option value="0">Admin</option>
														<%} %>
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
														<option value="">Select User</option>

													</select> <i id="umodule" class="mdi mdi-check-circle-outline"
														style="margin-left: 5px;"></i>

												</div>
												<span id="lmodule" style="color: red; font-size: small;"></span>

											</div>
											<div class="form-group">
												<label class="label" style="font-size: small;"><i
													class="bi bi-envelope" style="margin-right: 10px;"></i>Your
													Message </label>
												<div class="input-group">
													<input type="text" class="form-control" id="username"
														name="Message" placeholder="Write Your Message"
														onkeyup="ValidateUser();"> <i id="msgl"
														class="mdi mdi-check-circle-outline"
														style="margin-left: 5px;"></i>
												</div>
												<span id="ulabel" style="color: red; font-size: small;"></span>
											</div>

											<div class="form-group">
												<input type="submit" onclick=" return validateForm();"
													class="btn btn-primary submit-btn btn-block"
													value="Send Mail" />
											</div>
											<p class="footer-text text-center text-center">
												<%
													if (id == 0) {
												%>
												<a href="AdminHome.jsp"
													style="color: black; font-weight: bolder;"><i
													class="bi bi-reply-fill" style="margin-right: 10px;"></i>Go
													Back</a>
												<%
													} else if (id == 1) {
												%>
												<a href="projectmanagerhome.jsp"
													style="color: black; font-weight: bolder;"><i
													class="bi bi-reply-fill" style="margin-right: 10px;"></i>Go
													Back</a>
												<%
													} else if (id == 2) {
												%>
												<a href="developerhome.jsp"
													style="color: black; font-weight: bolder;"><i
													class="bi bi-reply-fill" style="margin-right: 10px;"></i>Go
													Back</a>
												<%
													} else {
												%>
												<a href="testerhome.jsp"
													style="color: black; font-weight: bolder;"><i
													class="bi bi-reply-fill" style="margin-right: 10px;"></i>Go
													Back</a>
												<%
													}
												%>
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