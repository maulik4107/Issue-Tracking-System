<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
	function verifyOtp() {
		var otp = document.getElementById("otp").value;
		var lblError = document.getElementById("otpmessage");
		lblError.innerHTML = "";

		if (otp.length > 0) {
			document.getElementById("otp").style.borderColor = "green";
			document.getElementById("uotp").style.color = "green";
		} else {
			lblError.innerHTML = "Please Enter Your OTP!";
			document.getElementById("otp").style.borderColor = "red";
			document.getElementById("uotp").style.color = "red";
		}
	}

	function validateOtp() {
		var flag = 0;

		var otp = document.getElementById("otp").value;
		var lblError = document.getElementById("otpmessage");
		lblError.innerHTML = "";

		if (otp.length <= 0) {
			lblError.innerHTML = "Please Enter Your OTP!";
			document.getElementById("otp").style.borderColor = "red";
			document.getElementById("uotp").style.color = "red";
			flag = 1;
			return false;
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
		String email = (String) request.getAttribute("email");
	%>
	<%
		String otp = (String) request.getAttribute("OTP");
	%>
	<%
		String msg = (String) request.getAttribute("msg");
	%>
	<%
		int id = (Integer) request.getAttribute("id");
	%>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div
				class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">
				<div class="row w-100">
					<div style="align-content: center;">
						<%
							if (msg == null) {
						%>
						<h1
							style="color: white; font-family: Apple; font-style: italic; text-align: center">
							<b><marquee scrolldelay="10" direction="down"
									scrollamount="5" behavior="slide">
									<h2
										style="color: darkblue; margin-left: 380px; font-family: Apple; font-style: italic; font-weight: bold; text-align: center">We
										have sent you an OTP(One Time Password) in E-mail.</h2>
								</marquee></b>
						</h1>
						<%
							}
						%>
						<h1
							style="color: darkblue; margin-left: 380px; font-family: Apple; font-style: italic; font-weight: bold; text-align: center">Please
							Enter Your OTP For Reset Your Password</h1>
						<div class="auto-form-wrapper"
							style="border: solid blue; margin-left: 380px; width: 800px; border-radius: 20px">
							<form action="PasswordOtpVerify" method="post">
								<div class="form-group">

									<label class="label"><i class="bi bi-lock-fill" style="margin-right: 10px;"></i>OTP Verification</label>
									<div class="input-group">
										<input type="text" id="otp" name="otp"
											class="form-control mail" placeholder="Enter OTP here."
											title="Enter Your OTP" onkeyup="verifyOtp();" /> <i
											id="uotp" class="mdi mdi-check-circle-outline"
											style="margin-left: 5px;"></i>
									</div>

									<span id="otpmessage" style="color: red; font-size: small;"></span><br>

									<%
										if (msg != null) {
									%>
									<span id="otpv" style="color: red; font-size: small;"><%=msg%></span><br>
									<%
										}
									%>

								</div>

								<div class="form-group">
									<input type="submit" onclick="return validateOtp();"
										class="btn btn-primary submit-btn btn-block" value="Submit" />
								</div>
								<input type="hidden" value=<%=email%> name="email"> <input
									type="hidden" value=<%=otp%> id="temp" name="gotp"> <input
									type="hidden" value="<%=id%>" name="id">
							</form>
							<br> <br>

						</div>
						<p class="footer-text text-center" style="color:white;margin-left: 380px;">copyright
							© 2020 Issue Tracker. All rights reserved.</p>
						<%
							if (id == -1) {
						%>
						<p class="footer-text text-center text-center"
							style="margin-left: 380px;">
							<a href="PasswordLinkCheck?id=-1"style="color:white;"><i class="bi bi-reply-fill" style="margin-right: 10px;"></i>Back</a>
						</p>
						<%
							} else if (id == 0) {
						%>
						<p class="footer-text text-center text-center"
							style="margin-left: 380px;">
							<a href="PasswordLinkCheck?id=0"style="color:white;" ><i class="bi bi-reply-fill" style="margin-right: 10px;"></i>Back</a>
						</p>
						<%
							} else if (id == 1) {
						%>
						<p class="footer-text text-center text-center"
							style="margin-left: 380px;">
							<a href="PasswordLinkCheck?id=1" style="color:white"><i class="bi bi-reply-fill" style="margin-right: 10px;"></i>Back</a>
						</p>
						<%
							} else if (id == 2) {
						%>
						<p class="footer-text text-center text-center"
							style="margin-left: 380px;">
							<a href="PasswordLinkCheck?id=2" style="color:white";><i class="bi bi-reply-fill" style="margin-right: 10px;"></i>Back</a>
						</p>
						<%
							} else {
						%>
						<p class="footer-text text-center text-center"
							style="margin-left: 380px;">
							<a href="PasswordLinkCheck?id=3"style="color:white;" ><i class="bi bi-reply-fill" style="margin-right: 10px;"></i>Back</a>
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