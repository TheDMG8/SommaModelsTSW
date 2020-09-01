package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.OrdineBean;
import it.unisa.model.OrdineModelDM;
import it.unisa.model.ProductBean;
import it.unisa.model.ProductModelDM;

@WebServlet("/OrdiniControl")
public class OrdiniControl extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		OrdineModelDM ordini= new OrdineModelDM();
		
		try {
			String idUser = null;
			@SuppressWarnings("unchecked")
			List<OrdineBean> orderBean = (List<OrdineBean>) ordini.doRetrieveByKeyUser(idUser);
			getServletContext().setAttribute("ordini", orderBean);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String address;
		address = "/ordini.jsp";
		System.out.println("TERMOSTATO");
		RequestDispatcher dispatcher = request.getRequestDispatcher(address);
		dispatcher.forward(request, response);
		

	}

}
