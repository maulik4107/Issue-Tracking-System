<%@page import="com.issuetracker.bean.ProjectDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
function getdid(pid) {

	var pid = pid;
	var strLink = "RemoveProjectDetails?id=" + pid;
	document.getElementById("rejectid").setAttribute("href", strLink);
}
</script>
<title>Project List</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>

	<%
		int cnt = 0;
	%>
	<%
		int id = (Integer) request.getAttribute("id");
	%>
	<%
		List<ProjectDetails> projectList = (List) request.getAttribute("projectList");
	%>
	<%
		String update = (String) request.getAttribute("update");
	%>
	<%
		String remove = (String) request.getAttribute("remove");
	%>
	<div class="container-scroller">
		<%@include file="_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<%
				if (id == 1) {
			%>
			<%@include file="projectmanagersidebar.jsp"%>
			<%
				} else if (id == 0) {
			%>
			<%@include file="adminsidebar.jsp"%>
			<%
				}
			%>
			<div class="main-panel">
				<div class="content-wrapper"
					style="background-image: url(pages/samples/buglogof.png); background-repeat: no-repeat; background-position: center; background-size: 550px;">
					<h1 class="h3 mb-2 text-gray-800">
						Issue Tracking System
						<marquee scrolldelay="10" direction="down" scrollamount="5"
							behavior="slide">
							<%
								if (update != null) {
							%>
							<h3><%=update%></h3>
							<%
								} else if (remove != null) {
							%><h3><%=remove%></h3>
							<%
								}
							%>
						</marquee>
					</h1>

					<p class="mb-4">Project List</p>

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
												<th>Project Manager</th>
												<th>Project Document</th>
												<%
													if (id == 0) {
												%>
												<th>Edit</th>
												<th>Delete</th>
												<%
													}
												%>
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
												<td><%=project.getPmName()%></td>
												<td style="color: white;"><a
													href="DownloadPDF?pid=<%=project.getProjectId()%>">Download</a></td>
												<%
													if (id == 0) {
												%>
												<td><a
													href="EditProjectDetails?id=<%=project.getProjectId()%>">Update</a></td>
												<td><center>
														<img src="pages/samples/reject.png" data-toggle="modal"
															data-target="#exampleModalCenter"
															onclick="getdid(<%=project.getProjectId()%>);">
													</center></td>
												<%
													}
												%>
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
										<h5 class="modal-title" id="exampleModalLongTitle">Delete
											Project</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">Are you sure want to Delete?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">cancel</button>
										<button type="button" class="btn btn-primary">
											<a style="color: white;" id="rejectid">Delete</a>
										</button>
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