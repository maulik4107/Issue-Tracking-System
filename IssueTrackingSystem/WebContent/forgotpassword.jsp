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
<div class="se-pre-con"></div>
	<%int id=(Integer)request.getAttribute("id"); %>
	<%
		String msg = (String) request.getAttribute("confirmation");
	%>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div
				class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">
				<div class="row w-100">
					<div style="align-content: center;">
						<h1
							style="color: darkblue;margin-left:320px; font-family: Apple; font-style: italic; text-align: center">
							<b><i class="bi bi-lock-fill" style="margin-right: 10px;"></i>Forgot Password !</b>
						</h1>
						<div class="auto-form-wrapper"
							style="border: solid blue; margin-left:380px; width:800px; border-radius: 20px">
							<form action="ValidateEmail">
								<div class="form-group">

									<label class="label"><i class="bi bi-envelope-fill" style="margin-right: 10px;"></i>Email</label>
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
								<input type="hidden" value="<%=id%>" name="id">
							</form>
						</div>
						<%
							if (id==0) {
						%>
						<p class="footer-text text-center"
							style="color: white; margin-left:320px;font-weight: bolder;">copyright ©
							2020 Issue Tracker. All rights reserved.</p>
						<p class="footer-text text-center text-center">
							<a href="EditPasswordCheck?id=0" 
								style="color: white;margin-left:320px; font-weight: bolder;"><i class="bi bi-reply-fill" style="margin-right: 10px;"></i>Back</a>
						</p>
						<%
							} else if(id==-1){
						%>
						<p class="footer-text text-center"
							style="color: white; margin-left:320px;font-weight: bolder;">copyright ©
							2020 Issue Tracker. All rights reserved.</p>
						<p class="footer-text text-center text-center">
							<a href="login.jsp" 
								style="color: white;margin-left:320px; font-weight: bolder;"><i class="bi bi-reply-fill" style="margin-right: 10px;"></i>Back to Login Page</a>
						</p>

						<%
							}else if(id==1){
						%>
						<p class="footer-text text-center"
							style="color: white; margin-left:320px;font-weight: bolder;">copyright ©
							2020 Issue Tracker. All rights reserved.</p>
						<p class="footer-text text-center text-center">
							<a href="EditPasswordCheck?id=1" 
								style="color: white;margin-left:320px; font-weight: bolder;"><i class="bi bi-reply-fill" style="margin-right: 10px;"></i>Back</a>
						</p>

						<%
							}else if(id==2){
						%>
						<p class="footer-text text-center"
							style="color: white; margin-left:320px;font-weight: bolder;">copyright ©
							2020 Issue Tracker. All rights reserved.</p>
						<p class="footer-text text-center text-center">
							<a href="EditPasswordCheck?id=2"
								style="color: white; margin-left:320px;font-weight: bolder;"><i class="bi bi-reply-fill" style="margin-right: 10px;"></i>Back</a>
						</p>
						<%} else{%>
						<p class="footer-text text-center"
							style="color: white;margin-left:320px; font-weight: bolder;">copyright ©
							2020 Issue Tracker. All rights reserved.</p>
						<p class="footer-text text-center text-center">
							<a href="EditPasswordCheck?id=3"
								style="color: whiteS;margin-left:320px; font-weight: bolder;"><i class="bi bi-reply-fill" style="margin-right: 10px;"></i>Back</a>
						</p>
						<%} %>
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