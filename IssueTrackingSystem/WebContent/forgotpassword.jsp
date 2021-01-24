<%@page import="com.issuetracker.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
	function ValidateEmail() {
		var email = document.getElementById("txtEmail").value;
		var lblError = document.getElementById("lblError");
		lblError.innerHTML = "";
		var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if (!expr.test(email)) {
			lblError.innerHTML = "Invalid E-mail address.";
			document.getElementById("txtEmail").style.borderColor = "red";
			document.getElementById("uemail").style.color = "red";
		} else {
			document.getElementById("txtEmail").style.borderColor = "green";
			document.getElementById("uemail").style.color = "green";
		}
	}
	function validateForm() {
		var flag = 0;

		var email = document.getElementById("txtEmail").value;
		var lblError = document.getElementById("lblError");
		lblError.innerHTML = "";

		if (email == "") {
			lblError.innerHTML = "Please Enter Email Address.";
			document.getElementById("txtEmail").style.borderColor = "red";
			document.getElementById("uemail").style.color = "red";
			flag = 1;
		}
		if (flag == 1) {
			return false;
		} else {
			return true;
		}

	}
</script>
<title>Forgot Password</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<%
		HttpSession session1 = request.getSession(false);
	User u = (User) session1.getAttribute("user");
	%>
	<%
		String msg = (String) request.getAttribute("confirmation");
	%>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div
				class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">
				<div class="row w-100">
					<div class="col-lg-4 mx-auto">
						<h1
							style="color: darkblue; font-family: Apple; font-style: italic; text-align: center">
							<b>Forgot Password !</b>
						</h1>
						<div class="auto-form-wrapper"
							style="border: solid blue; border-radius: 20px">
							<form action="ValidateEmail">
								<div class="form-group">

									<label class="label">Email</label>
									<div class="input-group">
										<input type="email" name="email" id="txtEmail"
											class="form-control mail" placeholder="example@gmail.com"
											onkeyup="ValidateEmail();" /> <i id="uemail"
											class="mdi mdi-check-circle-outline"
											style="margin-left: 5px;"></i>
									</div>
									<span id="lblError" style="color: red; font-size: small;"></span>
									<br>
									<%
										if (msg != null) {
									%>
									<span style="color: red; font-size: small;"><%=msg%></span>
									<%
										}
									%>
								</div>

								<div class="form-group">
									<input type="submit"
										class="btn btn-primary submit-btn btn-block"
										onclick="return validateForm();" value="submit">
								</div>
							</form>
						</div>
						<%
							if (u != null) {
						%>
						<p class="footer-text text-center"
							style="color: darkblue; font-weight: bolder;">copyright ©
							2020 Issue Tracker. All rights reserved.</p>
						<p class="footer-text text-center text-center">
							<a href="editpassword.jsp" target="_blank"
								style="color: darkblue; font-weight: bolder;">Back</a>
						</p>
						<%
							} else {
						%>
						<p class="footer-text text-center"
							style="color: darkblue; font-weight: bolder;">copyright ©
							2020 Issue Tracker. All rights reserved.</p>
						<p class="footer-text text-center text-center">
							<a href="index.jsp" target="_blank"
								style="color: darkblue; font-weight: bolder;">Back to Home</a>
						</p>

						<%
							}
						%>
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