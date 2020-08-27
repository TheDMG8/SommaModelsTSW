<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList, it.unisa.model.ProductBean"%>
    <%
			String ricerca= (String) request.getAttribute("search");
			ArrayList<ProductBean> prodotti= (ArrayList<ProductBean>) request.getAttribute("result");
			
			boolean notEmpty= !prodotti.isEmpty();
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ricerca</title>
</head>
<body>
<%@ include file="jsp/navbar2.jsp" %>
<div class="container">
<h1>Risultati di ricerca per: </h1> <h2><%= ricerca %></h2>
	
	<%
		if(notEmpty){
			for(ProductBean p : prodotti){
	%>
			<div class="well search-result">
				<div class="row">
					<div class="col-sm">
						<img class="img-responsive" src="https://via.placeholder.com/400x200" alt="">
					</div>
					<div class="col-sm">
					<a href="./ProductControl?action=details&id=<%=p.getIdProdotto()%>">
						<h2><%=p.getNomeProdotto() %></h2>
					</a>
						<p><%=p.getDescrizioneProdotto()%></p>
					</div>
                </div>
			</div>
	<%		}
		} else {%>
			<p>Sembra che non ci siano corrispondenze nel catalogo...</p>
	<% } %>
	
	</div>



</body>
<%@ include file="jsp/footer.jsp" %>
</html>