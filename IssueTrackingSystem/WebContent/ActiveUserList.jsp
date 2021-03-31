<%@page import="com.issuetracker.bean.ActiveUsers"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">
	function getdid(userid) {

		var uid = userid;
		var strLink = "DeleteUser?id=" + uid;
		document.getElementById("deleteid").setAttribute("href", strLink);
	}
</script>
<title>Active Users</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
<div class="se-pre-con"></div>
	<%
		int cnt = 0;
	%>
	<%
		List<ActiveUsers> activeuser = (List) request.getAttribute("Userlist");
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
					<p class="mb-4">Active User List</p>


					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Active Users</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0" style="border: black;">

									<thead>
										<tr>
											<th>UserId</th>
											<th>UserName</th>
											<th>Contact</th>
											<th>Area Name</th>
											<th>Email</th>
											<th>Role</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<%
											for (ActiveUsers user : activeuser) {
										%>
										<%
											if (user.getRoleid() != 0) {
										%>
										<%
											cnt = cnt + 1;
										%>
										<tr>
											<td><%=cnt%></td>
											<td><%=user.getUsername()%></td>
											<td><%=user.getContact()%></td>
											<td><%=user.getAreaname()%></td>
											<td><%=user.getEmail()%></td>
											<td><%=user.getRolename()%></td>
											<td><center>
													<h3>
														<i class="bi bi-trash" style="margin-right: 10px;"
															data-toggle="modal" data-target="#exampleModalCenter1"
															onclick="getdid(<%=user.getUserid()%>);"></i>
													</h3></td>
											</center>
											</td>
										</tr>

										<%
											}
										%>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="modal fade" id="exampleModalCenter1" tabindex="-1"
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
								<div class="modal-body">Are you sure want to Delete ? It
									will not undo.</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">
										<i class="bi bi-x"></i>No
									</button>
									<button type="button" class="btn btn-primary">
										<a style="color: white;" id="deleteid"><i
											class="bi bi-check"></i>Yes</a>
									</button>
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