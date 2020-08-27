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
</head>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
 

  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="Index.jsp">Home</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="ProductView.jsp">M.Statico</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="modellismoDinamico.jsp">M.Dinamico</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="ProductView.jsp">Accessori</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="#">Assistenza</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="#">Contatti</a>
    </li>
    </ul>
  <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Accedi</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Carrello.jsp">Carrello</a>
            </li>
            <form class="form-inline right" action="<%=response.encodeURL("./SearchControl?search=")%>" method="GET">
                    <input class="form-control mr-sm-2" type="text" placeholder="Cerca...">
                    <button class="btn btn-success" type="submit">Search</button>
            </form>
        </ul>
    </div>
  
  
 
</nav>
</body>
</html>