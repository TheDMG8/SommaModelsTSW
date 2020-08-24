<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
     pageEncoding="UTF-8" import="java.util.*, model.ProductBean, model.Carrello, model.UtenteBean" %>
    <%
    Collection<?> prodotti = (Collection<?>) request.getAttribute("prodotti");
    
 	String error = (String)request.getAttribute("error");
 	
 	if(prodotti == null && error == null) {
 		response.sendRedirect(response.encodeRedirectURL("./ProductControl"));
 		return;
 	}
 	/*controllo del carrello per recuperarlo*/
 	Carrello<ProductBean> carrello = (Carrello<ProductBean>)request.getAttribute("carrello");
 	
 	if(carrello == null) {
 		response.sendRedirect(response.encodeRedirectURL("./ProductControl"));
 		return;
 	}
 	/*controllo dell'esistenza del prodotto*/
 	ProductBean prodotto = (ProductBean) request.getAttribute("prodotto");
 	
 	UtenteBean user= (UtenteBean)request.getSession().getAttribute("user"); //Recupero dati utente dalla session, se presenti.
 	String nome="";
 	if(user != null){nome= user.getNome();}

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
<%@ include file="jsp/navbar2.jsp" %>
<!-- serve a rendere la tabella responsive -->
<div style="overflow-x:auto;">
<!-- fine tabella responsive -->
</div>


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
           <td><%= bean.getImmagine() %></td>
           <td>
            <a href="<%= response.encodeURL("ProductControl?action=details&id=" + bean.getIdProdotto())%>">Details</a>
            <a href="<%= response.encodeURL("ProductControl?action=addCart&id=" + bean.getIdProdotto()) %>">Add to Carrello</a> 
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
    if(prodotto != null && !prodotto.isEmpty()){
  
  %>
    <h2>Details</h2>
    <table>
      <tr>
         <th>Codice</th>
         <th>Nome </th>
         <th>Marca </th>
         <th>Categoria</th>
         <th>Tipo</th>
         <th>Descrizione</th>
         <th>Prezzo</th>
         <th>Immagine</th>
         <th>Pezzi Disponibili</th>
      </tr>
      <tr>
        <td><%= prodotto.getIdProdotto() %></td> 
        <td><%= prodotto.getNomeProdotto() %></td> 
        <td><%= prodotto.getMarcaProdotto() %></td> 
        <td><%= prodotto.getTipoCategoria() %></td> 
        <td><%= prodotto.getTipoProdotto() %></td> 
        <td><%= prodotto.getDescrizioneProdotto() %></td> 
        <td><%= prodotto.getPrezzoProdotto() %></td> 
        <td><%= prodotto.getImmagine() %></td> 
        <td><%= prodotto.getNumPezziDisponibili() %></td> 
      </tr>
    </table>
 <% } %> 
 
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

<%@ include file="jsp/footer.jsp" %>
</html>


