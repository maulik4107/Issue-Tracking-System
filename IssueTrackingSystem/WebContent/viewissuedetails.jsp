<%@page import="com.issuetracker.bean.Issue"%>
<%@page import="com.issuetracker.bean.ProjectDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>View Issue</title>
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
		int id = (Integer) request.getAttribute("id");
	%>
	<%
		int mid = (Integer) request.getAttribute("mid");
	%>
	<div class="container-scroller">
		<%@include file="_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<%@include file="testersidebar.jsp"%>
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
												<th>Description</th>
												<th>Impact</th>
												<th>Priority</th>
												<th>Starting Date</th>
												<th>Ending Date</th>
												<th>Current Status</th>
												<th>Developer</th>
												<th>Tester</th>
												<th>Module</th>
												<th>Document</th>
												<th>Edit</th>
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
												<td><%=i.getIssueDes()%></td>
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
												<%
													if (i.getDocumentString() != null) {
												%>
												<td>Avaialble</td>
												<%
													} else {
												%>
												<td>Not Avialable</td>
												<%
													}
												%>
												<td><a href="EditIssueDetails?id=<%=i.getIssueId()%>&testerId=<%=id%>&mid=<%=mid%>"><h3>
															<i class="bi bi-pencil-square"
																style="margin-right: 10px;"></i>
														</h3></a></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

					<a href="ViewIssue?id=<%=id%>"
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