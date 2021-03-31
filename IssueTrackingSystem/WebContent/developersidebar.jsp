<%@page import="com.issuetracker.bean.User"%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<%
		HttpSession session6 = request.getSession(false);
	%>
	<%
		User developer = (User) session6.getAttribute("developer");
	%>
	<ul class="nav">
		<br>
		<li class="nav-item nav-category border"
			style="font-size: 20px; text-align: center; border-radius: 35px; font-style: italic; font-family: Apple; background-color: white; color: blue"><b>
				Developer</b></li>
		<br>
		<br>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
				<i class="menu-icon typcn typcn-coffee"></i> <span
				class="menu-title"><i class="bi bi-file-ppt"
					style="margin-right: 10px;"></i>Projects</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="GetProjectList?id=2"><i class="bi bi-file-earmark-check"
							style="margin-right: 10px;"></i>View Projects</a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#ui-basic1" aria-expanded="false" aria-controls="ui-basic1">
				<i class="menu-icon typcn typcn-coffee"></i> <span
				class="menu-title"><i class="bi bi-file-earmark-post-fill"
					style="margin-right: 10px;"></i>Modules</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic1">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="DeveloperModules?id=<%=developer.getUserId()%>"><i
							class="bi bi-file-earmark-post-fill" style="margin-right: 10px;"></i>My
							Modules</a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#ui-basic2" aria-expanded="false" aria-controls="ui-basic2">
				<i class="menu-icon typcn typcn-coffee"></i> <span
				class="menu-title"><i class="bi bi-question-circle"
					style="margin-right: 10px;"></i>Issues</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic2">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="FetchAssignedIssueDetails?id=<%=developer.getUserId()%>&str=developer"><i
							class="bi bi-question-circle" style="margin-right: 10px;"></i>Change
							Issue Status</a></li>
				</ul>
			</div></li>

		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#auth" aria-expanded="false" aria-controls="auth"> <i
				class="menu-icon typcn typcn-document-add"></i> <span
				class="menu-title"><i class="bi bi-person-circle"
					style="margin-right: 10px;"></i>Profile</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="auth">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="EditProfile?id=2"><i class="bi bi-pencil-square"
							style="margin-right: 10px;"></i> Edit Profile </a></li>
					<li class="nav-item"><a class="nav-link"
						href="EditPasswordCheck?id=2"><i class="bi bi-lock-fill"
							style="margin-right: 10px;"></i> Change Password </a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" href="IdentifyUser?id=2">
				<i class="menu-icon typcn typcn-bell"></i> <span class="menu-title"><i
					class="bi bi-envelope" style="margin-right: 10px;"></i>Send Message
			</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="LogOut?id=2">
				<i class="menu-icon typcn typcn-bell"></i> <span class="menu-title"><i
					class="bi bi-box-arrow-in-left" style="margin-right: 10px;"></i>
					Logout </span>
		</a></li>
	</ul>
</nav>
