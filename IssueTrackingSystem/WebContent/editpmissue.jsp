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
	function selectImpact() {
		var area = document.getElementById("impact");
		var selectedValue = impact.options[impact.selectedIndex].value;
		var larea = document.getElementById("limpact");
		larea.innerHTML = "";

		if (selectedValue == "") {
			larea.innerHTML = "Impact is Not Selected.";
			document.getElementById("impact").style.borderColor = "red";
		} else {
			document.getElementById("impact").style.borderColor = "green";
		}

	}
	function selectPriority() {
		var area = document.getElementById("priority");
		var selectedValue = priority.options[priority.selectedIndex].value;
		var larea = document.getElementById("lpriority");
		larea.innerHTML = "";

		if (selectedValue == "") {
			larea.innerHTML = "Priority is Not Selected.";
			document.getElementById("priority").style.borderColor = "red";
		} else {
			document.getElementById("priority").style.borderColor = "green";
		}

	}
	function selectDeveloper() {
		var area = document.getElementById("developer");
		var selectedValue = developer.options[developer.selectedIndex].value;
		var larea = document.getElementById("ldeveloper");
		larea.innerHTML = "";

		if (selectedValue == "") {
			larea.innerHTML = "Developer is Not Selected.";
			document.getElementById("developer").style.borderColor = "red";
		} else {
			document.getElementById("developer").style.borderColor = "green";
		}

	}
	function selectTester() {
		var area = document.getElementById("tester");
		var selectedValue = tester.options[tester.selectedIndex].value;
		var larea = document.getElementById("ltester");
		larea.innerHTML = "";

		if (selectedValue == 0) {
			larea.innerHTML = "Tester is Not Selected.";
			document.getElementById("tester").style.borderColor = "red";
		} else {
			document.getElementById("tester").style.borderColor = "green";
		}

	}
	function checkdoc() {
		var pdes = document.getElementById("des").value;
		var dlabel = document.getElementById("dlabel");
		dlabel.innerHTML = "";
		if (pdes.length <= 0) {
			document.getElementById("des").style.borderColor = "red";
			dlabel.innerHTML = "Enter Description of Issue.";
			flag = 1;
		} else {
			document.getElementById("des").style.borderColor = "green";
			flag = 0;
		}
	}

	function validateForm() {

		var pname = document.getElementById("pid").value;
		var pdes = document.getElementById("des").value;

		var plabel = document.getElementById("plabel");
		var dlabel = document.getElementById("dlabel");

		plabel.innerHTML = "";
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
	$(document).on('click', '.data-enlargeable', function() {
		var src = $(this).attr('src');
		var modal;
		function removeModal() {
			modal.remove();
			$('body').off('keyup.modal-close');
		}
		modal = $('<div>').css({
			background : 'RGBA(0,0,0,.5) url(' + src + ') no-repeat center',
			backgroundSize : 'contain',
			width : '100%',
			height : '100%',
			position : 'fixed',
			zIndex : '10000',
			top : '0',
			left : '0',
			cursor : 'zoom-out'
		}).click(function() {
			removeModal();
		}).appendTo('body');
		//handling ESC
		$('body').on('keyup.modal-close', function(e) {
			if (e.key === 'Escape') {
				removeModal();
			}
		});
	});
</script>

<title>Edit Issue</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
<div class="se-pre-con"></div>
	<%
		Issue issue = (Issue) request.getAttribute("issue");
	%>
	<%
		int proId = (Integer) request.getAttribute("proId");
	%>
	<%
		int pmid = (Integer) request.getAttribute("pmid");
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
			<%@include file="projectmanagersidebar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="container-fluid page-body-wrapper full-page-wrapper">
						<div
							class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">

							<div class="row w-100">
								<div style="align-content: center;">
									<h2
										style="color: darkblue; font-family: Apple; font-style: italic; margin-left: 200px; text-align: center">
										<b><i class="bi bi-pencil-square" style="margin-right: 10px;"></i>Edit Issue</b>
									</h2>
									<div class="auto-form-wrapper"
										style="border: solid blue; margin-left: 200px; width: 800px; border-radius: 20px">
										<form action="UpdateIssueDetailsAdmin" method="post"
											enctype="multipart/form-data">
											
											<input type="hidden" value="pm" name="identity">
											
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
														onchange="selectImpact();" class="form-control"
														id="impact" style="font-size: small;" name="moduleId">
														<%
															if (issue.getIssueImpact() != null) {
														%>
														<option value=<%=issue.getIssueImpact()%>><%=issue.getIssueImpact()%></option>
														<%
															} else {
														%>
														<option value="Not Decided Yet">Not Decided Yet</option>
														<%
															}
														%>
														<option value="High">High</option>
														<option value="Medium">Medium</option>
														<option value="Low">Low</option>

													</select>

												</div>
												<span id="limpact" style="color: red; font-size: small;"></span>

											</div>

											<div class="form-group">
												<label class="label" style="font-size: small;"><i
													class="bi bi-file-earmark-post" style="margin-right: 10px;"></i>Issue
													Priority</label>
												<div class="input-group">
													<select title="Please select priority."
														onchange="selectPriority();" class="form-control"
														id="priority" style="font-size: small;" name="priority">
														<%
															if (issue.getIssuePriority() != null) {
														%>
														<option value="<%=issue.getIssuePriority()%>"><%=issue.getIssuePriority()%></option>
														<%
															} else {
														%>
														<option value="Not Decided Yet">Not decided Yet</option>
														<%
															}
														%>
														<option value="Broker">Broker</option>
														<option value="Critical">Critical</option>
														<option value="Minor">Minor</option>
														<option value="Major">Major</option>

													</select>

												</div>
												<span id="lpriority" style="color: red; font-size: small;"></span>

											</div>


											<%
												if (issue.getDocumentString() != null) {
											%>
											<div class="form-group">
												<img
													class="data-enlargeable" width="100"
													style="cursor: zoom-in"
													src="data:image/png;base64,<%=issue.getDocumentString()%>">
											</div>
											<%
												} else {
											%>
											<p style="font-family: apple; font-weight: bolder;">Image
												not uploaded yet.</p>
											<%
												}
											%>
											<div class="form-group">
												<label class="label">Image</label> <input type="file"
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
														onchange="selectDeveloper();" class="form-control"
														id="developer" style="font-size: small;"
														name="developerid">
														<%
															if (issue.getDeveloperName() != null) {
														%>
														<option value=<%=issue.getDeveloperId()%>><%=issue.getDeveloperName()%></option>
														<%
															} else {
														%>
														<option value=0>Not Assigned Yet</option>
														<%
															}
														%>
														<%
															for (User u : dList) {
														%>
														<option value="<%=u.getUserId()%>"><%=u.getUserName()%></option>
														<%
															}
														%>
													</select>
												</div>
												<span id="ldeveloper" style="color: red; font-size: small;"></span>

											</div>

											<div class="form-group">
												<label class="label" style="font-size: small;">Tester</label>
												<div class="input-group">
													<select title="Please select Tester."
														onchange="selectTester();" class="form-control"
														id="tester" style="font-size: small;" name="testerid">
														<%
															if (issue.getTesterName() != null) {
														%>
														<option value=<%=issue.getTesterId()%>><%=issue.getTesterName()%></option>
														<%
															} else {
														%>
														<option value=0>Not Assigned Yet</option>
														<%
															}
														%>
														<%
															for (User u : tList) {
														%>
														<option value="<%=u.getUserId()%>"><%=u.getUserName()%></option>
														<%
															}
														%>
													</select>
												</div>
												<span id="ltester" style="color: red; font-size: small;"></span>

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
													id="description" class="form-control"
													value="<%=issue.getModuleName()%>"
													placeholder="Description"
													style="font-size: small; size: 30px;" name="description"
													onkeyup="checkdoc();" readonly="readonly"> <span
													id="dlabelo" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<label class="label">Description</label> <input type="text"
													id="des" class="form-control"
													value="<%=issue.getIssueDes()%>" placeholder="Description"
													style="font-size: small; size: 30px;" name="des"
													onkeyup="checkdoc();"> <span id="dlabel"
													style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<input type="submit" onclick=" return validateForm();"
													class="btn btn-primary submit-btn btn-block"
													value="Save Changes" />
											</div>
											<p class="footer-text text-center text-center">
												<a
													href="GetProjectManagerIssue?projectId=<%=proId%>&pmid=<%=pmid%>"
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