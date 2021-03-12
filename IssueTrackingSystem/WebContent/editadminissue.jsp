<%@page import="java.util.List"%>
<%@page import="com.issuetracker.bean.Issue"%>
<%@page import="com.issuetracker.bean.User"%>
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
			plabel.innerHTML = "Enter Issue Name.";
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
			dlabel.innerHTML = "Enter Description of Issue.";
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
			plabel.innerHTML = "Issue Name is Empty.";
			document.getElementById("pid").style.borderColor = "red";
			flag = 1;
		}
		if (pname.length < 3) {
			plabel.innerHTML = "Please Enter at least 3 Character.";
			document.getElementById("pid").style.borderColor = "red";
			flag = 1;
		}
		if (sdt == "") {
			sdlabel.innerHTML = "Issue Creating date is Empty.";
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
		if (pdes == "") {
			dlabel.innerHTML = "Description is Empty.";
			document.getElementById("des").style.borderColor = "red";
			flag = 1;
		}
		if (pdes.length > 0) {

			document.getElementById("des").style.borderColor = "green";
		}
		if (flag == 1) {
			return false;
		} else {
			return true;
		}

	}
	$(document).ready(function() {
		$('#sdate').change(function() {
			var sdlabel = document.getElementById("sdlabel");
			document.getElementById("sdate").style.borderColor = "green";
			sdlabel.innerHTML = "";
		});
	});
	$(document).ready(function() {
		$('#edate').change(function() {
			var edlabel = document.getElementById("edlabel");
			document.getElementById("edate").style.borderColor = "green";
			edlabel.innerHTML = "";
		});
	});
</script>

<title>Edit Issue</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<%
		Issue issue = (Issue) request.getAttribute("issue");
	%>
	<%
		int pid = (Integer) request.getAttribute("pid");
	%>
	<%
		List<User> dList = (List) request.getAttribute("dList");
	%>
	<%
		List<User> tList = (List) request.getAttribute("tList");
	%>
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
									<h2
										style="color: darkblue; font-family: Apple; font-style: italic; margin-left: 200px; text-align: center">
										<b>Edit Issue</b>
									</h2>
									<div class="auto-form-wrapper"
										style="border: solid blue; margin-left: 200px; width: 800px; border-radius: 20px">
										<form action="UpdateIssueDetailsAdmin" method="post"
											enctype="multipart/form-data">
											<div class="form-group">
												<label class="label">Issue Name</label> <input type="hidden"
													value="<%=issue.getIssueId()%>" name="IssueId"> <input
													title="Enter Issue Name." type="text" id="pid"
													class="form-control" placeholder="Issue Name"
													style="font-size: small; size: 30px;"
													onkeyup="projectname();" name="pName"
													value="<%=issue.getIssueName()%>"> <span
													id="plabel" style="color: red; font-size: small;"></span>
											</div>

											<div class="form-group">
												<label class="label" style="font-size: small;"><i
													class="bi bi-file-earmark-post" style="margin-right: 10px;"></i>Issue
													impact</label>
												<div class="input-group">
													<select title="Please select impact."
														onchange="selectModule();" class="form-control"
														id="module" style="font-size: small;" name="moduleId">
														<%
															if (issue.getIssueImpact() != null) {
														%>
														<option value=<%=issue.getIssueImpact()%>><%=issue.getIssueImpact()%></option>
														<%
															} else {
														%>
														<option value="Not">Not Decided Yet</option>
														<%
															}
														%>
														<option value="High">High</option>
														<option value="Medium">Medium</option>
														<option value="Low">Low</option>

													</select>

												</div>
												<span id="lmodule" style="color: red; font-size: small;"></span>

											</div>

											<div class="form-group">
												<label class="label" style="font-size: small;"><i
													class="bi bi-file-earmark-post" style="margin-right: 10px;"></i>Issue
													Priority</label>
												<div class="input-group">
													<select title="Please select priority."
														onchange="selectModule();" class="form-control"
														id="module" style="font-size: small;" name="priority">
														<%
															if (issue.getIssuePriority() != null) {
														%>
														<option value="<%=issue.getIssuePriority()%>"><%=issue.getIssuePriority()%></option>
														<%
															} else {
														%>
														<option value="Not">Not decided Yet</option>
														<%
															}
														%>
														<option value="Broker">Broker</option>
														<option value="Critical">Critical</option>
														<option value="Minor">Minor</option>
														<option value="Major">Major</option>

													</select>

												</div>
												<span id="lmodule" style="color: red; font-size: small;"></span>

											</div>


											<%
												if (issue.getDocumentString() != null) {
											%>
											<div class="form-group">
												<img
													style="border-radius: 00px; border: 1px dotted black; height: 100px; width: 150px"
													src="data:image/png;base64,<%=issue.getDocumentString()%>">
											</div>
											<%
												} else {
											%>
											<p style="font-family: apple; font-weight: bolder;">Document not uploaded yet.</p>
											<%
												}
											%>
											<div class="form-group">
												<label class="label">Document</label> <input type="file"
													title="Attach Document" id="doc" class="form-control"
													placeholder="Document" style="font-size: small;"
													name="pdocument" value="<%=issue.getDocumentString()%>">
												<span id="clabel" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<label class="label" style="font-size: small;">Issue
													Status</label>
												<div class="input-group">
													<input type="text" class="form-control"
														value="<%=issue.getIssueStatusName()%>"
														readonly="readonly" name="projectStatusName"> <input
														type="hidden" value="<%=issue.getIssueStatusId()%>"
														readonly="readonly" name="projectStatus">

												</div>
												<span id="lpm" style="color: red; font-size: small;"></span>

											</div>
											<div class="form-group">
												<label class="label" style="font-size: small;">Developer</label>
												<div class="input-group">
													<select title="Please select Developer."
														onchange="selectProjectManager();" class="form-control"
														id="pm" style="font-size: small;" name="developerid">
														<%if(issue.getDeveloperName()!=null) {%>
														<option value=<%=issue.getDeveloperId()%>><%=issue.getDeveloperName()%></option>
														<%}else{ %>
														<option value=0>Not Assigned Yet</option>
														<%} %>
														<%
															for (User u : dList) {
														%>
														<option value="<%=u.getUserId()%>"><%=u.getUserName()%></option>
														<%
															}
														%>
													</select>
												</div>
												<span id="lpm" style="color: red; font-size: small;"></span>

											</div>

											<div class="form-group">
												<label class="label" style="font-size: small;">Tester</label>
												<div class="input-group">
													<select title="Please select Tester."
														onchange="selectProjectManager();" class="form-control"
														id="pm" style="font-size: small;" name="testerid">
														<%if(issue.getTesterName()!=null){ %>
														<option value=<%=issue.getTesterId()%>><%=issue.getTesterName()%></option>
														<%}else{ %>
														<option value=0>Not Assigned Yet</option>
														<%} %>
														<%
															for (User u : tList) {
														%>
														<option value="<%=u.getUserId()%>"><%=u.getUserName()%></option>
														<%
															}
														%>
													</select>
												</div>
												<span id="lpm" style="color: red; font-size: small;"></span>

											</div>

											<div class="form-group" style="size: 50px">
												<label class="label">Created Date</label> <input type="date"
													id="sdate" value="<%=issue.getIssueCreatedDate()%>"
													class="form-control" placeholder="dd/mm/yyyy"
													style="font-size: small; size: 30px;" name="sdate">
												<span id="sdlabel" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<label class="label">Module</label> <input type="text"
													id="des" class="form-control"
													value="<%=issue.getModuleName()%>"
													placeholder="Description"
													style="font-size: small; size: 30px;" name="description"
													onkeyup="checkdoc();" readonly="readonly"> <span
													id="dlabel" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<label class="label">Description</label> <input type="text"
													id="des" class="form-control"
													value="<%=issue.getIssueDes()%>" placeholder="Description"
													style="font-size: small; size: 30px;" name="description"
													onkeyup="checkdoc();"> <span id="dlabel"
													style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<input type="submit" onclick=" return validateForm();"
													class="btn btn-primary submit-btn btn-block"
													value="Save Changes" />
											</div>
											<p class="footer-text text-center text-center">
												<a href="EditIssueAdminDetails?id=<%=issue.getIssueId()%>&pid=<%=pid%>"
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