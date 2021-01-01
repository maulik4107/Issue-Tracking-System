<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function CheckPasswordStrength(password) {
		var password_strength = document.getElementById("password_strength");
		var psdmsg = document.getElementById("psdmsg");

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

		if (password.length > 8) {
			psdmsg.innerHTML = " | Password can be maximum 9 characters.";
			document.getElementById("password").style.borderColor = "green";
			document.getElementById("psdmsg").style.color = "green";

		} else {
			psdmsg.innerHTML = "";
		}
	}
	function Validatecpassword() {

		var pwd = document.getElementById("password").value;
		var cpwd = document.getElementById("cpassword").value;
		var lblError = document.getElementById("pwdlabel");
		lblError.innerHTML = "";
		if (pwd != cpwd) {
			lblError.innerHTML = "Password Not Match";
			document.getElementById("cpassword").style.borderColor = "red";
			document.getElementById("pwdlabel").style.color = "red";

		} else {
			lblError.innerHTML = "Password Matched";
			lblError.style.color = "green";
			document.getElementById("cpassword").style.borderColor = "green";

		}

	}
	function validateForm() {

		var flag = 0;
		var pwd = document.getElementById("password").value;
		var cpwd = document.getElementById("cpassword").value;
		var psdmsg = document.getElementById("psdmsg");
		var pwdlabel = document.getElementById("pwdlabel");
		psdmsg.innerHTML = "";
		pwdlabel.innerHTML = "";
		if (pwd == "") {
			psdmsg.innerHTML = "Password is Empty.";
			document.getElementById("password").style.borderColor = "red";
			flag = 1;
		}
		if (cpwd == "") {
			pwdlabel.innerHTML = "Confirm Password is Empty.";
			document.getElementById("cpassword").style.borderColor = "red";
			flag = 1;
		}
		if (pwd != cpwd) {
			pwdlabel.innerHTML = "Password Not Match";
			document.getElementById("cpassword").style.borderColor = "red";
			document.getElementById("pwdlabel").style.color = "red";
			flag = 1;
		}
		if (flag == 1) {
			return false;
		} else {
			return true;
		}

	}
</script>
<meta charset="ISO-8859-1">
<title>Reset Password</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
							<b>Reset Password</b>
						</h1>
						<div class="auto-form-wrapper"
							style="border: solid blue; border-radius: 20px">
							<form action="UpdatePassword" method="post">
								<div class="form-group">
									<div class="input-group">
										<input title="Please Enter Your New Password." type="password"
											id="password" class="form-control" placeholder="Password"
											style="font-size: small;" maxlength="9"
											onkeyup="CheckPasswordStrength(this.value);" name="password">

									</div>
									<span id="password_strength"
										style="color: red; font-size: small;"></span> <span
										id="psdmsg" style="color: red; font-size: small;"></span>

								</div>
								<div class="form-group">
									<div class="input-group">
										<input title="Please Enter Confirm Password." type="password"
											id="cpassword" class="form-control"
											placeholder="Confirm Password" style="font-size: small;"
											onkeyup="Validatecpassword();" name="cpassword" maxlength="9">

									</div>
									<span id="pwdlabel" style="color: red; font-size: small;"></span>
								</div>
								<div class="form-group">
									<input type="submit" onclick=" return validateForm();"
										class="btn btn-primary submit-btn btn-block" value="Submit" />
								</div>

							</form>
						</div>
						<p class="footer-text text-center">copyright © 2020 Issue
							Tracker. All rights reserved.</p>
						<p class="footer-text text-center text-center">
							<a href="index.jsp" target="_blank" style="color: white">Back
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

