<%@page import="it.unisa.model.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">

<title>DettagliProdotto</title>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="CSS/style.css">
<link rel="stylesheet" type="text/css" href="CSS/dettagliProdotto.css">

</head>
<body>

<%@ include file="jsp/navbar2.jsp" %>

<%ProductBean bean=(ProductBean)getServletContext().getAttribute("prodotto"); %>


<div class="container">
 <div class="row">
   <div class="left col-md-6">
     <img class="headset" src="./getPicture?idProdotto=<%=bean.getIdProdotto()%>" >   
   </div>
   <div class="destra col-md-6">
     
     <h4 class="product"><%=bean.getNomeProdotto() %></h4>
     <div class="desc">
     <b>Descrizione:</b> <br><%=bean.getDescrizioneProdotto() %>
     </div>
   	 <p class="price"><%=bean.getPrezzoProdotto() %>&euro;</p>
     <p><a href="<%= response.encodeURL("DettagliProdottoAddCart?action=addCart&id=" + bean.getIdProdotto()) %>" class="btn"><i class="fa fa-cart-plus" aria-hidden="true"></i> Compra</a></p>
<%if(user != null)
	if(user.isAdmin().equals("true")){%>
 <h4 class="text-center">ID PRODOTTO:<%=bean.getIdProdotto() %></h4>
<%}%>
  </div>
</div>
</div>

<!-- fine product grid -->
<br>
</body>
<%@ include file="jsp/footer.jsp" %>
</html>