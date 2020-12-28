<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">
	var psd = "";
	function ValidateEmail() {
		var email = document.getElementById("txtEmail").value;
		var lblError = document.getElementById("lblError");
		lblError.innerHTML = "";
		var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if (!expr.test(email)) {
			lblError.innerHTML = "Invalid E-mail address.";
		}
	}
	function CheckPasswordStrength(password) {
		var password_strength = document.getElementById("password_strength");

		psd = password;

		//TextBox left blank.
		if (password.length == 0) {
			password_strength.innerHTML = "";
			return;
		}

		//Regular Expressions.
		var regex = new Array();
		regex.push("[A-Z]"); //Uppercase Alphabet.
		regex.push("[a-z]"); //Lowercase Alphabet.
		regex.push("[0-9]"); //Digit.
		regex.push("[$@$!%*#?&]"); //Special Character.

		var passed = 0;

		//Validate for each Regular Expression.
		for (var i = 0; i < regex.length; i++) {
			if (new RegExp(regex[i]).test(password)) {
				passed++;
			}
		}

		//Validate for length of Password.
		if (passed > 2 && password.length > 8) {
			passed++;
		}

		//Display status.
		var color = "";
		var strength = "";
		switch (passed) {
		case 0:
		case 1:
			strength = "Weak";
			color = "red";
			break;
		case 2:
			strength = "Good";
			color = "darkorange";
			break;
		case 3:
		case 4:
			strength = "Strong";
			color = "green";
			break;
		case 5:
			strength = "Very Strong";
			color = "darkgreen";
			break;
		}
		password_strength.innerHTML = strength;
		password_strength.style.color = color;
	}
	function validateForm() {
		var email = document.getElementById("txtEmail").value;
		var lblError = document.getElementById("lblError");
		lblError.innerHTML = "";

		var password_strength = document.getElementById("password_strength");
		password_strength.innerHTML = "";

		if (email == "") {
			lblError.innerHTML = "Please Enter Email Address.";
		}
		if (psd.length == 0) {
			password_strength.innerHTML = "Please Enter Password.";
		}

	}
</script>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login Page</title>
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
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div
				class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">
				<div class="row w-100">
					<div class="col-lg-4 mx-auto">
						<h1
							style="color: white; font-family: Apple; font-style: italic; text-align: center">
							<b>Log in</b>
						</h1>
						<div class="auto-form-wrapper"
							style="border: solid blue; border-radius: 20px">
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
									<span id="lblError" style="color: red; font-size: small;"></span>
								</div>
								<div class="form-group">
									<label class="label">Password</label>
									<div class="input-group">
										<input type="password" class="form-control"
											placeholder="*********" id="txtPassword"
											onkeyup="CheckPasswordStrength(this.value);" />
										<div class="input-group-append">
											<span class="input-group-text"> <i
												class="mdi mdi-check-circle-outline"></i>
											</span>
										</div>
									</div>
									<span id="password_strength"
										style="color: red; font-size: small;"></span>
								</div>
								<div class="form-group">
									<button class="btn btn-primary submit-btn btn-block"
										onclick="validateForm();">Login</button>
								</div>
								<span id="labelError" style="color: red;"></span>

								<div class="form-group d-flex justify-content-between">

									<a href="forgotpassword.jsp"
										class="text-small forgot-password text-black">Forgot
										Password</a>
								</div>
								<div class="text-block text-center my-3">
									<span class="text-small font-weight-semibold">Not a
										member ?</span> <a href="register.jsp" class="text-black text-small">Create
										new account</a>
								</div>
							</form>
						</div>

						<p class="footer-text text-center">copyright © 2020 Issue
							Tracker. All rights reserved.</p>
						<p class="footer-text text-center text-center">
							<a href="index.jsp" target="_blank">Issue Tracking System</a>
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
