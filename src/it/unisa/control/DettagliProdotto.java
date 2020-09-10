package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.OrdineBean;
import it.unisa.model.OrdineModelDM;
import it.unisa.model.ProductBean;
import it.unisa.model.ProductModelDM;
import it.unisa.model.UtenteBean;

@WebServlet("/DettagliProd")
public class DettagliProdotto extends HttpServlet {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		ServletContext ctx= getServletContext();
		
		if(request.getParameter("id")!= null) {
		String idProd= request.getParameter("id");
		ProductModelDM prod= new ProductModelDM();
		
		try {
			ProductBean prodotto=(ProductBean)prod.doRetrieveByKey(idProd);
			ctx.setAttribute("prodotto", prodotto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String address;
		address = "/dettagliProdotto.jsp";
		System.out.println("TERMOSTATO DETTAGLI PRODOTTI");
		RequestDispatcher dispatcher = request.getRequestDispatcher(address);
		dispatcher.forward(request, response);
	}else {
		
		ProductModelDM model=new ProductModelDM();
		System.out.println("ViewProd 1");
		try {
			Collection<ProductBean> collProd=model.doRetrieveAll(null);
			getServletContext().setAttribute("prodotti", collProd);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String address;
		address = "/adminArea.jsp";
		System.out.println("ViewProd final");
		RequestDispatcher dispatcher = request.getRequestDispatcher(address);
		dispatcher.forward(request, response);
	}
	}
}
