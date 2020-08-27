<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,it.unisa.model.UtenteBean" %>
    <%
    
    UtenteBean user= (UtenteBean)request.getSession().getAttribute("user");
  //Recupero dati utente dalla session, se presenti.
   	String nome="";
   	if(user != null){nome= user.getNome();}
    
    %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Somma Models</title>
</head>
<body>
<%@ include file="jsp/navbar2.jsp" %>


<!-- Carousel (Scorrimento orizzontale) -->
	
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="z-index:1;">
 	 <ol class="carousel-indicators">
   		 <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
  	 	 <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
   		 <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
 	 </ol>
 	 <div class="carousel-inner">
  	  <div class="carousel-item active">
  	    <img class="d-block w-100" src="pictures/ferrari.jpg" alt="First slide" style="height:340px; width:240px;">
  	  </div>
  	  <div class="carousel-item">
  	    <img class="d-block w-100" src="pictures/aereo.jpg" alt="Second slide"style="height:340px; width:240px;">
 	   </div>
	    <div class="carousel-item">
 	     <img class="d-block w-100" src="pictures/nave.jpg" alt="Third slide"style="height:340px; width:240px;">
 	   </div>
	  </div>
	  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
 	   <span class="carousel-control-prev-icon" aria-hidden="true"></span>
  	  <span class="sr-only">Previous</span>
 	 </a>
 	 <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
    	<span class="sr-only">Next</span>
  	</a>
	</div>
	<br>
	
	<% if(!nome.isBlank()){ %> <br><h4>Bentornato/a <%=nome %></h4><br>

   <form action="Logout" method="get" > 
     <input type="submit" value="Logout"/>
</form> 
   
 <%}%>
	
<!-- Three cards category -->
<br>

<div class="container" style="background-color:#0000" >

  <div class="card img-fluid" style="width:300px; height:300px; float:left; display:block; margin-left:50px;" >
    <img class="card-img-top" src="pictures/dinamica.jpg" alt="Card image" style="width:100%">
    <div class="card-img-overlay">
      <h4 class="card-title">DINAMICO</h4>
      <a href="modellismoDinamico.jsp" class="btn btn-secondary" style="margin-left:auto; margin-right:auto;">Catalogo</a>
    </div>
  </div>
 
  <div class="card img-fluid" style="width:300px; height:300px; float:left; display:block; margin-left:50px;" >
    <img class="card-img-top" src="pictures/staticanave.jpg" alt="Card image" style="width:100%">
    <div class="card-img-overlay">
      <h4 class="card-title">STATICO</h4>
      <a href="ProductView.jsp" class="btn btn-secondary" style="margin-left:5px;">Catalogo</a>
    </div>
  </div>

  <div class="card img-fluid" style="width:300px; height:300px; float:left; display:block; margin-left:50px;" >
    <img class="card-img-top" src="pictures/accessori.jpg" alt="Card image" style="width:100%">
    <div class="card-img-overlay">
      <h4 class="card-title">ACCESSORI</h4>
      <a href="ProductView.jsp" class="btn btn-secondary">Catalogo</a>
    </div>
</div>
</div>
<div style="clear:both;"></div>
<br>
<br>


<!-- Ends cards category -->
</body>
<%@ include file="jsp/footer.jsp" %>
</html>