<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
	function validateOtp() {
		var flag = 0;

		var temp = document.getElementById("temp").value;
		var otp = document.getElementById("otp").value;
		var lblError = document.getElementById("otpmessage");
		lblError.innerHTML = "";

		if (otp.length <= 0) {
			lblError.innerHTML = "Please Enter Your OTP!";
			flag = 1;
			return false;
		}
		if (otp != temp) {
			lblError.innerHTML = "Invalid OTP.";
			flag = 1;
		}

		if (flag == 1) {
			return false;
		} else {
			if (temp == otp) {
				return true;
			}
		}

	}
</script>

</script>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Forgot Password</title>
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
		String otp = (String) request.getAttribute("OTP");
	%>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div
				class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">
				<div class="row w-100">
					<div class="col-lg-4 mx-auto">
						<h1
							style="color: white; font-family: Apple; font-style: italic; text-align: center">
							<b><marquee scrolldelay="10" direction="down"
									scrollamount="5" behavior="slide">
									<h2
										style="font-size: 40px; font-style: italic; font-family: Apple; color: lightgreen; text-align: center; font-weight: bold;">We
										have sent you an OTP(One Time Password) in E-mail.</h2>
								</marquee></b>
						</h1>
						<h3 style="font-style: italic; font-family: Apple; color: lightgreen; text-align: center; font-weight: bold;">Please Enter Your OTP For Reset Your Password</h3>
						<div class="auto-form-wrapper"
							style="border: solid blue; border-radius: 20px">
							<form action="resetpassword.jsp">
								<div class="form-group">

									<label class="label">OTP Verification</label>
									<div class="input-group">
										<input type="text" id="otp" name="otp"
											class="form-control mail" placeholder="Enter OTP here."
											title="Enter Your OTP" />
										<div class="input-group-append">
											<span class="input-group-text"> <i
												class="mdi mdi-check-circle-outline"></i>
											</span>
										</div>
									</div>

									<span id="otpmessage" style="color: red; font-size: small;"></span><br>
								</div>

								<div class="form-group">
									<input type="submit" onclick="return validateOtp();"
										class="btn btn-primary submit-btn btn-block" value="Submit" />
								</div>
								</form>
								<br> <br> <input type="hidden" value=<%=otp%>
									id="temp">
							
						</div>
						<p class="footer-text text-center">copyright © 2020 Issue
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
	<script src="assets/vendors/js/vendor.bundle.base.js"></script>
	<script src="assets/vendors/js/vendor.bundle.addons.js"></script>
	<!-- endinject -->
</body>
</html>