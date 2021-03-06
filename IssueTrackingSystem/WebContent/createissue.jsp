<%@page import="com.issuetracker.bean.ModuleDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
	var flag = 0;
	
	function selectmodule() {
		var area1 = document.getElementById("module");
		var selectedValue1 = module.options[module.selectedIndex].value;
		var larea1 = document.getElementById("lmodule");
		larea1.innerHTML = "";

		if (selectedValue1 == "") {
			larea1.innerHTML = "Module is Not Selected.";
			document.getElementById("module").style.borderColor = "red";
			flag=1;
		} else {
			document.getElementById("module").style.borderColor = "green";
			flag=0;
		}

	}

	function issuename() {
		var iname = document.getElementById("issue").value;
		var ilabel = document.getElementById("ilabel");
		ilabel.innerHTML = "";

		if (iname.length <= 0) {
			document.getElementById("issue").style.borderColor = "red";
			ilabel.innerHTML = "Enter Issue Name.";
			flag = 1;
		} else {
			if (iname.length < 3) {
				ilabel.innerHTML = "Please Enter at least 3 Character.";
				document.getElementById("issue").style.borderColor = "red";
				flag = 1;
			} else {
				document.getElementById("issue").style.borderColor = "green";
				flag = 0;
			}
		}

	}
	function descheck() {
		var pdes = document.getElementById("des").value;
		var dlabel = document.getElementById("dlabel");
		dlabel.innerHTML = "";
		if (pdes.length <= 0) {
			document.getElementById("des").style.borderColor = "red";
			dlabel.innerHTML = "Enter Description of Issue.";
		} else {
			document.getElementById("des").style.borderColor = "green";
		}
	}

	function validateForm() {

		var iname = document.getElementById("issue").value;
		var sdt = document.getElementById("sdate").value;
		var pdes = document.getElementById("des").value;
		var selectedValue1 = module.options[module.selectedIndex].value;
		var larea1 = document.getElementById("lmodule");

		var ilabel = document.getElementById("ilabel");
		var sdlabel = document.getElementById("sdlabel");
		var dlabel = document.getElementById("dlabel");

		ilabel.innerHTML = "";
		sdlabel.innerHTML = "";
		dlabel.innerHTML = "";
		larea1.innerHTML = "";

		if (iname == "") {
			ilabel.innerHTML = "Issue Name is Empty.";
			document.getElementById("issue").style.borderColor = "red";
			flag = 1;
		}
		if (iname.length < 3) {
			ilabel.innerHTML = "Please Enter at least 3 Character.";
			document.getElementById("issue").style.borderColor = "red";
			flag = 1;
		}
		if (sdt == "") {
			sdlabel.innerHTML = "Issue Created date is Empty.";
			document.getElementById("sdate").style.borderColor = "red";
			flag = 1;
		} else {
			sdlabel.innerHTML = "";
			document.getElementById("sdate").style.borderColor = "green";
			flag = 0;
		}
		if (pdes == "") {
			dlabel.innerHTML = "Description is Empty.";
			document.getElementById("des").style.borderColor = "red";
			flag = 1;
		}
		if (pdes.length > 0) {

			document.getElementById("des").style.borderColor = "green";
		}
		if (selectedValue1 == "") {
			larea1.innerHTML = "module is Not Selected.";
			document.getElementById("module").style.borderColor = "red";
			flag = 1;
		} else {
			document.getElementById("module").style.borderColor = "green";
			flag = 0;
		}
		if (flag == 1) {
			return false;
		} else {
			return true;
		}

	}
	$(document).ready(function() {
		$('#sdate').change(function() {
			var sdlabel = document.getElementById("sdlabel");
			document.getElementById("sdate").style.borderColor = "green";
			sdlabel.innerHTML = "";
			//console.log($('#date-daily').val());
		});
	});
</script>

<title>Create Issue</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>

	<%
		List<ModuleDetails> testerModules = (List) request.getAttribute("testerModules");
	%>

	<div class="container-scroller">
		<!-- partial:../../partials/_navbar.jsp -->
		<%@include file="_navbar.jsp"%>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:../../partials/_sidebar.html -->
			<%@include file="testersidebar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="container-fluid page-body-wrapper full-page-wrapper">
						<div
							class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">

							<div class="row w-100">
								<div style="align-content: center;">
									<h1
										style="color: darkblue; font-family: Apple; font-style: italic; margin-left: 200px; text-align: center">
										<b><i class="bi bi-question-square"
											style="margin-right: 10px;"></i>Create Issue</b>
									</h1>
									<div class="auto-form-wrapper"
										style="border: solid blue; margin-left: 200px; width: 800px; border-radius: 20px">
										<form action="CreateIssue" method="post" enctype="multipart/form-data">

											<div class="form-group">
												<label class="label" style="font-size: small;"><i
													class="bi bi-file-ppt" style="margin-right: 10px;"></i>Select
													Module </label>
												<div class="input-group">
													<select title="Please select Module"
														onchange="selectmodule();" class="form-control"
														id="module" style="font-size: small;" name="moduleName">
														<option value="">Select Module</option>
														<%
															for (ModuleDetails p : testerModules) {
														%>
														<option value="<%=p.getModuleId()%>"><%=p.getModuleName()%></option>
														<%
															}
														%>
													</select>

												</div>
												<span id="lmodule" style="color: red; font-size: small;"></span>

											</div>


											<div class="form-group">
												<label class="label"><i
													class="bi bi-file-earmark-font" style="margin-right: 10px;"></i>Issue
													Name</label> <input title="Enter Issue Name." type="text" id="issue"
													class="form-control" placeholder="Issue Name"
													style="font-size: small; size: 30px;"
													onkeyup="issuename();" name="iname"> <span
													id="ilabel" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<label class="label"><i
													class="bi bi-file-earmark-medical"
													style="margin-right: 10px;"></i>Document (Optional)</label> <input
													type="file" title="Attach Document" id="doc"
													class="form-control" placeholder="Document"
													style="font-size: small;" name="pdocument"> <span
													id="clabel" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group" style="size: 50px">
												<label class="label"><i class="bi bi-calendar-date"
													style="margin-right: 10px;"></i>Created Date</label> <input
													type="date" id="sdate" class="form-control"
													placeholder="dd/mm/yyyy"
													style="font-size: small; size: 30px;" name="sdate">
												<span id="sdlabel" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<label class="label"><i
													class="bi bi-chat-square-text" style="margin-right: 10px;"></i>Description</label>

												<input type="text" id="des" class="form-control"
													placeholder="Description"
													style="font-size: small; size: 30px;" name="description"
													onkeyup="descheck();"> <span id="dlabel"
													style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<input type="submit" onclick=" return validateForm();"
													class="btn btn-primary submit-btn btn-block"
													value="Create Issue" />
											</div>
											<p class="footer-text text-center text-center">
												<a href="testerhome.jsp"
													style="color: black; font-weight: bolder;"><i
													class="bi bi-reply-fill" style="margin-right: 10px;"></i>Go
													Back</a>
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