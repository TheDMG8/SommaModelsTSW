<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, it.unisa.model.ProductBean, it.unisa.model.Carrello, it.unisa.model.UtenteBean" %>
 <%
    Collection<?> prodotti = (Collection<?>) request.getAttribute("prodotti");
    
 	String error = (String)request.getAttribute("error");
 	
 	if(prodotti == null && error == null) {
 		response.sendRedirect(response.encodeRedirectURL("./ProductControl"));
 		return;
 	}
 	/*controllo dell'esistenza del prodotto*/
 	ProductBean prodotto = (ProductBean) request.getAttribute("prodotto");
 	
 	
    %>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">

<title>Somma Models</title>
<link rel="stylesheet" type="text/css" href="CSS/CSS.css">


</head>
<body>

<!-- serve a rendere la tabella responsive -->
<div style="overflow-x:auto;">
<!-- fine tabella responsive -->
</div>

<nav>
			<ul>
				<li><a href="addProduct.jsp">Aggiungi Prodotti</a></li>
				<li><a href="editProduct.jsp">Modifica Prodotti</a></li>
			</ul>
		</nav>
		<form action="Logout" method="get" > 
     <input type="submit" value="Logout"/>
</form>
<h1>PRODOTTI</h1>
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
           <td><%= bean.getImmagine() %></td>
           <td>
            <a href="<%= response.encodeURL("AdminController?action=delete&id=" + bean.getIdProdotto())%>">Delete</a>
           
           </td>
      </tr>
  
  <% }
  }else{ %>
  <tr>
    <td colspan="5">Prodotto non disponibile</td>
  </tr>
 
  <% } %>
</table>

 
 <%
 String message=(String)request.getAttribute("message");
 if(message != null && !message.equals("")){
%>
 <p style="color:green;"><%=message %></p>
<% 
 }
%>	 
 
 <%
 if(error != null && !error.equals("")){
 %>
 <p style="color: red;">Error: <%= error %></p>
 <% 
 }
%>
 
</body>


</html>
