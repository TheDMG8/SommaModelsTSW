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
<meta charset="ISO-8859-1">
<title>Amministrazione</title>


</head>
<body>
	<%@ include file="jsp/navbar2.jsp" %>

	<header>
		<h1>
			Welcome admin
		</h1>
		<nav>
			<ul>
				<li><a href="addProduct.jsp">Aggiungi Prodotti</a></li>
				<li><a href="editProduct.jsp">Modifica Prodotti</a></li>
			</ul>
		</nav>
		<form action="Logout" method="get" > 
     <input type="submit" value="Logout"/>
</form>
	</header>
	
	<div class="signup-header">
	 	<h2>Add Product</h2>
	 </div>

	 <form method="POST" action="AdminController" enctype="multipart/form-data">
	 
	 <input type="hidden" name="action" value="add_product">
     
	 	<div class="signup-group">
	 		<label>Nome Prodotto</label>
	 		<input type="text" name="nomeprodotto" placeholder="nome prodotto"  required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Marca Prodotto</label>
	 		<input type="text" name="marcaprodotto" placeholder="marca prodotto" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Tipo Categoria</label>
	 		<input type="text" name="categoria" placeholder="tipo categoria" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Tipo Prodotto</label>
	 		<input type="text" name="tipoprodotto" placeholder="tipo prodotto" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Descrizione Prodotto</label>
	 		<input type="text" name="descrizioneprodotto" placeholder="descrizione" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Prezzo Prodotto</label>
	 		<input type="text" name="prezzoprodotto" placeholder="descrizione" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label for="fileupload">Immagine</label>
	 		<input type="file" name="immagine" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Pezzi Disponibili</label>
	 		<input type="text" name="numPezziDisponibili" placeholder="pezzi disponibili" required>
	 	</div>
	 	
	 	<div class="signup-group">
			<input type="submit" value="Process">	 
		</div>
	 </form>
	
	 <footer style="position: absolute;left: 0;bottom: 0;width: 100%;">
		<div class="footer"> &copy; 
	    </div>
	</footer>
</body>
<%@ include file="jsp/footer.jsp" %>
</html>