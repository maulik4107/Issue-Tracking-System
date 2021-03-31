<nav class="sidebar sidebar-offcanvas" id="sidebar">

	<ul class="nav">
		<br>
		<li class="nav-item nav-category border"
			style="font-size: 20px; text-align: center; border-radius: 35px; font-style: italic; font-family: Apple; background-color: white; color: blue"><b>
				Admin</b></li>
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
						href="createproject.jsp"><i class="bi bi-file-earmark-plus"
							style="margin-right: 10px;"></i>Create Project</a></li>
					<li class="nav-item"><a class="nav-link"
						href="GetProjectDetails"><i class="bi bi-person-check"
							style="margin-right: 10px;"></i>Allocate Project</a></li>
					<li class="nav-item"><a class="nav-link"
						href="GetProjectList?id=0"><i class="bi bi-file-earmark-check"
							style="margin-right: 10px;"></i>View & Edit Projects</a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#auth1" aria-expanded="false" aria-controls="auth1"> <i
				class="menu-icon typcn typcn-document-add"></i> <span
				class="menu-title"><i class="bi bi-file-earmark-post-fill"
					style="margin-right: 10px;"></i>Module & Issue</span> <i
				class="menu-arrow"></i>
		</a>
			<div class="collapse" id="auth1">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="GetAllProject?str=modules"><i
							class="bi bi-file-earmark-post-fill" style="margin-right: 10px;"></i>View
							& Edit Modules</a></li>
					<li class="nav-item"><a class="nav-link"
						href="GetAllProject?str=issue"><i
							class="bi bi-question-circle" style="margin-right: 10px;"></i>View
							& Edit Issues</a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#auth2" aria-expanded="false" aria-controls="auth2"> <i
				class="menu-icon typcn typcn-document-add"></i> <span
				class="menu-title"><i class="bi bi-person-circle"
					style="margin-right: 10px;"></i>User</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="auth2">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="GetPendingUserRequest"> <i
							class="menu-icon typcn typcn-shopping-bag"></i> <span
							class="menu-title"><i class="bi bi-people"
								style="margin-right: 10px;"></i>Pending Users Request</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="GetActiveUsers">
							<i class="menu-icon typcn typcn-th-large-outline"></i> <span
							class="menu-title"><i class="bi bi-person-check"
								style="margin-right: 10px;"></i>View Active Users</span>
					</a></li>
				</ul>
			</div></li>


		<li class="nav-item"><a class="nav-link"
			href="pages/tables/basic-table.html"> <i
				class="menu-icon typcn typcn-bell"></i> <span class="menu-title"><i
					class="bi bi-file-earmark-person" style="margin-right: 10px;"></i>Create
					Report</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#auth" aria-expanded="false" aria-controls="auth"> <i
				class="menu-icon typcn typcn-document-add"></i> <span
				class="menu-title"><i class="bi bi-person-circle"
					style="margin-right: 10px;"></i>Profile</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="auth">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="EditProfile?id=0"><i class="bi bi-pencil-square"
							style="margin-right: 10px;"></i> Edit Profile </a></li>
					<li class="nav-item"><a class="nav-link"
						href="EditPasswordCheck?id=0"><i class="bi bi-lock-fill"
							style="margin-right: 10px;"></i>Change Password </a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" href="IdentifyUser?id=0">
				<i class="menu-icon typcn typcn-bell"></i> <span class="menu-title"><i
					class="bi bi-envelope" style="margin-right: 10px;"></i>Send Message
			</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="LogOut?id=0">
				<i class="menu-icon typcn typcn-bell"></i> <span class="menu-title"><i
					class="bi bi-box-arrow-in-left" style="margin-right: 10px;"></i>Logout
			</span>
		</a></li>
	</ul>
</nav>
