package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.ProductBean;
import it.unisa.model.ProductModelDM;


@WebServlet("/SearchControl")
public class SearchControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private ProductModelDM model= new ProductModelDM();
	
    public SearchControl() {
        super();
        
    }
 
        public void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            String s = request.getParameter("search");
            String address = null;
            
            Collection<ProductBean> prodotti = model.retriveBySearch(s);

            request.setAttribute("prodotti", prodotti);
            address = "/Ricerca.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(address);
            dispatcher.forward(request, response);
            
        }

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
