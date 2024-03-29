<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="it.unisa.model.Carrello,it.unisa.model.ProductBean,java.util.*"%>
   <%
			HttpSession sessione= request.getSession(true);
			@SuppressWarnings("unchecked")
			Carrello<ProductBean> carrello = (Carrello<ProductBean>)sessione.getAttribute("carrello");
			
			if(carrello == null) {
				response.sendRedirect(response.encodeRedirectURL("./ProductControl"));
				return;
			}
			
			String message= (String) request.getAttribute("message");
			
			
		%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet "href="CSS/assistenza.css">
<meta charset="ISO-8859-1">
<style type="text/css">
.well{ border: 1px solid black;
		padding: 15px;
}

</style>
<title>Carrello</title>
</head>
<%@ include file="jsp/navbar2.jsp" %>
<body>

<br>
<%if(nome.isBlank()){ %>
	<p class=titolo>Effettua il login per accedere al carrello</p>
	<%}else{%>
<div class="container">
	<h1>Carrello:</h1>
	<br>
	
	<%
		int tot= 0;
		if(carrello != null && !carrello.getItems().isEmpty()){
			for(ProductBean p : carrello.getItems()){
				tot+=p.getPrezzoProdotto();
	%>
			<div class="well search-result">
				<div class="row">
					<div class="col-sm">
						<img class="img-responsive" src="./getPicture?idProdotto=<%=p.getIdProdotto()%>" alt="">
					</div>
					<div class="col-sm">
					<a href="./ProductControl?action=details&id=<%=p.getIdProdotto()%>">
						<h2><%=p.getNomeProdotto() %></h2>
					</a>
					<h4>Prezzo: &euro;<%=p.getPrezzoProdotto() %></h4>
					<br><br>
						<a href="./CarrelloControl?action=deleteCart&id=<%=p.getIdProdotto()%>"><button type="button" class="btn btn-danger">Rimuovi</button></a>
					</div>
                </div>
			</div>
	<%		}%>
			<a href="./checkOut.jsp"><button type="button right" class="btn btn-danger">Paga</button></a>
	
	
		<br>
		<h4>Totale: &euro;<%=tot %></h4>
		<% } else { %>
			<h3>Il carrello � vuoto...</h3>
	<% } %>
	</div>
<%} %>	
</body>
<%@ include file="jsp/footer.jsp" %>
</html>