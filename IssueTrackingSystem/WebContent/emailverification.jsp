<%@page import="com.issuetracker.bean.User"%>
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
		}
		else
		{
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
			flag = 1;
			document.getElementById("otp").style.borderColor = "red";
			document.getElementById("uotp").style.color = "red";
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
<div class="se-pre-con"></div>
	<%
		String uname = (String) request.getAttribute("uname");
	%>

	<%
		User user = (User) request.getAttribute("user");
	%>

	<%
		String gotp = (String) request.getAttribute("OTP");
	%>
	<%
		String msg = (String) request.getAttribute("msg");
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
										style="font-size: 40px;margin-left: 340px; font-style: italic; font-family: Apple; color: darkblue; text-align: center; font-weight: bold;">We
										have sent you an OTP(One Time Password) in E-mail.</h2>
								</marquee></b>
						</h1>
						<%
							}
						%>
						<h3
							style="font-style: italic; font-family: Apple;margin-left: 380px; color: darkblue; text-align: center; font-weight: bold;">Please
							Enter Your OTP(One Time Password).</h3>
						<div class="auto-form-wrapper"
							style="border: solid blue; margin-left: 380px; width: 800px; border-radius: 20px">
							<form action="UserRegistrationDataBase" method="post">
								<div class="form-group">

									<label class="label">OTP Verification</label>
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
									<span id="otp" style="color: red; font-size: small;"><%=msg%></span><br>
									<%
										}
									%>
								</div>

								<div class="form-group">
									<input type="submit" onclick="return validateOtp();"
										class="btn btn-primary submit-btn btn-block" value="Submit" />
								</div>
								<input type="hidden" value="<%=uname%>" name="user"> <input
									type="hidden" value="<%=user.getUserName()%>" name="uname">
								<input type="hidden" value="<%=user.getUserAddress()%>"
									name="uaddress"> <input type="hidden"
									value="<%=user.getUserContact()%>" name="ucontact"> <input
									type="hidden" value="<%=user.getAreaId()%>" name="uarea">
								<input type="hidden" value="<%=user.getUserEmail()%>"
									name="uemail"> <input type="hidden"
									value="<%=user.getPassword()%>" name="upsd"> <input
									type="hidden" value="<%=user.getRoleId()%>" name="urole">
								<input type="hidden" value="<%=gotp%>" id="temp" name="gotp">
							</form>
							<br> <br>



						</div>
						<p class="footer-text text-center" style="color:white;margin-left: 310px;">copyright ? 2020 Issue
							Tracker. All rights reserved.</p>
						<p class="footer-text text-center" style="color:white;margin-left: 300px;">
							<a href="login.jsp">Back</a>
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