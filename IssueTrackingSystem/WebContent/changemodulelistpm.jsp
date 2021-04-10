<%@page import="com.issuetracker.bean.ModuleDetails"%>
<%@page import="com.issuetracker.bean.ProjectDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">
function myfunction(mId) {
	var ModuleId = mId;
	$(document).ready(function() {
		$.get("ModuleProgress", {
			MId : ModuleId
		}).done(function(data) {
			progressvalue=data;
			var progressmsg=document.getElementById("pmsg");
			if(data==0)
			{
				progressmsg.innerHTML="";
				progressmsg.innerHTML="Module Not Started Yet !";
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

function changestatus(mId) {
	var ModuleId = mId;
	$(document).ready(function() {
		$.get("ModuleStatusChanged", {
			MId : ModuleId
		}).done(function(data) {
			if(data==1)
			{
				$("#iden").modal("show");
			}
			if(data!=1)
			{
				$("#fail").modal("show");
			}
		});
	});	
}

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
	<div class="se-pre-con"></div>
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
												<th>Tester Name</th>
												<th>Module Progress</th>
												<th>Module Completed</th>
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
												<%
													if (module.getTesterName() != null) {
												%>
												<td><%=module.getTesterName()%></td>
												<%
													} else {
												%>
												<td>Not Assign</td>
												<%
													}
												%>
												<td><input type="button" class="btn btn-primary"
													onclick="myfunction(<%=module.getModuleId()%>)"
													value="View Progress"></td>
												<%if(module.getStatusId()!=6){ %>
												<td><input type="button" class="btn btn-primary"
													onclick="changestatus(<%=module.getModuleId()%>)"
													value="completed"></td>
												<%}else{ %>
												<td>Already Completed</td>
												<%} %>
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
													<h4 class="modal-title" id="exampleModalLongTitle">
														<i class="bi bi-exclamation-triangle"></i>Warning
													</h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">Are you sure want to Delete ?
													It will not undo.</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">
														<i class="bi bi-x"></i>cancel
													</button>
													<button type="button" class="btn btn-primary">
														<a style="color: white;" id="deleteid"><i
															class="bi bi-trash"></i>Delete</a>
													</button>
												</div>
											</div>
										</div>
									</div>


									<div class="modal fade" id="fail" tabindex="-1" role="dialog"
										aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered"
											role="document">
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
												<div class="modal-body">Testing of Module is Not Done
													Yet.</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">
														<i class="bi bi-x"></i>OK
													</button>
												</div>
											</div>
										</div>
									</div>
									<div class="modal fade" id="iden" tabindex="-1" role="dialog"
										aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered"
											role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title" id="exampleModalLongTitle">
														<i class="bi bi-exclamation-triangle"></i>Success
													</h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">Module Status Changed !!.</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">
														<i class="bi bi-x"></i>OK
													</button>
												</div>
											</div>
										</div>
									</div>
									<div class="modal fade" id="progressbar" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalCenterTitle"
										aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered"
											role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title" id="exampleModalLongTitle">
														<i class="bi bi-file-bar-graph-fill"></i>Module Progress
													</h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<div class="progress" style="height: 20px;">
														<div class="progress-bar" role="progressbar" id="projectp"
															aria-valuemin="0" aria-valuemax="100"></div>
													</div>
													<span id="pmsg" style="color: red; font-size: small;"></span>
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
							</div>
						</div>
					</div>

					<a href="GetProjects?id=<%=pmId%>"
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