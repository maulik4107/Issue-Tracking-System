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
			flag = 1;
		} else {
			document.getElementById("module").style.borderColor = "green";
			flag = 0;
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
		var pinfo = document.getElementById("info").value;
		var dlabel = document.getElementById("dlabel");
		dlabel.innerHTML = "";
		if (pinfo.length <= 0) {
			document.getElementById("info").style.borderColor = "red";
			dlabel.innerHTML = "Enter Description of Issue.";
			flag = 1;
		} else {
			document.getElementById("info").style.borderColor = "green";
			flag = 0;
		}
	}

	function validateForm() {
		
		var area11 = document.getElementById("module");
		var selectedValue11 = module.options[module.selectedIndex].value;
		var larea11 = document.getElementById("lmodule");
		larea11.innerHTML = "";

		if (selectedValue11 == "") {
			larea11.innerHTML = "Module is Not Selected.";
			document.getElementById("module").style.borderColor = "red";
			flag = 1;
		} else {
			document.getElementById("module").style.borderColor = "green";
			flag = 0;
		}
		
		var iname1 = document.getElementById("issue").value;
		var ilabel1 = document.getElementById("ilabel");
		ilabel1.innerHTML = "";

		if (iname1.length <= 0) {
			document.getElementById("issue").style.borderColor = "red";
			ilabel1.innerHTML = "Enter Issue Name.";
			flag = 1;
		} else {
			if (iname1.length < 3) {
				ilabel1.innerHTML = "Please Enter at least 3 Character.";
				document.getElementById("issue").style.borderColor = "red";
				flag = 1;
			} else {
				document.getElementById("issue").style.borderColor = "green";
				flag = 0;
			}
		}
		
		var pinfo1 = document.getElementById("info").value;
		var dlabel1 = document.getElementById("dlabel");
		dlabel1.innerHTML = "";
		if (pinfo1.length <= 0) {
			document.getElementById("info").style.borderColor = "red";
			dlabel1.innerHTML = "Enter Description of Issue.";
			flag = 1;
		} else {
			document.getElementById("info").style.borderColor = "green";
			flag = 0;
		}
		
		var sdt = document.getElementById("sdate").value;
		var dlabel = document.getElementById("sdlabel");
		dlabel.innerHTML = "";
		
		if (sdt == "") {
			dlabel.innerHTML = "Project Starting date is Empty.";
			document.getElementById("sdate").style.borderColor = "red";
			flag = 1;
		}else{
			dlabel.innerHTML = "";
			document.getElementById("sdate").style.borderColor = "green";
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
	<div class="se-pre-con"></div>
	<%
	 String msg=(String)request.getAttribute("msg");
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
									<%
										if (msg != null) {
									%>
									<marquee scrolldelay="10" direction="down" scrollamount="5"
										behavior="slide">
										<h2
											style="font-size: 30px; font-style: italic; font-family: Apple; color: darkblue; text-align: center;margin-left: 170px;">
											<%=msg%>
										</h2>
									</marquee>
									<%
										}
									%>
									<h1
										style="color: darkblue; font-family: Apple; font-style: italic; margin-left: 200px; text-align: center">
										<b><i class="bi bi-question-square"
											style="margin-right: 10px;"></i>Create Issue</b>
									</h1>
									<div class="auto-form-wrapper"
										style="border: solid blue; margin-left: 200px; width: 800px; border-radius: 20px">
										<form action="CreateIssue" method="post"
											enctype="multipart/form-data">

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
													Name</label> <input title="Enter Issue Name." type="text"
													id="issue" class="form-control" placeholder="Issue Name"
													style="font-size: small; size: 30px;"
													onkeyup="issuename();" name="iname"> <span
													id="ilabel" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<label class="label"><i
													class="bi bi-file-earmark-medical"
													style="margin-right: 10px;"></i>Image (Optional)</label> <input
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

												<input type="text" id="info" class="form-control"
													placeholder="Description"
													style="font-size: small; size: 30px;" name="description"
													onkeyup="descheck();"> <span id="dlabel"
													style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<input type="submit" onclick="return validateForm();"
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