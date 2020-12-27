<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">

	function ValidateEmail() {
		var email = document.getElementById("txtEmail").value;
		var lblError = document.getElementById("lblError");
		lblError.innerHTML = "";
		var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if (!expr.test(email)) {
			lblError.innerHTML = "Invalid E-mail address.";
		}
	}
		function validateForm()
	{
		var email = document.getElementById("txtEmail").value;
		var lblError = document.getElementById("lblError");
		lblError.innerHTML = "";
		
		if(email=="")
			{
				lblError.innerHTML="Please Enter Email Address.";
			}
	}
</script>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Forgot Password</title>
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
						<h1
							style="color: white; font-family: Apple; font-style: italic; text-align: center">
							<b>Forgot Password !</b>
						</h1>
						<div class="auto-form-wrapper">
							<form action="#">
								<div class="form-group">

									<label class="label">Email</label>
									<div class="input-group">
										<input type="text" id="txtEmail" class="form-control"
											placeholder="example@gmail.com" onkeyup="ValidateEmail();" />

										<div class="input-group-append">
											<span class="input-group-text"> <i
												class="mdi mdi-check-circle-outline"></i>
											</span>
										</div>
									</div>
									<span id="lblError" style="color: red;font-size: small;"></span>
								</div>

								<div class="form-group">
									<button class="btn btn-primary submit-btn btn-block" onclick="validateForm();">Submit</button>
								</div>
							</form>
						</div>
						<p class="footer-text text-center">copyright � 2020 Issue
							Tracker. All rights reserved.</p>
						<p class="footer-text text-center text-center">
							<a href="login.jsp" target="_blank">Back</a>
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