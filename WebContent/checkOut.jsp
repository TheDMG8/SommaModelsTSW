<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="it.unisa.model.Carrello,it.unisa.model.ProductBean,java.util.*,it.unisa.model.UtenteBean"%>
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
<meta charset="ISO-8859-1">
<title>CheckOut</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="CSS/checkOut.css">
<link rel = "stylesheet" href = "CSS/navBar.css">
</head>

<body>
<a href="Index.jsp">
  <img class="upperPic" src="pictures/px1.png">
</a>

<div class="pow">
  <div class="col-75">
    <div class="container">
      <form action="AddOrdine" value="insert" method="Post">
      
        <div class="pow">
          <div class="col-50">
            <h3>Indirizzo Di Fatturazione</h3>
            <label for="nome"><i class="fa fa-user"></i>  Nome e Cognome</label>
            <input type="text" id="nome" name="nome" placeholder="Mario Rossi">
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="email" placeholder="MarioRossi@gmail.com">
            <label for="indirizzo"><i class="fa fa-address-card-o"></i> Indirizzo</label>
            <input type="text" id="indirizzo" name="indirizzo" placeholder="Via Corso Umberto I 10">
            <label for="citta"><i class="fa fa-institution"></i> Citta'</label>
            <input type="text" id="citta" name="citta" placeholder="Roma">
            <label for="provincia"> Provincia</label>
            <input type="text" id="provincia" name="provincia" placeholder="RO">
            <label for="regione"> Regione</label>
            <input type="text" id="regione" name="regione" placeholder="Lazio">

            <div class="pow">
              <div class="col-50">
                <label for="state">Stato</label>
                <input type="text" id="stato" name="stato" placeholder="Italia">
              </div>
              <div class="col-50">
                <label for="zip">CAP</label>
                <input type="text" id="cap" name="cap" placeholder="80030">
              </div>
            </div>
          </div>

          <div class="col-50">
            <h3>Pagamenti</h3>
            <label for="fname">Carte Accettate</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
            </div>
            <label for="cname">Proprietario carta</label>
            <input type="text" id="cname" name="cardname" placeholder="Mario Rossi">
            <label for="ccnum">Numero carta di credito</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
            <label for="expmonth">Mese Scadenza</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="Gennaio">
            <div class="pow">
              <div class="col-50">
                <label for="expyear">Anno Scadenza</label>
                <input type="text" id="expyear" name="expyear" placeholder="2021">
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="000">
              </div>
            </div>
          </div>
          
        </div>
        <input type="submit" value="Continue il pagamento" class="btn">
      </form>
    </div>
  </div>
  <div class="col-25">
    <div class="container">
      <h4>Carrello: <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b>4</b></span></h4>
      <% 
 
      int tot= 0;
		if(carrello != null && !carrello.getItems().isEmpty()){
			for(ProductBean p : carrello.getItems()){
				tot+=p.getPrezzoProdotto();
      %>			
      <p><%=p.getNomeProdotto()%> <span class="price"><br><%=p.getPrezzoProdotto()%>&euro;</span></p>
      <hr>
      <% }%>
      <br>
      <p>Totale <span class="price" style="color:black"><b><%=tot%>&euro;</b></span></p>
      <%} %>
    </div>
  </div>
</div>


</body>

</html>