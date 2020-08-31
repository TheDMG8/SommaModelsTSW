<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,it.unisa.model.UtenteBean"%>
    <%
    
    UtenteBean user= (UtenteBean)request.getSession().getAttribute("user");
  //Recupero dati utente dalla session, se presenti.
   	String nome="";
   	if(user != null){nome= user.getNome();}
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Meta tags -->
      <meta charset = "utf-8">
      <meta name = "viewport" content = "width = device-width, initial-scale = 1, shrink-to-fit = no">
      
<title>Navbar esatta</title>
<link rel = "stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" >
<link rel = "stylesheet" href = "CSS/navBar.css">
<script src="https://kit.fontawesome.com/cf835fc8f8.js" crossorigin="anonymous"></script>
</head>
<body>

<a href="Index.jsp">
  <img class="upperPic" src="pictures/px1.png">
</a>


<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
 

  <!-- Links -->
  <div class="topnav">

  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="Index.jsp">Home</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="modellismoStatico.jsp">M.Statico</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="modellismoDinamico.jsp">M.Dinamico</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="accessori.jsp">Accessori</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="assistenza.jsp">Assistenza</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="contattaci.jsp">Contattaci</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="ProductView.jsp">ChiSiamo</a>
    </li>
    </ul>
   </div>
  	<div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul class="navbar-nav ml-auto">
        <% if(!nome.isBlank()){ %> 
            <li class="nav-item">
                <a class="nav-link" href="userPersonalPage.jsp"><i class="fas fa-car-side"></i> Profilo</a>
            </li>
       <%}else{ %>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Accedi</a>
            </li>
       <%} %>
            <li class="nav-item">
                <a class="nav-link" href="Carrello.jsp">Carrello</a>
            </li>
            <li class="nav-item" >
                <form class="form-inline right" action="<%=response.encodeURL("./SearchControl?search=")%>" method="GET">
                    <input class="form-control mr-sm-2" type="text" placeholder="Cerca...">
                    <button class="btn btn-success" type="submit">Search</button>
            	</form>
            </li>
        </ul>
    </div>

</nav>

</body>
</html>