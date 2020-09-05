package it.unisa.control;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.model.Carrello;
import it.unisa.model.OrdineBean;
import it.unisa.model.OrdineModelDM;
import it.unisa.model.ProductBean;
import it.unisa.model.UtenteBean;
import it.unisa.model.UtenteModelDM;

@WebServlet("/AddOrdine")
public class AddOrdine extends HttpServlet{
	
private static final long serialVersionUID = 1L;
	
	
	static OrdineModelDM model = new OrdineModelDM();
	
     public AddOrdine() {
        super();
      
    }
     
    
 	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		String action = request.getParameter("action");
 		UtenteBean user= (UtenteBean)request.getSession().getAttribute("user");
 		
 		try {
 			
 					String regione= request.getParameter("regione");
					String citta= request.getParameter("citta");
					String provincia= request.getParameter("provincia");
					String via= request.getParameter("indirizzo");
					int numCivico= 0;
					String statoOrdine="In Spedizione";
					int idUtente=user.getIdUtente();
					
					OrdineBean ordineBean=new OrdineBean();
					System.out.println("ADDORDINE 1");
					ordineBean.setCitta(citta);
					ordineBean.setDataOrdine("0000-00-00");
					ordineBean.setIdUtente(idUtente);
					ordineBean.setNumCivico(numCivico);
					ordineBean.setProvincia(provincia);
					ordineBean.setRegione(regione);
					ordineBean.setStatoOrdine(statoOrdine);
					ordineBean.setVia(via);
					System.out.println("ADDORDINE 2");
					int idNuovoOrdine=model.doSave(ordineBean);// ritorna l'id dell'ordine
					
					HttpSession sessione= request.getSession(true);
					Carrello<ProductBean> carrello = (Carrello<ProductBean>)sessione.getAttribute("carrello");
					List<ProductBean> prodotti = carrello.getItems();
					System.out.println("ADDORDINE DOPO SALVATAGGIO"); 
					int[] matrix = new int[prodotti.size()];	
							for(int i=0;i<prodotti.size();i++){
								ProductBean pr=prodotti.get(i);
								matrix[i]=pr.getIdProdotto();
					}
					
					model.doSaveProdottiOrdine(idNuovoOrdine,matrix,prodotti.size());		
					
					
					System.out.println("ADDORDINE Finale");
					RequestDispatcher view = request.getRequestDispatcher("Index.jsp");/*dove inoltro il form*/
					view.forward(request,response);
					
					
					request.getSession().removeAttribute("carrello");
					return;
 		
 		}catch(NumberFormatException | SQLException e) {
			System.out.println("Error:" + e.getMessage());
			request.setAttribute("error", e.getMessage());
		
		}

 		
}
}
