package control;

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

import model.ProductBean;
import model.ProductModelDM;


@WebServlet("/SearchControl")
public class SearchControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private ProductModelDM model= new ProductModelDM();
	
    public SearchControl() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String toSearch= (String) request.getParameter("search");
		String[] strings= toSearch.split(" ");
		ArrayList<String> words= new ArrayList<String>();
		
		Collections.addAll(words, strings);
		
		Collection<ProductBean> collection;
		ArrayList<ProductBean> prodotti= new ArrayList<ProductBean>();
		
		try {
			collection = model.doRetrieveAll(null);
		
			Iterator<?> it  = collection.iterator();
			while(it.hasNext()) {
				ProductBean bean = ((ProductBean)it.next());
				for(String word : words) {
					if(!bean.getNomeProdotto().contains(word)) {
						it.remove();
						break;
					}
				}
			}
		
			Iterator<?> it2  = collection.iterator();
			while(it2.hasNext()) {
				ProductBean bean = (ProductBean)it2.next();
				prodotti.add(bean);
			}
		
			System.out.println("Trovati " + prodotti.size() + " elementi");
			
			request.setAttribute("result", prodotti);
			request.setAttribute("search", toSearch);
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Ricerca.jsp");/*inserire qui IMPOOOOOO*/
			dispatcher.forward(request, response);
		    
		} catch (SQLException e) {
			System.out.println("Errore durante la ricerca");
			}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
