<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList, it.unisa.model.ProductBean"%>
    <%
			String ricerca=request.getParameter("search");
			Collection<ProductBean> prodotti= (Collection<ProductBean>) request.getAttribute("prodotti");
			
			boolean notEmpty= !prodotti.isEmpty();
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ricerca</title>
<style type="text/css">
.col-md-4{ border: 1px solid black;
}

</style>
</head>
<body>
<%@ include file="jsp/navbar2.jsp" %>
<div class="container">
<h1>Risultati di ricerca per:" <%=ricerca %> "</h1> 
	
	<div class= "container">
 <div class="row">
<% 
  /*era prodotto*/
    if(prodotti != null && prodotti.size()>0){
    	int i=0;
    	
    	Iterator<?> it= prodotti.iterator();
    	while(it.hasNext()){
    		i++;
    	ProductBean bean = (ProductBean)it.next();
    	
  %>
 
  <!-- product grid -->
<div class="col-md-4 product-grid">
 <div class="image">
  <a href="DettagliProd?id=<%=bean.getIdProdotto() %>">
    <img src="pictures/aereo.jpg" class="w-100">
    <div class="overlay">
       <div class="detail" >Visualizza Dettagli</div>
    </div>
  </a>
 </div>
 <h4 class="text-center"><%= bean.getNomeProdotto() %></h4>
 <h5 class="text-center">Prezzo: <%= bean.getPrezzoProdotto() %>&#8364;</h5>
 <a href="<%= response.encodeURL("DettagliProdottoAddCart?action=addCart&id=" + bean.getIdProdotto()) %>" class="btn"><i class="fa fa-cart-plus" aria-hidden="true"></i> Compra</a>
 
</div>

<% }
  }else{ %>
 		<h2>Articolo non disponibile ci scusiamo per il disagio...</h2>
  <% } %>
</div>
</div>

<!-- fine product grid -->
<br>
</body>
<%@ include file="jsp/footer.jsp" %>
</html>