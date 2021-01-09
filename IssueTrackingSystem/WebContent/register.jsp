
<%@page import="com.issuetracker.bean.Role"%>
<%@page import="com.issuetracker.bean.Area"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">

	var psd = "";
	function ValidateEmail() {
		var email = document.getElementById("txtEmail").value;
		var lblError = document.getElementById("lblError");
		lblError.innerHTML = "";
		var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if (!expr.test(email)) {
			lblError.innerHTML = "Invalid E-mail address.";
			document.getElementById("txtEmail").style.borderColor = "red";

		} else {
			document.getElementById("txtEmail").style.borderColor = "green";
		}
	}
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
	function validateForm() {

		var flag = 0;

		var uname = document.getElementById("username").value;
		var contact = document.getElementById("contact").value;
		var address = document.getElementById("address").value;
		var area = document.getElementById("area");
		var selectedValue = area.options[area.selectedIndex].value;
		var email = document.getElementById("txtEmail").value;
		var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

		var role = document.getElementById("role");
		var selectedvalue = role.options[role.selectedIndex].value;
		var pwd = document.getElementById("password").value;
		var cpwd = document.getElementById("cpassword").value;

		var ulabel = document.getElementById("ulabel");
		var clabel = document.getElementById("clabel");
		var laddress = document.getElementById("laddress");
		var larea = document.getElementById("larea");
		var lblError = document.getElementById("lblError");
		var lrole = document.getElementById("lrole");

		var psdmsg = document.getElementById("psdmsg");
		var pwdlabel = document.getElementById("pwdlabel");

		ulabel.innerHTML = "";
		clabel.innerHTML = "";
		laddress.innerHTML = "";
		larea.innerHTML = "";
		lblError.innerHTML = "";
		lrole.innerHTML = "";
		psdmsg.innerHTML = "";
		pwdlabel.innerHTML = "";

		if (uname == "") {
			ulabel.innerHTML = "User Name is Empty.";
			document.getElementById("username").style.borderColor = "red";
			flag = 1;

		}
		if (uname.length < 3) {
			ulabel.innerHTML = "Please Enter at least 3 Character.";
			document.getElementById("username").style.borderColor = "red";
			flag = 1;

		}
		if (contact == "") {
			clabel.innerHTML = "Contact is empty.";
			document.getElementById("contact").style.borderColor = "red";
			flag = 1;
		}
		if (contact.length < 10) {
			document.getElementById("contact").style.borderColor = "red";
			clabel.innerHTML = "Contact Number should be 10 digits";
			flag=1;
		}
		if (address == "") {
			laddress.innerHTML = "Address is Empty.";
			document.getElementById("address").style.borderColor = "red";
			flag = 1;
		}
		if (selectedValue == "") {
			larea.innerHTML = "Area Name is Not Selected.";
			document.getElementById("area").style.borderColor = "red";
			flag = 1;
		}
		if (email == "") {
			lblError.innerHTML = "Email is Empty.";
			document.getElementById("txtEmail").style.borderColor = "red";
			flag = 1;
		}
		if (!expr.test(email)) {
			lblError.innerHTML = "Invalid E-mail address.";
			document.getElementById("txtEmail").style.borderColor = "red";
			flag=1;
		} 
		if (selectedvalue == "") {
			lrole.innerHTML = "Role is Not Selected.";
			document.getElementById("role").style.borderColor = "red";
			flag = 1;
		}
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
	function ValidateUser() {
		var uname = document.getElementById("username").value;
		var lblError = document.getElementById("ulabel");

		lblError.innerHTML = "";

		if (uname == null || uname.length < 3) {
			lblError.innerHTML = "Please Enter at least 3 Character.";
			document.getElementById("username").style.borderColor = "red";

		} else {
			document.getElementById("username").style.borderColor = "green";
		}

	}
	function ValidatePhone() {
		var contact = document.getElementById("contact").value;
		var lblError = document.getElementById("clabel");
		lblError.innerHTML = "";

		if (contact.length < 10) {
			document.getElementById("contact").style.borderColor = "red";
			lblError.innerHTML = "Contact Number should be 10 digits";
		} else {
			document.getElementById("contact").style.borderColor = "green";
		}

		if (isNaN(contact)) {
			lblError.innerHTML = "Enter Numeric Values Only";
			document.getElementById("contact").value = "";
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
	function ValidateAddress() {
		var address = document.getElementById("address").value;
		var laddress = document.getElementById("laddress");
		laddress.innerHTML = "";

		if (address.length == 0) {
			laddress.innerHTML = "Address is Empty";
			document.getElementById("address").style.borderColor = "red";

		} else {
			document.getElementById("address").style.borderColor = "green";
		}

	}
	function selectArea() {
		var area = document.getElementById("area");
		var selectedValue = area.options[area.selectedIndex].value;
		var larea = document.getElementById("larea");
		larea.innerHTML = "";

		if (selectedValue == "") {
			larea.innerHTML = "Area Name is Not Selected.";
			document.getElementById("area").style.borderColor = "red";

		} else {
			document.getElementById("area").style.borderColor = "green";
		}

	}
	function selectRole() {
		var role = document.getElementById("role");
		var selectedvalue = role.options[role.selectedIndex].value;
		var lrole = document.getElementById("lrole");
		lrole.innerHTML = "";

		if (selectedvalue == "") {
			lrole.innerHTML = "Role is Not Selected.";
			document.getElementById("role").style.borderColor = "red";
		} else {
			document.getElementById("role").style.borderColor = "green";
		}
	}

	$(document)
			.ready(
					function() {

						$("input[type=email]")
								.blur(
										function() {
											var str = $(".mail").val();
											$
													.get("ExistEmailCheck", {
														email : str
													})
													.done(
															function(data) {
																if (data == 'true') {

																	var lblError = document
																			.getElementById("lblError");

																	document
																			.getElementById("txtEmail").style.borderColor = "red";

																	lblError.innerHTML = "Sorry !!! Email Id is Already Exists.";

																	document
																			.getElementById("txtEmail").value = "";
																}
															});

										});
					});
</script>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Registration Page of ITS</title>
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
<!-- Layout styles -->
<link rel="stylesheet" href="assets/css/demo_1/style.css">
<!-- End Layout styles -->
<link rel="shortcut icon" href="assets/images/favicon.ico" />
</head>
<body>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div
				class="content-wrapper d-flex align-items-center auth register-bg-1 theme-one">
				<div class="row w-100">
					<div class="col-lg-4 mx-auto">
						<h2 class="text-center mb-4"></h2>
						<h1
							style="color: white; font-family: Apple; font-style: italic; text-align: center">
							<b>Registration</b>
						</h1>
						<div class="auto-form-wrapper"
							style="border: solid blue; border-radius: 20px">
							<form action="IssueRegistration" method="post">
								<div class="form-group">
									<div class="input-group">
										<input title="Enter Your Name." type="text" id="username" class="form-control"
											placeholder="Username" style="font-size: small;"
											onkeyup="ValidateUser();" name="uname">
									</div>
									<span id="ulabel" style="color: red; font-size: small;"></span>

								</div>

								<div class="form-group">
									<div class="input-group">
										<input type="tel" maxlength="10" pattern="\d{10}"
											title="please enter Exactly 10 digits" id="contact"
											class="form-control" placeholder="Contact"
											style="font-size: small;" onkeyup="ValidatePhone();"
											name="contact">

									</div>
									<span id="clabel" style="color: red; font-size: small;"></span>

								</div>
								<div class="form-group">
									<div class="input-group">
										<input type="text" id="address" class="form-control"
											placeholder="Address" style="font-size: small;"
											onkeyup="ValidateAddress();" name="address">

									</div>
									<span id="laddress" style="color: red; font-size: small;"></span>

								</div>
								<div class="form-group">
									<div class="input-group">
										<%
											List<Area> areaList = (List) request.getAttribute("areaList");
										%>
										<select title="Please select Your Area." onchange="selectArea();" class="form-control"
											id="area" style="font-size: small;" name="area">
											<option value="">select area</option>
											<%
												for (Area area : areaList) {
											%>
											<option value="<%=area.getAreaId()%>"><%=area.getAreaName()%></option>
											<%
												}
											%>
										</select>

									</div>
									<span id="larea" style="color: red; font-size: small;"></span>

								</div>
								<div class="form-group">
									<div class="input-group">
										<input title="Enter Valid Email Address i.e. abc@gmail.com" type="email" class="form-control mail" id="txtEmail"
											placeholder="Email" style="font-size: small;"
											onkeyup="ValidateEmail();" name="email">

									</div>
									<span id="lblError" style="color: red; font-size: small;"></span>

								</div>
								<div class="form-group">
									<div class="input-group">
										<%
											List<Role> roleList = (List) request.getAttribute("roleList");
										%>
										<select onchange="selectRole();" class="form-control"
											id="role" style="font-size: small;" name="role">
											<option value="">select Role</option>
											<%
												for (Role role : roleList) {
											%>
											<option value="<%=role.getRoleId()%>"><%=role.getRoleName()%></option>
											<%
												}
											%>
										</select>

									</div>
									<span id="lrole" style="color: red; font-size: small;"></span>

								</div>
								<div class="form-group">
									<div class="input-group">
										<input  title="Please Enter Your Password." type="password" id="password" class="form-control"
											placeholder="Password" style="font-size: small;"
											maxlength="9" onkeyup="CheckPasswordStrength(this.value);"
											name="password">

									</div>
									<span id="password_strength"
										style="color: red; font-size: small;"></span> <span
										id="psdmsg" style="color: red; font-size: small;"></span>

								</div>
								<div class="form-group">
									<div class="input-group">
										<input title="Please Enter Confirm Password." type="password" id="cpassword" class="form-control"
											placeholder="Confirm Password" style="font-size: small;"
											onkeyup="Validatecpassword();" name="cpassword" maxlength="9">

									</div>
									<span id="pwdlabel" style="color: red; font-size: small;"></span>
								</div>

								<div class="form-group">
									<input type="submit" onclick=" return validateForm();"
										class="btn btn-primary submit-btn btn-block" value="register" />
								</div>
							</form>
						</div>
						<div class="text-block text-center my-3">
							<span class="text-small font-weight-semibold"
								style="color: white;">Already have an account ?</span> <a
								href="login.jsp" class="text-black text-small"
								style="color: white;">Login</a>
						</div>
						<p class="footer-text text-center">copyright © 2020 Issue
							Tracker. All rights reserved.</p>
						<p class="footer-text text-center text-center">
							<a href="index.jsp" target="_blank">Back to Home</a>
						</p>

					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="assets/vendors/js/vendor.bundle.base.js"></script>
	<script src="assets/vendors/js/vendor.bundle.addons.js"></script>
	<!-- endinject -->

	<script src="assets/js/shared/jquery.cookie.js" type="text/javascript"></script>
</body>
</html>