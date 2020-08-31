package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.Carrello;
import it.unisa.model.ProductBean;
import it.unisa.model.ProductModelDM;


@WebServlet("/modellismoStaticoControl")
public class modellismoStaticoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	static ProductModelDM model = new ProductModelDM();
	
    public modellismoStaticoControl() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/*gestire il carrello*/
			/*verificare la presenza*/
			@SuppressWarnings("unchecked")
			Carrello<ProductBean> carrello =(Carrello<ProductBean>) request.getSession().getAttribute("carrello");
			if(carrello == null) {
				/*se non esiste lo creiamo*/
				carrello = new Carrello<ProductBean>();
				request.getSession().setAttribute("carrello", carrello);
			}
			
			
			
			String action = request.getParameter("action");
			
			try {
				if(action != null) {
					if(action.equals("details")) {
						/*prendo l id di quando detail è stato aggiunto nella view recupero il prodotto lo rimuovo*/
						String id = request.getParameter("id");				
							request.removeAttribute("prodotto");
							request.setAttribute("prodotto", model.doRetrieveByKey(id));
							/*salvato il carrello nella sessione*/
					}else if(action.equals("addCart")){
						String id = request.getParameter("id");	
						ProductBean bean = model.doRetrieveByKey(id);
						if(bean!=null && !bean.isEmpty()) {
							carrello.addItem(bean);	
							request.setAttribute("message", "Prodotto" + bean.getNomeProdotto()+" aggiunto al carrello");
							
						}
						
					}else if(action.equals("clearCart")){
						carrello.deleteItems();
						request.setAttribute("message", "Carrello svuotato");
				}else if(action.equals("deleteCart")){
					String id = request.getParameter("id");
					ProductBean bean = model.doRetrieveByKey(id);
					if(bean!=null && !bean.isEmpty()) {
						carrello.deleteItem(bean);
						request.setAttribute("message", "Prodotto" + bean.getNomeProdotto()+" è stato eliminato dal carrello");
					}
				}
					
				}	
			} catch(SQLException | NumberFormatException e) {
				System.out.println("Error:" + e.getMessage());
				request.setAttribute("error", e.getMessage());
			}
		
			/*visualizzare il carrello lo rimando come attributo alla view inizialmente vuoto*/
			request.setAttribute("carrello", carrello);
			

		
		try {
			request.removeAttribute("prodotti");
			request.setAttribute("prodotti", model.doRetrieveAllStatico(""));
		}catch(SQLException e){
			System.out.println("Error:" + e.getMessage());
			request.setAttribute("error", e.getMessage());
		}
		
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/modellismoStatico.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
