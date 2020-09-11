<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, it.unisa.model.ProductBean"%>

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
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="CSS/profilo.css" rel="stylesheet">
<link href="CSS/assistenza.css" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>EliminaProdotto</title>


</head>
<body>
	<%@ include file="jsp/navbar2.jsp" %>
<div class="user-div">
	<form action="addProduct.jsp" method="POST" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Aggiungi Prodotti"/></form> 
    <form action="editProduct.jsp" method="POST" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Elimina Prodotti"/></form> 
   	<form action="adminArea.jsp" method="POST" ><input class="profile-edit-btn" name="btnAddMore" type="submit" value="Area Amministratore"/></form> 
   		
</div>
	 
	 <li><h1>elimina prodotto</h1>
	 <form method="post" action="AdminController" enctype="multipart/form-data">
	 <input type="hidden" name="action" value="delete">
	 	<li><label>Id prodotto:</label>
	 	<li><input type="text" name="id" placeholder="ID">
	 	<li><input class="bottoneAssistenza" type="submit" value="elimina prodotto">
	 </form>		
	 
	 
	
	 <footer style="position: absolute;left: 0;bottom: 0;width: 100%;">
		<div class="footer"> &copy; 
	    </div>
	</footer>
</body>
<%@ include file="jsp/footer.jsp" %>
</html>