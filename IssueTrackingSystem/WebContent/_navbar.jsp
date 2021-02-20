<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<nav
	class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
	<div style="background-color: blue;"
		class="text-center navbar-brand-wrapper d-flex align-items-top justify-content-center">
		<h1
			style="color: white; font-style: italic; font-family: Apple; margin-top: 10px; border-radius: 35px;">Issue
			Tracker</h1>
	</div>
	<div class="navbar-menu-wrapper d-flex align-items-center">
		<ul class="navbar-nav">
			<img src="pages/samples/buglogo.png" style="height: 50px;">
		</ul>
		<form class="ml-auto search-form d-none d-md-block" action="#">
			<div class="form-group">
				<input type="search" class="form-control" placeholder="Search Here">
			</div>
		</form>
		
		<button
			class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
			type="button" data-toggle="offcanvas">
			<span class="mdi mdi-menu"></span>
		</button>
	</div>
</nav>