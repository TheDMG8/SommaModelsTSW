package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.ProductBean;
import it.unisa.model.ProductModelDM;

@WebServlet("/DettagliProdottoOrdine")
public class DettagliProdottoOrdine extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static ProductModelDM model=new ProductModelDM();

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext ctx= getServletContext();
		String idOrdine= request.getParameter("id");
		ProductModelDM prod= new ProductModelDM();
		
		try {
			
			ArrayList<ProductBean> prodotti= new ArrayList<ProductBean>();
			prodotti=model.doRetrieveByOrdine(idOrdine);
			ctx.setAttribute("prodotti", prodotti);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String address;
		address = "/dettagliOrdine.jsp";
		System.out.println("TERMOSTATO DETTAGLI PRODOTTI");
		RequestDispatcher dispatcher = request.getRequestDispatcher(address);
		dispatcher.forward(request, response);
	}

}
