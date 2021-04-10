<%@page import="com.issuetracker.bean.ProjectDetails"%>
<%@page import="com.issuetracker.bean.Issue"%>
<%@page import="com.issuetracker.bean.ModuleDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>View Report</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<div class="se-pre-con"></div>
	<%
		int cnt = 0;
	%>
	<%
		int id = (Integer) request.getAttribute("i");
	%>
	<%List<ProjectDetails> projectList=null;
	List<Issue> issueList=null;
	List<ModuleDetails> moduleList=null;
		if (id == 1) {
		 projectList = (List) request.getAttribute("pList");
	} else if (id == 2) {
		 issueList = (List) request.getAttribute("pList");
	} else if (id == 3) {
		 moduleList = (List) request.getAttribute("pList");
	}
	%>
	<%
		String role = (String) request.getAttribute("role");
	%>
	<%
		String name = (String) request.getAttribute("uName");
	%>
	<div class="container-scroller">
		<%@include file="_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<%@include file="adminsidebar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper"
					style="background-image: url(pages/samples/buglogof.png); background-repeat: no-repeat; background-position: center; background-size: 550px;">
					<h1 class="h3 mb-2 text-gray-800">Issue Tracking System</h1>
					<h3>
						<input type="button" class="btn btn-primary" id="btnExport" value="Export Report" />
					</h3>
					<div class="card shadow mb-4">
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">User Report</h6>
								<h5 class="m-0 font-weight-bold text-primary"><%="User Name : " + name%></h5>
								<h5 class="m-0 font-weight-bold text-primary"><%="User Role : " + role%></h5>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0" style="border: black;">
										<thead>
											<tr>
											<%if(id==1){ %>
												<th>Sr. No</th>
												<th>Project Name</th>
												<th>Description</th>
												<th>Starting Date</th>
												<th>Ending Date</th>
												<th>Current Status</th>
											<%}else if(id==2) {%>
												<th>Sr. No</th>
												<th>Issue Name</th>
												<th>Description</th>
												<th>Impact</th>
												<th>Priority</th>
												<th>Created Date</th>
												<th>Ending Date</th>
												<th>Current Status</th>
											<%}else if(id==3){ %>
												<th>Sr. No</th>
												<th>Module Name</th>
												<th>Description</th>
												<th>Starting Date</th>
												<th>Ending Date</th>
												<th>Current Status</th>
											<%} %>
											</tr>
										</thead>
										<tbody>

											<%
												if (id == 1) {
												for (ProjectDetails project : projectList) {
											%>
											<%
												cnt = cnt + 1;
											%>
											<tr style="color: white;">
												<td><%=cnt%></td>
												<td><%=project.getProjectName()%></td>
												<td><%=project.getProjectDes()%></td>
												<td><%=project.getProjectSd()%></td>
												<td><%=project.getProjectEd()%></td>
												<td><%=project.getStatusName()%></td>
											</tr>
											<%
												}
											}
											%>
											<%
												if (id == 2) {
												for (Issue i : issueList) {
											%>
											<%
												cnt = cnt + 1;
											%>
											<tr style="color: white;">
												<td><%=cnt%></td>
												<td><%=i.getIssueName()%></td>
												<td><%=i.getIssueDes()%></td>
												<td><%=i.getIssueImpact()%></td>
												<td><%=i.getIssuePriority()%></td>
												<td><%=i.getIssueCreatedDate()%></td>
												<%if(i.getIssueCloseDate()!=null){ %>
												<td><%=i.getIssueCloseDate()%></td>
												<%}else{ %>
												<td>Not Closed</td>
												<%} %>
												<td><%=i.getIssueStatusName()%></td>
											</tr>
											<%
												}
											}
											%>
											<%
												if (id == 3) {
												for (ModuleDetails m : moduleList) {
											%>
											<%
												cnt = cnt + 1;
											%>
											<tr style="color: white;">
												<td><%=cnt%></td>
												<td><%=m.getModuleName()%></td>
												<td><%=m.getModuleDes()%></td>
												<td><%=m.getModuleSd()%></td>
												<td><%=m.getModuleEd()%></td>
												<td><%=m.getStatusName()%></td>
											</tr>
											<%
												}
											}
											%>
										</tbody>
									</table>
									<script type="text/javascript"
										src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
									<script type="text/javascript"
										src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
									<script type="text/javascript"
										src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
									<script type="text/javascript">
										$("body")
												.on(
														"click",
														"#btnExport",
														function() {
															html2canvas(
																	$('#dataTable')[0],
																	{
																		onrendered : function(
																				canvas) {
																			var data = canvas
																					.toDataURL();
																			var docDefinition = {
																				content : [ {
																					image : data,
																					width : 500
																				} ]
																			};
																			pdfMake
																					.createPdf(
																							docDefinition)
																					.download(
																							"cutomer-details.pdf");
																		}
																	});
														});
									</script>
								</div>
							</div>
						</div>
					</div>
					<a href="usersreport.jsp"
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