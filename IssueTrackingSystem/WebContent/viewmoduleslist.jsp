<%@page import="com.issuetracker.bean.ModuleDetails"%>
<%@page import="com.issuetracker.bean.ProjectDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">
	function getdid(userid) {

		var uid = userid;
		var strLink = "DeleteModuleDetails?id=" + uid;
		document.getElementById("deleteid").setAttribute("href", strLink);
	}
</script>
<title>View Modules</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>

	<%
		int cnt = 0;
	%>
	<%
		List<ModuleDetails> moduleList = (List) request.getAttribute("moduleList");
	%>
	<%
		int pmId = (int) request.getAttribute("pId");
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
					<p class="mb-4">Modules Details</p>

					<div class="card shadow mb-4">
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Modules</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0" style="border: black;">
										<thead>
											<tr>
												<th>Sr. No</th>
												<th>Module Name</th>
												<th>Description</th>
												<th>Starting Date</th>
												<th>Ending Date</th>
												<th>Current Status</th>
												<th>Project Name</th>
												<th>Developer Name</th>
												<th>Edit</th>
												<th>Delete</th>
											</tr>
										</thead>
										<tbody>
											<%
												for (ModuleDetails module : moduleList) {
											%>
											<%
												cnt = cnt + 1;
											%>
											<tr style="color: white;">
												<td><%=cnt%></td>
												<td><%=module.getModuleName()%></td>
												<td><%=module.getModuleDes()%></td>
												<td><%=module.getModuleSd()%></td>
												<td><%=module.getModuleEd()%></td>
												<td><%=module.getStatusName()%></td>
												<td><%=module.getProjectName()%></td>
												<%
													if (module.getDeveloperName() != null) {
												%>
												<td><%=module.getDeveloperName()%></td>
												<%
													} else {
												%>
												<td>Not Assign</td>
												<%
													}
												%>
												<td style="color: white;"><a
													href="EditModuleDetails?id=<%=module.getModuleId()%>&pId=<%=pmId%>">Update</a></td>
												<td style="color: white;"><button data-toggle="modal"
														data-target="#exampleModalCenter1"
														onclick="getdid(<%=module.getModuleId()%>);">Delete</button></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table>
									<div class="modal fade" id="exampleModalCenter1" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalCenterTitle"
										aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered"
											role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLongTitle">Delete
														Module</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">Are you sure want to Delete ?</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">No</button>
													<button type="button" class="btn btn-primary">
														<a style="color: white;" id="deleteid">Yes</a>
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
			</div>
		</div>
	</div>
	<%@include file="commonjspluggins.jsp"%>
</body>
</html>