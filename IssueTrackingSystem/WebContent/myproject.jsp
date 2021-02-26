<%@page import="com.issuetracker.bean.ProjectDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>My Projects</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>

	<%
		int cnt = 0;
	%>
	<%
		List<ProjectDetails> projectList = (List) request.getAttribute("pList");
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
					<p class="mb-4">My Projects</p>

					<div class="card shadow mb-4">
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Projects</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0" style="border: black;">
										<thead>
											<tr>
												<th>Sr. No</th>
												<th>Project Name</th>
												<th>Description</th>
												<th>Strating Date</th>
												<th>Ending Date</th>
												<th>Current Status</th>
												<th>Project Document</th>
											</tr>
										</thead>
										<tbody>
											<%
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
												<td><center><a
													href="DownloadPDF?pid=<%=project.getProjectId()%>"><h3><i class="bi bi-download"></i></h3></a></center></td>
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
					
				</div>
			</div>
		</div>
	</div>
	<%@include file="commonjspluggins.jsp"%>
</body>
</html>