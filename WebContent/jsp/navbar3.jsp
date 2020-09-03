<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
</head>
<body>

<a href="Index.jsp">
  <img class="upperPic" src="pictures/px1.png">
</a>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
 

  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="Index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="ProductView.jsp">M.Statico</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="ProductView.jsp">M.Dinamico</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="ProductView.jsp">Accessori</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="#">Assistenza</a>
    </li>
      
     <li class="nav-item">
      <a class="nav-link" href="contattaci.jsp">Contattaci</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="ProductView.jsp">ChiSiamo</a>
    </li>
    </ul>
  <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="login.jsp"><i class="fa fa-user-o" aria-hidden="true"></i> Accedi</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Carrello.jsp"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Carrello</a>
            </li>
            
        </ul>
    </div>
  
  
 
</nav>
</body>
</html>