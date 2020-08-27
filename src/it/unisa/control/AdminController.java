package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.ProductBean;
import it.unisa.model.ProductModelDM;


@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	static ProductModelDM model = new ProductModelDM();
	
    public AdminController() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		try {
			if(action != null) {
				if(action.equals("add_product")) {
					
					String nomeProdotto= request.getParameter("nomeprodotto");
					String marcaProdotto= request.getParameter("marcaprodotto");
					String tipoCategoria= request.getParameter("categoria");
					String tipoProdotto= request.getParameter("tipoprodotto");
					String descrizioneProdotto= request.getParameter("descrizioneprodotto");
					double prezzoProdotto= Double.parseDouble(request.getParameter("prezzoprodotto"));
					String immagine= request.getParameter("immagine");
					int numPezziDisponibili=Integer.parseInt(request.getParameter("numPezziDisponibili"));
										
					ProductBean bean = new ProductBean();
					
					bean.setNomeProdotto(nomeProdotto);
					bean.setMarcaProdotto( marcaProdotto);
					bean.setTipoCategoria(tipoCategoria);
					bean.setTipoProdotto(tipoProdotto);
					bean.setDescrizioneProdotto(descrizioneProdotto);
					bean.setPrezzoProdotto(prezzoProdotto);
					bean.setImmagine(immagine);
					bean.setNumPezziDisponibili(numPezziDisponibili);
					
					
					model.doSave(bean);
					RequestDispatcher view = request.getRequestDispatcher("addProduct.jsp");/*dove inoltro il form*/
					view.forward(request,response);
					return;
				  }else if(action.equals("delete")) {
					  String id = request.getParameter("id");
						ProductBean bean = model.doRetrieveByKey(id);
						if(bean != null && !bean.isEmpty()) {
							model.doDelete(bean);
							RequestDispatcher view = request.getRequestDispatcher("editProduct.jsp");/*dove inoltro il form*/
							view.forward(request,response);
							return;
						
						}
				  }
	       } 
		}catch(SQLException | NumberFormatException e) {
		System.out.println("Error:" + e.getMessage());
		request.setAttribute("error", e.getMessage());
		}
		}
    }
