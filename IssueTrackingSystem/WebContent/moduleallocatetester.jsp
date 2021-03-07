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
	function selectProject() {
		var area = document.getElementById("project");
		var selectedValue = project.options[project.selectedIndex].value;
		var larea = document.getElementById("lproject");
		larea.innerHTML = "";

		if (selectedValue == "") {
			larea.innerHTML = "Project is Not Selected.";
			document.getElementById("project").style.borderColor = "red";
			document.getElementById("uproject").style.color = "red";

		} else {
			document.getElementById("project").style.borderColor = "green";
			document.getElementById("uproject").style.color = "green";
		}

	}
	
	function selectModule() {
		var area = document.getElementById("module");
		var selectedValue = module.options[module.selectedIndex].value;
		var larea = document.getElementById("lmodule");
		larea.innerHTML = "";

		if (selectedValue == "") {
			larea.innerHTML = "Module is Not Selected.";
			document.getElementById("module").style.borderColor = "red";
			document.getElementById("umodule").style.color = "red";

		} else {
			document.getElementById("module").style.borderColor ="green";
			document.getElementById("umodule").style.color = "green";
		}

	}

	
	function selectProjectManager() {
		var area1 = document.getElementById("pm");
		var selectedValue1 = pm.options[pm.selectedIndex].value;
		var larea1 = document.getElementById("lpm");
		larea1.innerHTML = "";

		if (selectedValue1 == "") {
			larea1.innerHTML = "Tester is Not Selected.";
			document.getElementById("pm").style.borderColor = "red";
			document.getElementById("upm").style.color = "red";

		} else {
			document.getElementById("pm").style.borderColor = "green";
			document.getElementById("upm").style.color = "green";
		}

	}
	function validateForm() {

		var flag = 0;

		var area = document.getElementById("project");
		var selectedValue = project.options[project.selectedIndex].value;
		var larea = document.getElementById("lproject");
		var area1 = document.getElementById("pm");
		var selectedValue1 = pm.options[pm.selectedIndex].value;
		var larea1 = document.getElementById("lpm");
		
		var module=document.getElementById("module");
		var selectedv=module.options[module.selectedIndex].value;
		var modulel=document.getElementById("lmodule");
		modulel.innerHTML="";
		larea.innerHTML = "";
		larea1.innerHTML = "";
		
		if(selectedv==0){
			modulel.innerHTML="Module is not Created";
			document.getElementById("module").style.borderColor = "red";
			document.getElementById("umodule").style.color = "red";
			flag=1;
		}
		if(selectedv==""){
			modulel.innerHTML="Module is not Selected";
			document.getElementById("module").style.borderColor = "red";
			document.getElementById("umodule").style.color = "red";
			flag = 1;
		}else{
			document.getElementById("module").style.borderColor = "green";
			document.getElementById("umodule").style.color = "green";
			flag = 0;
		}
		if (selectedValue == "") {
			larea.innerHTML = "Project is Not Selected.";
			document.getElementById("project").style.borderColor = "red";
			document.getElementById("uproject").style.color = "red";
			flag = 1;
		} else {
			document.getElementById("project").style.borderColor = "green";
			document.getElementById("uproject").style.color = "green";
			flag = 0;
		}
		if (selectedValue1 == "") {
			larea1.innerHTML = "Tester is Not Selected.";
			document.getElementById("pm").style.borderColor = "red";
			document.getElementById("upm").style.color = "red";
			flag = 1;
		} else {
			document.getElementById("pm").style.borderColor = "green";
			document.getElementById("upm").style.color = "green";
			flag = 0;
		}
		if (flag == 1) {
			return false;
		} else {
			return true;
		}
	}
	$(document).ready(function() {

		$("#project").change(function() {
			var str = $("#project").val();
			var i=1;
			$.get("AllocateModules", {
				projectId : str,
				temp : i
			}).done(function(data) {
				$("#module").children().remove();
				var modules = jQuery.parseJSON(data);
				$.each(modules,function(key,value){
					
					$("#module").append('<option value='+value.moduleId+'>'+value.moduleName+'</option>');
				});
			});
		});
	});
</script>

<title>Allocate Project</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>

	<%
		List<ProjectDetails> project = (List) request.getAttribute("projectList");
	%>
	<%
		List<User> tester = (List) request.getAttribute("testerList");
	%>
	<div class="container-scroller">
		<!-- partial:../../partials/_navbar.jsp -->
		<%@include file="_navbar.jsp"%>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:../../partials/_sidebar.html -->
			<%@include file="projectmanagersidebar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="container-fluid page-body-wrapper full-page-wrapper">
						<div
							class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">

							<div class="row w-100">
								<div style="align-content: center;">
									<h1
										style="color: darkblue; font-family: Apple; font-style: italic; margin-left: 200px; text-align: center">
										<b><i class="bi bi-person-check" style="margin-right: 10px;"></i>Allocate Module</b>
									</h1>
									<div class="auto-form-wrapper"
										style="border: solid blue; margin-left: 200px; width: 800px; border-radius: 20px">
										<form action="ModuleAllocationTester">


											<div class="form-group">
												<label class="label" style="font-size: small;"><i class="bi bi-list-task" style="margin-right: 10px;"></i>Project
													List</label>
												<div class="input-group">
												<%if(project!=null){ %>
													<select title="Please select Project."
														onchange="selectProject();" class="form-control"
														id="project" style="font-size: small;" name="projectName">
														<option value="">Select Project</option>
														<%
															for (ProjectDetails p : project) {
														%>
														<option value="<%=p.getProjectId()%>"><%=p.getProjectName()%></option>
														<%
															}
														%>
													</select> <i id="uproject" class="mdi mdi-check-circle-outline"
														style="margin-left: 5px;"></i>
														<%}else{ %>
														<option value="">No Project Available</option>
													<%} %>

												</div>
												<span id="lproject" style="color: red; font-size: small;"></span>

											</div>

											<div class="form-group">
												<label class="label" style="font-size: small;"><i class="bi bi-file-earmark-post" style="margin-right: 10px;"></i>Project
													Module</label>
												<div class="input-group">
													<select title="Please select module."
														onchange="selectModule();" class="form-control"
														id="module" style="font-size: small;" name="moduleId">
														<option value="">Select Module</option>

													</select> <i id="umodule" class="mdi mdi-check-circle-outline"
														style="margin-left: 5px;"></i>

												</div>
												<span id="lmodule" style="color: red; font-size: small;"></span>

											</div>

											<div class="form-group">
												<label class="label" style="font-size: small;"><i class="bi bi-person-fill" style="margin-right: 10px;"></i>Tester
													List</label>
												<div class="input-group">
													<select title="Please select Developer."
														onchange="selectProjectManager();" class="form-control"
														id="pm" style="font-size: small;" name="testerId">
														<option value="">Select Tester</option>
														<%
															for (User pmanager : tester) {
														%>
														<option value="<%=pmanager.getUserId()%>"><%=pmanager.getUserName()%></option>
														<%
															}
														%>
													</select> <i id="upm" class="mdi mdi-check-circle-outline"
														style="margin-left: 5px;"></i>

												</div>
												<span id="lpm" style="color: red; font-size: small;"></span>
											</div>

											<div class="form-group">
												<input type="submit" onclick=" return validateForm();"
													class="btn btn-primary submit-btn btn-block"
													value="Allocate Module" />
											</div>
											<p class="footer-text text-center text-center">
												<a href="projectmanagerhome.jsp" 
													style="color: black; font-weight: bolder;"><i class="bi bi-reply-fill" style="margin-right: 10px;"></i>Go Back</a>
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