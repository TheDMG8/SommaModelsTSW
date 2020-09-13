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
	
	
	 	<h2 style="color: red;">Aggiungi prodotti</h2>
	 </div>

	 <form method="POST" action="AdminController" enctype="multipart/form-data" name="registrazione" onSubmit="return FormValidationAddProduct();">
	 
	 <input type="hidden" name="action" value="add_product">
     
	 	<table id="table-form">
   		<tr>
	 		<td><label>Nome Prodotto</label></td>
	 		<td><input type="text" name="nomeprodotto" placeholder="nome prodotto"  required></td>
	 	</tr>
	 	<tr>
	 		<td><label>Marca Prodotto</label></td>
	 		<td><input type="text" name="marcaprodotto" placeholder="marca prodotto" required></td>
	 	</tr>
	 	<tr>
	 		<td><label>Tipo Categoria</label></td>
	 		<td><input type="text" name="categoria" placeholder="tipo categoria" required></td>
	 	</tr>
	 	
	 	<tr>
	 		<td><label>Tipo Prodotto</label></td>
	 		<td><input type="text" name="tipoprodotto" placeholder="tipo prodotto" required></td>
	 	</tr>
	 	
	 	<tr>
	 		<td><label>Descrizione Prodotto</label></td>
	 		<td><textarea rows="5" cols="30"name="descrizioneprodotto" placeholder="descrizione" required></textarea></td>
	 	</tr>
	 	
	 	<tr>
	 		<td><label>Prezzo Prodotto</label></td>
	 		<td><input type="text" name="prezzoprodotto" placeholder="prezzo prodotto" required></td>
	 	</tr>
	 	
	 	<tr>
	 		<td><label for="fileupload">Immagine</label></td>
	 		<td><input type="file" name="immagine" required></td>
	 	</tr>
	 	
	 	<tr>
	 		<td><label>Pezzi Disponibili</label></td>
	 		<td><input type="text" name="numPezziDisponibili" placeholder="pezzi disponibili" required></td>
	 	</tr>
	 	
	 	 <div > 
			<td><input type="submit" value="Process" class="bottoneAssistenza"></td> 
		</div>
		</table>
	 </form>


	 <footer style="position: absolute;left: 0;bottom: 0;width: 100%;">
		<div class="footer">
	    </div>
	</footer>
</body>
<%@ include file="jsp/footer.jsp" %>
</html>