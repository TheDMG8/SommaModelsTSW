<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

   <%
// Check user credentials
Boolean adminRoles = (Boolean) request.getSession().getAttribute("adminRoles");
if (adminRoles != true)
{	
    response.sendRedirect("./login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<link href="CSS/profilo.css" rel="stylesheet">
<link href="CSS/assistenza.css" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Amministrazione</title>


</head>
<body>
	<%@ include file="jsp/navbar2.jsp" %>

	<header>
		<div class="user-div">
	<form action="addProduct.jsp" method="POST" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Aggiungi Prodotti"/></form> 
    <form action="editProduct.jsp" method="POST" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Elimina Prodotti"/></form> 
   	<form action="adminArea.jsp" method="POST" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Area Amministratore"/></form> 
   		</div>
   		
	
	</header>
	
	<div class="signup-header">
	 	<h2>Aggiungi prodotti</h2>
	 </div>

	 <form method="POST" action="AdminController" enctype="multipart/form-data">
	 
	 <input type="hidden" name="action" value="add_product">
     
	 	<div class="signup-group">
	 		<li><label>Nome Prodotto</label></li>
	 		<li><input type="text" name="nomeprodotto" placeholder="nome prodotto"  required></li>
	 	</div>
	 	<div class="signup-group">
	 		<li><label>Marca Prodotto</label></li>
	 		<li><input type="text" name="marcaprodotto" placeholder="marca prodotto" required></li>
	 	</div>
	 	<div class="signup-group">
	 		<li><label>Tipo Categoria</label></li>
	 		<li><input type="text" name="categoria" placeholder="tipo categoria" required></li>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<li><label>Tipo Prodotto</label></li>
	 		<li><input type="text" name="tipoprodotto" placeholder="tipo prodotto" required></li>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<li><label>Descrizione Prodotto</label></li>
	 		<li><input type="text" name="descrizioneprodotto" placeholder="descrizione" required></li>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<li><label>Prezzo Prodotto</label></li>
	 		<li><input type="text" name="prezzoprodotto" placeholder="descrizione" required></li>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<li><label for="fileupload">Immagine</label></li>
	 		<li><input type="file" name="immagine" required></li>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<li><label>Pezzi Disponibili</label>
	 		<li><input type="text" name="numPezziDisponibili" placeholder="pezzi disponibili" required></li>
	 	</div>
	 	
	 	 <div class="signup-group"> 
			<li><input type="submit" value="Process" class="bottoneAssistenza"></li> 
		</div>
	 </form>


	 <footer style="position: absolute;left: 0;bottom: 0;width: 100%;">
		<div class="footer">
	    </div>
	</footer>
</body>
<%@ include file="jsp/footer.jsp" %>
</html>