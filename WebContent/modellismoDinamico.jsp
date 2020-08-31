<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8" import="java.util.*, it.unisa.model.ProductBean, it.unisa.model.Carrello, it.unisa.model.UtenteBean" %>
    
     <%
     Collection<?> prodotti = (Collection<?>) request.getAttribute("prodotti");
     
  	String error = (String)request.getAttribute("error");
		
     if(prodotti == null ) {
  		response.sendRedirect(response.encodeRedirectURL("./modellismoDinamicoControl"));
  		return;
		}
		
     
     ProductBean prodotto = (ProductBean) request.getAttribute("prodotto");
		
  
 	 	
 	
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">

<title>Modellismo Dinamico</title>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="CSS/style.css">
</head>
<body>

<%@ include file="jsp/navbar2.jsp" %>
<div class= "container">
 <div class="row">
<% 
  /*era prodotto*/
    if(prodotti != null && prodotti.size()>0){
    	
    	Iterator<?> it= prodotti.iterator();
    	while(it.hasNext()){
    	ProductBean bean = (ProductBean)it.next();
    	
  %>
 
  <!-- product grid -->
<div class="col-md-4 product-grid">
 <div class="image">
  <a href="#">
    <img src="pictures/aereo.jpg" class="w-100">
    <div class="overlay">
       <div class="detail" href="#">View Details</div>
    </div>
  </a>
 </div>
 <h4 class="text-center"><%= bean.getNomeProdotto() %></h4>
 <h5 class="text-center"><%= bean.getPrezzoProdotto() %>$</h5>
 <a href="<%= response.encodeURL("modellismoDinamicoControl?action=addCart&id=" + bean.getIdProdotto()) %>" class="btn">BUY</a>
</div>

<% }
  }else{ %>
 
  <% } %>
</div>
</div>
<!-- fine product grid -->
<br>
</body>
<%@ include file="jsp/footer.jsp" %>
</html>