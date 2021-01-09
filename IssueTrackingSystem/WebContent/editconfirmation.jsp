<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Edit Confirmation Page</title>
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
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="assets/css/shared/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="assets/images/favicon.ico" />
</head>
<body>
	<%
		String message = (String) request.getAttribute("msg");
	%>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div
				class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">
				<div class="row w-100">
					<div class="col-lg-4 mx-auto">
						<%
							if (message != null) {
						%>
						<marquee scrolldelay="10" direction="down" scrollamount="5"
							behavior="slide">
							<h3
								style="font-size: 50px; font-style: italic; font-family: Apple; color: lightgreen; text-align: center; font-weight: bold;"><%=message%></h3>
						</marquee>
						<%
							}
						%>
						<p class="footer-text text-center">copyright © 2020 Issue
							Tracker. All rights reserved.</p>
						<p class="footer-text text-center text-center">
							<a href="AdminHome.jsp" target="_blank" style="color: white">Back
								to Home</a>
						</p>
					</div>
				</div>
			</div>
			<!-- content-wrapper ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="assets/vendors/js/vendor.bundle.base.js"></script>
	<script src="assets/vendors/js/vendor.bundle.addons.js"></script>
	<!-- endinject -->
</body>
</html>
