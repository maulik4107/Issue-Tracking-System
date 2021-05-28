<%@page import="com.issuetracker.bean.IssueStatus"%>
<%@page import="com.issuetracker.bean.Issue"%>
<%@page import="com.issuetracker.bean.ProjectDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
	function getMid(mid) {
		
		var moduleId = mid;
		document.getElementById("moduleid").setAttribute("value", moduleId);
	}
	$(document).ready(
			function() {
				$(".IssueStatusSelection").change(
						function() {
							var opval = $(this).val();
							var issueId = $(this).data('id');
							if (opval == 2) {
								$("#exampleModalCenter").modal("show");
								$("#modelIssueId").val(issueId);

								document.getElementById("statusid")
										.setAttribute("value", opval);
							}
							else {
								var proid=document.getElementById("projectId").value;
								var pmid=document.getElementById("pmIdvalue").value;
								$("#otherStatus").modal("show");
								if(opval==21)
								{
									var strLink = "UpdatePMIssueStatus?issueId=" + issueId+"&statusId="+opval+"&projectID="+proid+"&projectMId="+pmid+"&checkClose="+1;
									document.getElementById("rejectid").setAttribute("href", strLink);
								}
								else
								{
									var strLink = "UpdatePMIssueStatus?issueId=" + issueId+"&statusId="+opval+"&projectID="+proid+"&projectMId="+pmid+"&checkClose="+0;
									document.getElementById("rejectid").setAttribute("href", strLink);
								}
							}
						});

			});
</script>
<title>Change Issue Status</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<div class="se-pre-con"></div>
	<%
		int cnt = 0;
	%>
	<%
		List<Issue> issueList = (List) request.getAttribute("issueList");
	%>
	<%
		int proId = (Integer) request.getAttribute("proId");
	%>
	<%
		int pmid = (Integer) request.getAttribute("pmid");
	%>

	<%
		String msg = (String) request.getAttribute("statusChange");
	%>
	<%
		String StatusChange = (String) request.getAttribute("ChangeStatus");
	%>
	<div class="container-scroller">
		<%@include file="_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<%@include file="projectmanagersidebar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper"
					style="background-image: url(pages/samples/buglogof.png); background-repeat: no-repeat; background-position: center; background-size: 550px;">
					<h1 class="h3 mb-2 text-gray-800">Issue Tracking System</h1>
					<p class="mb-4">Issue Details</p>
					<%
						if (msg != null) {
					%>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 30px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=msg%>
						</h2>
					</marquee>
					<%
						}
					%>
					<%
						if (StatusChange != null) {
					%>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 30px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=StatusChange%>
						</h2>
					</marquee>
					<%
						}
					%>
					<div class="card shadow mb-4">
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Issue</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0" style="border: black;">
										<thead>
											<tr>
												<th>Sr. No</th>
												<th>Issue Name</th>
												<th>Impact</th>
												<th>Priority</th>
												<th>Starting Date</th>
												<th>Closed Date</th>
												<th>Current Status</th>
												<th>Developer</th>
												<th>Tester</th>
												<th>Module Name</th>
												<th>Change Issue Status</th>
											</tr>
										</thead>
										<tbody>
											<%
												for (Issue i : issueList) {
											%>
											<%
												cnt = cnt + 1;
											%>
											<tr>
												<td><%=cnt%></td>
												<td><%=i.getIssueName()%></td>
												<%
													if (i.getIssueImpact() != null) {
												%>
												<td><%=i.getIssueImpact()%></td>
												<%
													} else {
												%>
												<td>Not Decided Yet</td>
												<%
													}
												%>
												<%
													if (i.getIssuePriority() != null) {
												%>
												<td><%=i.getIssuePriority()%></td>
												<%
													} else {
												%>
												<td>Not Decided Yet</td>
												<%
													}
												%>
												<td><%=i.getIssueCreatedDate()%></td>
												<%
													if (i.getIssueCloseDate() != null) {
												%>
												<td><%=i.getIssueCloseDate()%></td>
												<%
													} else {
												%>
												<td>Not Closed Yet</td>
												<%
													}
												%>
												<td><%=i.getIssueStatusName()%></td>
												<%
													if (i.getDeveloperId() != 0) {
												%>
												<td><%=i.getDeveloperName()%></td>
												<%
													} else {
												%>
												<td>Not Assigned Yet</td>
												<%
													}
												%>
												<%
													if (i.getTesterId() != 0) {
												%>
												<td><%=i.getTesterName()%></td>
												<%
													} else {
												%>
												<td>Not Assigned Yet</td>
												<%
													}
												%>
												<td><%=i.getModuleName()%></td>

												<td>
													<%
														if (i.getIssueStatusId() == 21 || i.getIssueStatusId() == 3) {
													%> No Status Available <%
														} else {
													%> <select title="Please select Issue Status."
													class="form-control IssueStatusSelection"
													onclick="getMid(<%=i.getModuleId()%>);" id="IssueStatusid"
													style="font-size: small;" name="IssueStatusId"
													data-id="<%=i.getIssueId()%>">
														<option value=0>- Select Issue Status -</option>
														<%
															for (IssueStatus issueStatus : i.getIssueStatusBean()) {
														%>
														<option value="<%=issueStatus.getStatusId()%>"><%=issueStatus.getStatusName()%></option>

														<%
															}
														%>
												</select> <%
 	}
 %>
												</td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="modal fade" id="exampleModalCenter" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalCenterTitle"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">Change
											Issue Status</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">

										<form action="UpdateDIssueDetails">

											<input type="hidden" id="statusid" name="statusId"> <input
												type="hidden" id="modelIssueId" name="issueId"> <input
												type="hidden" id="moduleid" name="moduleId"> <input
												type="hidden" value="<%=proId%>" name="proId" id="projectId">
											<input type="hidden" value="<%=pmid%>" name="pmid"
												id="pmIdvalue">

											<div class="form-group">
												<label class="label" style="font-size: small;"><i
													class="bi bi-file-earmark-post" style="margin-right: 10px;"></i>Issue
													impact</label>
												<div class="input-group">
													<select title="Please select impact."
														onchange="selectImpact();" class="form-control"
														id="impact" style="font-size: small;" name="issueImpact">

														<option value="Not Decided yet">- Select Issue
															Impact -</option>
														<option value="High">High</option>
														<option value="Medium">Medium</option>
														<option value="Low">Low</option>

													</select>
												</div>
												<span id="impactl" style="color: red; font-size: small;"></span>
											</div>

											<div class="form-group">
												<label class="label" style="font-size: small;"><i
													class="bi bi-file-earmark-post" style="margin-right: 10px;"></i>Issue
													Priority</label>
												<div class="input-group">
													<select title="Please select priority."
														onchange="selectPriority();" class="form-control"
														id="priority" style="font-size: small;" name="priority">

														<option value="Not Decided yet">- Select Issue
															Priority -</option>

														<option value="Broker">Broker</option>
														<option value="Critical">Critical</option>
														<option value="Minor">Minor</option>
														<option value="Major">Major</option>

													</select>

												</div>
												<span id="priorityl" style="color: red; font-size: small;"></span>

											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">cancel</button>
												<input type="submit" onclick="return validateForm();"
													class="btn btn-primary" value="submit">

											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="modal fade" id="otherStatus" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalCenterTitle"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="exampleModalLongTitle">
											<i class="bi bi-exclamation-triangle"></i>Warning
										</h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">Status of issue is going to be
										change to Close State.</div>
									<div class="modal-body">Are you sure want to change ?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">
											<i class="bi bi-x"></i>cancel
										</button>
										<button type="button" class="btn btn-primary">
											</i><a style="color: white;" id="rejectid"><i
												class="bi bi-check-circle-fill" style="margin-right: 10px;"></i>Yes</a>
										</button>
									</div>
								</div>
							</div>
						</div>

						<a href="ChangeIssueStatusPM?id=<%=pmid%>"
							style="color: darkblue; font-weight: bolder; margin-left: 530px;"><i
							class="bi bi-reply-fill" style="margin-right: 10px;"></i> Go Back
						</a>
					</div>
				</div>
			</div>
		</div>
		<%@include file="commonjspluggins.jsp"%>
</body>
</html>