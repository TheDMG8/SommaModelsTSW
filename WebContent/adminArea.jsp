<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>

    
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="CSS/profilo.css" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Area admin</title>

</head>
<body>
<%@ include file="jsp/navbar2.jsp" %>
<div class="user-div">
 <form action="adminArea.jsp" method="POST" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Area Amministratore"/></form> 
		<form action="Logout" method="get" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Logout"/></form> 
		<form action="modificaProfilo.jsp" method="post" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Modifica Profilo"/></form> 
    </div>
<h1>Benvenuto nella pagina protetta</h1>

<br><br>
	<div class="user-div">
		<form action="addProduct.jsp" method="POST" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Aggiungi Prodotti"/></form> 
   		<form action="editProduct.jsp" method="POST" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Elimina Prodotti"/></form> 
   	</div>
	
	


</body>
<%@ include file="jsp/footer.jsp" %>
</html>