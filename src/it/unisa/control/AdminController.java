package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import it.unisa.model.ProductBean;
import it.unisa.model.ProductModelDM;
import it.unisa.model.UtenteBean;


@WebServlet("/AdminController")
@MultipartConfig
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
		UtenteBean user= (UtenteBean)request.getAttribute("user");
		System.out.println("ciao");
		try {
			if(action != null) {
				if(action.equals("add_product")) {
					String regNome =  "/^[A-Za-z- ]+$/";
					String regNum =  "/^[0-9.]+$/";
					Boolean validate=true;
					if(!request.getParameter("nomeprodotto").matches(regNome)) {
						System.out.println("nomep dato corretto");
					}else{validate=false;}
					if(!request.getParameter("marcaprodotto").matches(regNome)) {
						System.out.println("marca dato corretto");
					}else{validate=false;}
					if(!request.getParameter("categoria").matches(regNome)) {
						System.out.println("cate dato corretto");
					}else{validate=false;}
					if(!request.getParameter("tipoprodotto").matches(regNome)) {
						System.out.println("tipo dato corretto");
					}else{validate=false;}
					if(!request.getParameter("descrizioneprodotto").matches(regNome)) {
						System.out.println("descr dato corretto");
					}else{validate=false;}
					if(!request.getParameter("prezzoprodotto").matches(regNum)) {
						System.out.println("prezzo dato corretto");					
				   }else {validate=false;}
					if(!request.getParameter("numPezziDisponibili").matches(regNum)) {
						System.out.println("num dato corretto");					
				   }else {validate=false;}
					 if(validate==true) {
						  System.out.println("tutti i campi sono giusti");
					  }else {
						  RequestDispatcher view = request.getRequestDispatcher("addProduct.jsp");/*dove inoltro il form*/
						  HttpSession currentSession = request.getSession();
						  currentSession.setAttribute("error", "error");
						  view.forward(request,response);
							return;  
					  }
					System.out.println("sto per aggiungere il prodotto");
					String nomeProdotto= request.getParameter("nomeprodotto");
					String marcaProdotto= request.getParameter("marcaprodotto");
					String tipoCategoria= request.getParameter("categoria");
					String tipoProdotto= request.getParameter("tipoprodotto");
					String descrizioneProdotto= request.getParameter("descrizioneprodotto");
					double prezzoProdotto= Double.parseDouble(request.getParameter("prezzoprodotto"));
					Part immagine= request.getPart("immagine");
					int numPezziDisponibili=Integer.parseInt(request.getParameter("numPezziDisponibili"));
										
					ProductBean bean = new ProductBean();
					
					bean.setNomeProdotto(nomeProdotto);
					bean.setMarcaProdotto( marcaProdotto);
					bean.setTipoCategoria(tipoCategoria);
					bean.setTipoProdotto(tipoProdotto);
					bean.setDescrizioneProdotto(descrizioneProdotto);
					bean.setPrezzoProdotto(prezzoProdotto);
					bean.setImmagine(immagine.getInputStream().readAllBytes());
					bean.setNumPezziDisponibili(numPezziDisponibili);
					
					
					model.doSave(bean);
					System.out.println("ho aggiunto il prodotto");
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
