<%@page import="com.issuetracker.bean.ModuleDetails"%>
<%@page import="com.issuetracker.bean.ProjectDetails"%>
<%@page import="com.issuetracker.bean.Issue"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
var moduleId;
var projectid;

function getMid(mid) {
	moduleId = mid;
	projectid=document.getElementById("projectId").value;
}

$(function () {
    $(".moduleStatus").change(function () {
        var selectedText = $(this).find("option:selected").text();
        var selectedValue = $(this).val();
        var strLink = "UpdateModuleStatus?statusId="+selectedValue+"&mId="+moduleId+"&pid="+projectid;
		document.getElementById("rejectid").setAttribute("href", strLink);
        $("#otherStatus").modal("show"); 
    });
});

function myfunction(mId) {
	var ModuleId = mId;
	$(document).ready(function() {
		$.get("ModuleProgress", {
			MId : ModuleId,
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
		List<ModuleDetails> moduleList = (List) request.getAttribute("ModuleList");
	%>
	<%
		int pmId = (int) request.getAttribute("pmId");
	%>
	<%
		List<Issue> issueList = (List) request.getAttribute("iList");
	%>
	<%
		String msg=(String)request.getAttribute("statusMsg");
	%>
	<%
		int pid=(int)request.getAttribute("proId");
	%>
	<input type="hidden" value="<%=pid%>" id="projectId">
	<div class="container-scroller">
		<%@include file="_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<%@include file="adminsidebar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper"
					style="background-image: url(pages/samples/buglogof.png); background-repeat: no-repeat; background-position: center; background-size: 550px;">
					<h1 class="h3 mb-2 text-gray-800">Issue Tracking System</h1>
					<p class="mb-4">Modules Details</p>
					<%
						if (msg != null) {
					%>
					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 30px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;">
							<%=msg%>
						</h2>
					</marquee>
					<%
						}
					%>
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
												<th>Change Status</th>
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
											<tr>
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
												<td>Not Assigned</td>
												<%
													}
												%>
												<td><input type="button" class="btn btn-primary"
													onclick="myfunction(<%=module.getModuleId()%>)"
													value="View Progress"></td>
												<td>
												<%if(module.getStatusId()!=6) {%>
												<select title="Please select Issue Status."
													class="form-control moduleStatus" onclick="getMid(<%=module.getModuleId()%>);"
													style="font-size: small;">
														<%
															for (Issue i : issueList) {
														%>
														<option value="<%=i.getIssueStatusId()%>"><%=i.getIssueStatusName()%></option>
														<%
															}
														%>
												</select>
												<%}else{ %>
												No status Available
												<% }%>
												</td>
												<td><a
													href="EditModuleDetails?id=<%=module.getModuleId()%>&pId=<%=pmId%>&rid=0"><h3>
															<i class="bi bi-pencil-square"
																style="margin-right: 10px;"></i>
														</h3></a></td>
												<td><h3>
														<i class="bi bi-trash" data-toggle="modal"
															data-target="#exampleModalCenter1"
															onclick="getdid(<%=module.getModuleId()%>);"></i>
													</h3></td>
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
									<div class="modal fade" id="otherStatus" tabindex="-1"
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
												<div class="modal-body">Status of module is going to be
													change.</div>
												<div class="modal-body">Are you sure want to change ?</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">
														<i class="bi bi-x"></i>cancel
													</button>
													<button type="button" class="btn btn-primary">
														</i><a style="color: white;" id="rejectid"><i
															class="bi bi-check-circle-fill"
															style="margin-right: 10px;"></i>Yes</a>
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
							<a href="GetAllProject?str=modules"
								style="color: darkblue; font-weight: bolder; margin-left: 530px;"><i
								class="bi bi-reply-fill" style="margin-right: 10px;"></i> Go
								Back </a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="commonjspluggins.jsp"%>
</body>
</html>