<%@page import="com.issuetracker.bean.Issue"%>
<%@page import="com.issuetracker.bean.ProjectDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">

	$(document).on('click', '.data-enlargeable', function() {
		var src = $(this).attr('src');
		var modal;
		function removeModal() {
			modal.remove();
			$('body').off('keyup.modal-close');
		}
		modal = $('<div>').css({
			background : 'RGBA(0,0,0,.5) url(' + src + ') no-repeat center',
			backgroundSize : 'contain',
			width : '100%',
			height : '100%',
			position : 'fixed',
			zIndex : '10000',
			top : '0',
			left : '0',
			cursor : 'zoom-out'
		}).click(function() {
			removeModal();
		}).appendTo('body');
		//handling ESC
		$('body').on('keyup.modal-close', function(e) {
			if (e.key === 'Escape') {
				removeModal();
			}
		});
	});
	
	var issueId;
	var projectid;

	function getMid(mid) {
		issueId = mid;
		projectid=document.getElementById("proid").value;
	}

	$(function () {
	    $(".moduleStatus").change(function () {
	        var selectedText = $(this).find("option:selected").text();
	        var selectedValue = $(this).val();
	        var strLink = "UpdateIssueStatus?statusId="+selectedValue+"&issueId="+issueId+"&pid="+projectid;
			document.getElementById("rejectid").setAttribute("href", strLink);
	        $("#otherStatus").modal("show"); 
	    });
	});

	
</script>
<title>View Issue</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<div class="se-pre-con"></div>
	<%
		int cnt = 0;
	%>
	<%
		List<Issue> issueList = (List) request.getAttribute("issueList");
	%>
	<%
		int pid = (Integer) request.getAttribute("pid");
	%>
	<%
		List<Issue> iList = (List) request.getAttribute("iList");
	%>
	<%
		String msg = (String) request.getAttribute("statusMsg");
	%>
	<input type="hidden" value="<%=pid%>" id="proid">
	<div class="container-scroller">
		<%@include file="_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<%@include file="adminsidebar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper"
					style="background-image: url(pages/samples/buglogof.png); background-repeat: no-repeat; background-position: center; background-size: 550px;">
					<h1 class="h3 mb-2 text-gray-800">Issue Tracking System</h1>
					<p class="mb-4">Issue Details</p>
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
												<th>Image</th>
												<th>Edit</th>
												<th>Change Status</th>
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
												<td><img class="data-enlargeable" width="100"
													style="cursor: zoom-in"
													src="data:image/png;base64,<%=i.getDocumentString()%>" />
												</td>
												<%
													} else {
												%>
												<td>Not Avialable</td>
												<%
													}
												%>
												<td><a
													href="EditIssueAdminDetails?id=<%=i.getIssueId()%>&pid=<%=pid%>"><h3>
															<i class="bi bi-pencil-square"
																style="margin-right: 10px;"></i>
														</h3></a></td>
												<td>
												<%if(i.getIssueStatusId()!=21){ %>
												<select title="Please select Issue Status."
													class="form-control moduleStatus"
													onclick="getMid(<%=i.getIssueId()%>);"
													style="font-size: small;">
														<%
															for (Issue issue : iList) {
														%>
														<option value="<%=issue.getIssueStatusId()%>"><%=issue.getIssueStatusName()%></option>
														<%
															}
														%>
												</select>
												<%}else{ %>
												No Status Available
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
					<div class="modal fade" id="otherStatus" tabindex="-1"
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
								<div class="modal-body">Status of issue is going to be
									change.</div>
								<div class="modal-body">Are you sure want to change ?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">
										<i class="bi bi-x"></i>cancel
									</button>
									<button type="button" class="btn btn-primary">
										</i><a style="color: white;" id="rejectid"><i
											class="bi bi-check-circle-fill" style="margin-right: 10px;"></i>Yes</a>
									</button>
								</div>
							</div>
						</div>
					</div>

					<a href="GetAllProject?str=issue"
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