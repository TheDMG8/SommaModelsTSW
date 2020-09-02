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

import org.apache.catalina.User;

import it.unisa.model.OrdineBean;
import it.unisa.model.OrdineModelDM;
import it.unisa.model.ProductBean;
import it.unisa.model.ProductModelDM;
import it.unisa.model.UtenteBean;

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
			UtenteBean user =(UtenteBean) request.getSession().getAttribute("user");
			
			@SuppressWarnings("unchecked")
			Collection<OrdineBean> orderBean = (Collection<OrdineBean>) ordini.doRetrieveByKeyUser(user.getIdUtente());
			getServletContext().setAttribute("ordini", orderBean);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		String address;
		address = "/ordini.jsp";
		System.out.println("TERMOSTATO");
		RequestDispatcher dispatcher = request.getRequestDispatcher(address);
		dispatcher.forward(request, response);
		

	}

}
