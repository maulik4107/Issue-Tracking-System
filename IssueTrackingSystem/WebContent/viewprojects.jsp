<%@page import="com.issuetracker.bean.ProjectDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">

function myfunction(proId) {
	var pId = proId;
	$(document).ready(function() {
		$.get("ProjectProgress", {
			projectId : pId
		}).done(function(data) {
			progressvalue=data;
			var progressmsg=document.getElementById("pmsg");
			if(data==0)
			{
				progressmsg.innerHTML="";
				progressmsg.innerHTML="Project Not Started Yet !";
				var p=document.getElementById('projectp');
				p.style.width=0+"%";
				document.getElementById('projectp').innerHTML=0+"%";
				$("#progressbar").modal("show");
				
			}
			else
			{
				progressmsg.innerHTML="";
				var p=document.getElementById('projectp');
				p.style.width=data+"%";
				document.getElementById('projectp').innerHTML=data+"%";
				$("#progressbar").modal("show");
			}
		});
	});
}
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
<div class="se-pre-con"></div>
	<%
		int cnt = 0;
	int progressvalue = 0;
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
				} else if (id == 2) {
			%>
			<%@include file="developersidebar.jsp"%>
			<%
				} else {
			%>
			<%@include file="testersidebar.jsp"%>
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
												<th>Starting Date</th>
												<th>Ending Date</th>
												<th>Current Status</th>
												<th>Project Manager</th>
												<th>Project Progress</th>
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
												<%
													if (project.getPmId() == 0) {
												%>
												<td>Not Assign</td>
												<%
													} else {
												%>
												<td><%=project.getPmName()%></td>
												<%
													}
												%>
												<td><input type="button" class="btn btn-primary"
													onclick="myfunction(<%=project.getProjectId()%>)"
													value="View Progress"></td>
												<%
													if (project.getDocumentString() != null) {
												%>
												<td style="color: white;"><center>
														<a
															href="DownloadPDF?pid=<%=project.getProjectId()%>&pname=<%=project.getProjectName()%>"><h3>
																<i class="bi bi-download"></i>
															</h3></a>
													</center></td>
												<%
													} else {
												%>
												<td><center>Not Available</center></td>
												<%
													}
												%>
												<%
													if (id == 0) {
												%>
												<td><a
													href="EditProjectDetails?id=<%=project.getProjectId()%>"><h3>
															<i class="bi bi-pencil-square"></i>
														</h3></a></td>
												<td><center>
														<a>
															<h3>
																<i class="bi bi-trash" data-toggle="modal"
																	data-target="#exampleModalCenter"
																	onclick="getdid(<%=project.getProjectId()%>);"></i>
															</h3>
														</a>
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
										<h4 class="modal-title" id="exampleModalLongTitle">
											<i class="bi bi-exclamation-triangle"></i>Warning
										</h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">Are you sure want to Delete? It
										will not undo.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">
											<i class="bi bi-x"></i>cancel
										</button>
										<button type="button" class="btn btn-primary">
											<a style="color: white;" id="rejectid"><i
												class="bi bi-trash"></i>Delete</a>
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="modal fade" id="progressbar" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalCenterTitle"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="exampleModalLongTitle">
											<i class="bi bi-file-bar-graph-fill"></i>Project Progress
										</h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div class="progress" style="height: 20px;">
											<div class="progress-bar" role="progressbar" id="projectp"
												  aria-valuemin="0" aria-valuenow="<%=progressvalue%>"
												aria-valuemax="100"></div>
										</div>
										<span id="pmsg" style="color: red;font-size: small;"></span>
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-primary"
											data-dismiss="modal">
											<i class="bi bi-check"></i>Ok
										</button>
									</div>
								</div>
							</div>
						</div>

					</div>
					<a href="AdminHome.jsp"
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