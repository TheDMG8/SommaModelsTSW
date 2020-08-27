package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductBean;
import model.ProductModelDM;


@WebServlet("/modellismoDinamicoControl")
public class modellismoDinamicoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	static ProductModelDM model = new ProductModelDM();
	
    public modellismoDinamicoControl() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Collection<ProductBean> prodotti = model.doRetrieveAll("");
			
			
			Iterator<?> it = prodotti.iterator();
			
			while(it.hasNext()) {
				ProductBean bean = (ProductBean) it.next();
				
				String type = bean.getTipoCategoria();
				
				if(!type.equalsIgnoreCase("Radiocomandato")) {
					 it.remove();
				}
				RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/modellismoDinamico.jsp");
			    dispatcher.forward(request, response);
			    return;
			}
		} catch (SQLException e){
			System.out.println("Error:" + e.getMessage());
			request.setAttribute("error", e.getMessage());
		}
		
	    
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
