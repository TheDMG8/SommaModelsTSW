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
      <link rel = "stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" >
      <script src="https://kit.fontawesome.com/cf835fc8f8.js"  crossorigin="anonymous"></script>
	  <link rel = "stylesheet" type="text/css"  href = "CSS/navBar.css"/>
      <link rel = "stylesheet" type="text/css"  href = "CSS/mediaquery.css"/>
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>      
      <script src="preSearch.js"></script>
<title>Navbar</title>
</head>

<body>
<div id="try">
	
</div>

<a class="pic" href="Index.jsp">
  <img class="upperPic" src="pictures/px1.png">
  <img class="upperPic2" src="pictures/px2.png">
</a>


<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
 

  <!-- Links -->
  <div class="topnav">

  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="Index.jsp"><i class="fa fa-home" aria-hidden="true"></i></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="modellismoStatico.jsp">Statico</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="modellismoDinamico.jsp">Dinamico</a>
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
      <a class="nav-link" href="chiSiamo.jsp">ChiSiamo</a>
    </li>
    </ul>
   </div>
   
  	<div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
  	  
        <ul id="navdx" class="navbar-nav ml-auto">
        <% if(!nome.isBlank()){ %> 
            <li class="nav-item" >
                <a class="nav-link" href="userPersonalPage.jsp" style="color:#ff6666;"><i class="fas fa-car-side"></i> Profilo</a>
            </li>
       <%}else{ %>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp" style="color:#33ccff;" ><i class="fa fa-user-o" aria-hidden="true"></i> Accedi</a>
            </li>
       <%} %>
            <li class="nav-item">
                <a class="nav-link" href="Carrello.jsp"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Carrello</a>
            </li>
            <li class="nav-item" >
            
            
            
                <form autocomplete="false" id="form-search" class="form-inline right" action="<%=response.encodeURL("./SearchControl")%>" method="GET">
                    <input autocomplete="false" id="input-search" onkeyup="ricerca(this.value)" class="form-control mr-sm-2" name="search" type="text" placeholder="Cerca...">
                    <button class="btn btn-success" type="submit"><i class="fas fa-search"></i></button>
            	</form>
            	 
            </li>
        </ul>
   </div>
</nav>
 
    
<nav id="nav2" class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="area1">
        <ul class="navbar-nav ml-auto">
        <% if(!nome.isBlank()){ %> 
            <li class="nav-item" >
                <a class="nav-link" href="userPersonalPage.jsp" style="color:#ff6666;"><i class="fas fa-car-side"></i> Profilo</a>
            </li>
       <%}else{ %>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp" style="color:#33ccff;" ><i class="fa fa-user-o" aria-hidden="true"></i> Accedi</a>
            </li>
       <%} %>
            <li class="nav-item">
                <a class="nav-link" href="Carrello.jsp"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Carrello</a>
            </li>
            
                <form id="form-search" class="form-inline right" action="<%=response.encodeURL("./SearchControl")%>" method="GET">
                 	<li class="nav-item" ><input  id="input-search" class="form-control mr-sm-2" name="search" type="text" placeholder="Cerca..."></li>
                  	<li class="nav-item" ><button class="btn btn-success" type="submit"><i class="fas fa-search"></i></button></li>
                  	<div id="livesearch"></div>
   	  		        </div>
            	</form>
           
        </ul>
	</div>
	</nav>
	<div id="search-layer"></div>
</body>
</html>