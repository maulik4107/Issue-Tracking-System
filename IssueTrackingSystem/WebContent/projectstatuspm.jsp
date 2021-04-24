<%@page import="com.issuetracker.bean.ProjectDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">
function changeStatus(mId)
	{
		var pId = mId;
		$(document).ready(function() {
			$.get("ChangeProjectStatus", {
				projectId : pId
			}).done(function(data) {
				if(data=="true")
				{
					$("#Success").modal("show");
				}
				else
				{
					$("#Failure").modal("show");
				}
			});
		});
	}
</script>
<title>My Projects</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
<div class="se-pre-con"></div>
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
			<%@include file="adminsidebar.jsp"%>
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
												<th>Starting Date</th>
												<th>Ending Date</th>
												<th>Current Status</th>
												<th>Project Document</th>
												<th>Change Status</th>
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
												<%if(project.getDocumentString()!=null){ %>
												<td><center><a
													href="DownloadPDF?pid=<%=project.getProjectId()%>&pname=<%=project.getProjectName()%>"><h3><i class="bi bi-download"></i></h3></a></center></td>
													<%}else{ %>
													<td>Not Available</td>
													<%} %>
												<td>
												<%if(project.getProjectStatus()!=3){ %>
												<button class="btn btn-primary" onclick="changeStatus(<%=project.getProjectId()%>)" id="projects">
														Completed
													</button>
												<%} else {%>
												Already Done
												<%} %>
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
					</div>
					<div class="modal fade" id="Success" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalCenterTitle"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="exampleModalLongTitle">
											<i class="bi bi-exclamation-triangle"></i>Status Changed
										</h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">Status of Project has been change to completed successfully !!</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary"
											data-dismiss="modal">
											<i class="bi bi-check-circle-fill"></i>Ok
										</button>
									</div>
								</div>
							</div>
						</div>
					<div class="modal fade" id="Failure" tabindex="-1"
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
									<div class="modal-body">Sorry !! Modules of this Project are not Completed yet !!</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary"
											data-dismiss="modal">
											<i class="bi bi-check-circle-fill"></i>Ok
										</button>
									</div>
								</div>
							</div>
						</div>
					<a href="projectmanagerhome.jsp"
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