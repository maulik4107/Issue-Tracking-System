<%@page import="com.issuetracker.bean.ProjectDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
	var flag = 0;

	function modulename() {
		var mname = document.getElementById("mid").value;
		var mlabel = document.getElementById("mlabel");
		mlabel.innerHTML = "";

		if (mname.length <= 0) {
			document.getElementById("mid").style.borderColor = "red";
			mlabel.innerHTML = "Enter Module Name.";
			flag = 1;
		} else {
			if (mname.length < 3) {
				mlabel.innerHTML = "Please Enter at least 3 Character.";
				document.getElementById("mid").style.borderColor = "red";
				flag = 1;
			} else {
				document.getElementById("mid").style.borderColor = "green";
				flag = 0;
			}
		}
	}
	function selectProject() {
		var area1 = document.getElementById("project");
		var selectedValue1 = project.options[project.selectedIndex].value;
		var larea1 = document.getElementById("projects");
		larea1.innerHTML = "";

		if (selectedValue1 == "") {
			larea1.innerHTML = "Project is Not Selected.";
			document.getElementById("project").style.borderColor = "red";
			flag=1;
		} else {
			document.getElementById("project").style.borderColor = "green";
			flag=0;
		}

	}

	function checkdoc() {
		var pdes = document.getElementById("des").value;
		var dlabel = document.getElementById("dlabel");
		dlabel.innerHTML = "";
		if (pdes.length <= 0) {
			document.getElementById("des").style.borderColor = "red";
			dlabel.innerHTML = "Enter Description of Module.";
			flag=1;
		} else {
			document.getElementById("des").style.borderColor = "green";
			flag=0;
		}
	}
	
	function validateDetails() {
		
		var mname = document.getElementById("mid").value;
		var sdt = document.getElementById("sdate").value;
		var edt = document.getElementById("edate").value;
		var selectedValue1 = project.options[project.selectedIndex].value;
		var larea1 = document.getElementById("projects");

		var mlabel = document.getElementById("mlabel");
		var sdlabel = document.getElementById("sdlabel");
		var edlabel = document.getElementById("edlabel");

		mlabel.innerHTML = "";
		sdlabel.innerHTML = "";
		edlabel.innerHTML = "";
		larea1.innerHTML = "";

		if (mname == "") {
			mlabel.innerHTML = "Module Name is Empty.";
			document.getElementById("mid").style.borderColor = "red";
			flag = 1;
		}
		if (mname.length < 3) {
			mlabel.innerHTML = "Please Enter at least 3 Character.";
			document.getElementById("mid").style.borderColor = "red";
			flag = 1;
		}
		if (sdt == "") {
			sdlabel.innerHTML = "Project Starting date is Empty.";
			document.getElementById("sdate").style.borderColor = "red";
			flag = 1;	
		} else {
			sdlabel.innerHTML = "";
			document.getElementById("sdate").style.borderColor = "green";
			flag = 0;
		}
		if (edt == "") {
			document.getElementById("edate").style.borderColor = "red";
			edlabel.innerHTML = "Project Ending date is Empty.";
			flag = 1;
		} else {
			document.getElementById("edate").style.borderColor = "green";
			edlabel.innerHTML = "";
			flag = 0;
		}
		if (selectedValue1 == "") {
			larea1.innerHTML = "Project is Not Selected.";
			document.getElementById("project").style.borderColor = "red";
			flag = 1;
		} else {
			document.getElementById("project").style.borderColor = "green";
			flag = 0;
		}
		var pdes = document.getElementById("des").value;
		var dlabel = document.getElementById("dlabel");
		dlabel.innerHTML = "";
		if (pdes.length <= 0) {
			document.getElementById("des").style.borderColor = "red";
			dlabel.innerHTML = "Enter Description of Module.";
			flag=1;
		} else {
			document.getElementById("des").style.borderColor = "green";
			flag=0;
		}
		if(flag==1){
			return false;
		}else{
			return true;
		}

	}
	$(document).ready(function() {
        $('#sdate').change(function () {
        	var sdlabel = document.getElementById("sdlabel");
        	document.getElementById("sdate").style.borderColor = "green";
        	sdlabel.innerHTML = "";
            //console.log($('#date-daily').val());
        });
    });
 $(document).ready(function() {
        $('#edate').change(function (){
        	var edlabel = document.getElementById("edlabel");
        	document.getElementById("edate").style.borderColor = "green";
        	edlabel.innerHTML = "";
            //console.log($('#date-daily').val());
        });
    });
</script>

<title>Create Module</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>

	<%
		List<ProjectDetails> project = (List) request.getAttribute("pList");
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
										<b><i class="bi bi-file-earmark-post-fill" style="margin-right: 10px;"></i>Create Module</b>
									</h1>
									<div class="auto-form-wrapper"
										style="border: solid blue; margin-left: 200px; width: 800px; border-radius: 20px">
										<form action="CreateModule" method="post">

											<div class="form-group">
												<label class="label" style="font-size: small;"><i class="bi bi-file-ppt" style="margin-right: 10px;"></i>Projects
													</label>
												<div class="input-group">
													<select title="Please select Project"
														onchange="selectProject();" class="form-control"
														id="project" style="font-size: small;" name="project">
														<option value="">Select Project</option>
														<%
															for (ProjectDetails p : project) {
														%>
														<option value="<%=p.getProjectId()%>"><%=p.getProjectName()%></option>
														<%
															}
														%>
													</select> 

												</div>
												<span id="projects" style="color: red; font-size: small;"></span>

											</div>

											<div class="form-group">
												<label class="label"><i class="bi bi-file-earmark-post" style="margin-right: 10px;"></i>Module Name</label> <input
													title="Enter Module Name." type="text" id="mid"
													class="form-control" placeholder="Module Name"
													style="font-size: small; size: 30px;"
													onkeyup="modulename();" name="pname"> <span
													id="mlabel" style="color: red; font-size: small;"></span>
											</div>

											<div class="form-group" style="size: 50px">
												<label class="label"><i class="bi bi-calendar-date" style="margin-right: 10px;"></i>Starting Date</label> <input
													type="date" id="sdate" class="form-control"
													placeholder="dd/mm/yyyy"
													style="font-size: small; size: 30px;" name="sdate">
												<span id="sdlabel" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<label class="label"><i class="bi bi-calendar-date" style="margin-right: 10px;"></i>Ending Date</label> <input type="date"
													id="edate" class="form-control" placeholder="dd/mm/yyyy"
													style="font-size: small; size: 30px;" name="edate">

												<span id="edlabel" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<label class="label"><i class="bi bi-chat-square-text" style="margin-right: 10px;"></i>Description</label> <input type="text"
													id="des" class="form-control" placeholder="Description"
													style="font-size: small; size: 30px;" name="description"
													onkeyup="checkdoc();"> <span id="dlabel"
													style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<input type="submit" onclick="return validateDetails();"
													class="btn btn-primary submit-btn btn-block"
													value="Create Module" />
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