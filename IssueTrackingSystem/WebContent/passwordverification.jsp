<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
		if(otp!=temp)
		{
			lblError.innerHTML = "Invalid OTP.";
			flag=1;
		}

		if (flag == 1) {
			return false;
		} else {
			if(temp==otp)
			{
			return true;
			}
		}

	}
</script>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Password getting Page</title>
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
<!-- inject:css -->
<link rel="stylesheet" href="assets/css/shared/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="assets/images/favicon.ico" />
</head>
<body>
	<%String otp = (String)request.getAttribute("OTP"); %>
  	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex  error-page bg-info">

				<div class="text-white"
					style="text-align: center; margin-top: 200px; margin-left: 50px;">

					<marquee scrolldelay="10" direction="down" scrollamount="5"
						behavior="slide">
						<h2
							style="font-size: 60px; font-style: italic; font-family: Apple; color: white; text-align: center;">We
							have sent you an OTP(One Time Password) in E-mail.</h2>
					</marquee>
					<br> <br>
					<form action="resetpassword.jsp">
						<h4
							style="font-size: 30px; font-style: italic; font-family: Apple; color: white; text-align: center;">Please
							Enter Your OTP(One Time Password) for Reset Your Password.</h4>
						<br> <br> <input type="text" id="otp" name="otp"
							placeholder="Enter OTP here." title="Enter Your OTP"><br>
						<br> <span id="otpmessage"
							style="color: red; font-size: small;"></span><br> <input
							type="submit" onclick="return validateOtp();" value="Submit">
					</form>
					<br> <br> 
					<input type="hidden" value=<%=otp %> id="temp">
					<a
						style="font-size: 20px; font-style: italic; font-family: Apple; color: white; text-align: center;"
						href="index.jsp">Back to home</a>
				</div>
			</div>
		</div>
	</div>


	<!-- plugins:js -->
	<script src="assets/vendors/js/vendor.bundle.base.js"></script>
	<script src="assets/vendors/js/vendor.bundle.addons.js"></script>
	<!-- endinject -->
</body>
</html>