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
	var psd = "";
	function validateForm() {

		var flag = 0;

		var uname = document.getElementById("username").value;
		var contact = document.getElementById("contact").value;
		var address = document.getElementById("address").value;
		var area = document.getElementById("area");
		var selectedValue = area.options[area.selectedIndex].value;

		var ulabel = document.getElementById("ulabel");
		var clabel = document.getElementById("clabel");
		var laddress = document.getElementById("laddress");
		var larea = document.getElementById("larea");

		ulabel.innerHTML = "";
		clabel.innerHTML = "";
		laddress.innerHTML = "";
		larea.innerHTML = "";

		if (uname == "") {
			ulabel.innerHTML = "User Name is Empty.";
			document.getElementById("username").style.borderColor = "red";
			document.getElementById("uname").style.color = "red";
			flag = 1;

		}
		if (uname.length < 3) {
			ulabel.innerHTML = "Please Enter at least 3 Character.";
			document.getElementById("username").style.borderColor = "red";
			document.getElementById("uname").style.color = "red";
			flag = 1;

		}
		if (contact == "") {
			clabel.innerHTML = "Contact is empty.";
			document.getElementById("contact").style.borderColor = "red";
			document.getElementById("ucontact").style.color = "red";
			flag = 1;
		}
		if (contact.length < 10) {
			document.getElementById("contact").style.borderColor = "red";
			clabel.innerHTML = "Contact Number should be 10 digits";
			document.getElementById("ucontact").style.color = "red";
			flag = 1;
		}
		if (address == "") {
			laddress.innerHTML = "Address is Empty.";
			document.getElementById("address").style.borderColor = "red";
			document.getElementById("uad").style.color = "red";
			flag = 1;
		}
		if (selectedValue == "") {
			larea.innerHTML = "Area Name is Not Selected.";
			document.getElementById("area").style.borderColor = "red";
			document.getElementById("uarea").style.color = "red";
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
		document.getElementById("uname").style.color = "green";

		lblError.innerHTML = "";

		if (uname == null || uname.length < 3) {
			lblError.innerHTML = "Please Enter at least 3 Character.";
			document.getElementById("uname").style.color = "red";
			document.getElementById("username").style.borderColor = "red";

		} else {
			document.getElementById("username").style.borderColor = "green";
			document.getElementById("uname").style.color = "green";

		}

	}
	function ValidatePhone() {
		var contact = document.getElementById("contact").value;
		var lblError = document.getElementById("clabel");
		lblError.innerHTML = "";

		if (contact.length < 10) {
			document.getElementById("contact").style.borderColor = "red";
			document.getElementById("ucontact").style.color = "red";
			lblError.innerHTML = "Contact Number should be 10 digits";
		} else {
			document.getElementById("contact").style.borderColor = "green";
			document.getElementById("ucontact").style.color = "green";
		}

		if (isNaN(contact)) {
			lblError.innerHTML = "Enter Numeric Values Only";
			document.getElementById("contact").value = "";
		}
	}
	function ValidateAddress() {
		var address = document.getElementById("address").value;
		var laddress = document.getElementById("laddress");
		document.getElementById("uad").style.color = "green";
		laddress.innerHTML = "";

		if (address.length == 0) {
			laddress.innerHTML = "Address is Empty";
			document.getElementById("address").style.borderColor = "red";
			document.getElementById("uad").style.color = "red";
		} else {
			document.getElementById("address").style.borderColor = "green";
			document.getElementById("uad").style.color = "green";
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
			document.getElementById("uarea").style.color = "red";

		} else {
			document.getElementById("area").style.borderColor = "green";
			document.getElementById("uarea").style.color = "green";
		}

	}
</script>

<title>Blank page</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
	<%
		HttpSession session1 = request.getSession(false);
	User u = (User) session1.getAttribute("user");
	%>
	<div class="container-scroller">
		<!-- partial:../../partials/_navbar.jsp -->
		<%@include file="_navbar.jsp"%>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:../../partials/_sidebar.html -->
			<%@include file="adminsidebar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="container-fluid page-body-wrapper full-page-wrapper">
						<div
							class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">

							<div class="row w-100">
								<div class="col-lg-4 mx-auto">
									<h1
										style="color: darkblue; font-family: Apple; font-style: italic; text-align: center">
										<b>Edit Profile</b>
									</h1>
									<div class="auto-form-wrapper"
										style="border: solid blue; border-radius: 20px">
										<form action="UpdateProfile" method="post">
											<div class="form-group">
												<label class="label">User Name</label>
												<div class="input-group">
													<input type="hidden" name="id" value="<%=u.getUserId()%>"><br>
													<br> <input title="Enter Your Name." type="text"
														id="username" class="form-control" placeholder="Username"
														value="<%=u.getUserName()%>" style="font-size: small;"
														onkeyup="ValidateUser();" name="uname"><i
														id="uname" class="mdi mdi-check-circle-outline"
														style="margin-left: 5px;"></i>
												</div>
												<span id="ulabel" style="color: red; font-size: small;"></span>

											</div>

											<div class="form-group">
												<label class="label">Contact</label>
												<div class="input-group">
													<input type="tel" maxlength="10" pattern="\d{10}"
														title="please enter Exactly 10 digits" id="contact"
														class="form-control" placeholder="Contact"
														value="<%=u.getUserContact()%>" style="font-size: small;"
														onkeyup="ValidatePhone();" name="contact"> <i
														id="ucontact" class="mdi mdi-check-circle-outline"
														style="margin-left: 5px;"></i>

												</div>
												<span id="clabel" style="color: red; font-size: small;"></span>

											</div>
											<div class="form-group">
												<label class="label">Address</label>
												<div class="input-group">
													<input type="text" id="address" class="form-control"
														placeholder="Address" style="font-size: small;"
														value="<%=u.getUserAddress()%>"
														onkeyup="ValidateAddress();" name="address"> <i
														id="uad" class="mdi mdi-check-circle-outline"
														style="margin-left: 5px;"></i>

												</div>
												<span id="laddress" style="color: red; font-size: small;"></span>

											</div>
											<div class="form-group">
												<label class="label">Email</label>
												<div class="input-group">
													<input type="text" id="address" readonly="readonly"
														class="form-control" placeholder="Address"
														style="font-size: small;" value="<%=u.getUserEmail()%>"
														onkeyup="ValidateAddress();" name="address"> <i
														id="uad" class="mdi mdi-check-circle-outline"
														style="margin-left: 5px;"></i>
												</div>
											</div>
											<div class="form-group">
												<label class="label">Area</label>
												<div class="input-group">
													<%
														List<Area> areaList = (List) request.getAttribute("areaList");
													%>

													<select title="Please select Your Area."
														onchange="selectArea();" class="form-control" id="area"
														style="font-size: small;" name="area">
														<option value="<%=u.getAreaId()%>"><%=u.getAreaName()%></option>
														<%
															for (Area area : areaList) {
														%>
														<option value="<%=area.getAreaId()%>"><%=area.getAreaName()%></option>
														<%
															}
														%>
													</select> <i id="uarea" class="mdi mdi-check-circle-outline"
														style="margin-left: 5px;"></i>

												</div>
												<span id="larea" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<input type="submit" onclick=" return validateForm();"
													class="btn btn-primary submit-btn btn-block"
													value="Save Changes" />
											</div>
											<p class="footer-text text-center"
												style="color: black; font-weight: bolder;">copyright ©
												2020 Issue Tracker. All rights reserved.</p>
											<p class="footer-text text-center text-center">
												<a href="AdminHome.jsp" target="_blank"
													style="color: black; font-weight: bolder;">Back</a>
											</p>
										</form>
									</div>
								</div>
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