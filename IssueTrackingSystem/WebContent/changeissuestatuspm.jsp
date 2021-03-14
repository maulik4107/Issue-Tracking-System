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

	function changeIssueStatus(mId,issuesId) {
		
		var issuestatusId = $("#IssueStatusId").val();
		var issueid = issuesId;
		var moduleid = mId;
		
		alert("Status Id : " + issuestatusId);
		alert("Issue Id : " + issueid);
		alert("Module Id : " + moduleid);
		
		if (issuestatusId == 2) {
			$.ajax({
				method : "Post",
				url : "AssignIssueToDeveloper",
				data : { statusId : issuestatusId , issueId : issueid , moduleId : moduleid}
			});
		} else {
			$.ajax({
				method : "Post",
				url : "UpdatePMIssueStatus",
				data : { statusId : issuestatusId , issueId : issueid}
			});
		}
	}
</script>
<title>Change Issue Status</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
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
												<th>Ending Date</th>
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
												<td><select title="Please select Issue Status."
													onchange="changeIssueStatus(<%=i.getModuleId()%>,<%=i.getIssueId()%>);"
													class="form-control" id="IssueStatusId"
													style="font-size: small;" name="IssueStatusId">
													<option value="Select Status">- Select Issue Status -</option>
														<%
															for (IssueStatus issueStatus : i.getIssueStatusBean()) {
														%>
														<option value="<%=issueStatus.getStatusId()%>"><%=issueStatus.getStatusName()%></option>

														<%
															}
														%>
												</select>
											</tr>
											<%
												}
											%>
											<td></td>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

					<a href="GetAllProject?str=pm&id=<%=pmid%>"
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