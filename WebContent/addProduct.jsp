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
<script src="FormValidationAddProduct.js"></script>

</head>
<body onload="document.addprod.nome.focus();">
	<%@ include file="jsp/navbar2.jsp" %>

	<header>
		<div class="user-div">
	<form action="addProduct.jsp" method="POST" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Aggiungi Prodotti"/></form> 
    <form action="editProduct.jsp" method="POST" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Elimina Prodotti"/></form> 
   	<form action="adminArea.jsp" method="POST" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Area Amministratore"/></form> 
   		</div>
   		
	
	</header>
	
	
	 	<h2 style="color: red;">Aggiungi prodotto:</h2>
	

	 <form method="POST" action="AdminController" enctype="multipart/form-data" name="addprod" onSubmit="return FormValidationAddProduct();">
	 
	 <input type="hidden" name="action" value="add_product">
     <fieldset>
	 	<table id="table-form">
   		<tr>
	 		<td><label>Nome Prodotto</label></td>
	 		<td><input size="27" type="text" name="nomeprodotto" placeholder="nome prodotto"></td>
	 	</tr>
	 	<tr>
	 		<td><label>Marca Prodotto</label></td>
	 		<td><input size="27" type="text" name="marcaprodotto" placeholder="marca prodotto"></td>
	 	</tr>
	 	<tr>
	 		<td><label>Tipo Categoria</label></td>
	 		<td><input size="27" type="text" name="categoria" placeholder="tipo categoria"></td>
	 	</tr>
	 	
	 	<tr>
	 		<td><label>Tipo Prodotto</label></td>
	 		<td><input size="27" type="text" name="tipoprodotto" placeholder="tipo prodotto"></td>
	 	</tr>
	 	
	 	<tr>
	 		<td><label>Descrizione Prodotto</label></td>
	 		<td><textarea rows="5" cols="31" name="descrizioneprodotto" placeholder="descrizione"></textarea></td>
	 	</tr>
	 	
	 	<tr>
	 		<td><label>Prezzo Prodotto</label></td>
	 		<td><input size="27" type="text" name="prezzoprodotto" placeholder="prezzo prodotto" ></td>
	 	</tr>
	 	
	 	<tr>
	 		<td><label for="fileupload">Immagine</label></td>
	 		<td><input size="27" type="file" name="immagine"></td>
	 	</tr>
	 	
	 	<tr>
	 		<td><label>Pezzi Disponibili</label></td>
	 		<td><input size="27" type="text" name="numPezziDisponibili" placeholder="pezzi disponibili"></td>
	 	</tr>
	 	</table>
	 	<table>
	 	<tr>
			<td><input type="submit" value="Aggiungi Prodotto" class="bottoneAssistenza"></td>
			<td><input class=bottoneAssistenza type="reset" > </td> 
		</tr>
		</table>
		</fieldset>
	 </form>


</body>
<%@ include file="jsp/footer.jsp" %>
</html>