<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8" import="java.util.*, it.unisa.model.ProductBean, it.unisa.model.Carrello, it.unisa.model.UtenteBean"%>

     <%
     Collection<?> prodotti = (Collection<?>) request.getAttribute("prodotti");
     ArrayList<ProductBean> arrayList=new ArrayList<ProductBean>();
  	 String error = (String)request.getAttribute("error");
		
     if(prodotti == null ) {
  		response.sendRedirect(response.encodeRedirectURL("./modellismoStaticoControl"));
  		return;
		}
		
     
     ProductBean prodotto = (ProductBean) request.getAttribute("prodotto");
		
  
 	 	
 	
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">

<title>Modellismo Statico</title>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="CSS/style.css">
<link rel="stylesheet" type="text/css" href="CSS/assistenza.css">

<style type="text/css">
</style>
</head>
<body>

<%@ include file="jsp/navbar2.jsp" %>

<br><br>
<h1 class="titolo">Modellismo Statico:</h1>


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
    <img src="./getPicture?idProdotto=<%=bean.getIdProdotto()%>" class="w-100">
    <div class="overlay">
       <div class="detail" >Visualizza Dettagli</div>
    </div>
  </a>
 </div>
 <h4 class="text-center"><%= bean.getNomeProdotto() %></h4>
 <h5 class="text-center">Prezzo: <%= bean.getPrezzoProdotto() %>&#8364;</h5>
 <a href="<%= response.encodeURL("modellismoStaticoControl?action=addCart&id=" + bean.getIdProdotto()) %>" class="btn"><i class="fa fa-cart-plus" aria-hidden="true"></i> Compra</a>
 <%if(user != null)
	if(user.isAdmin().equals("true")){%>
 <h4 class="text-center">ID PRODOTTO:<%=bean.getIdProdotto() %></h4>
<%}%>
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