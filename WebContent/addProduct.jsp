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
<body onload="document.registration.nome.focus();">
	<%@ include file="jsp/navbar2.jsp" %>
	<%
		if(request.getSession()!=null){
			String error=  (String)request.getSession().getAttribute("error");
		if(error != null){%>
			<h1>CAMPI INSERITI SONO ERRATI</h1>
		<%} }%>

	<header>
		<div class="user-div">
	<form action="addProduct.jsp" method="POST" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Aggiungi Prodotti"/></form> 
    <form action="editProduct.jsp" method="POST" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Elimina Prodotti"/></form> 
   	<form action="adminArea.jsp" method="POST" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Area Amministratore"/></form> 
   		</div>
   		
	
	</header>
	
	
	 	<h2 style="color: red;">Aggiungi prodotti</h2>
	 

	 <form action="AdminController"  method="POST" name="registration" onSubmit="return FormValidationAddProduct();" enctype="multipart/form-data">
	 
	 <input type="hidden" name="action" value="add_product">
      <fieldset>
	 	<table id="table-form">
   		<tr>
	 		<td><label>Nome Prodotto</label></td>
	 		<td><input type="text" name="nomeprodotto" placeholder="nome prodotto"></td>
	 	</tr>
	 	<tr>
	 		<td><label>Marca Prodotto</label></td>
	 		<td><input type="text" name="marcaprodotto" placeholder="marca prodotto"></td>
	 	</tr>
	 	<tr>
	 		<td><label>Tipo Categoria</label></td>
	 		<td><input type="text" name="categoria" placeholder="tipo categoria"></td>
	 	</tr>
	 	
	 	<tr>
	 		<td><label>Tipo Prodotto</label></td>
	 		<td><input type="text" name="tipoprodotto" placeholder="tipo prodotto"></td>
	 	</tr>
	 	
	 	<tr>
	 		<td><label>Descrizione Prodotto</label></td>
	 		<td><textarea rows="5" cols="30"name="descrizioneprodotto" placeholder="descrizione"></textarea></td>
	 	</tr>
	 	
	 	<tr>
	 		<td><label>Prezzo Prodotto</label></td>
	 		<td><input type="text" name="prezzoprodotto" placeholder="prezzo prodotto" ></td>
	 	</tr>
	 	
	 	<tr>
	 		<td><label for="fileupload">Immagine</label></td>
	 		<td><input type="file" name="immagine" required></td>
	 	</tr>
	 	
	 	<tr>
	 		<td><label>Pezzi Disponibili</label></td>
	 		<td><input type="text" name="numPezziDisponibili" placeholder="pezzi disponibili"></td>
	 	</tr>
	 	
	 	 	<tr>
			<td><input type="submit" value="Aggiungi Prodotto" class="bottoneAssistenza"></td>
			<td> <input class=bottoneAssistenza type="reset" > </td> 
		</tr>
		</table>
		</fieldset>
		
	 </form>


	 <footer style="position: absolute;left: 0;bottom: 0;width: 100%;">
		<div class="footer">
	    </div>
	</footer>
</body>
<%@ include file="jsp/footer.jsp" %>
</html>