package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.ProductBean;
import it.unisa.model.ProductModel;
import it.unisa.model.ProductModelDM;

@WebServlet("/modellismoStatico")
public class ServletStatico extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		ProductModelDM prodotti= new ProductModelDM();
		System.out.println("TERMOSTATO");
		try {
			List<ProductBean> collBean = (List<ProductBean>) prodotti.doRetrieveAll(null);
			getServletContext().setAttribute("prodotti", collBean);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String address;
		address = "/ProductView.jsp";
		System.out.println("TERMOSTATO");
		RequestDispatcher dispatcher = request.getRequestDispatcher(address);
		dispatcher.forward(request, response);
		

	}

	
	

}
