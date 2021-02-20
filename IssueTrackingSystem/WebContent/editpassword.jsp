<%@page import="com.issuetracker.bean.User"%>
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
	function CheckPasswordStrength(password) {
		var password_strength = document.getElementById("password_strength");
		var psdmsg = document.getElementById("psdmsg");

		psd = password;

		//TextBox left blank.
		if (password.length == 0) {
			password_strength.innerHTML = "";
			document.getElementById("psdmsg").style.color = "red";
			psdmsg.innerHTML = "Password is Empty";
			document.getElementById("password").style.borderColor = "red";
			document.getElementById("p").style.color = "red";
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
			document.getElementById("password").style.borderColor = "green";
			document.getElementById("p").style.color = "green";
			break;
		case 2:
			strength = "Good";
			color = "orange";
			document.getElementById("password").style.borderColor = "green";
			document.getElementById("p").style.color = "green";
			break;
		case 3:
			strength = "Very Good";
			color = "darkorange";
			document.getElementById("password").style.borderColor = "green";
			document.getElementById("p").style.color = "green";
			break;
		case 4:
			strength = "Strong";
			color = "green";
			document.getElementById("password").style.borderColor = "green";
			document.getElementById("p").style.color = "green";
			break;
		case 5:
			strength = "Very Strong";
			color = "darkgreen";
			document.getElementById("password").style.borderColor = "green";
			document.getElementById("p").style.color = "green";
			break;
		}
		password_strength.innerHTML = strength;
		password_strength.style.color = color;

		if (password.length > 8) {
			psdmsg.innerHTML = " | Password can be maximum 9 characters.";
			document.getElementById("password").style.borderColor = "green";
			document.getElementById("psdmsg").style.color = "green";
			document.getElementById("p").style.color = "green";

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
			document.getElementById("cp").style.color = "red";

		} else {
			lblError.innerHTML = "Password Matched";
			lblError.style.color = "green";
			document.getElementById("cpassword").style.borderColor = "green";
			document.getElementById("cp").style.color = "green";
		}

	}
	function checkPwd(pwd) {
		var flag = 0;
		if (pwd.length != 0) {
			document.getElementById("epassword").style.borderColor = "green";
			document.getElementById("checkPwd").innerHTML = "";
			document.getElementById("ep").style.color = "green";
		}
		if (pwd == 0) {
			document.getElementById("epassword").style.borderColor = "red";
			document.getElementById("checkPwd").innerHTML = "Current Password is Empty.";
			document.getElementById("ep").style.color = "red";
		}
	}
	function validateForm() {

		var flag = 0;
		var pwd = document.getElementById("password").value;
		var cpwd = document.getElementById("cpassword").value;
		var epwd = document.getElementById("epassword").value;
		var psdmsg = document.getElementById("psdmsg");
		var pwdlabel = document.getElementById("pwdlabel");
		var checkpwd = document.getElementById("checkPwd");
		psdmsg.innerHTML = "";
		pwdlabel.innerHTML = "";
		checkpwd.innerHTML = "";
		if (epwd == "") {
			checkpwd.innerHTML = "Current Password is Empty.";
			document.getElementById("epassword").style.borderColor = "red";
			document.getElementById("ep").style.color = "red";
			flag = 1;
		}
		if (pwd == "") {
			psdmsg.innerHTML = "Password is Empty.";
			document.getElementById("password").style.borderColor = "red";
			document.getElementById("p").style.color = "red";
			flag = 1;
		}
		if (cpwd == "") {
			pwdlabel.innerHTML = "Confirm Password is Empty.";
			document.getElementById("cpassword").style.borderColor = "red";
			document.getElementById("cp").style.color = "red";
			flag = 1;
		}
		if (pwd != cpwd) {
			pwdlabel.innerHTML = "Password Not Match";
			document.getElementById("cpassword").style.borderColor = "red";
			document.getElementById("pwdlabel").style.color = "red";
			document.getElementById("cp").style.color = "red";
			flag = 1;
		}
		if (flag == 1) {
			return false;
		} else {
			return true;
		}

	}
	$(document)
			.ready(
					function() {

						$("input[type=password]")
								.blur(
										function() {
											var str = $(".pwd").val();
											$
													.get(
															"CheckExistingPassword",
															{
																pwd : str
															})
													.done(
															function(data) {
																if (data == 'false') {

																	var lblError = document
																			.getElementById("checkPwd");
																	document
																			.getElementById("ep").style.color = "red";

																	document
																			.getElementById("epassword").style.borderColor = "red";

																	lblError.innerHTML = "Sorry !!! Password is not Exists.";

																	document
																			.getElementById("epassword").value = "";
																}
															});

										});
					});
</script>

<title>Change Password</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<%
		int id = (Integer) request.getAttribute("id");
	%>
	<%
		String msg = (String) request.getAttribute("msg");
	%>

	<div class="container-scroller">
		<!-- partial:../../partials/_navbar.jsp -->
		<%@include file="_navbar.jsp"%>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:../../partials/_sidebar.html -->
			<%
				if (id == 0) {
			%>
			<%@include file="adminsidebar.jsp"%>
			<%
				} else if (id == 1) {
			%>
			<%@include file="projectmanagersidebar.jsp"%>
			<%
				}
			%>
			<div class="main-panel">
				<div class="content-wrapper">
					<div
						class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">
						<div class="row w-100">
							<div style="align-content: center;">
								<h1
									style="color: darkblue; font-family: Apple; font-style: italic; margin-left: 200px; text-align: center">
									<b>Edit Password</b>
								</h1>
								<div class="auto-form-wrapper"
									style="border: solid blue; margin-left: 200px; width: 800px; border-radius: 20px">
									<form action="UpdatePassword">
										<div class="form-group">
											<label class="label">Current Password</label>
											<div class="input-group">
												<input title="Please Enter Your Current Password."
													type="password" id="epassword" class="form-control pwd"
													placeholder="Current Password" style="font-size: small;"
													maxlength="9" onkeyup="checkPwd(this.value);" name="epwd">
												<i id="ep" class="mdi mdi-check-circle-outline"
													style="margin-left: 5px;"></i>

											</div>
											<span id="checkPwd" style="color: red; font-size: small;"></span>
										</div>

										<div class="form-group">
											<label class="label">New Password</label>
											<div class="input-group">
												<input title="Please Enter Your New Password."
													type="password" id="password" class="form-control"
													placeholder="New Password" style="font-size: small;"
													maxlength="9" onkeyup="CheckPasswordStrength(this.value);"
													name="password"> <i id="p"
													class="mdi mdi-check-circle-outline"
													style="margin-left: 5px;"></i>

											</div>
											<span id="password_strength"
												style="color: red; font-size: small;"></span> <span
												id="psdmsg" style="color: red; font-size: small;"></span>

										</div>
										<div class="form-group">
											<label class="label">Confirm Password</label>
											<div class="input-group">
												<input title="Please Enter Confirm Password."
													type="password" id="cpassword" class="form-control"
													placeholder="Confirm Password" style="font-size: small;"
													onkeyup="Validatecpassword();" name="cpassword"
													maxlength="9"> <i id="cp"
													class="mdi mdi-check-circle-outline"
													style="margin-left: 5px;"></i>

											</div>
											<span id="pwdlabel" style="color: red; font-size: small;"></span>
										</div>
										<div class="form-group">
											<input type="submit" onclick=" return validateForm();"
												class="btn btn-primary submit-btn btn-block"
												value="Save Changes" /> <span id="labelError"
												style="color: green; font-style: italic; font-family: apple; font-weight: bolder; font-size: medium;">
												<%
													if (msg != null) {
												%><%=msg%> <%
 	}
 %>
											</span><br>
											<%
												if (id == 0) {
											%>
											<a href="PasswordLinkCheck?id=0"
												style="color: blue; margin-left: 270px; font-style: italic; font-family: apple; font-weight: bolder;">Forgot
												Current Password?</a>
											<%
												} else if (id == 1) {
											%>
											<a href="PasswordLinkCheck?id=1"
												style="color: blue; margin-left: 270px; font-style: italic; font-family: apple; font-weight: bolder;">Forgot
												Current Password?</a>
											<%
												}
											%>
										</div>
									</form>

								</div>
								<p class="footer-text text-center"
									style="color: black; margin-left: 250px; font-weight: bolder;">copyright
									© 2020 Issue Tracker. All rights reserved.</p>
								<p class="footer-text text-center text-center">
									<%
										if (id == 0) {
									%>
									<a href="AdminHome.jsp" target="_blank"
										style="color: black; margin-left: 230px; font-weight: bolder;">Back</a>
									<%
										}
									%>
									<%
										if (id == 1) {
									%>
									<a href="projectmanagerhome.jsp" target="_blank"
										style="color: black; margin-left: 230px; font-weight: bolder;">Back</a>
									<%
										}
									%>
								</p>
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