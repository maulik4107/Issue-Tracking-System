<%@page import="java.util.List"%>
<%@page import="com.issuetracker.bean.ProjectDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
	var flag = 0;

	function projectname() {
		var pname = document.getElementById("pid").value;
		var plabel = document.getElementById("plabel");
		plabel.innerHTML = "";

		if (pname.length <= 0) {
			document.getElementById("pid").style.borderColor = "red";
			plabel.innerHTML = "Enter Project Name.";
			flag = 1;
		} else {
			if (pname.length < 3) {
				plabel.innerHTML = "Please Enter at least 3 Character.";
				document.getElementById("pid").style.borderColor = "red";
				flag = 1;
			} else {
				document.getElementById("pid").style.borderColor = "green";
				flag = 0;
			}
		}

	}
	function checkdoc() {
		var pdes = document.getElementById("des").value;
		var dlabel = document.getElementById("dlabel");
		dlabel.innerHTML = "";
		if (pdes.length <= 0) {
			document.getElementById("des").style.borderColor = "red";
			dlabel.innerHTML = "Enter Description of Project.";
		} else {
			document.getElementById("des").style.borderColor = "green";
		}
	}

	function validateForm() {

		var pname = document.getElementById("pid").value;
		var sdt = document.getElementById("sdate").value;
		var edt = document.getElementById("edate").value;
		var pdes = document.getElementById("des").value;

		var plabel = document.getElementById("plabel");
		var sdlabel = document.getElementById("sdlabel");
		var edlabel = document.getElementById("edlabel");
		var dlabel = document.getElementById("dlabel");

		plabel.innerHTML = "";
		sdlabel.innerHTML = "";
		edlabel.innerHTML = "";
		dlabel.innerHTML = "";

		if (pname == "") {
			plabel.innerHTML = "Project Name is Empty.";
			document.getElementById("pid").style.borderColor = "red";
			flag = 1;
		}
		if (pname.length < 3) {
			plabel.innerHTML = "Please Enter at least 3 Character.";
			document.getElementById("pid").style.borderColor = "red";
			flag = 1;
		}
		if (sdt == "") {
			sdlabel.innerHTML = "Project Starting date is Empty.";
			document.getElementById("sdate").style.borderColor = "red";
			flag = 1;
		}else{
			sdlabel.innerHTML = "";
			document.getElementById("sdate").style.borderColor = "green";
			flag = 0;
		}
		if (edt == "") {
			document.getElementById("edate").style.borderColor = "red";
			edlabel.innerHTML = "Project Ending date is Empty.";
			flag = 1;
		}else{
			document.getElementById("edate").style.borderColor = "green";
			edlabel.innerHTML = "";
			flag = 0;
		}
		if (pdes == "") {
			dlabel.innerHTML = "Description is Empty.";
			document.getElementById("des").style.borderColor = "red";
			flag = 1;
		}if(pdes.length>0){
			
			document.getElementById("des").style.borderColor = "green";
		}
		if (flag == 1) {
			return false;
		} else {
			return true;
		}

	}
	$(".date").datepicker({
	    onSelect: function(dateText) {
	        console.log("Selected date: " + dateText + "; input's current value: " + this.value);
	    }
	});
</script>

<title>Edit Project</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<%ProjectDetails projectDetails = (ProjectDetails)request.getAttribute("projectDetails");%>
	<%List<ProjectDetails> managerNames = (List)request.getAttribute("managerNames");%>
	<%List<ProjectDetails> statusNames = (List)request.getAttribute("statusNames");%>
		
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
								<div class="col-lg-4" style="margin-left: 240px;">
									<h2
										style="color: darkblue; font-family: Apple; font-style: italic; margin-left: 165px;">
										<b>Edit Project</b>
									</h2>
									<div class="auto-form-wrapper"
										style="border: solid blue; border-radius: 20px; height: 690px; width: 600px;">
										<form action="UpdateProjectDetails" method="post" enctype="multipart/form-data">
											<div class="form-group">
												<label class="label">Project Name</label>
													<input type="hidden" value="<%=projectDetails.getProjectId()%>" name="pId">
													<input title="Enter Project Name." type="text" id="pid"
														class="form-control" placeholder="Project Name"
														style="font-size: small; size: 30px;" onkeyup="projectname();"
														name="pName" value="<%=projectDetails.getProjectName() %>">
												
												<span id="plabel" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<label class="label" style="font-size: small;">Project Manager</label>
												<div class="input-group">
													<select title="Please select Project Manager."
														onchange="selectProjectManager();" class="form-control" id="pm"
														style="font-size: small;" name="projectManager">
														<option value="<%=projectDetails.getPmId()%>"><%=projectDetails.getPmName() %></option>
														<%
															for (ProjectDetails pm : managerNames) {
														%>
														<option value="<%=pm.getPmId() %>"><%=pm.getPmName()%></option>
														<%
															}
														%>
													</select> 
												</div>
												<span id="lpm" style="color: red; font-size: small;"></span>

											</div>
											<div class="form-group">
												<label class="label" style="font-size: small;">Project Status</label>
												<div class="input-group">
<!-- 													<select title="Please select Project Status." -->
<!-- 														onchange="selectProjectStatus();" class="form-control" id="ps" -->
<!-- 														style="font-size: small;" name="projectStatus"> -->
														<input type="text" class="form-control" value="<%=projectDetails.getStatusName()%>" readonly="readonly" name="projectStatusName">
<%-- 														<option value="<%=projectDetails.getProjectStatus()%>" style="display:none"><%=projectDetails.getStatusName() %></option> --%>
<%-- 														<% --%>
<!--  															for (ProjectDetails pm : statusNames) { -->
<%-- 														%> --%>
<%-- 														<option value="<%=pm.getProjectStatus()%>"  ><%=pm.getStatusName()%></option> --%>
<%-- 														<% --%>
<!--  															} -->
<%-- 														%> --%>
<!-- 													</select>  -->
														<input type="hidden" value="<%=projectDetails.getProjectStatus()%>" readonly="readonly" name="projectStatus">

												</div>
												<span id="lpm" style="color: red; font-size: small;"></span>

											</div>
											<%if(projectDetails.getDocumentString()==null){ %>
											Document not uploaded.
											<%}else{ %>
											<div class="form-group form-control">
											<label class="label">Document uploaded you can download it.<a href="DownloadPDF?pid=<%=projectDetails.getProjectId()%>&pname=<%=projectDetails.getProjectName()%>"><h5><i class="bi bi-download"></i></h5></a></label>
											</div>
											<%} %>
											<div class="form-group">
												<label class="label">Document (Optional)</label>
												
													<input type="file" title="Attach Document" id="doc"
														class="form-control" placeholder="Document"
														style="font-size: small;" name="pdocument" value="<%=projectDetails.getDocumentString()%>"> 
												
												<span id="clabel" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group" style="size:50px">
												<label class="label">Starting Date</label>
												
													<input type="date" id="sdate" value="<%=projectDetails.getProjectSd()%>" class="form-control"
														placeholder="dd/mm/yyyy" style="font-size: small;size: 30px;"
														name="sdate" > 
												<span id="sdlabel" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<label class="label">Ending Date</label>
												
													<input type="date" id="edate" class="form-control" value="<%=projectDetails.getProjectEd()%>"
														placeholder="dd/mm/yyyy" style="font-size: small;size: 30px;"
														name="edate"> 
												
												<span id="edlabel" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<label class="label">Description</label>
												
													<input type="text" id="des" class="form-control" value="<%=projectDetails.getProjectDes() %>"
														placeholder="Description" style="font-size: small;size: 30px;"
														name="description" onkeyup="checkdoc();"> 
												
												<span id="dlabel" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<input type="submit" onclick=" return validateForm();"
													class="btn btn-primary submit-btn btn-block"
													value="Save Changes" />
											</div>
											<p class="footer-text text-center text-center">
												<a href="GetProjectList?id=0" target="_blank"
													style="color: black; font-weight: bolder;">Go Back</a>
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