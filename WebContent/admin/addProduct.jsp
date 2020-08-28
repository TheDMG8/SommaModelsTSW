<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<header>
		<h1>
			Welcome admin
		</h1>
		<nav>
			<ul>
				<li><a href="">Home</a></li>
				<li><a href="">Add Product</a></li>
				<li><a href="#">Settings</a></li>
				<li><a href="#">Pages</a></li>
			</ul>
		</nav>
	</header>
	
	<div class="signup-header">
	 	<h2>Add Product</h2>
	 </div>

	 <form method="POST" action="AdminController">
	 
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
		<div class="footer"> &copy; 2018 Copyright:
	      Tiazon.com
	    </div>
	</footer>
</body>
</html>