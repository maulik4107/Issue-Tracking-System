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
</script>

<title>Assign Issue to Developer</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
<div class="se-pre-con"></div>
	<%
		int issueId = (Integer) request.getAttribute("issueId");
	%>
	<%
		int developerId = (Integer) request.getAttribute("developerId");
	%>
	<%
		int statusId = (Integer) request.getAttribute("statusId");
	%>
	<%
		String developerName = (String) request.getAttribute("developerName");
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
										<b><i class="bi bi-pencil-square"
											style="margin-right: 10px;"></i>Edit Issue</b>
									</h2>
									<div class="auto-form-wrapper"
										style="border: solid blue; margin-left: 200px; width: 800px; border-radius: 20px">
										<form action="UpdateDIssueDetails" method="post">

											<input type="hidden" value="<%=issueId%>" name="issueId">
											<input type="hidden" value="<%=statusId%>" name="statusId">

											<div class="form-group">
												<label class="label" style="font-size: small;"><i
													class="bi bi-file-earmark-post" style="margin-right: 10px;"></i>Issue
													impact</label>
												<div class="input-group">
													<select title="Please select impact."
														onchange="selectImpact();" class="form-control"
														id="impact" style="font-size: small;" name="issueImpact">

														<option value="Select Impact">- Select Issue
															Impact -</option>
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

														<option value="Select Priority">- Select Issue
															Priority -</option>

														<option value="Broker">Broker</option>
														<option value="Critical">Critical</option>
														<option value="Minor">Minor</option>
														<option value="Major">Major</option>

													</select>

												</div>
												<span id="lpriority" style="color: red; font-size: small;"></span>

											</div>


											<div class="form-group">
												<label class="label" style="font-size: small;">Developer</label>
												<div class="input-group">
													<select title="Please select Developer."
														onchange="selectDeveloper();" class="form-control"
														id="developer" style="font-size: small;"
														name="developerId">

														<option value="Select Developer">- Select
															Developer -</option>
														<option value="<%=developerId%>"><%=developerName%></option>
													</select>
												</div>
												<span id="ldeveloper" style="color: red; font-size: small;"></span>

											</div>
											<div class="form-group">
												<input type="submit" onclick=" return validateForm();"
													class="btn btn-primary submit-btn btn-block"
													value="Save Changes" />
											</div>
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