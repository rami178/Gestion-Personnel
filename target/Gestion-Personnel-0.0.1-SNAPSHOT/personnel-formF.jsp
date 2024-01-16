<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>تطبيق إدارة شؤون الموظفين</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

</head>
<body >
<div>
	<jsp:include page="personnel-form-headerF.jsp"></jsp:include>

	<br>
	<div style="margin-top: 4%;margin-bottom: 3%;">
		
				<c:if test="${personnel != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${personnel == null}">
					<form action="insert" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${personnel != null}">
            			<h1 style=" width:100%;font-weight: 900" class="text-center">Modifier le personnel</h1>
			<hr style="width: 90%;border: 5px outset #33F3FF;">
            		</c:if>
						<c:if test="${personnel == null}">
            			<h1 style=" width:100%;font-weight: 900" class="text-center">Ajouter un nouveau personnel</h1>
			<hr style="width: 90%;border: 5px outset #33F3FF;">
            		</c:if>
					</h2>
				</caption>
				</div>
	 <div style="margin-bottom: 6%" class="container col-md-5">
        <div  style="width:130%;margin-left:-15%; border: 10px groove #2BF905;background-color: #D3FFD4" class="card">
			<div style="padding-left: 15%;padding-right: 15%"class="card-body">
				<c:if test="${personnel != null}">
					<input type="hidden" name="mat" value="<c:out value='${personnel.mat}' />" />
				</c:if>
				<fieldset class="form-group">
					<div style="text-align: center;font-weight: 900;font-style:oblique;font-size: x-large;"><label>MATRICULE</label></div> <input style="border: 4px double #2BF905;font-weight: 900;text-align: center;font-size: large;color:#1C006C" type="text"
						value="<c:out value='${personnel.mat}' />" class="form-control"
						name="mat" required="required" >
				</fieldset>

				<fieldset class="form-group">
					<div style="text-align: center;font-weight: 900;font-style:oblique;font-size: x-large;"><label>NOM ET PRENOM</label></div> <input style="border: 4px double #2BF905;font-weight: 900;text-align: center;font-size: large;color:#1C006C;" type="text"
						value="<c:out value='${personnel.nom}' />" class="form-control"
						name="nom" required="required">
				</fieldset>
				
				<fieldset class="form-group">
					<div style="text-align: center;font-weight: 900;font-style:oblique;font-size: x-large;"><label>GRADE</label> </div><input style="border: 4px double #2BF905;font-weight: 900;text-align: center;font-size: large;color:#1C006C;" type="text"
						value="<c:out value='${personnel.grade}' />" class="form-control"
						name="grade" required="required">
				</fieldset>
				
				<fieldset class="form-group">
					<div style="text-align: center;font-weight: 900;font-style:oblique;font-size: x-large;"><label>LIEU DE TRAVAIL</label> </div><input style="border: 4px double #2BF905;font-weight: 900;text-align: center;font-size: large;color:#1C006C;" type="text"
						value="<c:out value='${personnel.prison}' />" class="form-control"
						name="prison" required="required">
				</fieldset>

				<fieldset class="form-group">
					<div style="text-align: center;font-weight: 900;font-style:oblique;font-size: x-large;"><label>EMAIL ADRESSE</label></div> <input style="border: 4px double #2BF905;font-weight: 900;text-align: center;font-size: large;color:#1C006C;" type="text"
						value="<c:out value='${personnel.email}' />" class="form-control"
						name="email" required="required">
				</fieldset>

				<fieldset class="form-group">
					<div style="text-align: center;font-weight: 900;font-style:oblique;font-size: x-large;"><label>NUMERO DE TELEPHONE</label> </div><input style="border: 4px double #2BF905;font-weight: 900;text-align: center;font-size: large;color:#1C006C;" type="text"
						value="<c:out value='${personnel.tel}' />" class="form-control"
						name="tel" required="required">
				</fieldset>
				<fieldset class="form-group">
					<div style="text-align: center;font-weight: 900;font-style:oblique;font-size: x-large;"><label>ADRESSE</label></div> <input style="border: 4px double #2BF905;font-weight: 900;text-align: center;font-size: large;color:#1C006C;" type="text"
						value="<c:out value='${personnel.adresse}' />" class="form-control"
						name="adresse" required="required">
				</fieldset>

			<button style ="width:30%;margin-left:35%;font-weight: 900;font-style: oblique;font-size: large;background-color:  #1D5DF0 " type="submit" class="btn btn-success">Enregistrer</button>
				</form>
			</div>
		</div>
	</div>
	</div>
<br>	
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
