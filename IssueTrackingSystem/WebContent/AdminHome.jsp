<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Issue Tracking System</title>
<!-- plugins:css -->
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
						data-toggle="collapse" href="#ui-basic" aria-expanded="false"
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
									href="pages/ui-features/typography.html">View Project</a></li>
								<li class="nav-item"><a class="nav-link"
									href="pages/ui-features/typography.html">View Issues</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="GetPendingUserRequest"> <i
							class="menu-icon typcn typcn-th-large-outline"></i> <span
							class="menu-title">Pending Users Request</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="GetActiveUsers"> <i
							class="menu-icon typcn typcn-th-large-outline"></i> <span
							class="menu-title">View Active Users</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../../index.jsp"> <i
							class="menu-icon typcn typcn-th-large-outline"></i> <span
							class="menu-title">Create Report</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="EditProfile"> <i
							class="menu-icon typcn typcn-th-large-outline"></i> <span
							class="menu-title">Edit Profile</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="LogOut">
							<i class="menu-icon typcn typcn-th-large-outline"></i> <span
							class="menu-title">Logout</span>
					</a></li>
				</ul>
			</nav>
			<div class="main-panel">
				<div class="content-wrapper"
					style="background-image: url(pages/samples/buglogof.png); background-repeat: no-repeat; background-position: center; background-size: 550px;">
					<h1>hello </h1>
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
	<script src="assets/js/shared/jquery.cookie.js" type="text/javascript"></script>
</body>
</html>