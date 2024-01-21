<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<header style="position:fixed;z-index:999;width:100%;
    height: 40px;">
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/fr"
					class="nav-link">Quitter</a></li>
			</ul>
			</div>
			  <div style="position:relative;margin-left:74.5%">
		    <ul class="navbar-nav navbar-collapse justify-content-end">
		        <li>   <a  href="<%= request.getContextPath() %>/registerF" class="navbar-brand"> Français</a></li>
		        <li>   <a  href="<%= request.getContextPath() %>/register" class="navbar-brand"> العربية</a></li>
		    </ul>
		   </div>
		    <div style = "position:relative;margin-left:2%">
	             <a  href="<%= request.getContextPath() %>/fr" class="navbar-brand">Page d'accueil</a>
			</div>
		</nav>
	</header>
	
	<div >
	<br><br><br><br>
	<h1 style=" width:100%;font-weight: 900" class="text-center">Inscription</h1>
			<hr style="width: 90%;border: 5px outset #1D5DF0;">
	</div>
	
    <div style="width: 70%;justify-content: center;display:flex;margin-bottom: 5%"class="container">
	<div  style="width:70%; border: 10px groove #FF6347;background-color: #F0F8FF;" class="card">
	<div style="width: 100%;justify-content: center;display:flex;padding-top: 5%;padding-bottom: 5%"class="container">
	<div  class="col-md-6 col-md-offset-3">
	
			
				<form action="<%=request.getContextPath()%>/registerF" method="post">

					<div style="text-align: center;font-weight: 900;font-style:oblique;font-size: x-large;" class="form-group">
						<label  for="uname">Prénom</label> <input style="border: 4px double #FF6347;font-weight: 900;text-align: center;font-size: large;color:#1C006C" type="text"
							class="form-control" id="uname" placeholder="Entrer le Prénom"
							name="firstName" required>
					</div>

					<div style="text-align: center;font-weight: 900;font-style:oblique;font-size: x-large;" class="form-group">
						<label for="uname">Nom</label> <input style="border: 4px double #FF6347;font-weight: 900;text-align: center;font-size: large;color:#1C006C" type="text"
							class="form-control" id="uname" placeholder="Entrer le Nom"
							name="lastName" required>
					</div>

					<div style="text-align: center;font-weight: 900;font-style:oblique;font-size: x-large;" class="form-group">
						<label for="uname">Nom d'utilisateur</label> <input style="border: 4px double #FF6347;font-weight: 900;text-align: center;font-size: large;color:#1C006C" type="text"
							class="form-control" id="username" placeholder="Entrer le Nom d'utilisateur"
							name="username" required>
					</div>

					<div style="text-align: center;font-weight: 900;font-style:oblique;font-size: x-large;" class="form-group">
						<label for="uname">Mot de passe</label> <input style="border: 4px double #FF6347;font-weight: 900;text-align: center;font-size: large;color:#1C006C" type="password"
							class="form-control" id="password" placeholder="Entrer le Mot de passe"
							name="password" required>
					</div>

					<button style ="width:60%;margin-left:22%;font-weight: 900;font-style: oblique;font-size: large;background-color:  #1D5DF0 " type="submit" class="btn btn-primary">Enregistrer</button>

				</form>
			</div>
		</div>
		</div>
		</div>
		
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>