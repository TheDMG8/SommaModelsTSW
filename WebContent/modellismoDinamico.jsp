<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, model.ProductBean, model.Carrello, model.UtenteBean" %>
    
     <%
    Collection<?> prodotti = (Collection<?>) request.getAttribute("prodotti");
    
 	String error = (String)request.getAttribute("error");
 	
 	if(prodotti == null && error == null) {
 		response.sendRedirect(response.encodeRedirectURL("./modellismoDinamicoControl"));
 		return;
 	}
 	
 	ProductBean prodotto = (ProductBean) request.getAttribute("prodotto");

    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modellismo Dinamico</title>
</head>
<body>
pagina relativa al modellismo dinamico
<h1>TABLE</h1>
<table>
   <tr> 
     <th>codice</th>
     <th>nome</th>
     <th>descrizione</th>
     <th>immagine</th>
     <th>Action</th>
   </tr>
  <% 
  /*era prodotto*/
    if(prodotti != null && prodotti.size()>0){
    	
    	Iterator<?> it= prodotti.iterator();
    	while(it.hasNext()){
    	ProductBean bean = (ProductBean)it.next();
    	
  %>


       <tr>
          <!-- prende il bean legge il numero e me lo va a stampare   -->  
                
           <td><%= bean.getTipoCategoria() %></td>
           <td><%= bean.getNomeProdotto() %></td>
           <td><%= bean.getDescrizioneProdotto() %></td>
           <td></td>
           <td></td>
      </tr>
  
  <% }
  }else{ %>
  <tr>
    <td colspan="5">Prodotto non disponibile</td>
  </tr>
 
  <% } %>
</table>
</body>
</html>