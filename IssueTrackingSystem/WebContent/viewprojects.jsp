<%@page import="com.issuetracker.bean.ProjectDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
<title>Project List</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>

	<%
		int cnt = 0;
	%>
	<%
		List<ProjectDetails> projectList = (List) request.getAttribute("projectList");
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
					<p class="mb-4">Project List</p>

					<div class="card shadow mb-4">
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Projects</h6>
							</div>
							<div class="card-body"
								style="background-image: url(pages/samples/keyboardkey.jpg); background-repeat: no-repeat; background-size: 1200px; background-position: center; color: white;">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0" style="border: black;">
										<thead>
											<tr>
												<th style="color: white;">Sr. No</th>
												<th style="color: white;">Project Name</th>
												<th style="color: white;">Description</th>
												<th style="color: white;">Strating Date</th>
												<th style="color: white;">Ending Date</th>
												<th style="color: white;">Current Status</th>
												<th style="color: white;">Project Manager</th>
												<th style="color: white;">Project Document</th>
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
												<td style="color: white;"><%=cnt%></td>
												<td style="color: white;"><%=project.getProjectName()%></td>
												<td style="color: white;"><%=project.getProjectDes()%></td>
												<td style="color: white;"><%=project.getProjectSd()%></td>
												<td style="color: white;"><%=project.getProjectEd()%></td>
												<td style="color: white;"><%=project.getStatusName()%></td>
												<td style="color: white;"><%=project.getPmName()%></td>
												<td style="color: white;"><a href="DownloadPDF?pid=<%=project.getProjectId()%>">Download</a></td>
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