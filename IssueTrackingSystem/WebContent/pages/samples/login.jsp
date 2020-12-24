<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">
	
</script>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login Page</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="../../assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="../../assets/vendors/iconfonts/ionicons/dist/css/ionicons.css">
<link rel="stylesheet"
	href="../../assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet"
	href="../../assets/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet"
	href="../../assets/vendors/css/vendor.bundle.addons.css">
<link rel="stylesheet" href="../../assets/vendors/js/bootstrap.min.js">
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="../../assets/css/shared/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="../../assets/images/favicon.ico" />

</head>
<body>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div
				class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">
				<div class="row w-100">
					<div class="col-lg-4 mx-auto">
						<h1 style="color: white; font-family: Cursive; text-align: center">
							<b>Log in</b>
						</h1>
						<div class="auto-form-wrapper">
							<form data-toggle="validator" role="form">


								<div class="form-group">
									<label for="inputEmail" class="control-label">Email</label> <input
										type="email" class="form-control" id="inputEmail"
										placeholder="Email"
										data-error="Bruh, that email address is invalid" required>
									<div class="help-block with-errors"></div>
								</div>
								<div class="form-group">
									<label for="inputPassword" class="control-label">Password</label>
									<div class="form-inline row">
										<div class="form-group col-sm-6">
											<input type="password" data-minlength="6"
												class="form-control" id="inputPassword"
												placeholder="Password" required>
											<div class="help-block">Minimum of 6 characters</div>
										</div>
										
									</div>
								</div>

								
								<div class="form-group">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form>
						</div>
						<p class="footer-text text-center">copyright © 2020 Issue
							Tracker. All rights reserved.</p>
						<p class="footer-text text-center text-center">
							<a href="../../index.jsp" target="_blank">Back to Home</a>
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
	<script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
	<script src="../../assets/vendors/js/vendor.bundle.addons.js"></script>
	<!-- endinject -->
	<!-- inject:js -->
	<script src="../../assets/js/shared/off-canvas.js"></script>
	<script src="../../assets/js/shared/misc.js"></script>
	<!-- endinject -->
	<script src="../../assets/js/shared/jquery.cookie.js"
		type="text/javascript"></script>
</body>
</html>