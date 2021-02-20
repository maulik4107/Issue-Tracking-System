<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">
	var flag = 0;
	var psd = "";
	function ValidateEmail() {
		var email = document.getElementById("txtEmail").value;
		var lblError = document.getElementById("lblError");
		lblError.innerHTML = "";
		var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if (!expr.test(email)) {
			lblError.innerHTML = "Invalid E-mail address.";
			document.getElementById("txtEmail").style.borderColor = "red";
			document.getElementById("check").style.color = "red";
		} else {
			document.getElementById("txtEmail").style.borderColor = "green";
			document.getElementById("check").style.color = "green";
		}
	}
	function CheckPasswordStrength(password) {
		var password_strength = document.getElementById("password_strength");
		document.getElementById("txtPassword").style.borderColor = "green";
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
			document.getElementById("txtPassword").style.borderColor = "green";
			document.getElementById("checkp").style.color = "green";
			break;
		case 2:
			strength = "Good";
			color = "orange";
			document.getElementById("txtPassword").style.borderColor = "green";
			document.getElementById("checkp").style.color = "green";
			break;
		case 3:
			strength ="Very Good";
			color="darkorange";
			document.getElementById("txtPassword").style.borderColor = "green";
			document.getElementById("checkp").style.color = "green";
			break;
		case 4:
			strength = "Strong";
			color = "green";
			document.getElementById("txtPassword").style.borderColor = "green";
			document.getElementById("checkp").style.color = "green";
			break;
		case 5:
			strength = "Very Strong";
			color = "darkgreen";
			document.getElementById("txtPassword").style.borderColor = "green";
			document.getElementById("checkp").style.color = "green";
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
			document.getElementById("txtEmail").style.borderColor = "red";
			document.getElementById("check").style.color = "red";
			flag = 1;
		}
		if (psd.length == 0) {
			password_strength.innerHTML = "Please Enter Password.";
			document.getElementById("txtPassword").style.borderColor = "red";
			document.getElementById("checkp").style.color = "red";
			flag = 1;
		}
		if (flag == 1) {
			return false;
		} else {
			return true;
		}

	}
</script>
<title>Login Page</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<%
		String confirm = (String) request.getAttribute("msg");
	%>
	<%
		String msg = (String) request.getAttribute("message");
	%>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div
				class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">
				<div class="row w-100">
					<div style="align-content: center;">
						<%
							if (confirm != null) {
						%>
						<marquee scrolldelay="10" direction="down" scrollamount="5"
							behavior="slide">
							<h3
								style="font-size: 35px; font-style: italic; font-family: Apple; color: darkblue; text-align: center; font-weight: bold;"><%=confirm%></h3>
						</marquee>
						<%
							}
						%>
						<h1
							style="color: darkblue;margin-left:320px; font-family: Apple; font-style: italic; text-align: center">
							<b>Log in</b>
						</h1>
						<div class="auto-form-wrapper"
							style="border: solid blue; margin-left:380px; width:800px; border-radius: 20px">
							<form action="LogIn" method="post">
								<div class="form-group">
									<label class="label">Email</label>
									<div class="input-group">
										<input type="text" name="email" id="txtEmail"
											class="form-control" placeholder="example@gmail.com"
											onkeyup="ValidateEmail();"/>
											<i id="check" class="mdi mdi-check-circle-outline" style="margin-left: 5px;"></i>
									</div>
									<span id="lblError" style="color: red; font-size: small;"></span>
								</div>
								<div class="form-group">
									<label class="label">Password</label>
									<div class="input-group">
										<input type="password" name="pwd" class="form-control"
											placeholder="*********" id="txtPassword"
											onkeyup="CheckPasswordStrength(this.value);" />
											<i id="checkp" class="mdi mdi-check-circle-outline" style="margin-left: 5px;"></i>
									</div>
									<span id="password_strength"
										style="color: red; font-size: small;"></span>
								</div>
								<div class="form-group">
									<input type="submit"
										class="btn btn-primary submit-btn btn-block"
										onclick="return validateForm();" value="Login">
								</div>
								<span id="labelError" style="color: red;"> 
								<%if (msg != null) {%>
									<%=msg%> 
								<%}%>
								</span>

								<div class="form-group d-flex justify-content-between">

									<a href="PasswordLinkCheck?id=-1" style="color: black;font-weight: bolder;"
										class="text-small forgot-password text-black">Forgot
										Password ?</a>
								</div>
								<div class="text-block text-center my-3">
									<span class="text-small font-weight-semibold">Not a
										member ?</span> <a href="DisplayAreaAndRole" class="text-black text-small">Create
										new account</a>
								</div>
							</form>
						</div>
						<p class="footer-text text-center" style="color: black;margin-left:320px; font-weight: bolder;">copyright © 2020 Issue
							Tracker. All rights reserved.</p>
						<p class="footer-text text-center text-center">
							<a href="index.jsp" target="_blank" style="color: black;margin-left:320px; font-weight: bolder;">Back
								to Home</a>
						</p>
					</div>
				</div>
			</div>
			<!-- content-wrapper ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<%@include file="commonjspluggins.jsp"%>
</body>
</html>
