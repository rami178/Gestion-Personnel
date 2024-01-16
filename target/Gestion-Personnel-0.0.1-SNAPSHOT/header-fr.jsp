<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header>
	<nav class="navbar navbar-expand-md navbar-dark"
		style="background-color: tomato">
		
		
       <div>
		<ul class="navbar-nav navbar-collapse justify-content-end">
			<li><a href="<%= request.getContextPath() %>/fr" class="nav-link">Actualiser</a></li>
			<li><a href="<%= request.getContextPath() %>/registerF" class="nav-link">Inscription</a></li>
			
		</ul>
		</div>
		
		  <div style="position:relative;margin-left:67%">
		    <ul class="navbar-nav navbar-collapse justify-content-end">
		        <li>   <a  href="<%= request.getContextPath() %>/fr" class="navbar-brand"> Français</a></li>
		        <li>   <a  href="<%= request.getContextPath() %>/" class="navbar-brand"> العربية</a></li>
		    </ul>
		   </div>
		    <div style = "position:relative;margin-left:2%">
	             <a  href="<%= request.getContextPath() %>/fr" class="navbar-brand"> Page d'accueil</a>
			</div>
	</nav>
</header>