<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
	var flag = 0;

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
	function checkdoc() {
		var pdes = document.getElementById("des").value;
		var dlabel = document.getElementById("dlabel");
		dlabel.innerHTML = "";
		if (pdes.length <= 0) {
			document.getElementById("des").style.borderColor = "red";
			dlabel.innerHTML = "Enter Description of Project.";
		} else {
			document.getElementById("des").style.borderColor = "green";
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
		}else{
			sdlabel.innerHTML = "";
			document.getElementById("sdate").style.borderColor = "green";
			flag = 0;
		}
		if (edt == "") {
			document.getElementById("edate").style.borderColor = "red";
			edlabel.innerHTML = "Project Ending date is Empty.";
			flag = 1;
		}else{
			document.getElementById("edate").style.borderColor = "green";
			edlabel.innerHTML = "";
			flag = 0;
		}
		if (pdes == "") {
			dlabel.innerHTML = "Description is Empty.";
			document.getElementById("des").style.borderColor = "red";
			flag = 1;
		}if(pdes.length>0){
			
			document.getElementById("des").style.borderColor = "green";
		}
		if (flag == 1) {
			return false;
		} else {
			return true;
		}

	}
	$(".date").datepicker({
	    onSelect: function(dateText) {
	        console.log("Selected date: " + dateText + "; input's current value: " + this.value);
	    }
	});
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

							<div class="row w-100">
								<div style="align-content: center;">
									<h1
										style="color: darkblue; font-family: Apple; font-style: italic; margin-left: 200px; text-align: center">
										<b>Create Project</b>
									</h1>
									<div class="auto-form-wrapper"
										style="border: solid blue; margin-left: 200px; width: 800px; border-radius: 20px">
										<form action="CreateProject" method="post" enctype="multipart/form-data">
											<div class="form-group">
												<label class="label">Project Name</label>
												
													<input title="Enter Project Name." type="text" id="pid"
														class="form-control" placeholder="Project Name"
														style="font-size: small; size: 30px;" onkeyup="projectname();"
														name="pname">
												
												<span id="plabel" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<label class="label">Document (Optional)</label>
												
													<input type="file" title="Attach Document" id="doc"
														class="form-control" placeholder="Document"
														style="font-size: small;" name="pdocument"> 
												
												<span id="clabel" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group" style="size:50px">
												<label class="label">Starting Date</label>
												
													<input type="date" id="sdate" class="form-control"
														placeholder="dd/mm/yyyy" style="font-size: small;size: 30px;"
														name="sdate" > 
												<span id="sdlabel" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<label class="label">Ending Date</label>
												
													<input type="date" id="edate" class="form-control"
														placeholder="dd/mm/yyyy" style="font-size: small;size: 30px;"
														name="edate"> 
												
												<span id="edlabel" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<label class="label">Description</label>
												
													<input type="text" id="des" class="form-control"
														placeholder="Description" style="font-size: small;size: 30px;"
														name="description" onkeyup="checkdoc();"> 
												
												<span id="dlabel" style="color: red; font-size: small;"></span>
											</div>
											<div class="form-group">
												<input type="submit" onclick=" return validateForm();"
													class="btn btn-primary submit-btn btn-block"
													value="Create Project" />
											</div>
											<p class="footer-text text-center text-center">
												<a href="AdminHome.jsp" target="_blank"
													style="color: black; font-weight: bolder;">Go Back</a>
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