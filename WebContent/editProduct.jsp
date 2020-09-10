<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, it.unisa.model.ProductBean"%>
<%
     Collection<?> prodotti = (Collection<?>) request.getAttribute("prodotti");
     ArrayList<ProductBean> arrayList=new ArrayList<ProductBean>();
  	 String error = (String)request.getAttribute("error");
     
     if(prodotti == null ) {
  		response.sendRedirect(response.encodeRedirectURL("./DettagliProd"));
  		return;
		}

    %>
    
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
<title>modicaEliminaProdotto</title>


</head>
<body>
	<%@ include file="jsp/navbar2.jsp" %>

	<header>
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
	 	<h2>Modifica prodotto</h2>
	 </div>

	  <form method="post" action="AdminController" enctype="multipart/form-data">
		<input type="hidden" name="action" value="update">
     
	 	<div class="signup-group">
	 	
	 	<label>Id Prodotto</label>
	 		<input type="text" name="idProdotto" placeholder="ID prodotto"  required>
	 	</div>
	 	
	 		<label>Nome Prodotto</label>
	 		<input type="text" name="nomeprodotto" placeholder="nome prodotto"  >
	 	</div>
	 	<div class="signup-group">
	 	
	 		<label>Marca Prodotto</label>
	 		<input type="text" name="marcaprodotto" placeholder="marca prodotto" >
	 	</div>
	 	<div class="signup-group">
	 		<label>Tipo Categoria</label>
	 		<input type="text" name="categoria" placeholder="tipo categoria" >
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Tipo Prodotto</label>
	 		<input type="text" name="tipoprodotto" placeholder="tipo prodotto" >
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Descrizione Prodotto</label>
	 		<input type="text" name="descrizioneprodotto" placeholder="descrizione" >
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Prezzo Prodotto</label>
	 		<input type="text" name="prezzoprodotto" placeholder="descrizione" >
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label for="fileupload">Immagine</label>
	 		<input type="file" name="immagine" >
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Pezzi Disponibili</label>
	 		<input type="text" name="numPezziDisponibili" placeholder="pezzi disponibili" >
	 	</div>
	 	
	 	<div class="signup-group">
			<input type="submit" value="Process">	 
		</div>
	 </form>
	 
	 <h1>elimina prodotto</h1>
	 <form method="post" action="AdminController" enctype="multipart/form-data">
	 <input type="hidden" name="action" value="delete">
	 	<label>Id prodotto:</label>
	 	<input type="text" name="id" placeholder="num">
	 	<input type="submit" value="elimina prodotto">
	 </form>		
	 
	
	 <footer style="position: absolute;left: 0;bottom: 0;width: 100%;">
		<div class="footer"> &copy; 
	    </div>
	</footer>
</body>
<%@ include file="jsp/footer.jsp" %>
</html>