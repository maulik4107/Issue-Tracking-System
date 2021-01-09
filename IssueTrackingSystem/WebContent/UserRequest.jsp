<%@page import="com.issuetracker.bean.UserRequest"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript"> 

	var id = 0;
	function getid() {
		id = document.getElementById("uid").value();
		userid = id;

	}
</script>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>User Request</title>
<!-- plugins:css -->
<link href="assets/css/all.min.css" rel="stylesheet" type="text/css">
<link href="assets/css/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="assets/css/font-awesome.min.css" rel="stylesheet">

<link rel="stylesheet"
	href="assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="assets/vendors/iconfonts/ionicons/dist/css/ionicons.css">
<link rel="stylesheet"
	href="assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet"
	href="assets/vendors/css/vendor.bundle.addons.css">
<link rel="stylesheet" href="assets/css/shared/style.css">
<!-- Layout styles -->
<link rel="stylesheet" href="assets/css/demo_1/style.css">
<!-- End Layout styles -->
<link rel="shortcut icon" href="assets/images/favicon.ico" />
</head>
<body>
	<%
		List<UserRequest> pendinguser = (List) request.getAttribute("requestlist");
	%>
	<div class="container-scroller">
		<%@include file="_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar">

				<ul class="nav">
					<br>
					<li class="nav-item nav-category border"
						style="font-size: 20px; text-align: center; border-radius: 35px; font-style: italic; font-family: Apple; background-color: white; color: blue"><b>
							Admin</b></li>
					<br>
					<br>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#ui-basic" aria-expanded="true"
						aria-controls="ui-basic"> <i
							class="menu-icon typcn typcn-coffee"></i> <span
							class="menu-title">Projects</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="ui-basic">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="pages/ui-features/buttons.html">Create Project</a></li>
								<li class="nav-item"><a class="nav-link"
									href="pages/ui-features/dropdowns.html">Allocate Project</a></li>
								<li class="nav-item"><a class="nav-link"
									href="pages/ui-features/typography.html">View Projects</a></li>
								<li class="nav-item"><a class="nav-link"
									href="pages/ui-features/typography.html">View Issues</a></li>

							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="GetPendingUserRequest"> <i
							class="menu-icon typcn typcn-th-large-outline"></i> <span
							class="menu-title">Pending Users</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="GetActiveUsers">
							<i class="menu-icon typcn typcn-th-large-outline"></i> <span
							class="menu-title">View Users</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../../index.jsp"> <i
							class="menu-icon typcn typcn-th-large-outline"></i> <span
							class="menu-title">Create Report</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="editprofile.jsp"> <i
							class="menu-icon typcn typcn-th-large-outline"></i> <span
							class="menu-title">Edit Profile</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="index.jsp">
							<i class="menu-icon typcn typcn-th-large-outline"></i> <span
							class="menu-title">Logout</span>
					</a></li>
				</ul>
			</nav>
			<div class="main-panel">
				<div class="content-wrapper"
					style="background-image: url(pages/samples/buglogof.png); background-repeat: no-repeat; background-position: center; background-size: 550px;">
					<h1 class="h3 mb-2 text-gray-800">Issue Tracking System</h1>
					<p class="mb-4">Pending user Request</p>
					<div class="card shadow mb-4">
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Pending Users</h6>
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
												<th>Accept</th>
												<th>Reject</th>
											</tr>
										</thead>
										<tbody>
											<%
												for (UserRequest user : pendinguser) {
											%>
											<tr>
												<td id="uid"><%=user.getUserid()%></td>
												<td><%=user.getUsername()%></td>
												<td><%=user.getContact()%></td>
												<td><%=user.getAreaname()%></td>
												<td><%=user.getEmail()%></td>
												<td><%=user.getRolename()%></td>
												<td><button type="button" data-toggle="modal"
														onclick="getid();" data-target="#exampleModalCenter"
														class="btn btn-success btn-rounded btn-fw">
														<i class="mdi mdi-check"></i>Accept
													</button></td>
												<td><button type="button" data-toggle="modal"
														data-target="#exampleModalCenter1"
														class="btn btn-danger btn-rounded btn-fw">X
														Reject</button></td>
											</tr>


											<%
												}
											%>
										</tbody>

									</table>
									<div class="modal fade" id="exampleModalCenter" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalCenterTitle"
										aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered"
											role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLongTitle">Accept
														User</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">Are you sure want to accept ?</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">cancel</button>



													<button type="button" class="btn btn-primary">
														<a href="AcceptUserDetails?id="
															style="color: white;">Accept</a>
													</button>

												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="modal fade" id="exampleModalCenter1" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalCenterTitle"
									aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLongTitle">Reject
													User</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">Are you sure want to Reject ?</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">cancel</button>
												<%
													for (UserRequest user : pendinguser) {
												%>
												<%=user.getUserid()%>
												<button type="button" class="btn btn-primary">
													<a href="RejectUserDetails?id=<%=user.getUserid()%>"
														style="color: white;">Reject</a>
												</button>
												<%
													}
												%>
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


	<!-- plugins:js -->
	<script src="assets/vendors/js/vendor.bundle.base.js"></script>
	<script src="assets/vendors/js/vendor.bundle.addons.js"></script>
	<!-- Custom js for this page-->
	<script src="assets/js/demo_1/dashboard.js"></script>
	<!-- End custom js for this page-->
	<!-- Page level plugins -->
	<script src="assets/js/jquery.dataTables.min.js"></script>
	<script src="assets/js/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="assets/js/datatables-demo.js"></script>
</body>
</html>