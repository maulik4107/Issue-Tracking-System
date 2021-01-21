<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
	var flag = 0;
	
	function description() {
		var pdes = document.getElementById("des").value;
		var dlabel = document.getElementById("dlabel");
		dlabel.innerHTML = "";
		if (pdes.length <= 0) {
			document.getElementById("des").style.borderColor = "red";
			dlabel.innerHTML = "Enter Descriptionn of Project.";
			flag = 1;
		} else {
			document.getElementById("des").style.borderColor = "green";
			flag = 0;
		}
	}


	function projectname() {
		var pname = document.getElementById("pid").value;
		var plabel = document.getElementById("plabel");
		plabel.innerHTML = "";

		if (pname.length <= 0) {
			document.getElementById("pid").style.borderColor = "red";
			plabel.innerHTML = "Enter Project Name.";
			flag = 1;
		} else {
			if (pname.length < 3) {
				plabel.innerHTML = "Please Enter at least 3 Character.";
				document.getElementById("pid").style.borderColor = "red";
				flag = 1;
			} else {
				document.getElementById("pid").style.borderColor = "green";
				flag = 0;
			}
		}

	}

	function validateForm() {

		var pname = document.getElementById("pid").value;
		var sdt = document.getElementById("sdate").value;
		var edt = document.getElementById("edate").value;
		var pdes = document.getElementById("des").value;

		var plabel = document.getElementById("plabel");
		var sdlabel = document.getElementById("sdlabel");
		var edlabel = document.getElementById("edlabel");
		var dlabel = document.getElementById("dlabel");

		plabel.innerHTML = "";
		sdlabel.innerHTML = "";
		edlabel.innerHTML = "";
		dlabel.innerHTML = "";

		if (pname == "") {
			plabel.innerHTML = "Project Name is Empty.";
			document.getElementById("pid").style.borderColor = "red";
			flag = 1;
		}
		if (pname.length < 3) {
			plabel.innerHTML = "Please Enter at least 3 Character.";
			document.getElementById("pid").style.borderColor = "red";
			flag = 1;
		}
		if (sdt == "") {
			sdlabel.innerHTML = "Project Starting date is Empty.";
			document.getElementById("sdate").style.borderColor = "red";
			flag = 1;
		}
		if (edt == "") {
			document.getElementById("edate").style.borderColor = "red";
			edlabel.innerHTML = "Project Ending date is Empty.";
			flag = 1;
		}
		if (pdes == "") {
			dlabel.innerHTML = "Description is Empty.";
			document.getElementById("des").style.borderColor = "red";
			flag = 1;
		}
		if (flag == 1) {
			return false;
		} else {
			return true;
		}

	}
</script>

<title>Create Project</title>
<%@include file="commonplugins.jsp"%>
</head>
<body>
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

							<div class="col-12 grid-margin">
								<h1
									style="color: darkblue; font-family: Apple; font-style: italic; padding-left: 400px;">
									<b>Create Project</b>
								</h1>
								<div class="card" style="border-radius: 10px;">
									<div class="card-body">
										<h4 class="card-title" style="font-size: 30px;">Issue
											Tracking System</h4>
										<form class="form-sample">
											<p class="card-description" style="font-size: 20px;">Project
												Details</p>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Project
															Name</label>
														<div class="col-sm-9">
															<input type="text" class="form-control"
																onkeyup="projectname();" style="border: solid blue 2px;"
																placeholder="Enter Project Name" name="pname" id="pid">
														</div>
														<span id="plabel"
															style="color: red; font-size: small; margin-left: 150px;"></span>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Document</label>
														<div class="col-sm-9">
															<input type="file" class="form-control" name="pdocument"
																id="doc" style="border: solid blue 2px;" />
														</div>
														<span id="plabel"
															style="color: blue; font-size: small; margin-left: 150px;">(Optional)</span>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Starting
															Date</label>
														<div class="col-sm-9">
															<input type="date" class="form-control"
																placeholder="dd/mm/yyyy" name="sdate" id="sdate"
																style="border: solid blue 2px;" />
														</div>
														<span id="sdlabel"
															style="color: red; font-size: small; margin-left: 150px;"></span>

													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Ending Date</label>
														<div class="col-sm-9">
															<input type="date" class="form-control"
																style="border: solid blue 2px;" placeholder="dd/mm/yyyy"
																name="edate" id="edate" />
														</div>
														<span id="edlabel"
															style="color: red; font-size: small; margin-left: 150px;"></span>

													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Description</label>
														<div class="col-sm-9">
															<input type="text" class="form-control"
																onkeyup="description();" placeholder="Description"
																name="description" id="des"
																style="border: solid blue 2px;" />
														</div>
														<span id="dlabel"
															style="color: red; font-size: small; margin-left: 150px;"></span>
													</div>
												</div>

											</div>
											<br>
											<div class="form-group">
												<input type="submit" onclick=" return validateForm();"
													class="btn btn-primary submit-btn btn-block"
													value="Create Project" />
											</div>
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